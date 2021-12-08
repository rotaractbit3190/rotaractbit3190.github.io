'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "144ebef2084c91c9a044b9c7606547ed",
"assets/assets/AssetManifest.json": "a0bdb233e792bf18f7639612c8cb7156",
"assets/assets/Awards.jpg": "fbe3e4ab9e057d14571f00bbaf10f4e4",
"assets/assets/bahnschrift.TTF": "b3483ec650bba4a4416d39c4d6030a99",
"assets/assets/blue_rcbit_logo.png": "be5f8e2fc05e3b4717c52a9ec70af1f7",
"assets/assets/Book_donation.jpg": "7071004cc1ac98a186942b64ac019733",
"assets/assets/Canopy.jpg": "b53e270361c668ad59086d1a638bc3c6",
"assets/assets/celeberation_image.webp": "fd645211e255c697bb9cbd33cc2910cc",
"assets/assets/celeberation_image_orange.webp": "20d11c7baa572f2416ef7075f0c0ae4f",
"assets/assets/FontManifest.json": "032174a146c1a900a4a204ff0bb605d4",
"assets/assets/NOTICES": "36955664d65089e1e5103329bc1930d5",
"assets/assets/principal.jpg": "a468402f7fa6101064fd6377bfef20e5",
"assets/assets/rbse_logo.png": "f377c2c6f374e9c4465d0d07b4da2d86",
"assets/assets/rcbit/Aatmika5.jpg": "16bc1b1316adef627c984736b257ae0e",
"assets/assets/rcbit/AkashUday.jpg": "85beb6ef02b3ffbeccf1d2a542318625",
"assets/assets/rcbit/Akshay.jpeg": "ce5ca2c669575adb26ccb0fa416ada42",
"assets/assets/rcbit/amisha.jpg": "e3bc5095b124ba2bee8f7c088117b265",
"assets/assets/rcbit/ananya.jpg": "a669b0ac0cbe5092375c3e08db1bb52d",
"assets/assets/rcbit/anirudha.jpg": "e41c993bdbef84e599fa0df752047fcd",
"assets/assets/rcbit/Anushka.jpg": "71cad2528474d38d2a44b511707d0ffe",
"assets/assets/rcbit/Arpita.jpg": "c4e420c30f0277d7091f118dc04b875c",
"assets/assets/rcbit/chandan.jpg": "37770d4e6513ae4dfa2e3eaaca57f69b",
"assets/assets/rcbit/Divyam3.jpg": "936810426132628ab42b19de830dd882",
"assets/assets/rcbit/hritik.jpg": "b6f613895f0e8a59d8b0b6a120926864",
"assets/assets/rcbit/kishan.jpg": "645df0d096ed28ad38e4b2e3fc3f42da",
"assets/assets/rcbit/koushal.jpg": "4bc382c33e0a723cc2440c2230e5b97a",
"assets/assets/rcbit/Likitha.jpg": "58894652631a01c2dc84795f469cfa98",
"assets/assets/rcbit/manish.jpg": "7d879597ad87ccb329c1f8e6fccf2d71",
"assets/assets/rcbit/Manognya.jpeg": "d63c19313a86a82d953253b683d76df6",
"assets/assets/rcbit/mansi.jpg": "870d682e37f7895b1fcc28b3ef548a3d",
"assets/assets/rcbit/mayank.jpg": "9a7a81733019d1417876664e2ff53b0f",
"assets/assets/rcbit/NIKHIL.JPG": "91ac9d3bec9e89adff09abad779478df",
"assets/assets/rcbit/Prasanna1.jpg": "666b4c472ead70166d1efd25684e2acd",
"assets/assets/rcbit/Prerana.jpg": "47debc1085daf33bc2bee3951b296cf5",
"assets/assets/rcbit/rohan.jpeg": "8251bbc22440ed92e6dda93f2805d483",
"assets/assets/rcbit/Rohan.jpg": "972244c8b8aff41783b9d2230130165b",
"assets/assets/rcbit/Shashank.jpg": "eeedfc13416003c8a757daeb08321e93",
"assets/assets/rcbit/Sridevi2.jpg": "0f72de4844ea2e83000f7fb005148274",
"assets/assets/rcbit/Sumedha.jpg": "e9ea7bec97e6db295ae7846811fa68f2",
"assets/assets/rcbit/Sunaina.jpg": "5153190c10d2bdb63d163cd611cd54ea",
"assets/assets/rcbit/Swathy.jpg": "ad40fefc9d6eb1e0909482e97aded303",
"assets/assets/rcbit/thejusvani.jpg": "b9882d5952ba5cacaeb83a911fffa116",
"assets/assets/rcbit/Yashaswi.jpg": "6c0580d9f4796b295a4257e9458fd182",
"assets/assets/rcbit_logo.png": "1b78e943416c1d92303d375f8ee0aee1",
"assets/assets/roarlikeone.png": "42d8ecbc0a44d0572692ba87f9234bba",
"assets/assets/roarlikeone2.png": "14ab930cbc724446296966bfcd00c9f1",
"assets/assets/rotary_international.png": "428acbac11625687367b66387b88a9f4",
"assets/assets/rotary_pres.jpeg": "2b1fc90a49fb50f2e84b0fc6b443177c",
"assets/assets/rotary_pres.jpg": "5f749b443c7b5a37f0f4292ee0e0a8c4",
"assets/assets/Run_for_hunger(1).jpeg": "98da7862e55919a6861fb7bbb71b02f8",
"assets/assets/Run_for_hunger(2).jpeg": "fe8609c6b44cda415d84fffbebf1d46f",
"assets/assets/Run_for_hunger(3).jpg": "2d329fd4dc7a25535b23add82c42b798",
"assets/assets/tiger_logo.png": "97d26a0457f5a6feb8319156f325b82b",
"assets/assets/title_logo.png": "c27174e6dfb4375e3d1b2f65523844ee",
"assets/assets/Treaking.jpg": "579a628c223be234c205dc20a87b0c60",
"assets/assets/Treaking1.jpg": "aa37116ba4cb33b372a19df10ba63131",
"assets/FontManifest.json": "032174a146c1a900a4a204ff0bb605d4",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "96f73cbbc326813ac76b42f5834f756a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "c27174e6dfb4375e3d1b2f65523844ee",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "3a8d5a207b7ebc7d084ec96848990a8d",
"/": "3a8d5a207b7ebc7d084ec96848990a8d",
"main.dart.js": "ef4f1a30165b434cfdbba99b1ccf8c54",
"manifest.json": "be83e9811b562c64f5e4611203a42414",
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
