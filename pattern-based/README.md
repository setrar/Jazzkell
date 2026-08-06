# [Pattern Based Algorithmic Music Youtube: Donya Quick](https://www.youtube.com/watch?v=UVcXNhgVr9o)


## :one: [Random Numbers to Music](https://youtu.be/UVcXNhgVr9o?t=226s)

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

## 2️⃣ [Generation with 1 Pattern](https://youtu.be/UVcXNhgVr9o?t=632)

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

## 3️⃣ [Changing Scales](https://www.youtube.com/watch?v=UVcXNhgVr9o&t=226s)

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

## 4️⃣ [2-Part Composition](https://www.youtube.com/watch?v=UVcXNhgVr9o&t=862s)

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

---

The difference lies in how candidate pattern instances are selected after spatial filtering (`nearby`): **`pGen2` adds a duplicate-prevention step to avoid pitch stagnation.**

| Feature | `pGen` | `pGen2` |
| --- | --- | --- |
| **Primary Selection** | Chooses randomly from nearby instances (`piNear`), or falls back to all instances (`pS`). | Same initial candidate grouping (`candidates`). |
| **Pitch Stagnation Prevention** | **None.** Can select an instance whose starting pitch equals `x`, causing note repetition. | **Filters duplicates.** Creates `freshCandidates` by removing instances where `head inst == x`. |
| **Fallback Strategy** | Reverts to `pS` if `piNear` is empty. | Reverts to `candidates` if removing duplicates leaves `freshCandidates` empty. |
| **Musical Effect** | Tends to stall on static pitch anchors or repeat identical figures. | Keeps melodic motion active by forcing new transpositions where possible. |

## 5️⃣ [Changing Scales Again](https://www.youtube.com/watch?v=UVcXNhgVr9o&t=1017s)

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

```
ghci> :l 5.ChangingScalesAgain.lhs 4.2-PartComposition.lhs 3.ChangingScales.lhs 2.Gen2.lhs 1.PatternGen.lhs 
```
```lua
[1 of 5] Compiling PatternGen       ( 1.PatternGen.lhs, interpreted )
[2 of 5] Compiling Gen2             ( 2.Gen2.lhs, interpreted )
[3 of 5] Compiling ChangingScales   ( 3.ChangingScales.lhs, interpreted )
[4 of 5] Compiling TwoPartComposition ( 4.2-PartComposition.lhs, interpreted )
[5 of 5] Compiling ChangingScalesAgain ( 5.ChangingScalesAgain.lhs, interpreted )
Ok, five modules loaded.
```

- Minor

```
ghci> playDev 7 m5
```
```
Pt_Start() called
^CInterrupted.
```

- Pentatonic

```
ghci> playDev 7 m6
```
```
Pt_Start() called
^CInterrupted.
```
