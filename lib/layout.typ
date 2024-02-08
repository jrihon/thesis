// Layout template file



//! 
//! 
//! PAGE LAY-OUT
//! 
//! 
#let layout(document, numeral) = {
  set text(
    font: "CormorantGaramond",
    weight: "regular",
    size: 11pt,
  )
  set align(left)
  set page(
    paper: "a4",
    margin: (
      left: 2cm,
      right: 2cm,
      top: 2cm,
      bottom: 2cm,
    ),
    numbering: numbering(numeral, 1),
  )
  set par(
    justify: true,
  )
  set heading(
    numbering: "1.1.1.", // only go three depths before we make inlined headers
  )
  document
}

//! 
//! 
//! HEADERS
//! 
//! 
#let headerstate = state("headercount", 1)

#let headerL1(element, colour) = {

  set text(font: "Roboto", colour, size: 18pt)
  set align(left)

  // Place title
  box(width: 85%, upper(element.body))

  if element.outlined { // the table of contents is not outlined
    place(top + right, text(headerstate.display(), size: 76pt))
  }
  headerstate.update(x => x + 1)

}

#let headerL2(element, colour) = {

  set text(font: "Roboto", colour, size: 14pt)
  set align(left)
  let c = counter(heading).display()
  [#c #element.body]

}

#let headerL3(element, colour) = {


  set text(font: "Roboto", colour)
  set align(left)

  let c = counter(heading).display()
  [#c #element.body]

}

#let headerL4(element, colour) = {


  set text(font: "Roboto", colour, size: 11pt)
  set align(left)

  let original = read("../src/svg/chevron-arrow.svg")
  let changed = original.replace(
    black.to-hex(), // blue
    colour.to-hex(),
  )
  let a = box(image.decode(changed), height:0.7em, baseline: 0pt)
  let c = counter(heading).display()
  [#h(1em)#a #element.body]

}


//! 
//! 
//! TABLE OF CONTENTS
//! 
//! 
#let tableofcontents(colour) = {

  // Outlines the table of contents
  outline(
    title: text("CONTENTS", size: 16pt, font: "Roboto", colour),
    depth: 3,
    fill: repeat("  .  "), // optionally, fill in blank space
    indent: 2em, // `auto`  only works with numbered headers
  )

}

//! 
//! 
//! COLOUR PALETTE
//! 
//! 
#let colourPalette = (
  // base colors
  anthracite: rgb("#767F94"),
  // Pallete 1
  cambridgeBlue: rgb("#99C1B9"),
  almondBeige: rgb("#F1E3D3"),
  puceRed: rgb("#D88C9A"),
  lightOrange: rgb("#F2D0A9"),
  TropicalIndigo: rgb("#8E7DBE"),

  // Pallete 2
  airBlue: rgb("#7C9EB2"),
  ultraViolet: rgb("#4B4E6D"),
  russianViolet: rgb("#372554"),
//  darkPurple: rgb("#231123"),
  black: rgb("#000000"),

  // Palette 3
  onyx: rgb("#36393B"),
  jet: rgb("#2F2F2F"),
  raisinblack: rgb("#2E2E24"),
  rosybrown: rgb("#C49799"),
  teagreen: rgb("#C7DFA9"),

  // Palette 4
//  darksteel: rgb("#355C7D"),
  charcoal: rgb("#364958"),
//  darkpurple: rgb("#6C5B7B"),
  darkpurple: rgb("#7B597A"),
//  darkpurple: rgb("#7A5B6F"),
//  darkrose: rgb("#C06C84"),
  darkrose: rgb("#B3647A"),
  coralred: rgb("#F67280"),
  sanddune: rgb("#F8B195"),
//  fountain: rgb("#5BAEB7"),
  fountain: rgb("#5C91B8"),
  moonstone: rgb("#779FA1"),
//  myrtlegreen: rgb("#538083"),
  myrtlegreen: rgb("#538883"),
//  myrtlegreen: rgb("#528275"),
//  coffee: rgb("#694A38")
)
