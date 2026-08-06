# [Pattern Based Algorithmic Music Youtube: Donya Quick](https://www.youtube.com/watch?v=UVcXNhgVr9o)


## [Random Numbers to Music](https://youtu.be/UVcXNhgVr9o?t=226s)

```bash
ghci ghci -package Euterpea -package random
```
<details>
<summary>:wood: Log</summary>

```lua
Loaded package environment from /Users/valiha/.ghc/aarch64-darwin-9.12.4/environments/default
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
```

</details>

```text
ghci> :l 0.Gen.lhs
```
```lua
[1 of 2] Compiling Main             ( Gen.lhs, interpreted )
Ok, one module loaded.
```

```
ghci> playDev 7 m
```
```
Pt_Start() called
^CInterrupted.
```

## [Generation with 1 Pattern](https://youtu.be/UVcXNhgVr9o?t=632)

```bash
ghci ghci -package Euterpea -package random
```
<details>
<summary>:wood: Log</summary>

```lua
Loaded package environment from /Users/valiha/.ghc/aarch64-darwin-9.12.4/environments/default
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
```

</details>

```text
ghci> :l 2.Gen2.lhs 1.PatternGen.lhs
```
```lua
[1 of 2] Compiling PatternGen       ( 1.PatternGen.lhs, interpreted )
[2 of 2] Compiling Gen2             ( 2.Gen2.lhs, interpreted )
Ok, two modules loaded.
```

```
ghci> playDev 7 m1
```
```
Pt_Start() called
^CInterrupted.
```

## [Changing Scales](https://www.youtube.com/watch?v=UVcXNhgVr9o&t=226s)

```bash
ghci ghci -package Euterpea -package random
```
<details>
<summary>:wood: Log</summary>

```lua
Loaded package environment from /Users/valiha/.ghc/aarch64-darwin-9.12.4/environments/default
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
```

</details>

```text
ghci> :l 3.ChangingScales.lhs 2.Gen2.lhs 1.PatternGen.lhs 
```
```lua
[1 of 3] Compiling PatternGen       ( 1.PatternGen.lhs, interpreted )
[2 of 3] Compiling Gen2             ( 2.Gen2.lhs, interpreted )
[3 of 3] Compiling ChangingScales   ( 3.ChangingScales.lhs, interpreted )
Ok, three modules loaded.
```

```
ghci> playDev 7 m1b
```
```
Pt_Start() called
^CInterrupted.
```

## [2-Part Composition](https://www.youtube.com/watch?v=UVcXNhgVr9o&t=862s)

```bash
ghci ghci -package Euterpea -package random
```
<details>
<summary>:wood: Log</summary>

```lua
Loaded package environment from /Users/valiha/.ghc/aarch64-darwin-9.12.4/environments/default
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
```

</details>

```text
ghci> :l 4.2-PartComposition.lhs 3.ChangingScales.lhs 2.Gen2.lhs 1.PatternGen.lhs 
```
```lua
[1 of 4] Compiling PatternGen       ( 1.PatternGen.lhs, interpreted )
[2 of 4] Compiling Gen2             ( 2.Gen2.lhs, interpreted )
[3 of 4] Compiling ChangingScales   ( 3.ChangingScales.lhs, interpreted )
[4 of 4] Compiling TwoPartComposition ( 4.2-PartComposition.lhs, interpreted )
Ok, four modules loaded.
```

```
ghci> playDev 7 m4
```
```
Pt_Start() called
^CInterrupted.
```
