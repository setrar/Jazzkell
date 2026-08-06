Declare the module header and import dependencies:

> module PatternGen where
> import Euterpea
> import System.Random

Utility function for choosing a random element:

> choose :: [a] -> StdGen -> (a, StdGen)
> choose xs g =
>   let (idx, g') = randomR (0, length xs - 1) g
>   in (xs !! idx, g')

Find all instances of pattern p in pitch space s:

> type PitchSpace = [AbsPitch]
> type Pattern = [AbsPitch]
> type PatternInst = [AbsPitch]
> type DistThresh = AbsPitch

Locate valid transpositions of a pattern within a pitch space:

> findInsts :: PitchSpace -> Pattern -> [PatternInst]
> findInsts s p = -- find all instances of pattern p in pitch space s
>   let patInsts = map (\a -> map (+a) p) s
>   in filter (and . map (`elem` s)) patInsts

Recursively construct an infinite stream of patterned pitches:
(Generate patterns sequentially)

> pGen :: PitchSpace -> [Pattern] -> AbsPitch -> DistThresh -> StdGen -> [AbsPitch]
> pGen s k x d g0 =
>   let (p, g1) = choose k g0 -- select a pattern to use, p
>       pS = findInsts s p -- find p's instances in s
>       nearby (h:_) = abs (h - x) <= d
>       nearby []    = False
>       piNear = filter nearby pS -- which instances are nearby (within d half steps)?
>       (pInst, g2) = -- pick a nearby instance if one exists
>         if not (null piNear) then choose piNear g1
>         else choose pS g1 -- no nearby instances available
>   in pInst ++ pGen s k (last pInst) d g2