# Molecular modeling tools to improve and expand computational research on synthetic nucleic acids

## My PhD thesis

All formatting has been personally designed and coded in the `typst` language.

This thesis employs [multi-bibs](https://github.com/jrihon/multi-bibs), a library I wrote to support multiple bibliographies using the `typst` language.

Add the `output` directory to have everything compile correctly. Compiles in roughly thirty seconds on my machine.

```shell
$ mkdir output/
```

### Compilation
Compile the chapters. Pdf appears in `output/`. 

The `build.sh` is a one-time build script.
```shell
$ ./build.sh 
```

The `wbuild` sets the Typst compiler in `watch` mode, for continuous compilation.
```shell
$ ./wbuild.sh 
```

## Typst
Compiled with `typst` version `0.11.0`

Find `typst` and the compiler over at [typst/typst](https://github.com/typst/typst).


## Questions ?

Feel free to ask any questions!

The usage of all figures in this repository is permitted, as long as I am properly referenced!

```
Rihon, J., Lescrinier, E., Bernardes Pinheiro, V., & Froeyen, M. (2024). Molecular modeling tools to improve and expand computational research on synthetic nucleic acids.
```
