'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "ba69122b8b8225e3c124dcc88015ffa5",
"version.json": "e521e4337d879a13f6d87a3af1066c65",
"index.html": "cbae85457ee3a9b05f209c9d31544acd",
"/": "cbae85457ee3a9b05f209c9d31544acd",
"main.dart.js": "6fb49b6f328858e710eb4ba4c5336218",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"resume.pdf": "c8ab3d337afca37d678ef5a85062cc4b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "18408f05739fe0809d58b86068904076",
"assets/NOTICES": "4bdaa800a6e688dc5cc2d1a670f66c73",
"assets/FontManifest.json": "67a28da3784fc091c2f816d615fbf08a",
"assets/AssetManifest.bin.json": "188c26cb744a4e61f088ff742537f509",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b397154b238f9fbff7f9b55410399f4f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "d86783b01348d818310b203fd17584ba",
"assets/fonts/MaterialIcons-Regular.otf": "368463b140b2e95e7a439846e4748d10",
"assets/assets/dp.jpeg": "f07463cd2ac92e5aba5608bcf49c5329",
"assets/assets/instagram.jpg": "4b4d4a704321c935ec6b48c8c4c64d0d",
"assets/assets/youtybe.jpg": "6832788883082a15d470ed949847d372",
"assets/assets/focusstore.png": "d751da6796d128fc46b859e6693c8f9e",
"assets/assets/cfa%2520tvp.jpg": "5737d25ce7c8a2082193d158bb1b56f1",
"assets/assets/tmx.jpeg": "2d3da470ad3b0a98eea4ba8d9b72d558",
"assets/assets/Mohammed%2520Riswan.pdf": "74ba62992b190fedeffaef6d0cb11be5",
"assets/assets/logos/applestore-logo.png": "10fe809d9cbb9cfbcfe8077e6887b485",
"assets/assets/logos/dart-logo.png": "9271c5feaa7176d4bc87467c11eaa8c0",
"assets/assets/logos/convosys-logo.png": "950a64d5735e4b2772cb2c34e65fcd30",
"assets/assets/logos/bloc-logo.png": "6590464a542a15c3cec0ed46b1c65ab3",
"assets/assets/logos/rays-logo.png": "165b7b2afd66292bfdf58c122adb7b0f",
"assets/assets/logos/bluetooth-logo.png": "50138288187fdde79107af562b8a3557",
"assets/assets/logos/sync-logo.png": "c0638c0dd9b6b9ddd7fd5f9e67e5802d",
"assets/assets/logos/postman-logo.png": "88af45c7ebd7f036992684ea66888491",
"assets/assets/logos/firebase.png": "41ab203c3be47c6f7e3f08d47f1f62c1",
"assets/assets/logos/supabase.png": "3199f2c636f94c50045dd8558eb00ea5",
"assets/assets/logos/bluetooth-app-logo.png": "709b2399a3cbd91aa36a89fe549f2bdb",
"assets/assets/logos/flutter-logo.png": "ea5334c6b098d59057d5c8d4a8371397",
"assets/assets/logos/playstore-logo.png": "39948027012689e6ec38166698f9c3e8",
"assets/assets/logos/eamunc-logo.png": "837b8ae0b163d45f00747e7161c94ffc",
"assets/assets/logos/github-logo.webp": "9e8f7df1c7d2dae49586969b077b9d26",
"assets/assets/logos/figma-logo.png": "5903fb5732c2ec944f6e7508b031f03d",
"assets/assets/logos/rambers-logo.png": "18cf7201bbf66ed628d5f39ccba93504",
"assets/assets/miniroom2.png": "d2b047e5599d3df0ccfeae5d9ba24e76",
"assets/assets/netflix.jpg": "f0b398b039fb69222c9947546ea4a8be",
"assets/assets/miniroomimage.png": "7650de57891632557abc801902b80d75",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
