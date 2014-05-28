import Numeric
import Data.Char
import Data.List

-- all possible patterns
data Dot = Dot | NoDot
type Braille = [Dot]
patterns = [[a1, a2, a3, a4, a5, a6, a7, a8] | a1 <- [NoDot, Dot],
                                               a2 <- [NoDot, Dot],
                                               a3 <- [NoDot, Dot],
                                               a4 <- [NoDot, Dot],
                                               a5 <- [NoDot, Dot],
                                               a6 <- [NoDot, Dot],
                                               a7 <- [NoDot, Dot],
                                               a8 <- [NoDot, Dot]]

-- get decimal value of character
value :: Braille -> Integer
value = sum . zipWith (*) v
    where v = [1, 2, 4, 8, 16, 32, 64, 128]

offset = 10240 -- = h2800

-- get index in unicode table
-- of a braille pattern (in
-- decimal)
encoding :: Braille -> Integer
encoding = (+offset) . value

-- get the rows of a braille pattern
-- unicode switches from 6 to 8 dots
-- at unicode character 10303 (U+283f)
rows :: Braille -> [[Dot]]
rows [a1, a2, a3, a4, a5, a6, a7, a8] =
    if encoding [a1, a2, a3, a4, a5, a6, a7, a8] > 10303
    then [[a1, a4], [a2, a5], [a3, a6], [a7, a8]]
    else [[a1, a4], [a2, a5], [a3, a6]]

-- get the height of a Braille pattern
-- this is hardcoded because it is easier
bbx :: Braille -> String
bbx ptn = if encoding ptn > 10303
          then "BBX 3 7 0 -2"
          else "BBX 3 5 0 0"

-- make row in to hex number that represents
-- it's drawing at 8 bits wide
rowToHex :: [Dot] -> String
rowToHex [NoDot, NoDot] = "00"    -- 00000000
rowToHex [NoDot, Dot]   = "20"    -- 00100000
rowToHex [Dot,   NoDot] = "80"    -- 10000000
rowToHex [Dot,   Dot]   = "A0"    -- 10100000


-- get the hex representation of a character
hexRep :: Braille -> String
hexRep = (intercalate "\n00\n") . (map rowToHex) . rows

-- get the full character definition of a Braille pattern
showC :: Braille -> String
showC v = intercalate "\n" [ "STARTCHAR char" ++ enc
                           , "ENCODING " ++ enc
                           , "SWIDTH 437 0"
                           , "DWIDTH 7 0"
                           , size
                           , "BITMAP"
                           , repr
                           , "ENDCHAR"
                           ]
            where enc  = show $ encoding v
                  repr = hexRep v
                  size = bbx v

-- get all of the character definitions in x
braille = (++"\n"). (intercalate "\n") . (map showC)

-- output all the stuff,
-- I'm using runhaskell braille.hs >> creep.bdf
main = putStr $ braille patterns

-- example character definition:
-- STARTCHAR char10325
-- ENCODING 10325
-- SWIDTH 437 0
-- DWIDTH 7 0
-- BBX 3 7 0 0
-- BITMAP
-- A0
-- 00
-- A0
-- 00
-- A0
-- 00
-- A0
-- ENDCHAR
