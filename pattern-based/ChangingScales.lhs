> {-# OPTIONS_GHC -Wno-x-partial #-}

Declare required imports at the top of the module:

> module ChangingScales where

> import Euterpea
> import Data.List (findIndices, findIndex)
> import PatternGen
> import Gen2 (m1)

Turn a scale, like [0,2,3,5,7,8,10] (C minor), into a larger pitch space:

> scaleToPSpace :: (AbsPitch, AbsPitch) -> [AbsPitch] -> [AbsPitch]
> scaleToPSpace (l,u) pcSet =
>     filter (\p -> p >= l && p<=u) $ concat $
>     map (\i -> map (\p -> p+12*i) pcSet) [0..10]

Fit an existing pitch into a new pitch space (nearest neighbor):

> fitToPSpace :: PitchSpace -> AbsPitch -> AbsPitch
> fitToPSpace [] pitchNum = error "Empty pitch space"
> fitToPSpace s pitchNum =
>     let dists = map (\a -> abs(pitchNum - a)) s
>         minDist = minimum dists
>     in  case findIndex (== minDist) dists of
>           Just idx -> s !! idx
>           Nothing  -> error "Unreachable"

Using this to turn the chromatic example into C-minor:

> cMin = [0,2,3,5,7,8,10]
> s1b = scaleToPSpace (40,70) cMin
> m1b = mMap (fitToPSpace s1b) m1