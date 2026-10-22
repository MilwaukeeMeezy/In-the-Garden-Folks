-- In the Garden, Folks! accounts, synced gardens and the Growing Circle
-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run.
-- It is safe to run again: it skips things that already exist.

-- 1. Profiles: one per account. Everyone starts as a customer.
create table if not exists public.profiles(
  id uuid primary key references auth.users on delete cascade,
  role text not null default 'customer' check (role in ('customer','admin')),
  name text default '' check (char_length(name) <= 80),
  created_at timestamptz default now());
alter table public.profiles enable row level security;

create or replace function public.handle_new_user() returns trigger language plpgsql security definer set search_path = public as $$
begin insert into public.profiles(id) values (new.id) on conflict do nothing; return new; end $$;
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created after insert on auth.users for each row execute function public.handle_new_user();

create or replace function public.is_admin() returns boolean language sql stable security definer set search_path = public as $$
  select exists(select 1 from public.profiles where id = auth.uid() and role = 'admin') $$;

drop policy if exists "read own profile" on public.profiles;
create policy "read own profile" on public.profiles for select using (id = auth.uid() or public.is_admin());
drop policy if exists "update own name" on public.profiles;
create policy "update own name" on public.profiles for update using (id = auth.uid()) with check (id = auth.uid());
revoke update on public.profiles from authenticated;
grant update (name) on public.profiles to authenticated;

-- keeps updated_at current on every change
create or replace function public.touch() returns trigger language plpgsql as $$ begin new.updated_at = now(); return new; end $$;

-- 2. Gardens: the map and plan. Only the admin can change them; a customer can read their own.
create table if not exists public.gardens(
  id text primary key,
  owner uuid references auth.users on delete set null,
  name text default '',
  data jsonb not null default '{}',
  updated_at timestamptz default now());
alter table public.gardens enable row level security;
drop trigger if exists gardens_touch on public.gardens;
create trigger gardens_touch before update on public.gardens for each row execute function public.touch();
drop policy if exists "garden read" on public.gardens;
create policy "garden read" on public.gardens for select using (owner = auth.uid() or public.is_admin());
drop policy if exists "garden admin write" on public.gardens;
create policy "garden admin write" on public.gardens for all using (public.is_admin()) with check (public.is_admin());

create or replace function public.owns_garden(g text) returns boolean language sql stable security definer set search_path = public as $$
  select exists(select 1 from public.gardens where id = g and owner = auth.uid()) $$;

-- 3. Entries the customer adds: journal, harvests, receipts and costs, problems they report.
create table if not exists public.entries(
  id text primary key,
  garden_id text not null references public.gardens on delete cascade,
  author uuid default auth.uid(),
  kind text not null check (kind in ('journal','harvest','receipt','problem')),
  data jsonb not null default '{}',
  deleted boolean not null default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now());
alter table public.entries enable row level security;
drop trigger if exists entries_touch on public.entries;
create trigger entries_touch before update on public.entries for each row execute function public.touch();
drop policy if exists "entry read" on public.entries;
create policy "entry read" on public.entries for select using (public.owns_garden(garden_id) or public.is_admin());
drop policy if exists "entry add" on public.entries;
create policy "entry add" on public.entries for insert with check (author = auth.uid() and (public.owns_garden(garden_id) or public.is_admin()));
drop policy if exists "entry change" on public.entries;
create policy "entry change" on public.entries for update using (author = auth.uid() or public.is_admin()) with check (public.owns_garden(garden_id) or public.is_admin());

-- 4. Questions and answers between a customer and the consultant.
create table if not exists public.messages(
  id text primary key,
  garden_id text not null references public.gardens on delete cascade,
  author uuid default auth.uid(),
  body text not null check (char_length(body) between 1 and 2000),
  created_at timestamptz default now());
alter table public.messages enable row level security;
drop policy if exists "message read" on public.messages;
create policy "message read" on public.messages for select using (public.owns_garden(garden_id) or public.is_admin());
drop policy if exists "message add" on public.messages;
create policy "message add" on public.messages for insert with check (author = auth.uid() and (public.owns_garden(garden_id) or public.is_admin()));

-- 5. Invites: the admin makes a link for one garden; the customer claims it after signing up.
create table if not exists public.invites(
  token text primary key,
  name text default '',
  contact text default '',
  garden_id text references public.gardens on delete cascade,
  created_at timestamptz default now(),
  used_by uuid,
  used_at timestamptz);
alter table public.invites enable row level security;
drop policy if exists "invite admin" on public.invites;
create policy "invite admin" on public.invites for all using (public.is_admin()) with check (public.is_admin());

create or replace function public.invite_name(t text) returns text language sql stable security definer set search_path = public as $$
  select name from public.invites where token = t and used_by is null $$;
grant execute on function public.invite_name(text) to anon, authenticated;

create or replace function public.claim_invite(t text) returns text language plpgsql security definer set search_path = public as $$
declare g text; n text;
begin
  select garden_id, name into g, n from public.invites where token = t and used_by is null;
  if g is null then raise exception 'This invite link was already used or is not valid.'; end if;
  update public.gardens set owner = auth.uid() where id = g;
  update public.invites set used_by = auth.uid(), used_at = now() where token = t;
  update public.profiles set name = coalesce(nullif(name,''), n) where id = auth.uid();
  return g;
end $$;
grant execute on function public.claim_invite(text) to authenticated;

-- 6. "I'm interested" form behind the QR code. Anyone can send one; only the admin can read them.
create table if not exists public.interest(
  id bigint generated always as identity primary key,
  name text check (char_length(name) <= 80),
  contact text check (char_length(contact) <= 120),
  zip text check (zip is null or zip = '' or zip ~ '^[0-9]{5}$'),
  note text check (char_length(note) <= 500),
  created_at timestamptz default now(),
  handled boolean default false);
