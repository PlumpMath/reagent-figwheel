#!/bin/bash

rm -r temp
mkdir temp
cd temp

# base
printf "\ncreating base\n"
lein new reagent-figwheel base
cd base
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

# cider
printf "\ncreating base +cider\n"
lein new reagent-figwheel base-cider +cider
cd base-cider
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

# devcards
printf "\ncreating base +devcards\n"
lein new reagent-figwheel base-devcards +devcards
cd base-devcards
lein cljsbuild once min
lein cljsbuild once hostedcards
cd resources/public
google-chrome index.html
google-chrome cards.html
cd ../../..

# keechma
printf "\ncreating base +keechma\n"
lein new reagent-figwheel base-keechma +keechma
cd base-keechma
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

# routes
printf "\ncreating base +routes\n"
lein new reagent-figwheel base-routes +routes
cd base-routes
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

# test
printf "\ncreating base +test\n"
lein new reagent-figwheel base-test +test
cd base-test
lein cljsbuild once min
lein doo phantom test once
cd resources/public
google-chrome index.html
cd ../../..

# garden
printf "\ncreating base +garden\n"
lein new reagent-figwheel base-garden +garden
cd base-garden
lein garden once
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

# less
printf "\ncreating base +less\n"
lein new reagent-figwheel base-less +less
cd base-less
lein less once
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

# Everything sans Keechma
printf "\ncreating base +cider +routes +test +garden +less +devcards\n"
lein new reagent-figwheel everything-sans-keechma +cider +routes +test +garden +less +devcards
cd everything-sans-keechma
lein garden once
lein less once
lein cljsbuild once min
lein cljsbuild once hostedcards
lein doo phantom test once
cd resources/public
google-chrome index.html
google-chrome cards.html
cd ../../..

# Everything
printf "\ncreating base +cider +routes +test +garden +less +keechma +devcards\n"
lein new reagent-figwheel everything +cider +routes +test +garden +less +keechma +devcards
cd everything
lein garden once
lein less once
lein cljsbuild once min
lein cljsbuild once hostedcards
lein doo phantom test once
cd resources/public
google-chrome index.html
google-chrome cards.html
cd ../../..
