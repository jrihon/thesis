#import "../../lib/multi-bib.typ": mcite
#import "bib_02_chapter.typ": biblio


== Conclusion

To conclude, the current work describes Ducque, a free and open-source program to construct initial models for (synthetic) nucleic acid duplexes of virtually any XNA chemistry. The manuscript proves that Ducque easily builds any type of structure for a given chemistry and that, with the correct force field, an accurate prediction can be modelled. We demonstrated one can extend the nucleic acid library with new sugars and nucleoside linkers. Ducque requires only built-in and NumPy modules, and Tkinter for the GUI. The user can supply Ducque with chemistries and their respective conformations, which can be confidently generated for with the conformational sampling scheme when no experimental structure is available.
The current work describes Ducque, a free and open-source program to construct initials models for (synthetic) nucleic acid duplexes of virtually any XNA chemistry.
The DNA and RNA chemistries were already well documented in literature with both crystallographic and NMR structures. This allowed parameters to be fitted on nucleosides whose behaviour was readily described in detail. For a given XNA that has not benefitted yet from years of characterisation, it is shown that the computed PESs are exceptionally accurate in predicting its behaviour.

The manuscript proves that not only can Ducque easily build any type of structure for a given chemistry, but that with the correct force field an accurate prediction can be modelled.
We demonstrated one can extend the nucleic acid library with new sugars and nucleoside linkers. Ducque requires only built-in and NumPy modules, and Tkinter for the GUI. 
The user can supply Ducque with chemistries and their respective conformations, which can be confidently generated for with the conformational sampling scheme. On top of that, a suitable force field can be derived.

The RNA::MNA heteroduplex simulations yielded a right-handed helical structure that does not belong to the A- or B-type family.
Only subtle changes in dihedral angles of the RNA strand, compared to values measured in dsRNA A-type helices, are imposed by the complementary MNA. The significantly different helical parameters, like increased radius of the double helix and altered positioning of the phosphoramidate due to the morpholino ring, can all contribute to the lack of RNA degradation when bound to complementary MNA sequences. Except for a Watson-Crick-Franklin to Hoogsteen transition in a mA:U basepair, that was facilitated by K#super("+") binding and fraying at the helix end, stable WCF base pairing was observed during the MM simulation.
This corrobates well with the available data that the heteroduplex differs from either A- and B-type duplexes and it is strongly suspected it acts as a steric block, in the ASO pathways, as it has also been demonstrated the heteroduplex is not fit for degradation by the RNase H enzyme #mcite(("Nan2018antisense", "Langner2020thiophosphoramidate"), biblio).


 === Supplementary information
#link("academic.oup.com/nar/article-lookup/doi/10.1093/nar/gkn000#supplementary-data")[Supplementary Data] is available at NAR Online.
The Ducque GitHub repository contains an extensive and comprehensible manual on how to start with Ducque and broaden the library of chemistries (Ducque/docs/). It also contains a separate guide on how to build a force field (Ducque/ff/). The latter directory contains the Morpholino FF used in this project.


Ducque is available on GitHub #link("github.com/jrihon/Ducque")[github.com/jrihon/Ducque] and works on most Linux operating system (tested on Ubuntu 20 and 22 LTS), it runs on MacOS and _Windows Subsystem for Linux_ (WSL).

CeNA, $beta$-homo DNA, (d)XyNA. 2_'_-O-Me RNA, 2_'_-Fluoro RNA, HNA and MNA are included. It produces full homoduplexes, heteroduplexes and allows mixed chemistries in the complementary strand. The leading sequence is also allowed to vary in chemistry, though we advise to keep the leading strand within the same XNA type.

A separate guide is provided on how to build a force field, how AMBER interprets its atoms, terminology, requirements for the creation of force fields, on how to perform parametrisation (resp, equivalence, restraints, paramfit, etc.) on a local machine.
//The ORCA QM package is accessible from the ORCA forum (\href{https://orcaforum.kofo.mpg.de/app.php/portal"), biblio){ORCA Download Portal"), biblio)). 
//The MSMS software is made publicly available by the Scripps Research Institute ( \href{https://ccsb.scripps.edu/msms/downloads/"), biblio){MSMS download link"), biblio)).
//The RESP charge derivation scheme through ORCA is freely available on GitHub and will be pushed to both AMBER and ORCA (\href{https://www.github.com/jrihon/TBD"), biblio){github.com/jrihon/ORCA\_MKsampling"), biblio)).
All figures are generated through python-scripted methods (Libraries : matplotlib, cartopy, NumPy, SciPy, mayavi) and/or concatenated/adapted in InkScape.
All python libraries used are freely available through conda and/or pip (NumPy, SciPy, Tkinter, Cartopy, Mayavi).

