// Layout template file
#import "colours.typ": colourPalette

//! 
//! 
//! HEADERNOTE AT TOP OF PAGES
//! 
//! 
#let make-headernotes(colour) = {

  locate(loc => {

    // query elements at the current heading
    let headings_at_page = {
      query(
        selector(heading).before(loc),
        loc,
    )}
    // if there are no elements, return.
    if headings_at_page.len() == 0 { return }

    let currenthead = headings_at_page.last()

    // if page has roman numerals, return. These pages are part of the prelude
    if currenthead.numbering == none { return } 

    // get current page
    let currentpage = loc.page()

    // get the pages containing all the `level: 1` headings and find their pages
    let nextheading-l1 = query(heading.where(level: 1), loc)
    let all-l1-pages = nextheading-l1.map(x => x.location().page())

    // if the current page contains a `level: 1` heading, skip this page
    if currentpage in all-l1-pages {
      return
    }

    // get page number
    let pagenumber = counter(page).at(loc).at(0) 

    if calc.rem-euclid(pagenumber, 2) == 0 { // if page is even
      let name_chapter = { 
        query( 
          selector(heading.where(level: 1)).before(loc), loc,
        ).last()
      }

      // Get chapter number
      let chapternum = counter(heading).at(loc)
      align(left, [Chapter #chapternum.at(0) : #name_chapter.body])

    } else { // if page is uneven
      let name_subsection = {
        query( 
          selector(heading.where(level: 2)).before(loc), loc,
        ).last()
      }

      // Get section number
      let secnum = counter(heading).at(loc)
      align(right, [ #secnum.at(0).#secnum.at(1) : #name_subsection.body])
    }

    // Place line
    line(length: 100%, stroke: colour)

  })
}


//! 
//! 
//! PAGE LAY-OUT
//! 
//! 

#let layout(document, pagenumbers, headernumbers, colour) = {
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
    header: make-headernotes(colour),
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
#let headingstate = state("headercount", 1)

#let prelude_header(body, colour) = {
    text(body.body, size: 18pt, font: "Roboto", colour)
}

#let headerL1(element, colour) = {

  set text(font: "Roboto", colour, size: 18pt)
  set align(left)

  // Place title
  box(width: 85%, upper(element.body))

  if element.outlined { // the table of contents is not outlined
    place(top + right, text(headingstate.display(), size: 76pt))
  }
  headingstate.update(x => x + 1)

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

//  if element.element.numbering == none {
//    text(element, font: "Roboto", colourPalette.fountain)
//  } else if element.element.level == 1 {
//    text(element, font: "Roboto", colourPalette.fountain)

  if element.element.level == 1 {
    text(element, font: "Roboto", colourPalette.fountain)
//    let string = to-string(element.body).at(0)
//    if string == "1" {
//      text(element, font: "Roboto", colourPalette.darkpurple)
//    } else if string == "2" {
//      text(element, font: "Roboto", colourPalette.darkrose)
//    } else if string == "3" {
//      text(element, font: "Roboto", colourPalette.fountain)
//    } else if string == "4" {
//      text(element, font: "Roboto", colourPalette.myrtlegreen)
//    } else if string == "5" {
//      text(element, font: "Roboto", colourPalette.yellow)
//    } else if string == "6" {
//      text(element, font: "Roboto", colourPalette.roseorange)
//    }
  } else {
    text(element, font: "Roboto")

  }
  v(-6.5mm)
}

#let boxed-text(title: "", authors: "", journal: "", doi: "www.github.com/jrihon", colour: rgb("#000000")) = {

  // Start content

  let contents = ""
  if doi != "www.github.com/jrihon" {
    let doilink = link("https://www.doi.org/" + doi)[#emph(doi)]
    contents += "Adapted from the following manuscript " + doilink + " : \n"
  } else {
    let doilink = link(doi)[#emph("xxx/aaa/xxxxx")]
    contents += "Adapted from the following manuscript " + doilink + " : \n"
  }

  // Add authors
  let c = 0
  for author in authors { 
    if author == "Rihon J." {
      if c != 0 { contents += ", " }
      contents += text(author, weight: "semibold")
    } else { 
      if c != 0 { contents += ", " }
      contents += author 
    }
    c += 1
  }
  contents += " "
  contents += ["#emph(title)" ]
  contents += journal + ". "
//  contents += link("https://www.doi.org/" + doi)[(#doi)]

  let lightColour = colour.components()
  lightColour.at(3) = 30% // set alpha to 30%

  v(1.5em)
  block(
    width: 100%,
    fill: rgb(..lightColour), // unpack array into the rgb() function
    stroke: 1pt + colour,
    radius: 2pt,
    inset: 10pt,
//    body
    text(fill: colour, contents)
  )
}
