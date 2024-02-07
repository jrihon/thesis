// Layout template file



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

#let tableofcontents() = {

  // Outlines the table of contents
  outline(
    title: text("CONTENTS", size: 16pt, font: "Roboto"),
    depth: 3,
    fill: repeat("  .  "), // optionally, fill in blank space
    indent: 2em, // `auto`  only works with numbered headers
  )

}

#let colorPalette = (
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
  ultraViolet: rgb("#52528C"),
  russianViolet: rgb("#372554"),
  darkPurple: rgb("#231123"),
  black: rgb("#000000"),




)
