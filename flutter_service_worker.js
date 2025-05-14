'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.ico": "23c1562e1e49a6f793c851b120e07f8f",
"assets/AssetManifest.json": "b970303cd9c8db23f082f6e0d4ae416c",
"assets/AssetManifest.bin": "d4fa29a3198a462e5a35de5fe88f70ab",
"assets/assets/audio/die.wav": "16436c886c305a4bb2f8aa04e0e00919",
"assets/assets/audio/wing.wav": "802e8685100ebd33c49630e01407641e",
"assets/assets/audio/background.mp3": "3431c779f2b5ed847fde5e16c408fb69",
"assets/assets/audio/score.mp3": "fd7f3ff3f2c802d1fd238a4378fcb8fb",
"assets/assets/audio/hit.wav": "3cf321a7a65534a5abd59dc9aacae746",
"assets/assets/fonts/Chewy-Regular.ttf": "53ee0977b5f9f3afc1d18b4419264c8b",
"assets/assets/icons/ic_share.svg": "cb5d32bf25018f759d6cdbc484eeb059",
"assets/assets/icons/ic_home.svg": "83a4b484c2766ec3a052d3fa4ed4ada2",
"assets/assets/icons/ic_profile.svg": "db8773511fbb30df65dde72712699e62",
"assets/assets/icons/ic_menu.svg": "ba05c07cf42de65584dfa04b9c6fe66f",
"assets/assets/icons/ic_youtube.svg": "81efb2f1086f3519e04833f5f0f95953",
"assets/assets/icons/ic_qr.svg": "0c949e7ec7cdc32137c784502b458066",
"assets/assets/icons/ic_github.svg": "8dcc6b5262f3b6138b1566b357ba89a9",
"assets/assets/icons/app_icon.png": "56931f95d9062ce735dc0d92f8e03428",
"assets/assets/icons/ic_trophy.svg": "70e00ec9619fef0830e74631b86005b2",
"assets/assets/icons/ic_back.svg": "83e40138f06f8163af486505bc9188fc",
"assets/assets/icons/ic_close.svg": "63bda2f6191ad9b92d72e0d6e5fb2ce9",
"assets/assets/images/logo.png": "276a3da0529b5f057928cfa90ee5a753",
"assets/assets/images/portal.png": "f2f64637dda305f0f4a8eab4b3a1f52a",
"assets/assets/images/multi_dash.svg": "0693839b246c67c0d389f525e2135a34",
"assets/assets/images/dashes/peachy_dash.svg": "fa80e0493be7fc1107eaf0712b7f5ecc",
"assets/assets/images/dashes/flutter_dash.png": "72b9fdf7bf5562b08c106f1ceaee68aa",
"assets/assets/images/dashes/minty_dash.png": "c150dce7ee4d6bf603f28a43e2724c72",
"assets/assets/images/dashes/lime_dash.svg": "95a754cb57d669ec19d5eab126fded22",
"assets/assets/images/dashes/sky_dash.png": "b902cd9f51181d497c0e49d0e4e2c7e2",
"assets/assets/images/dashes/sky_dash.svg": "cc8de1d6d476b06c097cc00925369e2c",
"assets/assets/images/dashes/minty_dash.svg": "19c48cf6876cd4dda449ac2a1eef0209",
"assets/assets/images/dashes/violet_dash.svg": "5931b89a446e9d033bbf7f22099c9da3",
"assets/assets/images/dashes/flutter_dash.svg": "9ddce3ffed2a02abf0a792ed82135054",
"assets/assets/images/dashes/violet_dash.png": "82378d302cca033083e58bc7ae456b7f",
"assets/assets/images/dashes/scarlet_dash.png": "d5c3aecd235fb7e4f7b88e94b16052f1",
"assets/assets/images/dashes/sand_dash.png": "646c3e70c5fa60f6803ba2022696803d",
"assets/assets/images/dashes/sunny_dash.svg": "8c4dab3d92651f0a92200b5830c17100",
"assets/assets/images/dashes/scarlet_dash.svg": "3aef89da948511af4da90a331958f534",
"assets/assets/images/dashes/lime_dash.png": "92b67d94298e414f36cecdfb34adca2e",
"assets/assets/images/dashes/sand_dash.svg": "fb8d4480168cdd19bebb09d16753e20e",
"assets/assets/images/dashes/sunny_dash.png": "24fbac84d2add52a6e5fd955c06b9a50",
"assets/assets/images/dashes/rose_dash.png": "670c447e2ebc016581b70975050c5b92",
"assets/assets/images/dashes/rose_dash.svg": "ed5d217e8f4a6ca01d373b40a9ba9bc5",
"assets/assets/images/dashes/peachy_dash.png": "79d02fdd1f456bdc0c7e8f8d1d6bb10d",
"assets/assets/images/dash.png": "56931f95d9062ce735dc0d92f8e03428",
"assets/assets/images/trophies/trophy3.svg": "eda4dbf380c068696935a13d6b686225",
"assets/assets/images/trophies/trophy2.svg": "8d1534822682f0446c9d07e4f67b566a",
"assets/assets/images/trophies/trophy1.svg": "1cda26afacc40835982162ffd5c63feb",
"assets/assets/images/blurred_background.png": "538676c07a0e09523778815af2f76e8a",
"assets/assets/images/pipe.png": "ccbadae55474e53cc16f5268f3a809d5",
"assets/assets/images/background/layer4-clouds.png": "39f85052dd79e18ff8c5f5229b0936de",
"assets/assets/images/background/layer3-clouds.png": "3db7a5a18357d9a99d77651f7212886c",
"assets/assets/images/background/layer7-bushes.png": "49cfa7c605a0f0a0faacab7f3e5cda6c",
"assets/assets/images/background/layer2-clouds.png": "2d298c3ccbc53cbefaaa0390900b6485",
"assets/assets/images/background/layer1-sky.png": "eaca695464b3b8a9ce918075c26acd11",
"assets/assets/images/background/layer5-huge-clouds.png": "1c8fc9133672d14d3fce14d608c4701c",
"assets/assets/images/background/layer6-bushes.png": "5123c114769ed9dd086aaa50e9fa025f",
"assets/FontManifest.json": "ea489b15cb1e3312372838ae6ec740ef",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/AssetManifest.bin.json": "973391f4983d734f5ad804069cb0a647",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "facc0067876c5bf1bea2b57c2df05c9d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"manifest.json": "149c986d7ca8056fbb5832fa7f88d675",
"version.json": "23c90fc09f546e6cef0e86f4c748f4cf",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"index.html": "fefcab648c56ba14a037ee578ecdacc4",
"/": "fefcab648c56ba14a037ee578ecdacc4",
"flutter_bootstrap.js": "cf954f4c0fac7093fc6e4943d6cc8709",
"icons/favicon.ico": "23c1562e1e49a6f793c851b120e07f8f",
"icons/apple-touch-icon.png": "48e32391e8f35f2e94b950995766e299",
"icons/manifest.json": "149c986d7ca8056fbb5832fa7f88d675",
"icons/Icon-192.png": "cebed8b337fce7bb77a4c5963da9ec82",
"icons/Icon-maskable-192.png": "b362188a07e79c4f301b26cf968998e6",
"icons/Icon-maskable-512.png": "7c83cf9a3858cc553b770e3235ad31f2",
"icons/Icon-512.png": "6cf6fcd673796e1de5446f392f978bbb",
"main.dart.js": "c5b40619365e3d27c8d405ea803e150c"};
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
