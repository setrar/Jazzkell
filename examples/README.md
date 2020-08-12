# Examples


## :star: Running the examples in `ghci`

### :a: without installing the `Jazzkell` Library

You can run 4 individual examples by loading them using their filenames

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

:x: When trying to load the `Bebop` example, it will fail. 

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

:o: You need to load other file along with the `Bebop` program

```
Prelude> :load examples/Bebop.lhs examples/SimpleBossa.lhs examples/SimpleWalkingBass.lhs
```


### :b: with installing the `Jazzkell` Library

* Installing the library

```
$ cabal install Jazzkell
```

with `cabal` 3.x plus

```
$ cabal v1-install Jazzkell
```

* You can only run 2 more examples:

- [ ] WalkingBass

- [ ] Bebop

:bulb: To play the examples:

- [x] type the below in `ghci` to hear the generated sound:

```
Prelude> play m
```

- [x] type the below in `ghci` to write the midi file:

```
Prelude> main
```


## :ab: Uninstalling the `Jazzkell` Library

```
$ ghc-pkg unregister Jazzkell
```

## Euterpea

```
Prelude> import Euterpea
```

```
*Jazzkell Euterpea> devices

Input devices: 

Output devices: 
  OutputDeviceID 0	SimpleSynth virtual input
```
# References

https://www.youtube.com/watch?v=Da7qwYADeds
