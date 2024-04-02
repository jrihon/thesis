// Main file of Chapter 3
#import "../../lib/layout.typ": boxed-text, make-quote
#import "../../lib/colours.typ": colourPalette
#import "../../lib/multi-bib.typ": mbibliography
#import "bib_03_chapter.typ": biblio


= Structure prediction of an HNA aptamer with a G-quadruplex motif

#boxed-text(
  title: "Characterization of an HNA aptamer suggests a non-canonical G-quadruplex motif.",
  authors: ("Schofield P.", "Taylor A.I.", "Rihon J.", "Peña Martinez C.D.", "Zinn S.", "Mattelaer C.-A.", "Jackson J.", "Dhaliwal G.",
    "Schepers G.", "Herdwijn P.", "Lescrinier E", "Christ D.", "Holliger P."),
  journal: "Nucleic Acids Research (NAR)",
  doi: "10.1093/nar/gkad592",
)

#include {"./03_introduction.typ"}
#include {"./03_methods.typ"}
#include {"./03_resultdiscussion.typ"}
#include {"./03_conclusion.typ"}

#make-quote(
  [Je rime et je rame comme tartine et boterham, hein comme on dit.],
  [Claudy - Dikkenek],
)
#mbibliography(biblio, "ieee")
#pagebreak()
