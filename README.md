# Molecular modeling tools to improve and expand computational research on synthetic nucleic acids

## My PhD thesis

All formatting has been personally designed and coded in the `typst` language.
This thesis employs [multi-bibs](https://github.com/jrihon/multi-bibs), a library I wrote to support multiple bibliographies using the `typst` language.

## Dependencies (Linux only)
- [jrihon/multi-bibs](https://github.com/jrihon/multi-bibs)
- [typst/typst](https://github.com/typst/typst) `version 0.11.0`
- Python `version >=3.9`
- Bash
- [bibcure/doi2bib](https://github.com/bibcure/doi2bib) Fetch `.bib` by `doi` through the CLI
- [typst/hayagriva](https://github.com/typst/hayagriva) Convert `.bib` to `.yml`

## Compilation

Add the `output/` directory to have everything compile correctly.

```shell
$ cd thesis/ && mkdir output/
```
</br>


```shell
$ ./build.sh    # The `build.sh` is a one-time build script.
#
$ ./wbuild.sh   # The `wbuild` for `watch` mode (continuous compilation).
```

Pdf appears in `output/`. 

## Compiled version
You can download the compiled manuscript directly from the Lirias platform of the KU Leuven [here](https://lirias.kuleuven.be/retrieve/785308) !
<!--
## Typst
Compiled with `typst` version `0.11.0`

Find `typst` and the compiler over at [typst/typst](https://github.com/typst/typst).
-->

<!--
## Questions ?
Feel free to ask! 
-->

## Cite me !
The usage of all figures in this repository is permitted, as long as I am properly referenced!

##### Cite the PhD thesis
```
Rihon, J., Lescrinier, E., Bernardes Pinheiro, V., & Froeyen, M. (2024). Molecular modeling tools to improve and expand computational research on synthetic nucleic acids.
```
```bib
@phdthesis{RihonPhd2025,
  title        = {Molecular modeling tools to improve and expand computational research on synthetic nucleic acids.},
  author       = {Rihon, Jérôme and Lescrinier, Eveline and Pinheiro, Vitor Bernardes and Froeyen, Mathy},
  year         = 2025,
  month        = {March},
  address      = {Herestraat 49, 3000 Leuven, Belgium},
  note         = {Available at \url{https://lirias.kuleuven.be/retrieve/785308}},
  school       = {KU Leuven},
  type         = {PhD thesis}
}
```

##### Cite the Ducque paper
```bib 
@article{Rihon_2024,
    title={Structural insights into the morpholino nucleic acid/RNA duplex using the new XNA builder Ducque in a molecular modeling pipeline},
    volume={52},
    ISSN={1362-4962},
    url={http://dx.doi.org/10.1093/nar/gkae135},
    DOI={10.1093/nar/gkae135},
    number={6},
    journal={Nucleic Acids Research},
    publisher={Oxford University Press (OUP)},
    author={Rihon, Jérôme and Mattelaer, Charles-Alexandre and Montalvão, Rinaldo Wander and Froeyen, Mathy and Pinheiro, Vitor Bernardes and Lescrinier, Eveline},
    year={2024},
    month=feb,
    pages={2836–2847} 
}
```

##### Cite the pucke.rs paper
```bib 
@article{Rihon_2025,
    title={The pucke.rs toolkit to facilitate sampling the conformational space of biomolecular monomers},
    volume={17},
    ISSN={1758-2946},
    url={http://dx.doi.org/10.1186/s13321-025-00977-7},
    DOI={10.1186/s13321-025-00977-7},
    number={1},
    journal={Journal of Cheminformatics},
    publisher={Springer Science and Business Media LLC},
    author={Rihon, Jérôme and Reynders, Sten and Bernardes Pinheiro, Vitor and Lescrinier, Eveline},
    year={2025},
    month=apr
}
``` 

##### Cite the HNA aptamer paper
```bib 
@article{Schofield_2023,
    title={Characterization of an HNA aptamer suggests a non-canonical G-quadruplex motif},
    volume={51},
    ISSN={1362-4962},
    url={http://dx.doi.org/10.1093/nar/gkad592},
    DOI={10.1093/nar/gkad592},
    number={15},
    journal={Nucleic Acids Research},
    publisher={Oxford University Press (OUP)},
    author={Schofield, Peter and Taylor, Alexander I and Rihon, Jérôme and Peña Martinez, Cristian D and Zinn, Sacha and Mattelaer, Charles-Alexandre and Jackson, Jennifer and Dhaliwal, Gurpreet and Schepers, Guy and Herdewijn, Piet and Lescrinier, Eveline and Christ, Daniel and Holliger, Philipp},
    year={2023},
    month=jul,
    pages={7736–7748}
}
```
