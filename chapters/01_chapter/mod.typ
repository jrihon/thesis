// Main file of Chapter 2
#import "../../lib/layout.typ": boxed-text, make-quote
#import "../../lib/colours.typ": colourPalette
#import "../../lib/multi-bib.typ": mbibliography
#import "bib_01_chapter.typ": biblio

//! set up variables

#show "hf3c": "HF-3c"
#show "mp2q": [MP2#super("Q")]
#show "mp2t": [MP2#super("T")]
#show "pbeq": [PBE0#super("Q")]
#show "pbet": [PBE0#super("T")]
#show "hfq": [HF#super("Q")]
#show "hfnorijk": [HF#super("Q-" + strike("RIJK", offset: -0.75em))]

= The _pucke.rs_ toolkit to calculation puckers values of biomolecular monomers.
#boxed-text(
  title: "The pucke.rs toolkit to facilitate sampling the conformational space of biomolecular monomers.",
  authors: ("Rihon J.", "Reynders S.", "Pinheiro V.B.", "Lescrinier E."),
  journal: "Submitted to Journal of Cheminformatics (J Cheminf)",
)

#include {"./01_introduction.typ"}
#include {"./01_methods.typ"}
#include {"./01_resultdiscussion.typ"}
#include {"./01_conclusion.typ"}

#make-quote(
  [" You miss 100% of the shots you don't take. \
    \- Wayne Gretzky " \ 
      \- Michael Scott ],
  [Jérôme Rihon]
)

#mbibliography(biblio, "ieee")
#pagebreak()
