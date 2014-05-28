import Numeric
import Data.Char
import Data.List

-- all possible patterns
x = [[a1, a2, a3, a4, a5, a6, a7, a8] | a1 <- [0,1],
                                        a2 <- [0,1],
                                        a3 <- [0,1],
                                        a4 <- [0,1],
                                        a5 <- [0,1],
                                        a6 <- [0,1],
                                        a7 <- [0,1],
                                        a8 <- [0,1]]

-- get decimal value of character
value :: [Integer] -> Integer
value = sum . zipWith (*) v
    where v = [1, 2, 4, 8, 16, 32, 64, 128]

offset = 10240 -- = h2800

-- get index in unicode table
encoding :: [Integer] -> Integer
encoding = (+offset) . value


rows :: [Integer] -> [[Integer]]
rows [a1, a2, a3, a4, a5, a6, a7, a8] =
    if encoding [a1, a2, a3, a4, a5, a6, a7, a8] > 10303
    then [[a1, a4], [a2, a5], [a3, a6], [a7, a8]]
    else [[a1, a4], [a2, a5], [a3, a6]]            -- last row will be empty

-- from 6 to 8 dots: 10303
bbx v = if encoding v > 10303
        then "BBX 3 7 0 -2"
        else "BBX 3 5 0 0"

-- make row in to hex number
rowToHex :: [Integer] -> String
rowToHex [0, 0] = "00"
rowToHex [0, 1] = "20"
rowToHex [1, 0] = "80"
rowToHex [1, 1] = "A0"


-- get the hex representation of a character
hexRep :: [Integer] -> String
hexRep = (intercalate "\n00\n") . (map rowToHex) . rows

showC :: [Integer] -> String
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


braille = (++"\n"). (intercalate "\n") . (map showC)

main = putStr $ braille x


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







hex i = showIntAtBase 16 intToDigit i ""


