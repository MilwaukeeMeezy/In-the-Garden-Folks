# In the Garden, Folks!

**Grow where you live.** A privacy-first garden app prototype for urban and suburban home growers, balcony and container gardeners, and community plot members.

Know your space. Grow what works. Share what you grow. Stay connected to your local growing community.

## Try it

Open `index.html` in any modern browser. It's one file with no build step. It makes no outside requests unless the visitor presses a live weather or frost button (see Privacy).

To publish with GitHub Pages: **Settings → Pages → Deploy from a branch → `main` / (root)**.

## What's in it

| Area | Status |
|---|---|
| Home dashboard: space banner, quick actions, topic tabs, and sections for Today, My spaces, Garden health, Upcoming tasks, Around you and From the folks (reorder or hide sections; Advanced adds More cards) | Working |
| My Garden map with an At a glance panel (overview, weather, sun and shade, soil, water, plants, tasks, notes) | Working |
| Search across plants, beds, tasks, notes and app sections, plus a 7-step guided tour | Working |
| My Garden: map editor, sun and shade by date and time, sun-hour heat map, soil records, rain and downspout planning, plant matching, calendar, journal, budget | Working |
| Seasonal pest outlook | Working |
| Live 7-day forecast, frost dates and approximate zone from [Open-Meteo](https://open-meteo.com/), fetched only on request | Prototype |
| Daily light integral (DLI) per bed: clear-day estimate from the shade model, this week's and monthly values with real cloud cover, and light-meter readings (DLI, PPFD or lux) logged as Measured | Working (live parts on request) |
| Light probe: drag a pin anywhere on the yard map to see that spot's sun hours, clear-day DLI, this week's DLI and typical DLI by month from 10 years of recorded sunlight | Working (history on request) |
| Light sensors: place a sensor on the map and load its CSV log (PPFD, lux, W/m² or daily DLI); daily totals are kept as Measured and used to correct probe readings within 15 ft | Working |
| Privacy controls and accessibility settings | Working |
| Explore: community posts and Garden Globe | Prototype (this device only) |
| Trade: harvest swaps and community crop circles | Prototype (this device only) |
| Garden Mood background sounds (generated in the browser) | Prototype |
| Accounts, shared feed and moderation, verified policy and water alerts, garden assistant, notifications | Planned |

There are two fictional demo yards: a Southeast DC rowhouse and a Milwaukee duplex on a narrow lot with an alley garage. Open the Milwaukee one directly with `index.html#demo-mke`. The demo yards are fictional. Demo weather, pest sightings and the sample crop circle are labeled as examples. There are no invented posts, offers or alerts.

## Privacy

- On the first visit, a privacy pop-up asks the visitor to allow or reject saving their garden on the device. Allow and Reject look the same, and nothing optional runs before a choice. Only the choice itself is remembered, so the pop-up doesn't keep returning. Privacy choices lists exactly what each option stores and can be changed any time.
- No analytics, ad pixels, outside fonts or third-party scripts.
- The only outside connection is Open-Meteo, and only when the visitor presses a live weather or frost button. It receives the city's location rounded to about 7 miles (and, like any website, the visitor's IP address), nothing about the person or their garden. Results aren't saved.
- Never asks for camera, microphone, photo library or device location. Location is the nearest city the person picks, used only for plant-related information.
- Photos are chosen one file at a time, and location data inside them is removed. Posts are private by default.

## Accessibility

- Required descriptions for photos; descriptions or transcripts and optional caption files for video. Videos never autoplay and start muted.
- Text size, higher contrast, reduced motion and low-data settings.
- Text versions of maps and the globe, and keyboard-operable controls. Target: WCAG 2.2 AA.

## Fonts

The welcome page embeds trimmed copies of three open fonts, so nothing loads from an outside font service:
Big Shoulders (headlines), Instrument Sans (body text) and JetBrains Mono (labels and measurements).
All three are released under the SIL Open Font License 1.1 (https://openfontlicense.org).

## Data sources

- Weather forecasts and frost estimates: [Open-Meteo.com](https://open-meteo.com/), licensed CC BY 4.0. The free API is for non-commercial use; a commercial launch needs an Open-Meteo subscription or another provider.
- Frost dates are the median last and first 32°F days from the past 10 years of daily lows; the zone is estimated from the average yearly lowest temperature. Both are estimates; the official USDA map is the reference for zones.
- Sun position: NOAA solar calculation.
- Sensor logs are read in the browser and never uploaded. Readings are integrated into daily DLI; days covering less than 80% of daylight are kept but left out of averages. Solar radiation (W/m²) is converted at 2.1 µmol/m²/s per W/m².
- Daily light (DLI): clear-sky sunlight from the Haurwitz model, split into direct sun and sky light, with shaded spots keeping part of the sky light. Converted to plant light at about 2.1 µmol per joule; lux readings use 1,000 lux ≈ 18.5 µmol/m²/s (sunlight).
