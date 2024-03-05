// Main file of Chapter 00
#import "../../lib/colours.typ": colourPalette
#import "../../lib/layout.typ": boxed-text, make-quote
#import "../../lib/multi-bib.typ": mbibliography
#import "bib_00_chapter.typ": biblio


=  General introduction

#let box-env() = {
  v(3.5em)
  let pat = pattern(
    relative: "parent",
    image("../../src/cover/boxedtext_background-final.svg") // variant of the thesis cover
  )

  let contents = [ 
    Welcome to the first chapter of this doctoral thesis! \
    The contents of this chapter are, in parts, adaptations of the original manuscripts and supplementary materials of *Chapter 2* and *Chapter 3*.
  ]

  block(
    width: 100%,
//    fill: rgb(..lightColour), // unpack array into the rgb() function
    fill: pat,
    radius: 2pt,
    inset: 10pt,
    // body
    text(fill: colourPalette.blueslate, contents)
  )
}

#box-env()

#include {"outline.typ"}
//#include {"./00_introduction.typ"}
//#include {"./00_methods.typ"}
//#include {"./00_resultdiscussion.typ"}
//#include {"./00_conclusion.typ"}

#make-quote(
  [My invasion of \
  Thoughts is your \
  Caviar],
  [Dance Gavin Dance - Caviar],

)

#mbibliography(biblio, "ieee")
#pagebreak()
