Standard Euterpea and Random imports for algorithmic music generation:

> import Euterpea
> import System.Random

Initialize a deterministic pseudo-random number generator with seed 5:

> g0 = mkStdGen 5

Generate an infinite stream of random absolute pitch values 
bounded between pitch 50 (D3) and pitch 85 (C#6):

> nums = randomRs (50 :: AbsPitch, 85) g0

Lazily construct an infinite musical line by mapping sixteenth notes 
over the pitch stream:

> m = line $ map (note sn) nums