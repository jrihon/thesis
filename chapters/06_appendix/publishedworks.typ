#import "../../lib/colours.typ": colourPalette
= Published works 

#let box-env() = {
  let pat = pattern(
    relative: "parent",
    image("../../src/cover/boxedtext_background-final.svg") // variant of the thesis cover
  )

  let contents = [ 
    This final section of this doctoral thesis contains the published works I had the pleasure of leading / partaking in. 
    I want to extend my gratitude to everyone listed here below, as I was able to be challenged on topics pertaining to a variety of fields of scientific research. This brings me joy! \
    The _List of Publications_ is ordered from high to low relevance with respect to the topic of my thesis.
  ]

  block(
    width: 100%,
    fill: pat,
    radius: 2pt,
    inset: 10pt,
    // body
    text(fill: colourPalette.blueslate, contents)
  )
}

#box-env()
== List of Publications
#set enum(numbering: "[1]", indent: 1em, body-indent: 1em)

+ *Rihon, J.*, Mattelaer, C-A., Montalvão, R.W., Froeyen, M., Pinheiro, V.B., Lescrinier, E. (2024). Structural insights into the morpholino nucleic acid/RNA duplex using the new XNA builder Ducque in a molecular modeling pipeline. _Nucleic Acids Research_ , #link("https://doi.org/10.1093/nar/gkae135")[10.1093/nar/gkae135]
//
+ *Rihon, J.*, Reynders, S., Pinheiro, V.B., Lescrinier, E. (2024). The pucke.rs toolkit to facilitate sampling the conformational space of biomolecular monomers. _Journal of Cheminformatics_ , #link("https://github.com/jrihon")[placeholder]
//
+ Mattelaer, C-A., Mattelaer, H-P., *Rihon, J.*, Froeyen, M., Lescrinier, E. with Lescrinier, E. (2021). Efficient and Accurate Potential Energy Surfaces of Puckering in Sugar-Modified Nucleosides. _Journal of Chemical Theory and Computation_ , #link("https://doi.org/10.1021/acs.jctc.1c00270")[10.1021/acs.jctc.1c00270] 
//
+ Schofield, P., Taylor, A., *Rihon, J. (co-first)*, Pena Martinez, C.D., Zinn, S., Mattelaer, C-A., Jackson, J., Dhaliwal, G., Schepers, G., Herdewijn, P., Lescrinier, E., Christ, D., Holliger, P. (2023). Characterization of an HNA aptamer suggests a non-canonical G-quadruplex motif. _Nucleic Acids Research_ , #link("https://doi.org/10.1093/nar/gkad592")[10.1093/nar/gkad592] 
//
+ Xu, Y., Groaz, E., *Rihon, J.*, Herdewyn, P., Lescrinier, E. (2023). Synthesis, antiviral activity, and computational study of β-D-xylofuranosyl nucleoside phosphonates. _European Journal Of Medicinal Chemistry_ #link("https://doi.org/10.1016/j.ejmech.2023.115379")[10.1016/j.ejmech.2023.115379]
//
+ Depuydt, A-S., *Rihon, J. (co-first)*, Cheneval, O., Vanmeert, M., Schroeder, C.I., Craik, D.J., Lescrinier, E., Peigneur, S., Tytgat, J. (2021). Cyclic Peptides as T-Type Calcium Channel Blockers: Characterization and Molecular Mapping of the Binding Site. _ACS Pharmacology & Translational Science_ #link("https://doi.org/10.1021/acsptsci.1c00079")[10.1021/acsptsci.1c00079]


== Software releases
+ Ducque : the (X)NA model builder #link("https://github.com/jrihon/Ducque")[www.github.com/jrihon/Ducque]
+ pucke.rs : the CLI tool for conformational sampling #link("https://github.com/jrihon/puckers")[www.github.com/jrihon/puckers]
+ pucke.py : the Python module for conformational sampling, puckering formalisms and inversion, and computing standard geometries #link("https://github.com/jrihon/puckepy")[www.github.com/jrihon/puckepy]

== Scientific outreach


#let content-embo = [I had the pleasure of designing the poster for the EMBO | EMBL (European Molecular Biology Organization | Laboratory) course "Synthetic biology in action: beyond standard metabolism" (2022). They liked it so much that they reused my design for their 2024 course (#link("https://www.embl.org/about/info/course-and-conference-office/events/syn22-01/")[2022 event], 
#link("https://www.embl.org/about/info/course-and-conference-office/events/syn24-01/?utm_id=SYN24-01")[2024 event]) !
]

#let figure-embo = [#figure(
  image("../../src/svg/EMBO-EMBL_poster_design.svg")
)]
#grid(content-embo, figure-embo, columns: 2, gutter: 1em)
#pagebreak()
