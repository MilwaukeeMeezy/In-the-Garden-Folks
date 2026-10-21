/* In the Garden, Folks! offline support: keeps a copy of the app so it opens without internet after your first visit.
   It caches only this site's own files. Weather, maps and sync still need a connection and are never cached. */
const CACHE="igf-v1";
const FILES=["./","index.html","manifest.webmanifest","icon.svg"];
self.addEventListener("install",e=>{e.waitUntil(caches.open(CACHE).then(c=>c.addAll(FILES)).then(()=>self.skipWaiting()))});
self.addEventListener("activate",e=>{e.waitUntil(caches.keys().then(ks=>Promise.all(ks.filter(k=>k!==CACHE).map(k=>caches.delete(k)))).then(()=>self.clients.claim()))});
self.addEventListener("fetch",e=>{const u=new URL(e.request.url);if(e.request.method!=="GET"||u.origin!==location.origin)return;
 /* network first, so updates show up right away; fall back to the saved copy when offline */
 e.respondWith(fetch(e.request).then(r=>{if(r.ok){const c2=r.clone();caches.open(CACHE).then(c=>c.put(e.request,c2))}return r}).catch(()=>caches.match(e.request).then(r=>r||caches.match("index.html"))))});
