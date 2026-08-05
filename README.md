# Jazzkell


This project uses a local project by using the `cabal.project` file

To use the local project in `ghci`:

```
cabal repl
```

or 

```bash
ghci -package Euterpea -package random examples/SimpleBossa.lhs
```
<details>
<summary>:wood: Log</summary>

```lua
Loaded package environment from /Users/valiha/.ghc/aarch64-darwin-9.12.4/environments/default
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
[1 of 4] Compiling Jazzkell.JazzTypes ( Jazzkell/JazzTypes.lhs, interpreted )
[2 of 4] Compiling Jazzkell         ( Jazzkell.lhs, interpreted )
[3 of 4] Compiling Jazzkell.Utils   ( Jazzkell/Utils.lhs, interpreted )
[4 of 4] Compiling SimpleBossa      ( examples/SimpleBossa.lhs, interpreted )
Ok, four modules loaded.
```

</details>

```text
ghci> playDev 7 m
```
> Pt_Start() called
> 
> ^CInterrupted.

```bash
ghci -package Euterpea -package mtl -package random -iexamples examples/Bebop.lhs
```

> -i<dir>         Search for imported modules in the directory <dir>.

# 📚 References

- [ ] [Pattern Based Algorithmic Music Youtube: Donya Quick](https://www.youtube.com/watch?v=UVcXNhgVr9o)
