// Main file of Chapter 1
#import "../../lib/layout.typ": boxed-text
#import "../../lib/colours.typ": colourPalette
#import "../../lib/multi-bib.typ": mbibliography
#import "bib_02_chapter.typ": biblio

=  The Ducque model builder tool to predict synthetic nucleic acid duplexes

#boxed-text(
  title: "Structural insights into the Morpholino Nucleic Acid/RNA duplex using the new XNA builder Ducque in a molecular modeling pipeline.",
  authors: ("Rihon J.", "Mattelaer C.-A.", "Montalvão R.W.", "Froeyen M.", "Pinheiro V.B.", "Lescrinier E."),
  journal: "Nucleic Acid Research (NAR)",
  doi: "10.1093/nar/gkae135",
  colour: colourPalette.fountain
)

//= The Ducque model builder  The Ducque model builder
#include {"./02_introduction.typ"}
#include {"./02_methods.typ"}
#include {"./02_results.typ"}
#include {"./02_discussion.typ"}
#include {"./02_conclusion.typ"}

#mbibliography(biblio, "ieee")
#pagebreak()
