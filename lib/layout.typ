// Layout template file
#import "colours.typ": colourPalette



//! 
//! 
//! PAGE LAY-OUT
//! 
//! 
#let layout(document, pagenumbers, headernumbers) = {
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
    numbering: numbering(pagenumbers, 1),
  )
  set par(
    justify: true,
  )
  set heading(
    numbering: headernumbers, // only go three depths before we make inlined headers
  )

  document

}

//! 
//! 
//! HEADERS
//! 
//! 
#let headerstate = state("headercount", 1)
#let entrystate = state("entrystate", 1)

#let prelude_header(body, colour) = {
    text(body.body, size: 18pt, font: "Roboto", colour)
}

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
    title: text("CONTENTS\n", size: 18pt, font: "Roboto", colour),
    depth: 3,
    fill: repeat("  .  "), // optionally, fill in blank space
    indent: 2em, // `auto`  only works with numbered headers
  )

}

// https://github.com/typst/typst/issues/2196 -- recursively join content into string
#let to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let format-entries(element) = { 

  if element.element.numbering == none {
    text(element, font: "Roboto", colourPalette.charcoal)
  } else if element.element.level == 1 {
    let string = to-string(element.body).at(0)
    if string == "1" {
      text(element, font: "Roboto", colourPalette.darkpurple)
    } else if string == "2" {
      text(element, font: "Roboto", colourPalette.darkrose)
    } else if string == "3" {
      text(element, font: "Roboto", colourPalette.fountain)
    } else if string == "4" {
      text(element, font: "Roboto", colourPalette.myrtlegreen)
    } else if string == "5" {
      text(element, font: "Roboto", colourPalette.yellow)
    } else if string == "6" {
      text(element, font: "Roboto", colourPalette.roseorange)
    }
  } else {
    text(element, font: "Roboto")

  }
  v(-6.5mm)
}












