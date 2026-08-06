> module ChangingScalesAgain where

> import Euterpea
> import PatternGen
> import ChangingScales (scaleToPSpace, fitToPSpace)
> import TwoPartComposition (m4)

C-minor version:

> s5 = scaleToPSpace (0,127) [0,2,3,5,7,8,10]
> m5 = mMap (fitToPSpace s5) m4

Pentatonic version:

> s6 = scaleToPSpace (0,127) [0,2,4,7,9]
> m6 = mMap (fitToPSpace s6) m4