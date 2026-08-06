Define the main entry module and import dependencies:

> module Gen2 where

> import Euterpea
> import System.Random
> import PatternGen -- (code from last slides)

Set up parameters for generation:

> k1 = [[0,7]] -- just one pattern for now
> s1 = [40..70] -- a chromatic pitch space
> d1 = 3 -- a distance threshold
> x1 = 40 -- a general starting place (near the bottom)
> g1 = mkStdGen 5 -- Seed the random generator:
> nums1 = pGen s1 k1 x1 d1 g1 -- Lazily evaluate the infinite stream of generated pitch values:
> m1 = line $ map (note sn) $ nums1 --Convert the infinite pitch stream into a musical line of sixteenth notes: