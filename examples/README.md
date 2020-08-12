# Examples


## :star: Running the examples in `ghci`

### :a: Running while using the `Jazzkell` Source Code

:bulb: Make sure you run `ghci` from the project root directory where the file `Jazzkell.lhs` is located

You can run 4 individual examples by loading them using their filenames in `ghci`

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

:o: You need to load other files along with the `Bebop` program

```
Prelude> :load examples/Bebop.lhs examples/SimpleBossa.lhs examples/SimpleWalkingBass.lhs
```

or the `WalkingBass` program

```
Prelude> :load examples/WalkingBass.lhs examples/SimpleWalkingBass.lhs 
```

Note: The program to be played needs to be loaded prior loading dependency files.

### :b: Running while installing the `Jazzkell` Library from Hackage 

* go to the `examples` folder

```
$ cd examples
```

* Execute `ghci` and load the `Bebop` program

```
$ ghci
GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
Prelude> :load Bebop.lhs 
[1 of 3] Compiling SimpleBossa      ( SimpleBossa.lhs, interpreted )

SimpleBossa.lhs:14:3: error:
    Could not find module ‘Jazzkell’
    Use -v to see a list of the files searched for.
   |
14 | > import Jazzkell
   |   ^^^^^^^^^^^^^^^

SimpleBossa.lhs:15:3: error:
    Could not find module ‘Jazzkell.Utils’
    Use -v to see a list of the files searched for.
   |
15 | > import Jazzkell.Utils
   |   ^^^^^^^^^^^^^^^^^^^^^
Failed, no modules loaded.
```

:bookmark: if you get a `Could not find module` error that means that `Jazzkell` library needs to be installed from Hackage 

* Installing the library

```
$ cabal install Jazzkell
```

with `cabal` 3.x plus

```
$ cabal v1-install Jazzkell
```

* load the examples:

```
Prelude> :load Bebop.lhs 
```

- [ ] SimpleWalkingBass

- [ ] Trading

- [ ] SimpleBossa

- [ ] Hypnotize

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

* Check that `Jazzkell` Library is installed

```
$ ghc-pkg list Jazzkell
/Users/valiha/.ghcup/ghc/8.6.5/lib/ghc-8.6.5/package.conf.d
    (no packages)
/Users/valiha/.ghc/x86_64-darwin-8.6.5/package.conf.d
    Jazzkell-0.0.1
```

* Uninstall `Jazzkell` Library with `ghc-pkg` tool

```
$ ghc-pkg unregister Jazzkell
```

## Euterpea

Install ghci version 8.6.5 see [Installation](http://www.euterpea.com/download-and-installation/) for details

```
% ghci
GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
```

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
