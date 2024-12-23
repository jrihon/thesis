// Main file of Chapter 00
#import "../../lib/colours.typ": colourPalette
#import "../../lib/layout.typ": boxed-text, make-quote, FONT-10PT
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
    This introduction will guide you through the world of nucleic acids and how we describe and interpret molecules through means of computational modeling.
    The first part details the nucleic acids in nature and how we can chemically modify them for particular applications. Afterwards we describe how we can mathematically abstract their molecular structures. We close the chapter //finalise with their fundamental characterising and 
    by elaborating on how we can fundamentally characterise these molecules from a computer's point of view.
  ]

  block(
    width: 100%,
//    fill: rgb(..lightColour), // unpack array into the rgb() function
    fill: pat,
    radius: 2pt,
    inset: FONT-10PT,
    // body
    text(fill: colourPalette.blueslate, contents)
  )
}

#box-env()

#include {"00_section_01.typ"}
#include {"00_section_02.typ"}
#include {"00_section_03.typ"}
#include {"00_section_objectives.typ"}

#make-quote(
  [My invasion of \
  Thoughts is your \
  Caviar],
  [Dance Gavin Dance - Caviar],

)

#mbibliography(biblio, "ieee")
#pagebreak()
