# Examples

[A Functional Model of Jazz Improvisation](https://www.researchgate.net/publication/333967847_A_Functional_Model_of_Jazz_Improvisation)

:star: Running the examples in `ghci`

## :a: without installing the `Jazzkell` Library

You can only run 4 examples:

- [ ] SimpleWalkingBass

- [ ] Trading

- [ ] SimpleBossa

- [ ] Hypnotize

```
Prelude> :load examples/
bebop.mid              WalkingBass.lhs        SimpleWalkingBass.lhs  Trading.lhs            bebop.mscz
SimpleBossa.lhs        README.md              Bebop.lhs              Hypnotize.lhs
Prelude> :load examples/SimpleWalkingBass.lhs 
[1 of 4] Compiling Jazzkell.JazzTypes ( Jazzkell/JazzTypes.lhs, interpreted )
[2 of 4] Compiling Jazzkell         ( Jazzkell.lhs, interpreted )
[3 of 4] Compiling Jazzkell.Utils   ( Jazzkell/Utils.lhs, interpreted )
[4 of 4] Compiling SimpleWalkingBass ( examples/SimpleWalkingBass.lhs, interpreted )
Ok, four modules loaded.
*SimpleWalkingBass> :l examples/Trading.lhs 
[1 of 4] Compiling Jazzkell.JazzTypes ( Jazzkell/JazzTypes.lhs, interpreted )
[2 of 4] Compiling Jazzkell         ( Jazzkell.lhs, interpreted )
[3 of 4] Compiling Jazzkell.Utils   ( Jazzkell/Utils.lhs, interpreted )
[4 of 4] Compiling Trading          ( examples/Trading.lhs, interpreted )
Ok, four modules loaded.
*Trading> :load examples/SimpleBossa.lhs 
[1 of 4] Compiling Jazzkell.JazzTypes ( Jazzkell/JazzTypes.lhs, interpreted )
[2 of 4] Compiling Jazzkell         ( Jazzkell.lhs, interpreted )
[3 of 4] Compiling Jazzkell.Utils   ( Jazzkell/Utils.lhs, interpreted )
[4 of 4] Compiling SimpleBossa      ( examples/SimpleBossa.lhs, interpreted )
Ok, four modules loaded.
*SimpleBossa> :load examples/Hypnotize.lhs 
[1 of 4] Compiling Jazzkell.JazzTypes ( Jazzkell/JazzTypes.lhs, interpreted )
[2 of 4] Compiling Jazzkell         ( Jazzkell.lhs, interpreted )
[3 of 4] Compiling Jazzkell.Utils   ( Jazzkell/Utils.lhs, interpreted )
[4 of 4] Compiling Hypnotize        ( examples/Hypnotize.lhs, interpreted )
Ok, four modules loaded.
*Hypnotize>     
```

:bulb: To play the examples, just type the below in `ghci`:

```
Prelude> play m
```

:x: If you try to load the `Bebop` example, it will fail. You need to install the `Jazzkell` library first

```
Prelude> :load examples/Bebop.lhs 
[1 of 4] Compiling Jazzkell.JazzTypes ( Jazzkell/JazzTypes.lhs, interpreted )
[2 of 4] Compiling Jazzkell         ( Jazzkell.lhs, interpreted )
[3 of 4] Compiling Jazzkell.Utils   ( Jazzkell/Utils.lhs, interpreted )
[4 of 4] Compiling Bebop            ( examples/Bebop.lhs, interpreted )

examples/Bebop.lhs:17:3: error:
    Could not find module ‘SimpleWalkingBass’
    Use -v to see a list of the files searched for.
   |
17 | > import qualified SimpleWalkingBass as SWB
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

examples/Bebop.lhs:18:3: error:
    Could not find module ‘SimpleBossa’
    Use -v to see a list of the files searched for.
   |
18 | > import qualified SimpleBossa as SB
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Failed, three modules loaded.
```


## :b: with installing the `Jazzkell` Library

* Installing the library

```
$ cabal install Jazzkell
```

with `cabal` 3.x plus

```
$ cabal v1-install Jazzkell
```

## :ab: Uninstalling the `Jazzkell` Library

```
$ ghc-pkg unregister Jazzkell
```
