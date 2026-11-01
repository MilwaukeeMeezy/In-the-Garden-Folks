# Feature proposal: Personalized growing calendar (2027 plan)

**Project:** In the Garden, Folks! — Grow Where You Live  
**Status:** Approved recommendations; implementation and testing pending  
**Priority:** High — especially for first-time gardeners  
**Requested:** November 1, 2026

## The gardener's problem

A beginner can draw a garden and choose plants but may not know *what to do, when, or how*. Generic monthly calendars don't reflect their chosen crops, location, growing method, planting dates, or actual progress. The calendar should turn a user's own garden plan into actionable guidance from preparation through harvest.

**Success statement:** Once a user enters their 2027 growing plan, the app builds a calendar of crop-specific tasks automatically. Opening any date explains what to do for each crop. Checking off a task removes that *instance* from the active calendar without erasing its history or unrelated future tasks.

## Required workflow

1. **Use plants the gardener actually selected.** Generate tasks from the 2027 garden plan, plant library selections, beds/containers and 3D placements. Do not require manual re-entry into the calendar. Make planned crops distinct from existing/planted crops and from merely browsing the catalog.
2. **Capture planting choices for each crop/batch.** Plant identity (species and cultivar where known), number of seeds or plants, source (start from seed / direct-sow / purchase transplants / existing perennial), growing place (indoor / greenhouse / raised bed / in-ground / pot / balcony), intended year, desired planting or harvest date, and user overrides. A purchased pepper transplant must **not** receive a seed-starting task.
3. **Calculate dates for the user's situation.** Use local frost-date *estimates with uncertainty*, crop/variety guidance, indoor vs outdoor conditions, soil-temperature needs where appropriate, crop lead times, days to maturity (as a range), and actual task completions. The user's growing zone alone is **not** a frost-date or planting-date calculator. Favor extension-service/seed-packet information; label estimates and let users edit them.
4. **Populate a true month calendar.** Color-code tasks and show compact indicators/counts on each day. Tapping a date opens a readable day panel with all crops needing attention that day, ordered by urgency. Selecting a task displays crop, quantity, growing place, reason/timing, plain-language steps, materials, estimated duration, next milestone, and optional detailed plant guide.
5. **Act on each task.** Provide **Mark complete**, **Reschedule**, **Skip**, and **View plant guide**, with **Undo completion**. A completed one-time task disappears from upcoming/active lists and its calendar dot or count, but remains viewable in Completed and the garden journal with its *actual* completion date. Never delete the underlying task/history. A skipped item has an explicit status and explanation, not a silent disappearance.
6. **Recalculate intelligently.** When seeds are actually sown or transplants actually planted, use that observed date to recalculate dependent milestones/harvest estimates for that crop batch. Adding, removing or changing a crop updates affected *future* tasks; it must not erase completed tasks, journal entries, or other crops' work. Clearly show proposed changes when a large reschedule occurs.
7. **Integrate everywhere.** Power the calendar, "My next three tasks", Home/At a glance, individual plant/bed views, and optional .ics export/reminders from the same task records. Preserve the app's accessible theme and privacy-first, offline-friendly behavior.

## Task types to support

- **Planning:** source seeds/transplants, gather supplies, prepare and label trays, prepare bed/soil, set up supports.
- **Propagation:** **begin and complete cold stratification where required**, perform other variety-specific pre-sowing treatments only when supported, start seeds indoors, winter sow, direct sow, germination checks, pot up seedlings.
- **Moving outdoors:** harden off, soil/frost readiness check, transplant, protect from late frost; account for crop-specific tolerances.
- **Cultivation:** thinning, mulching, feeding when indicated, trellising/pruning where appropriate, scouting/monitoring pests, watering checks (condition-based, not rigid promises).
- **Harvest and succession:** expected harvest window, harvest checks, repeat sowing only when part of the gardener's plan, end-of-season and seed-saving tasks when requested.

**Cold-stratification rule:** The species/cultivar record must explicitly say whether stratification is required, recommended, optional, satisfied by a purchased or pretreated seed lot, or unknown. Where supported, store the treatment method, moist/dry conditions, temperature range, duration *range*, and reference. Calculate the start date backward from the intended sowing date; this can put **2027 tasks in November–December 2026**. Offer natural outdoor winter stratification or indoor refrigeration where scientifically appropriate. Do not invent a generic 60- or 90-day requirement or assign refrigeration to every perennial/native. Show an "information needed" state rather than making up a treatment.

## Calendar behavior and visual design

Maintain the site's green/yellow/coral palette and the selected calendar styling; suggested meaning (confirm against actual theme tokens):
- **Yellow:** indoor seed-starting and direct sowing.
- **Coral:** transplanting / planting.
- **Green:** harvest.
- **Purple:** plant maintenance, including cold stratification.
- **Blue:** user-added personal tasks.

Always pair color with icons/text for accessibility. Date cells should **fit the calendar box**, with a mobile-friendly agenda on narrow screens; avoid scrolling conflicts. The expanded panel for a clicked day shows individual crop tasks, not a generic monthly tips paragraph. Provide filters for **Upcoming / All / Completed / Overdue** and a toggle for showing completed milestones in history.

