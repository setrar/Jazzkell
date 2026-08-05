> import Euterpea
> import System.Random
> g0 = mkStdGen 5
> nums = randomRs (50::AbsPitch , 85) g0
> m = line $ map (note sn) nums 