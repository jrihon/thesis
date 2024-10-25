#set enum(numbering: "[1]", indent: 1em, body-indent: 1em)

= DECLARATIONS


== Scientific acknowledgements

I want to thank prof. dr. Eveline Lescrinier, prof. dr. Vitor Bernardes Pinheiro and prof. dr. Mathy Froeyen for their help the past four years, on their guidance throughout my years as a PhD candidate on my dissertation and in my personal life. Your discussions mean a great deal to me.  

To dr. Charles-Alexandre Mattelaer and dr. Rinaldo Wander Montalvão for discussing topics on molecular modeling and informatics, for helping my with the basics so I could have a headstart on my work.
To Sten Reynders for testing the Ducque and pucke.rs tools and making sure I corrected every small mistake I had left behind.

To dr. Peter Schofield, dr. Alexander Taylor, dr. Cristian D. Peña Martinez, Sacha Zinn, dr. Jenny Jackson, Gurpreet Dhaliwal, Guy Schepers, dr. Piet Herdewijn, dr. Daniel Christ and dr. Philipp Holliger for the collaborative effort on capturing the essence and characterising the HNA aptamer, and especially dr. Charles-Alexandre Mattelaer without whom the modeling experiments would have been practically unfeasible. 

To dr. Elisabetta Groaz and dr. Yuqing Xu for allowing me to help them in their work on understanding the mode of action of their novel antiviral compound. 

To dr. Anne-Sophie Depuydt, dr. Olivier Cheneval, dr. Christina I. Schroeder, prof. dr. David J. Craik, dr. Steve Peigneur and prof. dr. Jan Tytgat for inviting me to work on a project completely beyond my scope. It was truly an enjoyable collaboration we were able to produce together.


== Scientific contributions

The enumerated contributions follows the ordering of the _List of Publications_ subsection in _Published Works_. Only the personal contributions of the author are mentioned in this subsection.

+ Rihon, J., _et al._ (2024). NAR , #link("https://doi.org/10.1093/nar/gkae135")[10.1093/nar/gkae135].\ Rihon designed and programmed the Ducque software, wrote the implementation for the Merz-Kollman population analysis scheme for the ORCA quantum mechanics package, carried out all the experiments (conformational sampling, MD simulations), derived the force field for the morpholino nucleic acid, analysed the experiments, wrote the manuscript and made the figures. Mattelaer helped with the conformational sampling experiment and his earlier work laid the foundation for the fitting protocol. Wander Montalvão guidance was necessary on the fundamentals of linear algebra. All mentioned authors supervised the writing of the manuscript before submission. Lescrinier acts as corresponding author.
//
+ Rihon, J. _et al._, (2024). Submitted to JChemInf. \  Rihon designed and programmed the pucke.rs and pucke.py tools, carried out all the experiments (conformational sampling benchmark), analysed the experiments and the wrote the manuscript. Rihon and Reynders tested both the CLI tool and the Python API. All mentioned authors supervised the writing of the manuscript. Lescrinier acts as corresponding author. 
//
+ Mattelaer, C.-A. _et al._, (2021). JCTC , #link("https://doi.org/10.1021/acs.jctc.1c00270")[10.1021/acs.jctc.1c00270].\ Mattelaer C.-A. designed the accelerated methodology, performed the experiment on the five-membered ring chemistries and performed the novel sampling of six-membered rings. Mattelaer C.-A. wrote the manuscript, Mattelaer H.-P. contributed to the discussion of the results. Rihon performed the conformational sampling experiment on the cyclohexenyl nucleic acid under the guidance of Mattelaer C.-A. . All mentioned authors supervised the writing of the manuscript. Lescrinier acts as corresponding author.
//
+ Schofield, P. _et al._ (2023). NAR , #link("https://doi.org/10.1093/nar/gkad592")[10.1093/nar/gkad592].\ Schofield, Peña Martinez, Zinn and Jackson conducted the experiments on the the epitope mapping, antibody affinity measurements and antibody competition assays. Taylor and Dhaliwal conducted the truncation experiments and affinity binding studies to the HEL protein. Mattelaer designed the HNA chemistry force field and conducted the simulated annealing and REMD experiments, and the initial search for a structural model of the aptamer. Rihon carried out the structure prediction experiment. Schepers managed the oligonucleotide synthesis experiments. Herdewijn, Christ, Lescrinier and Holliger steered the project and act as corresponding authors. 
//
+ Xu, Y. _et al._ (2023). EJMC #link("https://doi.org/10.1016/j.ejmech.2023.115379")[10.1016/j.ejmech.2023.115379].\ Xu carried out the synthesis of the nucleotide chemistry and tested the antiviral activity of the compound _in vitro_. Rihon performed conformational sampling experiments on the xylose nucleic acid, designed a custom force field for the synthetic molecule and conducted the computational experiments. Xu, Groaz, Rihon and Lescrinier wrote the manuscript. All mentioned authors supervised the writing of the manuscript. Lescrinier acts as corresponding author.
//
+ Depuydt, A.-S. _ et al._ (2021). _ACS Pharm. & Trans. Sci._ #link("https://doi.org/10.1021/acsptsci.1c00079")[10.1021/acsptsci.1c00079].\ Depuydt conducted all electrophysiology experiments. Tytgat and Schroeder designed the peptides. Cheneval performed the peptide synthesis. Rihon performed the peptide docking experiment and the subsequent MD simulation on the calcium channel protein. Depuydt and Rihon wrote the manuscript. All mentioned authors supervised the writing of the manuscript. Peigneur and Tytgat act as corresponding authors.

== Conflict of interest

The author declares no conflicts of interest or any financial interests.

#pagebreak()
