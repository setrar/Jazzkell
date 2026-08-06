> module TwoPartComposition where

> import Euterpea
> import System.Random
> import Data.List (findIndex)
> import PatternGen
> import ChangingScales

Helper functions:

> pGen2 :: PitchSpace -> [Pattern] -> AbsPitch -> DistThresh -> StdGen -> [AbsPitch]
> pGen2 s k x d g0 =
>   let (p, g1) = choose k g0
>       pS = findInsts s p
>       nearby (h:_) = abs (h - x) <= d
>       nearby []    = False
>       piNear = filter nearby pS
>       candidates = if not (null piNear) then piNear else pS
>       freshCandidates = filter (\inst -> case inst of (h:_) -> h /= x; [] -> False) candidates
>       finalPool = if not (null freshCandidates) then freshCandidates else candidates
>       (pInst, g2) = choose finalPool g1
>   in pInst ++ pGen2 s k (last pInst) d g2

A marimba part (treble):

> k2 = [[0,3], [0,5], [0,-2]]
> s2 = scaleToPSpace (50,80) [0,2,4,5,7,9,11]
> d2 = 7
> x2 = 60
> nums2 = pGen2 s2 k2 x2 d2 (mkStdGen 7)
> m2 = line $ map (note sn) nums2

A plucked string part (bass):

> k3 = [[0,7], [0,4], [0,12]]
> s3 = scaleToPSpace (30,50) [0,4,7]
> d3 = 12
> x3 = 40
> nums3 = pGen s3 k3 x3 d3 (mkStdGen 10)
> m3 = line $ map (\p -> note en p :+: rest en) nums3
> m3o = m3 :=: transpose 12 (rest en :+: m3)

All together:

> m4 = instrument PizzicatoStrings m3o :=:
>      instrument Marimba m2