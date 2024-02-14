// Main file of Chapter 1
#import "../../lib/layout.typ": boxed-text
#import "../../lib/colours.typ": colourPalette
#import "../../lib/multi-bib.typ": mbibliography
#import "bib_01_chapter.typ": biblio

=  The Ducque model builder as a tool to create synthetic nucleic acid structures

#boxed-text(
  title: "Structural insights into the Morpholino Nucleic Acid/RNA duplex using the new XNA builder Ducque in a molecular modeling pipeline.",
  authors: ("Rihon J.", "Mattelaer C.-A.", "Montalvão R.W.", "Froeyen M.", "Pinheiro V.B.", "Lescrinier E."),
  journal: "Nucleic Acid Research (NAR)",
  colour: colourPalette.fountain
)

//= The Ducque model builder  The Ducque model builder
#include {"./01_introduction.typ"}
#include {"./01_methods.typ"}
#include {"./01_resultdiscussion.typ"}
#include {"./01_conclusion.typ"}

#mbibliography(biblio, "apa")
#pagebreak()
