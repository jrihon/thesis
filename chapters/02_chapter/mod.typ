// Main file of Chapter 2
#import "../../lib/layout.typ": boxed-text
#import "../../lib/colours.typ": colourPalette
#import "../../lib/multi-bib.typ": mbibliography
#import "bib_02_chapter.typ": biblio


= The _pucke.rs_ toolkit to calculation puckers values of biomolecular monomers.
#boxed-text(
  title: "The pucke.rs toolkit to facilitate sampling the conformational space of biomolecular monomers.",
  authors: ("Rihon J.", "Reynders S.", "Pinheiro V.B.", "Lescrinier E."),
  journal: "Journal of Cheminformatics (J Cheminf)",
  colour: colourPalette.fountain
)

#include {"./02_introduction.typ"}
#include {"./02_methods.typ"}
#include {"./02_resultdiscussion.typ"}
#include {"./02_conclusion.typ"}

#mbibliography(biblio, "ieee")
#pagebreak()
