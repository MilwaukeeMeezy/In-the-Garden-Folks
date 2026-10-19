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
| House & yard photos: top (drone, satellite screenshot or upstairs window), front, back, both sides and up to 24 more; line the top view up under the map; jump the map to the time a photo was taken to compare shadows; optionally keep photos in your profile on this device. Turn and size buttons for the top photo, "Line it up for me" (tap two front roof corners to size, turn and place the photo automatically), and a quick-turn button for sideways photos | Working |
| Map toolbar right under the map: house orientation in words (updates with every turn, also shown on the map), house turn buttons, top-photo size/turn/move buttons, Move & resize by hand (drag, two-finger pinch to resize and turn, scroll wheel), zoom and pan | Working |
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

## Setting up a garden

1. **Your space:** name it and pick every place you grow: front yard, back yard, left side yard, right side yard, greenhouse, patio, containers, community plot, row house yard, indoor (by a window), indoor (in a sun room).
2. **Location:** the city from sign-up is filled in. Optionally type the street address: the app finds the building on OpenStreetMap, works out which way the front faces, and estimates house and yard size from nearby buildings. Then choose a top-of-house picture: satellite imagery (Esri World Imagery, opt-in), your own pictures, or none.
3. **Photos:** a compass dial shows the top view, which way the home faces, and today's sun path with sunrise and sunset. Turn your own top photo until north is up, turn the house, or use the phone compass. Add front, back and side photos (each can be turned).
4. **Size:** measure from the top photo by tapping the yard corners (satellite pictures have a known scale; your own photos use the house width as a ruler), or type your own measurements. Spaces without a yard (patio, containers, indoor) get growing-space fields instead.
5. **Review**, then the dashboard. The same orientation dial and a "Sunlight tells a story" card (modeled direct-sun hours for each side of the home) appear in My Garden.

## Live sun and shade

- **Dashboard map:** shows the sun and shade for the current hour at the garden's location and refreshes on the hour, like a clock. A label shows the time and where the sun is; at night it shows when the sun rises.
- **House photos:** a "Sun and shade on your photos" slider in My Garden lights up the front, back and side photos for any time of day (direct sun, shade, or sun behind that side), linked to the map's time slider. It's modeled from the sun's position and which way each side faces; tree and neighbor shadows show on the map.
- The house outline is see-through over a top photo, so your real roof shows.

## My Garden