alter table public.interest enable row level security;
drop policy if exists "interest send" on public.interest;
create policy "interest send" on public.interest for insert to anon, authenticated with check (handled = false);
drop policy if exists "interest admin" on public.interest;
create policy "interest admin" on public.interest for all using (public.is_admin()) with check (public.is_admin());
grant insert on public.interest to anon;

-- 7. Growing Circle: neighbors grow a crop or two together and share. Account holders only.
create table if not exists public.circles(
  id text primary key,
  name text not null check (char_length(name) between 2 and 60),
  zip text check (zip ~ '^[0-9]{5}$'),
  crops text default '' check (char_length(crops) <= 200),
  about text default '' check (char_length(about) <= 600),
  created_by uuid default auth.uid(),
  created_at timestamptz default now());
create table if not exists public.circle_members(
  circle_id text references public.circles on delete cascade,
  user_id uuid default auth.uid(),
  name text default '' check (char_length(name) <= 40),
  growing text default '' check (char_length(growing) <= 120),
  role text default 'member' check (role in ('member','lead')),
  joined_at timestamptz default now(),
  primary key (circle_id, user_id));
create table if not exists public.circle_posts(
  id text primary key,
  circle_id text references public.circles on delete cascade,
  author uuid default auth.uid(),
  name text default '',
  kind text default 'update' check (kind in ('update','share','need')),
  body text not null check (char_length(body) between 1 and 1000),
  hidden boolean default false,
  flagged boolean default false,
  created_at timestamptz default now());
alter table public.circles enable row level security;
alter table public.circle_members enable row level security;
alter table public.circle_posts enable row level security;

create or replace function public.in_circle(c text) returns boolean language sql stable security definer set search_path = public as $$
  select exists(select 1 from public.circle_members where circle_id = c and user_id = auth.uid()) $$;
create or replace function public.leads_circle(c text) returns boolean language sql stable security definer set search_path = public as $$
  select exists(select 1 from public.circles where id = c and created_by = auth.uid()) $$;

drop policy if exists "circle read" on public.circles;
create policy "circle read" on public.circles for select to authenticated using (true);
drop policy if exists "circle add" on public.circles;
create policy "circle add" on public.circles for insert to authenticated with check (created_by = auth.uid());
drop policy if exists "circle change" on public.circles;
create policy "circle change" on public.circles for update using (created_by = auth.uid() or public.is_admin());
drop policy if exists "circle remove" on public.circles;
create policy "circle remove" on public.circles for delete using (created_by = auth.uid() or public.is_admin());

drop policy if exists "member read" on public.circle_members;
create policy "member read" on public.circle_members for select to authenticated using (true);
drop policy if exists "member join" on public.circle_members;
create policy "member join" on public.circle_members for insert to authenticated with check (user_id = auth.uid());
drop policy if exists "member change" on public.circle_members;
create policy "member change" on public.circle_members for update using (user_id = auth.uid()) with check (user_id = auth.uid());
drop policy if exists "member leave" on public.circle_members;
create policy "member leave" on public.circle_members for delete using (user_id = auth.uid() or public.leads_circle(circle_id) or public.is_admin());

drop policy if exists "post read" on public.circle_posts;
create policy "post read" on public.circle_posts for select using (public.in_circle(circle_id) or public.is_admin());
drop policy if exists "post add" on public.circle_posts;
create policy "post add" on public.circle_posts for insert with check (author = auth.uid() and public.in_circle(circle_id) and hidden = false and flagged = false);
drop policy if exists "post moderate" on public.circle_posts;
create policy "post moderate" on public.circle_posts for update using (author = auth.uid() or public.leads_circle(circle_id) or public.is_admin());
create or replace function public.flag_post(pid text) returns void language sql security definer set search_path = public as $$
  update public.circle_posts set flagged = true where id = pid and public.in_circle(circle_id) $$;
grant execute on function public.flag_post(text) to authenticated;
drop policy if exists "post remove" on public.circle_posts;
create policy "post remove" on public.circle_posts for delete using (author = auth.uid() or public.leads_circle(circle_id) or public.is_admin());

-- 8. Private file storage: receipt photos and the garden's map photos.
insert into storage.buckets (id, name, public) values ('receipts','receipts',false) on conflict do nothing;
insert into storage.buckets (id, name, public) values ('garden-files','garden-files',false) on conflict do nothing;
drop policy if exists "receipt files" on storage.objects;
create policy "receipt files" on storage.objects for all to authenticated
  using (bucket_id = 'receipts' and (public.owns_garden((storage.foldername(name))[1]) or public.is_admin()))
  with check (bucket_id = 'receipts' and (public.owns_garden((storage.foldername(name))[1]) or public.is_admin()));
drop policy if exists "garden files read" on storage.objects;
create policy "garden files read" on storage.objects for select to authenticated
  using (bucket_id = 'garden-files' and (public.owns_garden((storage.foldername(name))[1]) or public.is_admin()));
drop policy if exists "garden files admin" on storage.objects;
create policy "garden files admin" on storage.objects for all to authenticated
  using (bucket_id = 'garden-files' and public.is_admin()) with check (bucket_id = 'garden-files' and public.is_admin());

-- 9. Make yourself the admin. First create your account in the app (Sign in -> Create account),
--    then change the email below to yours and run just this line:
-- update public.profiles set role = 'admin' where id = (select id from auth.users where email = 'you@example.com');
