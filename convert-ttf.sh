#!/bin/sh
# This script hackily creates a .ttf file as `creep.ttf`

# To begin, it's necessary to make a size 12 bitmap bdf so that the  .ttf has
# the correct a size for the terminal (e.g. termite)
# First we generate a correct size creep 16 bitmap
fontforge ./exporttmpbdf.pe
# then we take the prepared size 12 bitmap header manually generated via the
# fontforge GUI interface. The same operations cause segfaults when ran from a
# script unfortunately
BDF12FILE="/tmp/creep-12.bdf"
cat ./bdf12head > $BDF12FILE
# Lines after 30 in the 16 size bitmap font have the actual characters
tail -n +31 /tmp/creep-16.bdf >> $BDF12FILE

# Finally we can make the .ttf
fontforge ./exportttf.pe
