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
- **Measurements carry over exactly:** after "Measure me", the top photo, lot, house (where you tapped it, even off-center) and every area are placed in My Garden exactly as measured. The ruler can be the front of your house or the scale bar on a map screenshot (in meters, as Google Earth and Google Maps show it, or feet).
- **Shade check:** in the Sun & shade view, mark spots that are shady or sunny right now. The app compares them with the map. If the sun is low and still hidden behind the trees and houses around you, one tap sets your **tree line** (the angle the sun must clear; adjustable with a slider). Otherwise it can add an estimated tree in the direction of the sun, tall enough to cast that shade, for you to move or adjust.
- **Measure a height:** select a tree (or the house, a neighbor's house, a fence or shed) and press "📐 Measure its height". **Tilt:** set your distance (type it, count steps, or tap where you stand on the map), hold the phone screen-up and sight along its top edge to the top, lock the angle; height = distance × tan(angle) + eye height. **Shadow:** measure the shadow (tape or tap its tip on the map); height = shadow × tan(sun angle right now). The result is saved as Measured and the shade updates. The tilt reading uses the motion sensor only after you start it.
- **Find trees, bushes & buildings:** after a top photo is added (in setup or under House photos), the app scans it on the device and highlights each possible tree (green), bush (teal) and building (orange) with a numbered dashed outline. Under the map, each one has ✓ Tree, ✓ Bush, ✓ Building and ✗ Not an object. Confirming adds it to the map at the size seen in the photo and opens "Measure its height", so its shade counts once the height is set. "Scan again" reruns it. It uses color and texture (no AI service, nothing uploaded). It evens out the blue tint common in 3D map screenshots (Google Earth and similar), finds dark canopy in shadow (marked "in shadow, may be ground"), and joins roof halves split by a ridge line. Works best on clear, overhead photos taken in summer; ground-level photos aren't scanned. Gray or solar-panel roofs can be missed — add those with + Neighbor's house.
- **Dappled shade & neighbors:** trees have a "Leaves let through" setting (dense, medium, light), so light-leafed trees cast filtered shade that counts as partial sun in the sun hours. The shade check has a "⛅ Dappled here now" mark, and its fix adds a light-canopy tree when you mark dappled spots. "+ Neighbor's house" adds a neighbor's building with a height so its shadow counts.
- **Rearrange the dashboard:** drag any section by its ⠿ handle (mouse or finger), or focus the handle and use the up/down arrow keys.
- **Sun hours view:** a continuous color scale (dark green under 2 h → light yellow ≈3 h → bright yellow ≈6 h → golden orange 10+ h) with a legend right under the map that also shows the most sun possible that day. Drag the sun or the time slider to overlay where shade falls at that moment.
- **Water drawing:** draw a line where water runs (bright arrows show the direction of flow) or a shape where water sits (arrows point to where it collects). Pick bright arrow colors, add notes, delete.
- **Rain gauge log:** place your rain gauge on the map, log readings in inches after each rain, and see the last 7 days, 30 days and year, a 30-day bar chart and the gallons that ran off your roof.
- **House and lot maps:** the map-screenshot size step has **1. House measurement** (a close-up map; tap your house and the app traces it) and **2. Lot measurement** (zoomed out). Each shows only its map with ↶ Undo, ↷ Redo and ✕ Clear all lines. On the lot map, a "Measure:" row picks what you tap: House, Lot, then each place you grow (front yard, back yard…), each with a ✓ when done. **3. Line up your top photo** follows if you added a photo. On the right, **Your measurements** holds the scale bars (found automatically, length and meters/feet, or tap it yourself) and every number: lot, house, setback and each place.
- **Places you grow on the lot map:** once the lot is measured, the Lot measurement section lists every place picked in step 1 (front yard, back yard, side yards, greenhouse…). Press 📏 Measure on one and tap its corners on the lot map; it shows in its color with its size and area, and carries onto the top photo and into My Garden. The cards in the measurements column have the same "Measure on the map" button.
- **Your top photo (section 3):** after lining the photo up (two taps on the house's front corners), the lot (white dashed), house (orange) and every place you grow are drawn on the photo. Drag any corner of a place to adjust it where you can see the real beds, or pick a place under "Measure on the photo" and tap its corners. Changes show on the lot map, in Your measurements and in My Garden, with Undo, Redo and Clear all lines.
- **Show on map:** a row of switches right under the My Garden map turns each kind of outline on or off: lot line, house outline, growing places, trees, water marks and found objects, plus All on / All off. Hidden things still count in the sun and shade.
- **Plot water:** in the Water view, "Water you've seen" lists kinds of water to plot. Tap a spot: puddle, downspout, soggy spot, drain or sump. Drag a line: runoff, stream (arrows show the flow), erosion or washout. Drag around a shape: pooling, flooding. Each kind has its own color and label on the map; you can add several in a row, change colors, add notes and delete.
- **Rearrange My Garden:** every panel on the My Garden page has a ⠿ tab. Drag it (or focus it and use the up/down arrow keys) to reorder: At a glance, Selected item, Time of day and the view's details on the right; map tools, Look ahead and Map in words under the map. The layout is remembered (on this device when saving is on); "Reset layout" restores the default.
- **Measure a height, fixed and improved:** the tilt reading now works whichever way the phone or iPad is held (portrait or sideways), with two ways to aim: along the top edge, or pointing the back of the phone like a camera (the camera is never opened). It shows a live height while you aim and warns when you stand too close. New third method, **Compare in a photo**: pick a photo from a folder, tap the bottom and top of the tree, then the bottom and top of something with a known height (your house, a two-story wall, a door, a person or anything you type).
- **Measuring tools:** every measuring step (map screenshot, roof and lot on the photo, each growing place) has the same tool bar right above the picture: the current instruction, ↶ Undo last tap, ✕ Clear all lines, Done and Stop. On the map screenshot, the steps are a numbered list (1 Scale bar, 2 Your house, 3 Your lot, 4 Line up your top photo) with a status and a Redo button each; results show in one "Your measurements" box at the end, with a warning if the lot corners look wrong.
- **Map screenshot (easiest, no tape measure):** setup step 4 starts with "Use a map screenshot". Add a screenshot of the plain 2D map view (Google Maps or Apple Maps) zoomed in on the house. The app finds the scale bar on its own (or you tap its two ends) and you pick its length in meters or feet. Tap inside your house and the app traces its outline, notches included. Then tap the lot corners along the property lines. Lot size, true area, house size and shape, and setback are all measured from the scale bar. If you have a satellite or drone top photo, tap the two front corners of the house on it, and the photo is scaled, turned and lined up with the map (two-point match). With no photo, the map is used as the top view. The screenshot is read on the device and isn't kept after setup.
- **Roof outline = official house size:** measuring the lot goes ruler → every corner of the roof → every corner of the lot. When the ruler is the front of the house, those two taps are also the first two roof corners. The roof outline sets the house width, depth, position, angle and setback; an L-shaped or stepped roof (garage, porch, addition) is kept as its real outline on the map, and its shadow follows that shape.
- **Measure me:** setup step 4 lists the lot (with the house) and every place you picked, each with one "📏 Measure me" button. Tap each corner around the edge on your top photo; any shape works (square, narrow, curved, L-shaped). Tap point 1 again or press Done to finish. The app works out width, depth, true area (shoelace formula) and setback, and decides by itself whether the shape is a rectangle (resizable by corners in My Garden) or irregular (draggable points).
- **Receipts & spending:** in Calendar & journal → Spending & receipts, add a photo or screenshot of a receipt, tap (or drag a box over) each garden item and enter its price, or press "Read the receipt for me" to find the priced lines and check the ones to keep. Items are categorized, totals add up against the receipt total and tax, and spending is tracked by category for the year. Reading runs on the device (Tesseract.js downloads once from jsDelivr); receipts are stored only on the device when saving is on.
- **Plot each place you grow:** in setup step 4, after measuring the lot and house on the top photo, tap the four corners of each place you picked (front yard, back yard, patio…). Each gets its own measurement and its outline appears in that exact spot in My Garden.
- **Line up your photo on the dial:** in the Photos step, under "Turn the house", step 3 lets you drag the top photo on the dial, pinch or scroll to resize it, or use the − / + and arrow buttons, until your roof matches the see-through house (dashed outline, drawn at your house's proportions). If you don't measure on the photo later, this line-up also places the photo under the house in My Garden.
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
- Tree and building heights now update on their own as soon as a measurement has a result (no extra button). Every My Garden card (Time of day, Light probe and more) can be hidden or shown, and map tool rows like "Front door wrong?" fold up. Found objects live in their own movable, folded section, and an "Identified objects" item under At a glance opens it. Scans of your top photo run quietly instead of popping up at sign-in.
- New Normal view with no sun, water or soil layers. Each view shows its own details right under the map: sun and shade for the sun views, water flow for Water, and a button for every bed and growing area in Soil zones. Any section, including At a glance, can be dragged (or moved with the arrow keys) under the map. The Top photo box sits right under the map and folds up.
- Setup: Live Compass is at the top of the line-up screen, and you can turn the house by dragging a finger around the dial's edge.
- Balcony is a new growing place. Balcony and window growers answer which floor they're on, which way it faces (or use the live compass), what's above it and whether walls or a solid railing block sun. The app never asks for an apartment number.
- Apartments: balcony and window growers enter their apartment's size (width and depth, or just the total square feet) instead of a lot. The apartment is drawn at that size, its height comes from the floor it's on, and the balcony or window sits on the side it faces.
- 3D garden (My Garden → 3D garden): the real yard in 3D, including the house, fences, trees, beds, pots and apartment balconies at their floor height. Drag a date slider or press "Watch it grow" to see plants grow, bloom, fruit and die back with the frost, with sun and shadows for the time of day. Side lists show what's in bloom, what's ready to pick and what to do this month. Pick a plant and tap a bed, pot, balcony or the ground to plant it, or tap a plant to move it, change its planting date or remove it. "Save garden file" exports the layout and plants (no photos, notes or address) to send to a client, who opens it with "Open a garden file". Built with plain WebGL, so nothing loads from other sites. The plant library has "Build my garden in 3D" and "Place in 3D garden" buttons.
- Apartment lookup: when an apartment grower types their address, their building's outline appears from OpenStreetMap. They tap the side their home is on (no unit number needed). Nearby buildings come in with heights from the map, or guessed, and can be unticked or corrected. In 3D, the balcony sits on the right wall of the real building.
- Floor plan: upload a floor plan, set the scale from total square feet or one known wall, trace the home, then add each balcony or patio by tapping its corners. Sizes can be adjusted. The app works out which way each one faces, and each becomes its own growing space. The plan image is never saved.
- Look from my balcony: tilt-and-compass readings (or typed angles) of what blocks the sky in each direction. Measured directions replace the map's guesses in the balcony's sun hours.
- My Garden page reorganized: Views sit at the top, with the map under them and the Time of day slider to its right. At a glance lists Overview, Outlines, Where you're growing, Weather, Sun & shade, Soil health, Water flow, Plants in your garden, House photos and Garden notes. The add buttons moved out of the top toolbar into those sections: + Bed, Container and Greenhouse under Where you're growing; + Tree under Plants; + Fence, Neighbor's house and Shed, garage or structure (with height boxes) under Outlines; water tools under Water flow; + Light sensor under Sun & shade. The Normal view shows an overview of everything under the map. Sun & shade now shows which beds are in sun at the chosen time, and Sun hours shows the all-day numbers.
- At a glance tidy-up: House orientation (dial and turn buttons) sits under Overview. Outlines lists the lot and every growing place (front yard, back yard, side yards and more) with Select and width/depth boxes, plus Front door wrong?, the growing-area outline switches, and fences, neighbors' houses and structures. Look ahead moved under Plants in your garden. The Identified objects box shows only when opened from At a glance and has a Close button. Zoom and Undo/Redo moved into the Top photo box under the map.
