> import Euterpea
> import System.Random
> import PatternGen -- (code from last slides)

> k1 = [[0,7]] -- just one pattern for now
> s1 = [40..70] -- a chromatic pitch space
> d1 = 3 -- a distance threshold
> x1 = 40 -- a general starting place (near the bottom)
> g1 = mkStdGen 5
> nums1 = pGen s1 k1 x1 d1 g1
> m1 = line $ map (note sn) $ nums1