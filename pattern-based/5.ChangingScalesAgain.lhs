> module ChangingScalesAgain where

> import Euterpea
> import PatternGen
> import ChangingScales (scaleToPSpace, fitToPSpace)
> import TwoPartComposition (m4, makePiece)

C-minor version:

> s5 = scaleToPSpace (0,127) [0,2,3,5,7,8,10]
> m5 = mMap (fitToPSpace s5) m4

Pentatonic version:

> s6 = scaleToPSpace (0,127) [0,2,4,7,9]
> m6 = mMap (fitToPSpace s6) m4

Major 6th / Diminished version:

> s7 = scaleToPSpace (0,127) [0,2,4,5,7,8,9,11]
> m7 = mMap (fitToPSpace s7) m4

> -- Maintain backward compatibility with your existing m4 variable:
> m40 :: Music AbsPitch
> m40 = makePiece 500

> s70 = scaleToPSpace (0,127) [0,2,4,5,7,8,9,11]
> m70 = mMap (fitToPSpace s70) m40
