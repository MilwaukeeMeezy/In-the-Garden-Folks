# In the Garden, Folks!

**Grow where you live.** A privacy-first garden planner for city and suburban home growers, balcony and container gardeners, community plot members, and garden consultants, with a focus on regenerative gardening: building healthy, living soil year after year.

Know your space. Grow what works. Share what you grow.

## Try it

Open `index.html` in any modern browser. It's one file with no build step and no outside libraries. The 3D view also loads small model files from the `models/` folder next to it (browsers only allow that when the page is served from a website, such as GitHub Pages); without them it uses simple shapes. When the page opens, it loads nothing from other sites. It contacts an outside service only when you press a button that needs one (see [Privacy](#privacy)).

Press **Explore demo** to try a fictional sample yard without setting anything up. There are two demo yards: a Southeast DC rowhouse and a Milwaukee duplex with an alley garage (open it directly with `index.html#demo-mke`). Demo weather, pest sightings and the sample crop circle are labeled as examples.

New to gardening? Tap any word with a dotted underline to see what it means, or press **? Help** for the full list of garden words.

## What works today

| Area | Status |
|---|---|
| Garden setup: home type, places you grow, city or ZIP code, photos, which way the home faces, measuring the house and lot (including splitting a townhome row) | Working |
| My Garden map: sun and shade at any date and time, sun hours, water, soil zones, tree line by direction | Working |
| At a glance panel with a section for each topic, which you can reorder or move under the map | Working |
| 3D garden: the yard in 3D with sun and shadows, realistic models (trees, bushes, beds, greenhouse, shed, deck, watering tools), slopes and dips you can exaggerate, touch navigation (drag, pinch, twist, two-finger slide, double-tap); drag things to move them; watch plants grow through the season | Working |
| Yard conditions: slope arrows, height pins and height lines, dips and low spots, tree stumps, retaining walls, stairs (wood or set into a slope), walkways and driveways, on the 2D map and in 3D; photos from different angles to mark what the satellite map misses | Working |
| Where water goes: flow lines from your slope, downspouts and hard surfaces (red when they reach the house), likely puddles, suggested routes around the house or to a rain garden, routes you draw, moving-water animation and a rain view | Working (estimates) |
| Ways to water: rain this week vs. what each bed needs, hose reach, sprinkler coverage, watering cans, rain barrels, PVC lines with straight, tee and corner fittings that connect to a spigot or barrel, with a parts list | Working |
| Running bamboo and English ivy: mark them as problems; the plan and report include a removal plan | Working |
| Beds, containers, plants and the plant library (natives and edibles, filtered by light and soil) | Working |
| Care & watering: water needed per bed this week, a monthly care plan, plant check-ins, harvest log, rough plant prices | Working |
| Regenerative practices: soil health scorecard (soil cover, less digging, living roots, plant diversity, pollinators, closing the loop, keeping rain on site), practice checklist, cover crop timing from your frost dates; in the care plan and site reports | Working |
| Safety & wildlife (811, landlord or HOA, lead, toxic and invasive plants, animals), site conditions, and your situation (mobility, budget, community or school garden, rooftop, indoor, climate) | Working |
| Soil records, water and rain planning, rain gauge log | Working |
| Light: sun hours (clear day), daily light (DLI) with real weather, light probe, meter readings, sensor logs, model check | Working |
| Needed improvements and site reports, with client consent, labor estimate, invoice, a downloadable report file and an email summary | Working |
| Problems & plan: Existing vs Recommended labels, problem pins, Today / With recommendations / Both map views, two report maps, visit comparison, visit timeline and progress since the last visit | Working |
| Saved site reports on this device, backup and spreadsheet export, report summaries | Working |
| Plain-language help, beginner tips and a Sources page | Working |
| Calendar, journal, budget, receipts, and calendar reminders (.ics file) | Working |
| Seasonal pest outlook and links to official alert sources | Working |
| Live 7-day forecast, frost dates with their usual range, and estimated zone (only when you press a button) | Working |
| Works offline after the first visit (published site) | Working |
| Ask about your garden (answers from your own map and the app's guides; no AI service) | Prototype |
| Español (menus, section names, tips and key steps) | Prototype |
| Finding trees, bushes and buildings in your top photo | Prototype: results need your review |
| Consultant report sync (encrypted) | Prototype: use "Test the sync service" under Saved reports to check the live connection |
| Accounts | Prototype: stored only on the device where they were made; sign-in codes are shown on screen, not sent |
| Explore (community posts, Garden Globe, share cards) and Trade (swaps, crop circles) | Prototype: stays on this device |
| Pest sighting reports | Prototype |
| Garden Mood sounds (made in the browser) | Prototype |
| Shared community feed with moderation, verified water and local-rules alerts, phone push notifications | Planned: needs a server and an editorial process |

## Main parts of the app

**Home.** A dashboard for your space: quick actions, weather, today's tasks and tips. Sections can be reordered or hidden.

**My Garden** has four tabs:
- **Map, sun & water.** A top-down map of your yard. Views: Normal, Sun & shade now, Sun hours, Water and Soil zones. Map types: 2D map, Lot map, Photos and 3D view. A time slider shows sun and shade at any hour and date.
- **Beds & plants.** Add beds and containers (raised, in-ground or pot) and plants with quantities. Everything you add shows on the 2D map, in 3D and on matched photos.
- **3D garden.** The house, fences, trees, beds and balconies in 3D at their real heights and floors. Drag plants, trees, beds and other objects to move them.
- **Calendar & journal.** Tasks from your frost dates, journal entries, budget and receipts.

**At a glance** (beside the map) has a section for each topic: Measure objects, Overview, Ask about your garden, Outlines, Where you're growing, Weather, Sun & shade, Soil health, Water flow & drainage, Yard conditions, Ways to water, Plants in your garden, House photos, Identified objects, Care & watering, Regenerative practices, Safety & wildlife, Site conditions, Your situation, Problems & plan, Needed improvements, Site report and Garden notes. Move any section up or down, or send it under the map.

**Plant library.** Natives and edibles for your region. Search, filter by light, soil and type, and add plants to a bed or straight onto the map.

**Explore, Trade and Alerts.** Community posts, a Garden Globe, neighbor swaps and crop circles are prototypes that stay on your device. "Make a share card" saves a picture of your map and plants (never your address) with a suggested image description, to post wherever you like. Alerts links to official sources (U.S. Drought Monitor, USDA APHIS, your extension service, invasive species lists); the app doesn't publish its own alerts yet.

**Profile.** Privacy choices, accessibility and display settings, Garden Mood, copy or delete your data.

## Setting up a garden

1. **Your space.** Pick your type of home (detached house, townhouse end or middle unit, or apartment or condo), how many floors, whether you have a deck, balcony or patio, and every place you grow: front, back or side yards, row house yard, in-ground garden, greenhouse, patio, balcony, containers, community plot or indoors.
2. **Location.** Type your city or ZIP code, or pick a listed city. You can also type your street address to find your house on OpenStreetMap; the address is never saved.
3. **Photos and direction.** Add a top view (drone, upstairs window, a map screenshot, or an optional satellite picture) and front, back and side photos. Set which way your home faces with the dial, the phone's compass, the number from your phone's Compass app, or by checking against the sun. Lock it when it's right.
4. **Measure.** The easiest way is a screenshot of Google Maps or Apple Maps: the app reads the scale bar, traces your house and lets you tap the lot corners. Or tap corners on your top photo, or type sizes. Apartments and townhomes outline their own home on the building. Maps usually draw a row of townhomes as one building, so "Split the row" divides it into homes and you tap yours.
5. **Review**, then your garden opens.

## Measuring and accuracy

- **Heights** of trees and buildings come from a tilt reading, a shadow, or a comparison in a photo. "Fill in quick guesses" estimates the rest from size or floors, labeled as guesses until measured.
- **Clear day vs real weather:** sun hours are labeled "Clear day". Numbers that use recorded or forecast sunshine are labeled "Real weather".
- **Model check:** mark sunny and shady spots in the Sun & shade view; the app shows how often the map agrees.
- **Sun hours** are modeled for a clear day from the sun's position and the objects on your map. Real weather, objects you haven't added and wrong heights all change the real amount. Tapping a spot shows what is shading it, and "Fix it with my shadow" helps line the model up with your yard.
- **Frost dates and zones:** after you press a live weather or frost button, frost dates are the middle of the last 10 years of weather records, with the range seen in most years. Before that, they are a rough guess from latitude that can be off by 2 to 3 weeks. The zone is an estimate; the USDA map is the official reference.
- **Rounding:** numbers are shown only as precisely as they are known. Sun hours are rounded to the nearest half hour, modeled daily light to whole numbers, water amounts to two significant figures, and measured heights say "give or take" about 10%.
- **The compass** on phones and tablets can be off by a lot near metal, cars or electronics. The app gives one set of steps everywhere: stand in your front doorway, hold the phone flat with its top edge pointing at the street, wait for a steady reading, then set and lock your front. If the reading looks wrong, check it with the sun or type the number from your phone's Compass app (held the same way, with True north on).

## Site reports for consultants

Fill in who it's for and who prepared it (an optional site address is printed but never saved), then **Make the report**. It includes a summary, site facts, the map, sun by bed, soil, water, trees and plants, prioritized findings, a seasonal plan, materials with rough costs, the garden words used and the methods.

Record the client's consent (how and when) and your hourly rate; the report then includes the consent line and a labor estimate, and "Make an invoice" opens an editable, printable invoice. From an open report, "Download file for the client" saves a standalone page that opens in any browser, and "Email summary" opens your email app with the top recommendations.

Each report is saved on this device when saving is on. Reopen, print or delete it, export a backup or a spreadsheet, and see summaries (reports by month, common findings, ZIP codes, cities, typical costs). Consultants can sign in to sync reports across devices. Each report is encrypted on the device before upload; the sync service can't read it. A recovery key is shown once at sign-up.

## Privacy

The full policy is in the app (Privacy policy, in the footer). In short:

- No cookies, ads, analytics, tracking, outside fonts or outside scripts at page load.
- Nothing is saved until you choose. If you turn on saving, your garden is kept in this browser only. Turning saving off deletes everything the site stored there.
- Street addresses are never saved, not even in reports. The app never asks for an apartment or unit number.
- Never asks for camera, microphone, photo library, contacts, notifications or device location. The compass is used only after you press a button.
- Photos are picked one file at a time from a folder. Hidden location data is removed from photos.
- Report files, invoices, share cards and calendar files are made on your device. "Ask about your garden" answers on your device; nothing you type is sent.
- On the published site, the browser keeps an offline copy of the app's own files (no garden data).

Outside services are contacted only when you use a feature that needs them. Each also sees your IP address, like any website.

| Service | When | What it gets |
|---|---|---|
| Open-Meteo place search | You press Find in setup | The city or ZIP code you typed |
| Open-Meteo weather and climate | You press a live weather or frost button | Your city's location, rounded to about 7 miles |
| OpenStreetMap (Nominatim and Overpass) | You choose "Use my address" | The address you typed, then your home's map position to find building outlines and the street |
| Esri World Imagery | You choose a satellite top view | The map squares around your home (about a city block) |
| jsDelivr | First time you press "Read the receipt for me" | A download request for the text-reading tool |
| Supabase | You sign in to sync reports | Your email, a sign-in code made from your passphrase, encrypted reports, and when each changed |

## Accessibility

- Text size, higher contrast, reduced motion, low-data mode and captions settings.
- Required descriptions for photos; transcripts or caption files for video. Videos never autoplay and start muted.
- Text versions of maps and the globe; keyboard-operable controls; plain-language explanations of garden words.
- Spanish (beta) for menus, section names, tips and key steps.
- Share cards come with a suggested image description to paste as alt text.
- Target: WCAG 2.2 AA.

## Data sources and methods

- **Sun position:** NOAA solar calculation.
- **Weather and frost:** [Open-Meteo](https://open-meteo.com/) (CC BY 4.0). Frost dates are the median last and first 32°F days over the past 10 years; the zone is estimated from the average yearly lowest temperature.
- **Daily light (DLI):** clear-sky sunlight from the Haurwitz model, split into direct and sky light, converted at about 2.1 µmol per joule. Lux readings use 1,000 lux ≈ 18.5 µmol/m²/s. Sensor logs are read in the browser; days covering less than 80% of daylight are kept but left out of averages.
- **Maps:** building outlines and streets from OpenStreetMap contributors (ODbL).
- **Satellite imagery:** Esri World Imagery (Imagery © Esri, Maxar, Earthstar Geographics), only when you choose it.
- **Receipt reading:** Tesseract.js, downloaded from jsDelivr the first time you use it.
- **Rules of thumb** (full sun, watering, mulch, planting times, rain gardens, DLI, cover crops) come from state extension services, and the regenerative scorecard follows the USDA NRCS soil health principles; the in-app Sources page links each one.
- **Plant prices, labor hours and fence heights** are rough planning figures, labeled as such.
- **Slope and water flow** are estimates from the slope arrows, height pins and dips you mark (or the slope direction you chose); water lines follow the ground downhill. Slope percent is drop ÷ distance × 100.
- **Running bamboo and English ivy removal** follows University of Maryland Extension guidance.

### 3D model credits

Free models from [Poly Pizza](https://poly.pizza), simplified to load fast. CC-BY 3.0 models are used under the [Creative Commons Attribution 3.0 license](https://creativecommons.org/licenses/by/3.0/); CC0 models are public domain. The in-app Sources page lists the same credits.

- [Hose (“TIME HOTEL 4.28”) by S. Paul Michael](https://poly.pizza/m/1NHQ2WYCMBX) [CC-BY 3.0]
- [Water Can by Zoe XR](https://poly.pizza/m/7EfDXOcziyF) [CC-BY 3.0]
- [Beer Keg (used as a rain barrel) by Jarlan Perez](https://poly.pizza/m/dy4tnEIsHHa) [CC-BY 3.0]
- [Metal pipe by Poly by Google](https://poly.pizza/m/a4bBMLzmLky) [CC-BY 3.0]
- [Tree by Marc Solà](https://poly.pizza/m/6Yjt8nIwLsD) [CC-BY 3.0]
- [Tree by Quaternius](https://poly.pizza/m/qZtx0AHhcy) [CC0]
- [Trees by Quaternius](https://poly.pizza/m/etFGNvsiFv) [CC0]
- [Pine by Quaternius](https://poly.pizza/m/79gmlLnweB) [CC0]
- [Poplar Tree by Poly by Google](https://poly.pizza/m/2y-Cl3E7lMf) [CC-BY 3.0]
- [Bamboo by Poly by Google](https://poly.pizza/m/auVD_m-ugF0) [CC-BY 3.0]
- [Banana Tree by Poly by Google](https://poly.pizza/m/d0WJSiuOz6o) [CC-BY 3.0]
- [Bush by Quaternius](https://poly.pizza/m/ooG6CkLyE8) [CC0]
- [Bush with Flowers by Quaternius](https://poly.pizza/m/U1ymDy8tbY) [CC0]
- [Wall by Quaternius](https://poly.pizza/m/CkF171SeTV) [CC0]
- [Stairs Open by Kenney](https://poly.pizza/m/ZsfbTnXt2g) [CC0]
- [Stone Walkway by Pixel](https://poly.pizza/m/Im0kSO5tiJ) [CC-BY 3.0]
- [White Dandelions by Aeres Vistaas](https://poly.pizza/m/2R2ocKyluaP) [CC-BY 3.0]
- [Clover by Quaternius](https://poly.pizza/m/u5SOgBFiut) [CC0]
- [Plants - Seedlings by Jakers H](https://poly.pizza/m/0ASWNpT1YEP) [CC-BY 3.0]
- [Crops by Quaternius](https://poly.pizza/m/Ro6K0Yg7mx) [CC0]
- [Farm Dirt by Quaternius](https://poly.pizza/m/8BQFbUMOeC) [CC0]
- [Flower Frame by Hugo Gibson](https://poly.pizza/m/8coLcKGpdOB) [CC-BY 3.0]
- [grapes by Poly by Google](https://poly.pizza/m/971XbsYmMG3) [CC-BY 3.0]
- [Pear tree by Poly by Google](https://poly.pizza/m/44lGuM746Zi) [CC-BY 3.0]
- [Ivy by Jarlan Perez](https://poly.pizza/m/3SiwWmWJ2WW) [CC-BY 3.0]
- [Greenhouse by J-Toastie](https://poly.pizza/m/exys3emjr1) [CC-BY 3.0]
- [Cabana (used for decks) by Poly by Google](https://poly.pizza/m/dDw6BXOMJJ8) [CC-BY 3.0]
- [Raised bed, robomower hideaway by Dan Vinge Madsen](https://poly.pizza/m/aTU8O8XERgM) [CC-BY 3.0]
- [Storage shed by Quaternius](https://poly.pizza/m/TvXpjtD2nk) [CC0]
- [railing by g w](https://poly.pizza/m/4APZeLcSRuI) [CC-BY 3.0]

## Known limits before a public launch

- Open-Meteo's free API is for non-commercial use; a commercial launch needs a subscription or another provider.
- Nominatim and the public Overpass servers are meant for light use; many users need a paid or self-hosted service.
- Esri imagery at scale needs an ArcGIS Location Platform account (or a public-domain source like USGS NAIP).
- Accounts need a real sign-in service and an email or text sender.
- Report sync needs testing against the live Supabase project: sign in, then run "Test the sync service" under Saved reports.
- A shared community feed, verified alerts and push notifications need a server, moderation and an editorial process. Today the app links to official sources, saves reminders to your own calendar, and makes share cards you post yourself.
- Spanish covers the main menus and tips; detailed text is still English.
- The garden assistant matches common questions with your data; it is not an AI chatbot.
- Privacy and accessibility requirements need legal review for each place it launches.

## For developers

- Everything is in `index.html`: HTML, CSS and vanilla JavaScript, with no build step and no third-party libraries (3D uses plain WebGL).
- Publish with GitHub Pages: **Settings → Pages → Deploy from a branch → `main` / (root)**. Upload `sw.js`, `manifest.webmanifest` and `icon.svg` next to `index.html` for offline use, and the `models/` folder for the 3D models.
- `models/*.m3d` are the 3D models converted from the original GLB files: flat-colored triangles (texture colors baked in, normal maps dropped, heavy meshes thinned), stored as `M3D1` + vertex and triangle counts + size, then 16-bit positions, 16-bit triangle indices and one RGB color per triangle. The app reads them with its own small WebGL loader; if a file is missing, that item falls back to simple shapes.
- Report sync uses Supabase's REST API with the project's publishable key. The table it expects:

  ```sql
  create table public.reports (
    id text primary key,
    owner uuid not null default auth.uid(),
    updated_at timestamptz not null default now(),
    blob text not null
  );
  alter table public.reports enable row level security;
  create policy "own reports" on public.reports
    for all using (owner = auth.uid()) with check (owner = auth.uid());
  ```

  Never put the service_role key in the page.

## Fonts

The page embeds trimmed copies of Big Shoulders (headlines), Instrument Sans (body text) and JetBrains Mono (labels and measurements), all under the SIL Open Font License 1.1.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for feature notes in the order they were added.
