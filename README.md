creep
=====

[Features](#features) · [Usage](#usage) · [Attribution](#attribution) ·
[Licence](#license)

I never found the pixel font that was perfect for me, so I decided to roll
my own with creep.  It is a pretty compact (only 4px wide!) font that's great
for smaller screens (like my 11" laptop).

I'm constantly adding in new characters (diacritics, box-drawing characters, etc.),
so I figured I'd put it up on github for poeple to reap benefits of this.

I also recently added some nice [Haskell features](https://github.com/romeovs/creep/wiki/Haskell-syntax-sugar) (that
can be used in other languages too)!

![screenshot1](screens/screen.png  "screenshot of the ASCII characters")
![screenshot2](screens/screen2.png "in the wild example")

### Features
#### Powerline
Creep supports all the symbols needed for Lokaltog's awsome [powerline](https://github.com/Lokaltog/powerline)
![powerline](screens/powerline.png "powerline screenshot")

#### Sparklines
Creep has the necessary symbols for creating sparklines.  See how good it makes
[iStats](https://github.com/Chris911/iStats) look:
![powerline](screens/istats.png "istats screenshot")

#### Better Haskell syntax
I've added support for better Haskell syntax.  Take a look at [the wiki
page](https://github.com/romeovs/creep/wiki/Haskell-syntax-sugar) for how to
implement this in vim (or emacs).

#### Braille and Drawille
Because creep now supports the full [braille
alphabet](https://en.wikipedia.org/wiki/Braille_Patterns_(Unicode)), it also
supports all of the [Drawille](https://github.com/asciimoo/drawille) libraries:
![powerline](screens/drawille.png "drawille screenshot")

## Usage
The font is maintained using the awesome [gbdfed](http://sofia.nmsu.edu/~mleisher/Software/gbdfed/) 
which unfortunatly does not support a lot of export formats besides `bdf`.

To install creep in Mac OS X, you can use [font forge](http://fontforge.org/) to convert the `bdf`
file to a `dfont` file that can be used by Font Book.app to install the font.  To do this:

1. open the font in font forge:

   ```shell
   $ fontforge creep.bsd
   ```
2. select `File > Generate Fonts`
3. from the left dropdown select `No Outline Font`
4. from the right dropdown select `Apple bitmap only sfnt (dfont)`
5. click `Save`
6. open the `.dfont` file in Font Book.app
7. You're done!

Alternativatly you can download one of the [releases](https://github.com/romeovs/creep/releases),
these are not the latest versions of the font but I will try to update them regulary so you don't
have to go trought these steps.

I'm not a professional font creator so there are some little quirks in the character
sizing.  To get past these I set the line height to 0.9 and the character spacing
to 0.75 in Terminal.app (using a Size of 16px) to make it look airtight.

![terminal](screens/info.png "Terminal.app settings")

## Attribution
Before I created creep I was using Proggy Tiny, which is a great font
and has given me a lot of inspiration.

## License
I love you all, so please use this font as much as you like for free.  But make sure you provide the
same liberty in it's new incarnations.

