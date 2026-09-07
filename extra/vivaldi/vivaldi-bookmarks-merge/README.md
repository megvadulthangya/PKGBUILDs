## How to Use merge.js

Included is a nodejs script called "merge.js". Here is a very brief example of 
how to use it with some prepared example data (included) using an unpacked 
deb.

```
$ wget -q https://downloads.vivaldi.com/stable/vivaldi-stable_3.8.2259.42-1_amd64.deb
$ ar p vivaldi-stable_3.8.2259.42-1_amd64.deb data.tar.xz | tar -xJ --one-top-level=vivaldi-repack
$ node merge.js manjaro-example vivaldi-repack/opt/vivaldi/resources/vivaldi
```

(In your case you would call it in the PKGBUILD during the packaging step)

Here the "manjaro-example", which we created contains the following:

```
manjaro-example/
manjaro-example/default-bookmarks
manjaro-example/default-bookmarks/partners.json
manjaro-example/default-bookmarks/en-US.json
manjaro-example/resources
manjaro-example/resources/manjaro.png
manjaro-example/resources/manjaro_wiki.png
```


In this example the "partners.json" looks like this:

```
{
  "folders": [
    {
      "name": "Manjaro",
      "guid": "30844c9b-a314-468a-ac5c-7dc0827faf4b"
    }
  ],
  "bookmarks": [
    {
      "name": "manjaro.org",
      "thumbnail": "/resources/manjaro.png",
      "guid": "f4ce85f0-7aa9-48cc-880f-c99acfbdf694",
      "guid2": "2b62f4ab-ad1f-4ce8-969f-2d5f9133b894"
    },
    {
      "name": "wiki.manjaro.org",
      "thumbnail": "/resources/manjaro_wiki.png",
      "guid": "76e2345a-347f-4e8a-97fa-7d3a2da825bd",
      "guid2": "f075a187-1262-4ed9-aa8d-f6eb8e5f67b1"
    }
  ]
}
```

Here you can see that the subfolder of the Speed dial is named Manjaro and it 
contains two bookmarks, one to your website and one to your wiki (obviously 
you could put more entries if you like). The thumbnails are to give the Speed 
Dial entries a custom look and are included under the subdirectory 
"resources". For this example we just used colored pngs. You would obviously 
replace these.

Regarding the "name" values, any folder name must use only latin letters, 
digits and must start with a capital letter. Bookmark names must use only 
latin letters, digits, dash, dot and must start with a small letter or digit.

You will note the use of UUIDs (guid and guid2), with the folder having one 
and the bookmarks having two. You can just generate these with `uuidgen`. They 
are used to avoid duplication for sync and also to prevent a bookmark being 
reinjected into the users Speed Dial in cases of upgrade, where the user 
already deleted them once. The reason there are two for bookmarks is that it 
allows the same partner bookmark to appear in two places, once under SpeedDial
and once under the Bookmark folder. As a general rule you must generate these
UUIDs once and reuse them in the future for all cases where you consider
the bookmark to be "the same" but more on that in the next section.

Finally, here is the example "en-US.json":

```
{
  "version": "2",
  "children": [
    {
      "name": "SpeedDial",
      "children": [
        {
          "name": "Manjaro",
          "children": [
			{
			  "name": "manjaro.org",
			  "url": "https://manjaro.org",
			  "title": "Manjaro",
			  "description": "Manjaro homepage"
			},
			{
			  "name": "wiki.manjaro.org",
			  "url": "https://wiki.manjaro.org/index.php?title=Main_Page",
			  "title": "Manjaro Wiki",
			  "description": "Manjaro wiki pages"
			}
          ]
        }
      ]
    }
  ]
}
```

You will notice is that there are no UUIDs listed here at all. It is actually 
the "name" values that appear in two files that match everything up together 
when first read by Vivaldi (the UUIDs are then used internally). Therefore the 
name must be consitent across the files.

The other values can vary. This is a "en-US" file. Thus the title and 
description (which appear in the UI) are in English.

We currently support 40 localisations (be-BY, de-AT, de-CH, de-DE, dk-DK, en, 
en-AU, en-CA, en-GB, en-IE, en-IN, en-NZ, en-US, es-AR, es-CL, es-CO, es-ES, 
es-MX, es-PE, es-VE, fr-FR, id-ID, is-IS, it-IT, ja-JP, mk-SG, my-MY, nb-NO, 
nn-NO, ph-PH, pl-PL, pt-BR, pt-PT, ru-RU, sv-SE, tr-TR, uk-UA, vi-VI, zh-HK, 
zh-TW) but this will likely change in the future. So keep an eye out by 
looking at what we have in the package. ;)

If you want to update all of the locales identically, just copy en-US(.json) 
to each of these supported locales before running merge.js (e.g. `cp 
en-US.json de-DE.json`). Alternately you can copy them and then update each of 
them with language specific titles, descriptions and even urls before running 
merge.js.

P.S. Do not run merge.js more than once because you will end up with corrupted 
files that Vivaldi rejects (leaving the user with no default speed dials). 
Have all your files prepared and ready before hand and just run merge.js the 
one time and it will update all the files in Vivaldi for you.

## Testing the changes ##

After you have updated everything, if you want to confirm that it all worked, 
install Vivaldi and launch it like so:

```
LANG=en-US vivaldi --user-data-dir="$(mktemp -td vivaldi-test.XXXXXX)" &
```

The above will cause Vivaldi to launch with a clean/test profile in US English 
(en-US). Just adjust LANG to another language to check that, e.g. 
`LANG=de-DE`. Check that your merged bookmarks are present and localised (if 
you did localisation changes).