A task completed on March 3 should not continue to show as unfinished on March 4. Daily or weekly recurring care checks are **instances**: finishing one should not cancel future legitimately scheduled checks. A deliberate second sowing of peppers likewise remains separate from the first.

### Illustrative day panel — March 3, 2027

> **My garden tasks • March 3, 2027**  
> **Start bell pepper seeds indoors** — 4 plants planned, indoor seed-starting shelf.  
> **Why today?** Calculated from the selected pepper variety, local outdoor readiness window, and chosen seed-starting method.  
> **How:** Fill labeled trays with seed-starting mix, sow at the seed packet's depth, water gently, maintain recommended germination conditions, then monitor emergence.  
> **Actions:** [Mark complete] [Reschedule] [Skip] [Plant guide]

Other crops due on the same date appear as separate cards. **March 3 is only a UI example**, never a hard-coded recommended pepper sowing date. Completion adds a journal record (e.g., "Started 4 pepper plants indoors on March 3") and updates downstream tasks.

## Data and scheduling design

Use one stable source of truth for all calendar surfaces. Suggested logical entities (adapt to the existing storage model):

- `garden_plan`: year, location reference (coarse city/ZIP as appropriate), frost date estimate and quality, settings.
- `planned_crop_batch`: stable ID, plant/variety ID, garden place ID, quantity, propagation method, target dates, overrides, batch status. Support multiple batches of the same crop.
- `crop_schedule_guidance`: species/cultivar, supported methods and timing rules, seed treatments and source/reference, applicability (climate, indoors/outdoors), last-reviewed date.
- `garden_task`: stable deterministic ID (plan + batch + task kind + occurrence), due local date/window, dependencies, status (not started/completed/skipped/rescheduled), date actually completed, original proposed due date, instructions/source, metadata.
- `task_history`: immutable-ish record of completions/undo/reschedules and linked journal entry; never silently destroy a record when a schedule is regenerated.

Requirements:
- Compute calendar days in the **garden's local timezone** (DST-safe) and support tasks before the plan year.
- Make scheduling/regeneration **idempotent**: revisiting or refreshing does not duplicate tasks.
- Keep completed history when future timing rules or catalog content change; recalculate only appropriate pending dependents.
- Make completion undoable. Rescheduling one task must not silently reschedule every task or wipe plants.
- Handle missing data gracefully (unknown variety, unknown frost date, no sow date) with choices and uncertainty labels.
- Deduplicate where necessary while preserving each crop batch's individual record and directions.
- Do not auto-delete 3D plants or bed records when tasks are completed, skipped, or regenerated.
- Do not send exact addresses or full crop plans to external services without the relevant user consent.

## Acceptance tests

1. Plan tomatoes, peppers, beans, basil and lettuce for 2027: their calendar tasks are generated **from those selections** and fit their chosen propagation methods.
2. Open March 3, 2027: shows crop-specific tasks and actionable instructions, with multiple tasks when applicable.
3. Mark a pepper seed-starting task complete: it disappears from **active** calendar/tasks, appears in Completed and journal, and downstream tasks use the actual date. Undo restores its status.
4. Add the same crop in two batches: completing the first does not suppress the second.
5. Choose **purchased pepper transplants**: no seed-starting task; do show appropriate acquisition/hardening-off/transplant tasks.
6. Choose a plant with documented required cold stratification: show its backward-planned pre-treatment (possibly in **2026**) and finishing/sowing steps. Choose a plant without it: no stratification tasks. Missing guidance is labeled unknown, never guessed.
7. Change frost estimate, planting date, grow location or crop choice: relevant **pending** tasks update; completed history and unrelated plants survive.
8. Show winter sowing or natural cold treatment as an option **only for supported species**; don't generically equate winter sowing with refrigerator treatment.
9. Date color coding is readable in the chosen theme and via screen readers; keyboard and mobile date selection work.
10. Calendar, Dashboard/At a glance, plant/bed pages, and calendar export agree on pending and completed status; refresh/offline reopening creates no duplicates.
11. Overdue tasks remain visible until completed, skipped or rescheduled; recurring care tasks continue on their appropriate cadence.
12. Existing Undo/Redo plant plotting and harvest features remain unchanged by the new scheduler.

## Staged delivery

**Phase 1 (highest value):** 2027 plan → crop-specific calendar; date panel with instructions; sow/start/harden/transplant/harvest windows; status, completion history/journal, reschedule/undo; nonduplicating updates and dashboard integration.

**Phase 2:** sourced, species-specific cold stratification and other seed treatments; cross-year tasks; deeper dependency recalculation and distinct crop batches. **Cold stratification must be included before this feature is called complete**, not dropped indefinitely.

**Phase 3:** more granular care/harvest progress, succession planning, live weather-risk prompts with explicit uncertainty, configurable reminders, and optional refinements based on actual gardening results.

## Definition of done

A new gardener can select plants for a specific year's plan, see exactly what to do for those plants on each calendar day, check off tasks without them repeating as unfinished, and preserve an accurate record of what they did. Plants that need cold stratification receive appropriately timed and sourced instructions, including the preceding year when necessary. The calendar remains understandable for a first-time gardener without preventing experienced gardeners from editing dates and methods.
