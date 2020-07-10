# Examples

[A Functional Model of Jazz Improvisation](https://www.researchgate.net/publication/333967847_A_Functional_Model_of_Jazz_Improvisation)

:star: Running the examples in `ghci`

## :a: without installing the `Jazzkell` Library


```
Prelude> :l examples/Bebop.lhs 
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