- **Views:** picture tiles above the map switch between Sun & shade now, Sun hours, Water and Soil zones.
- **Live compass:** tap the compass on the map to make it follow your phone (its N needle points to real north). It only reads the phone's orientation after you turn it on, and stops when you turn it off or leave the map.
- **Growing areas & adjustable outlines:** every place picked on "Where are you growing?" gets its own measured area (sizes set in setup step 4). Each shows as a thin colored outline with its name and size on the top photo, with an Outlines on/off switch. Pick the house, the whole yard or any area under the map, then drag it to move or drag its corner squares to resize; the size updates as you drag. Add more areas any time.
- **Measurements carry over exactly:** after "Measure me", the top photo, lot, house (where you tapped it, even off-center) and every area are placed in My Garden exactly as measured. The ruler can be the front of your house or the scale bar on a map screenshot.
- **Shade check:** in the Sun & shade view, mark spots that are shady or sunny right now. The app compares them with the map. If the sun is low and still hidden behind the trees and houses around you, one tap sets your **tree line** (the angle the sun must clear; adjustable with a slider). Otherwise it can add an estimated tree in the direction of the sun, tall enough to cast that shade, for you to move or adjust.
- **Measure a height:** select a tree (or the house, a neighbor's house, a fence or shed) and press "📐 Measure its height". **Tilt:** set your distance (type it, count steps, or tap where you stand on the map), hold the phone screen-up and sight along its top edge to the top, lock the angle; height = distance × tan(angle) + eye height. **Shadow:** measure the shadow (tape or tap its tip on the map); height = shadow × tan(sun angle right now). The result is saved as Measured and the shade updates. The tilt reading uses the motion sensor only after you start it.
- **Find trees, bushes & buildings:** after a top photo is added (in setup or under House photos), the app scans it on the device and highlights each possible tree (green), bush (teal) and building (orange) with a numbered dashed outline. Under the map, each one has ✓ Tree, ✓ Bush, ✓ Building and ✗ Not an object. Confirming adds it to the map at the size seen in the photo and opens "Measure its height", so its shade counts once the height is set. "Scan again" reruns it. It uses color and texture (no AI service, nothing uploaded), so it works best on clear, overhead photos taken in summer; ground-level photos aren't scanned.
- **Dappled shade & neighbors:** trees have a "Leaves let through" setting (dense, medium, light), so light-leafed trees cast filtered shade that counts as partial sun in the sun hours. The shade check has a "⛅ Dappled here now" mark, and its fix adds a light-canopy tree when you mark dappled spots. "+ Neighbor's house" adds a neighbor's building with a height so its shadow counts.
- **Rearrange the dashboard:** drag any section by its ⠿ handle (mouse or finger), or focus the handle and use the up/down arrow keys.
- **Sun hours view:** a continuous color scale (dark green under 2 h → light yellow ≈3 h → bright yellow ≈6 h → golden orange 10+ h) with a legend right under the map that also shows the most sun possible that day. Drag the sun or the time slider to overlay where shade falls at that moment.
- **Water drawing:** draw a line where water runs (bright arrows show the direction of flow) or a shape where water sits (arrows point to where it collects). Pick bright arrow colors, add notes, delete.
- **Rain gauge log:** place your rain gauge on the map, log readings in inches after each rain, and see the last 7 days, 30 days and year, a 30-day bar chart and the gallons that ran off your roof.
- **Measure me:** setup step 4 lists the lot (with the house) and every place you picked, each with one "📏 Measure me" button. Tap each corner around the edge on your top photo; any shape works (square, narrow, curved, L-shaped). Tap point 1 again or press Done to finish. The app works out width, depth, true area (shoelace formula) and setback, and decides by itself whether the shape is a rectangle (resizable by corners in My Garden) or irregular (draggable points).
- **Receipts & spending:** in Calendar & journal → Spending & receipts, add a photo or screenshot of a receipt, tap (or drag a box over) each garden item and enter its price, or press "Read the receipt for me" to find the priced lines and check the ones to keep. Items are categorized, totals add up against the receipt total and tax, and spending is tracked by category for the year. Reading runs on the device (Tesseract.js downloads once from jsDelivr); receipts are stored only on the device when saving is on.
- **Plot each place you grow:** in setup step 4, after measuring the lot and house on the top photo, tap the four corners of each place you picked (front yard, back yard, patio…). Each gets its own measurement and its outline appears in that exact spot in My Garden.
- **Orientation step layout:** the dial sits beside the turn buttons and compass (on phones it stays pinned at the top while you scroll the controls).
- **Compass snapshot:** turn on the live compass (on the map, or under the orientation dial in setup), stand in your front doorway facing the street, and tap "📸 Set my front to this". The exact reading becomes your front direction (corrected to true north).
- **Front door wrong?** A house outline looks the same with its front on either side, so under the turn buttons you can pick which way the front door really faces (the outline stays where it is), tap your front door on the map, or use the live compass while standing in the doorway. The same choice is in setup.
- **House & yard photos** stay hidden until you tap "Open house photos" in the At a glance panel.
- **Beds & plants:** add a bed or container (raised, in-ground or pot) with its size; the app places it in the sunniest, part-sun or shadiest open spot, and you can drag it on the map. Add plants to any bed by typing them (with a count) or tap "Search the library".
- **Plant library** has its own spot in the main menu (under My Garden; "Plants" on phones): browse natives and edibles, search by name, filter by light, soil and type, and add plants to a bed. Pick a bed under "Adding to" to see how well each plant fits it.
- The dashboard's extra cards are a "Show more cards" checkbox under Customize (the Starter/Advanced buttons are gone).

## Accounts (prototype)

- **Create an account:** username, email *or* phone number (only if you want your garden saved), date of birth, and city or ZIP code. Then verify with a 6-digit code and go straight into building your space; the city carries over into setup.
- **Sign in** with your email or phone number and a one-time code. No passwords.
- **Under 13:** account creation is blocked (COPPA). The date of birth is checked once and is not stored.
- **Just trying it:** choose "No thanks" and nothing is saved when you leave.
- **Prototype limit:** no email or text is actually sent. The code is shown on screen, and the account is stored only on the device where it was made. Going live needs a sign-in service (for example Firebase Authentication, Supabase Auth or Auth0) plus an email/SMS sender; text messages cost a small amount per code. Only the verify step needs to change.

## Privacy

- Account details (username, email or phone, city) are used only to run your account; email/phone only for sign-in codes, never marketing. Date of birth is not kept.

- On the first visit, a privacy pop-up asks the visitor to allow or reject saving their garden on the device. Allow and Reject look the same, and nothing optional runs before a choice. Only the choice itself is remembered, so the pop-up doesn't keep returning. Privacy choices lists exactly what each option stores and can be changed any time.
- No analytics, ad pixels, outside fonts or third-party scripts.
- The only outside connection is Open-Meteo, and only when the visitor presses a live weather or frost button. It receives the city's location rounded to about 7 miles (and, like any website, the visitor's IP address), nothing about the person or their garden. Results aren't saved.
- Never asks for camera, microphone, photo library or device location. Location is a city or ZIP code the person types (looked up with Open-Meteo's free place search only when they press Find) or a listed city, used only for plant-related information. No latitude or longitude to enter.
- Setup works out which way the front of the house faces: with the phone's compass (only after the person presses Start compass; corrected to true north; readings never leave the device), or by tapping the roof and front door on a satellite screenshot. A third option, "Use my address", finds the house outline and the street in front of it on OpenStreetMap (via Nominatim and the Overpass API), works out the facing direction, offers a choice of streets on corner lots and can estimate the house size. The address is sent only when the person presses Find and is never saved. Turn buttons (5°, 15° and 90°) fine-tune the direction in setup and later on My Garden, turning the house and everything on the map together. Setting it by hand is still there as a fallback.
- Nominatim and the public Overpass servers are free but meant for light use. A public launch with many users needs a paid or self-hosted geocoder and map data service.
- Photos are chosen from a folder, and location data inside them is removed. House photos are kept only if the person turns on saving and chooses "Keep my house photos in my profile"; they stay in that browser and are never uploaded. Posts are private by default.
- The app never loads satellite maps itself; people add a satellite screenshot or drone photo as a file, so no address is sent anywhere.

## Accessibility

- Required descriptions for photos; descriptions or transcripts and optional caption files for video. Videos never autoplay and start muted.
- Text size, higher contrast, reduced motion and low-data settings.
- Text versions of maps and the globe, and keyboard-operable controls. Target: WCAG 2.2 AA.

## Fonts

The welcome page embeds trimmed copies of three open fonts, so nothing loads from an outside font service:
Big Shoulders (headlines), Instrument Sans (body text) and JetBrains Mono (labels and measurements).
All three are released under the SIL Open Font License 1.1 (https://openfontlicense.org).

## Data sources

- **Satellite imagery:** Esri World Imagery tiles (Imagery © Esri, Maxar, Earthstar Geographics), loaded only when the user opts in during setup. Fine for a prototype; a public launch at scale needs an ArcGIS Location Platform account (or a public-domain source such as USGS NAIP for U.S. addresses).

- Weather forecasts and frost estimates: [Open-Meteo.com](https://open-meteo.com/), licensed CC BY 4.0. The free API is for non-commercial use; a commercial launch needs an Open-Meteo subscription or another provider.
- Frost dates are the median last and first 32°F days from the past 10 years of daily lows; the zone is estimated from the average yearly lowest temperature. Both are estimates; the official USDA map is the reference for zones.
- Sun position: NOAA solar calculation.
- Sensor logs are read in the browser and never uploaded. Readings are integrated into daily DLI; days covering less than 80% of daylight are kept but left out of averages. Solar radiation (W/m²) is converted at 2.1 µmol/m²/s per W/m².
- Daily light (DLI): clear-sky sunlight from the Haurwitz model, split into direct sun and sky light, with shaded spots keeping part of the sky light. Converted to plant light at about 2.1 µmol per joule; lux readings use 1,000 lux ≈ 18.5 µmol/m²/s (sunlight).
