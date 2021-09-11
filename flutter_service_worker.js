'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"favicon.png": "c27174e6dfb4375e3d1b2f65523844ee",
"manifest.json": "be83e9811b562c64f5e4611203a42414",
"assets/FontManifest.json": "032174a146c1a900a4a204ff0bb605d4",
"assets/NOTICES": "36955664d65089e1e5103329bc1930d5",
"assets/assets/FontManifest.json": "032174a146c1a900a4a204ff0bb605d4",
"assets/assets/bgt.jpeg": "fb76f07269e054216148d0229ca36f34",
"assets/assets/spooktecular.jpeg": "e4756da07ce610eed3e857c45b631678",
"assets/assets/rotary_international.png": "428acbac11625687367b66387b88a9f4",
"assets/assets/peace_day.jpeg": "a7fe9f2ba9b9d2bd84157f0f19f4d955",
"assets/assets/celeberation_image_orange.webp": "20d11c7baa572f2416ef7075f0c0ae4f",
"assets/assets/prism1.jpg": "7a19145c29808eeaf863077cda8bf868",
"assets/assets/prism3centre.jpg": "2d973e83ccafc729ed6565d024c04d9b",
"assets/assets/blue_rcbit_logo.png": "be5f8e2fc05e3b4717c52a9ec70af1f7",
"assets/assets/pratibha.JPG": "5008c64b6e44271d5490822a84585aad",
"assets/assets/celeberation_image.jpg": "d69cb88f5400be80de64c663ab4bd726",
"assets/assets/nithinkamath.png": "531ebf5b645e679837c59c684f9d2958",
"assets/assets/BDC.jpeg": "d744a7b3a14abf65c45d2daa0f4e35c6",
"assets/assets/NOTICES": "36955664d65089e1e5103329bc1930d5",
"assets/assets/rotary_pres.jpg": "5f749b443c7b5a37f0f4292ee0e0a8c4",
"assets/assets/assets/bgt.jpeg": "fb76f07269e054216148d0229ca36f34",
"assets/assets/assets/spooktecular.jpeg": "e4756da07ce610eed3e857c45b631678",
"assets/assets/assets/rotary_international.png": "428acbac11625687367b66387b88a9f4",
"assets/assets/assets/peace_day.jpeg": "a7fe9f2ba9b9d2bd84157f0f19f4d955",
"assets/assets/assets/celeberation_image_orange.webp": "20d11c7baa572f2416ef7075f0c0ae4f",
"assets/assets/assets/prism1.jpg": "7a19145c29808eeaf863077cda8bf868",
"assets/assets/assets/prism3centre.jpg": "2d973e83ccafc729ed6565d024c04d9b",
"assets/assets/assets/blue_rcbit_logo.png": "be5f8e2fc05e3b4717c52a9ec70af1f7",
"assets/assets/assets/pratibha.JPG": "5008c64b6e44271d5490822a84585aad",
"assets/assets/assets/celeberation_image.jpg": "d69cb88f5400be80de64c663ab4bd726",
"assets/assets/assets/nithinkamath.png": "531ebf5b645e679837c59c684f9d2958",
"assets/assets/assets/BDC.jpeg": "d744a7b3a14abf65c45d2daa0f4e35c6",
"assets/assets/assets/rotary_pres.jpg": "d112b6dca5fadd646772309f4ae7faca",
"assets/assets/assets/le_panga.JPG": "e38a27396bb6812585bc3c8e72c83c03",
"assets/assets/assets/principal.jpg": "a468402f7fa6101064fd6377bfef20e5",
"assets/assets/assets/Trade-itional.png": "e5f27cee97501f683f1b219b6061485c",
"assets/assets/assets/prism2.jpg": "b1cd6a2d4672cd11ee571a396085819d",
"assets/assets/assets/rotary_pres.jpeg": "2b1fc90a49fb50f2e84b0fc6b443177c",
"assets/assets/assets/codigo.jpeg": "3117a71f865f41749b450df636d5a2ba",
"assets/assets/assets/childre_day.jpg": "5764717a2d289b26e2ea64db50ef4255",
"assets/assets/assets/title_logo.png": "c27174e6dfb4375e3d1b2f65523844ee",
"assets/assets/assets/rcbit_logo.png": "1b78e943416c1d92303d375f8ee0aee1",
"assets/assets/assets/abacus.jpeg": "7358acf8adbf51991a4e1ee4f6b6b7df",
"assets/assets/assets/celeberation_image.webp": "fd645211e255c697bb9cbd33cc2910cc",
"assets/assets/assets/rbse_logo.png": "f377c2c6f374e9c4465d0d07b4da2d86",
"assets/assets/assets/le_panga_event.jpeg": "76ce5dda42bd25fa0aadb9eca355e38b",
"assets/assets/le_panga.JPG": "e38a27396bb6812585bc3c8e72c83c03",
"assets/assets/principal.jpg": "a468402f7fa6101064fd6377bfef20e5",
"assets/assets/rcbit/shahid.jpg": "cb56d4bdc4f98702fb844527009e4ab9",
"assets/assets/rcbit/kishan.jpeg": "22b661275377e48f80e35ad60228dac8",
"assets/assets/rcbit/thejusvani.jpg": "b9882d5952ba5cacaeb83a911fffa116",
"assets/assets/rcbit/anirudha.jpg": "e41c993bdbef84e599fa0df752047fcd",
"assets/assets/rcbit/sourabh.jpg": "9da41b9523654166ce3ebfb86fac6730",
"assets/assets/rcbit/manish.jpg": "7d879597ad87ccb329c1f8e6fccf2d71",
"assets/assets/rcbit/shreyash.JPG": "fe61bd7d941293f4af1d2f9195fe7568",
"assets/assets/rcbit/maanvi.jpeg": "28d111b0b2e5ed789cd563ec1e477f74",
"assets/assets/rcbit/rohan.jpeg": "8251bbc22440ed92e6dda93f2805d483",
"assets/assets/rcbit/kajal.jpg": "7c4a15dcae07e6e4170a9ec10065ab42",
"assets/assets/rcbit/chandan.jpg": "37770d4e6513ae4dfa2e3eaaca57f69b",
"assets/assets/rcbit/manjit.jpg": "8430ccfef1f6b21e606babd747a72e81",
"assets/assets/rcbit/sridevi.jpg": "85aedbdb488c96281c8b555b9f2a67e1",
"assets/assets/rcbit/mansi.jpg": "870d682e37f7895b1fcc28b3ef548a3d",
"assets/assets/rcbit/tanya.jpg": "578ff97eb7c2e850490cdcbfb9e001ff",
"assets/assets/rcbit/samarth.jpg": "4934c927c76cb110a3d7283055ebdd9d",
"assets/assets/rcbit/supritha.jpg": "5ed96af5bf11b90de027028112e8577e",
"assets/assets/rcbit/harshit.jpg": "140c9bc396c1d267bc8c320f4a949f1d",
"assets/assets/rcbit/amisha.jpg": "e3bc5095b124ba2bee8f7c088117b265",
"assets/assets/rcbit/mayank.jpg": "9a7a81733019d1417876664e2ff53b0f",
"assets/assets/rcbit/yukta.jpg": "55faa5fac7b6453990bd8514b05879f9",
"assets/assets/rcbit/ananya.jpg": "bfbeb8001efd85994492e002b2bf717c",
"assets/assets/rcbit/hritik.jpg": "b6f613895f0e8a59d8b0b6a120926864",
"assets/assets/Trade-itional.png": "e5f27cee97501f683f1b219b6061485c",
"assets/assets/prism2.jpg": "b1cd6a2d4672cd11ee571a396085819d",
"assets/assets/rotary_pres.jpeg": "2b1fc90a49fb50f2e84b0fc6b443177c",
"assets/assets/codigo.jpeg": "3117a71f865f41749b450df636d5a2ba",
"assets/assets/childre_day.jpg": "5764717a2d289b26e2ea64db50ef4255",
"assets/assets/title_logo.png": "c27174e6dfb4375e3d1b2f65523844ee",
"assets/assets/rcbit_logo.png": "1b78e943416c1d92303d375f8ee0aee1",
"assets/assets/AssetManifest.json": "a0bdb233e792bf18f7639612c8cb7156",
"assets/assets/abacus.jpeg": "7358acf8adbf51991a4e1ee4f6b6b7df",
"assets/assets/celeberation_image.webp": "fd645211e255c697bb9cbd33cc2910cc",
"assets/assets/bahnschrift.TTF": "b3483ec650bba4a4416d39c4d6030a99",
"assets/assets/rbse_logo.png": "f377c2c6f374e9c4465d0d07b4da2d86",
"assets/assets/le_panga_event.jpeg": "76ce5dda42bd25fa0aadb9eca355e38b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/AssetManifest.json": "e2498df4db6514f4488be25ac5916760",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"main.dart.js": "691048c249d77b0155ccc39f35769676",
"index.html": "ddda809b20fb4e998be432b47e8515fe",
"/": "ddda809b20fb4e998be432b47e8515fe",
"version.json": "51f5307a70eeaecafea930ecc355c168"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
