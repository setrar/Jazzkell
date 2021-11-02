## Midi Setup

- [ ] Install Devices

* vmpk

```
brew install vmpk
```

* Sforzando

https://www.plogue.com/products/sforzando.html


- [ ] Install ghci version 8.6.5 see [Installation](http://www.euterpea.com/download-and-installation/) for details (old)

```
% cabal repl
Build profile: -w ghc-8.10.7 -O1
...
```

```
*Jazzkell> import Euterpea
```

```
*Jazzkell Euterpea> devices

Input devices: 

Output devices: 
  OutputDeviceID 0	SimpleSynth virtual input
```


```
*Jazzkell> import Euterpea
*Jazzkell Euterpea> devices

Input devices: 

Output devices: 
  OutputDeviceID 0	sforzando

*Jazzkell Euterpea> play $ line [c 4 qn, c 4 qn, g 4 qn, g 4 qn, a 4 qn, a 4 qn, g 4 hn]
```


