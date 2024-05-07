// Layout template file
#import "colours.typ": colourPalette


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

      let next_subsection = query(selector(heading.where(level: 2)).after(loc), loc)
      let ref_text = ""
      if next_subsection.len() == 0 {
        ref_text += "Appendix"
      } else {
        ref_text += to-string(next_subsection.at(0).body)
      }

      if ref_text == "References" {
        // Get section number
        let map_bibs = next_subsection.map(x => {
            let refsubsections = to-string(x.body)
            if refsubsections == "References" {
              x.location().page()
            }
        })
        let filtered_set = map_bibs.filter(x => x != none)
        let current_page = loc.page()
        // if the current page is in the set of pages that contains the references heading L2, then
        if current_page in filtered_set {
          let secnum = counter(heading).at(loc)
          secnum.at(1) += 1
          align(right, [ #secnum.at(0).#secnum.at(1) : References])
        } else {
          let name_subsection = {
            query( 
              selector(heading.where(level: 2)).before(loc), loc,
            ).last()
          }

          // Get section number
          let secnum = counter(heading).at(loc)
          align(right, [ #secnum.at(0).#secnum.at(1) : #name_subsection.body])

        }
      } else {
        let name_subsection = {
          query( 
            selector(heading.where(level: 2)).before(loc), loc,
          ).last()
        }

        // Get section number
        let secnum = counter(heading).at(loc)
        align(right, [ #secnum.at(0).#secnum.at(1) : #name_subsection.body])
      }
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
//    font: "IBM Plex Serif",
//    font: "Source Serif 4",
//    font: "Noto Serif CJK JP",
//    font: "Roboto Slab",
//    weight: "light",
//    font: "Cormorant Garamond",
    weight: "regular", // standard typst font is probably best font, also smallest font and is well-readable
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
//    leading: 0.65em, // whitespace between lines
//    leading: 0.8em,
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
    text(body.body, size: 18pt, font: "Roboto", colour, weight: "medium")
}
#let prelude_subheader(body, colour) = {
    text(body.body, size: 14pt, font: "Roboto", colour, weight: "light")
}

#let headerL1(element, colour) = {

  set text(font: "Roboto", colour, size: 18pt, weight: "regular")
  set align(left)

  // Place title
  box(width: 85%, upper(element.body))

  if element.outlined { // if the element is not in the outline() (ToC)
    place(top + right, text(headingstate.display(), size: 76pt))
  }
  headingstate.update(x => x + 1)

}

#let headerL2(element, colour) = {

  set text(font: "Roboto", colour, size: 16pt, weight: "regular")
  set align(left)
  let c = counter(heading).display()
  [#c #element.body]

}

#let headerL3(element, colour) = {


  set text(font: "Roboto", colour, size: 12pt, weight: "regular")
  set align(left)

  let c = counter(heading).display()
  [#c #element.body]

}

#let headerL4(element, colour) = {


//  set text(font: "Roboto", colour, size: 11pt, weight: "light")
  set text(font: "Roboto", colour, size: 12pt, weight: "regular")
  set align(left)

//  let original = read("../src/svg/chevron-arrow.svg")
//  let changed = original.replace(
//    black.to-hex(), // blue
//    colour.to-hex(),
//  )
//  let a = box(image.decode(changed), height:0.7em, baseline: 0pt)
//  let a = $tilde.op$
//  let a = $quote.angle.r.double$
//  let a = $succ.eq$
//  let a = $arrow.r.loop$
//  let a = $harpoon.rt$
//  let a = $compose$
//  let a = $succ$
//  let a = $integral.cont$
  let a = $arrow.r.hook$
  [#h(1em)#a #element.body]

}

#let headerL5(element, colour) = {

//  set text(font: "Roboto", colour, size: 11pt, weight: "light")
  set text(font: "Roboto", colour, size: 11pt, weight: "regular")
  [#element.body]
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
    indent: 1em, // `auto`  only works with numbered headers
  )

}

#let format-entries(element) = { 

//  if element.element.numbering == none {
//    text(element, font: "Roboto", colourPalette.fountain)
//  } else if element.element.level == 1 {
//    text(element, font: "Roboto", colourPalette.fountain)

  if element.element.level == 1 {
    text(element, font: "Roboto", colourPalette.lightblueslate)
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

//! 
//! 
//! BOX STYLE TEXT
//! 
//! 
#let boxed-text(title: "", authors: "", journal: "", doi: "www.github.com/jrihon") = {

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

//  let lightColour = colour.components()
//  lightColour.at(3) = 10% // set alpha to 30%

  v(1.5em)
  let pat = pattern(
    relative: "parent",
    image("../src/cover/boxedtext_background-final.svg") // variant of the thesis cover
  )

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


//! 
//! 
//! HYPERLINK STYLE
//! 
//! 

#let style_href(body, colour) = {
  text(body, fill: colour)
} 


//! 
//! 
//! FIGURE STYLE
//! 
//! 
// TODO: I have to fix the numbering scheme of Figures and Equations
// https://github.com/typst/typst/issues/606
#let figure-numbering(num) = {
  // num returns the amount of figures that has thusfar appeared in the manuscript

  locate(loc => {
    //! Get Chapter Number
    // get location of current figure, `at()` index starts from 0
    let fig_loc = query(figure, loc).at(num - 1).location() // 
    // get current number of chapter 
    // Chapter 2 : number 2 ; Chapter 3 : number 3
    let chap = counter(heading.where(level: 1)).at(fig_loc).first()

    //! Get Figure Number in the chapter
    // get location of current chapter
    //
    // We have 5 chapters in our prelude section, which also count as `heading`
    // Increment an extra by 5 to get chapter_location, starting from the actual Chapter 1
    // `at()` index starts from 0
    let chap_loc = query(heading.where(level: 1), loc).at(chap - 1 + 5).location()
    let num_before = counter(figure).at(chap_loc).first()
    str(chap) + "-" + str(num - num_before)
  })
}
//})

//! 
//! 
//! EQUATION STYLE
//! 
//! 
#let equation-numbering(num) = {
  locate(loc => {
    //! Get Chapter Number
    // get location of current figure, `at()`. Indexing starts from 0
    //  but the numbers returned from the counters start at 1
    let eq_loc = query(math.equation.where(block: true), loc).at(num - 1).location()
    // get current number of chapter 
    // Chapter 2 : number 2 ; Chapter 3 : number 3
    let chap = counter(heading.where(level: 1)).at(eq_loc).first()

    //! Get Figure Number in the chapter
    // get location of current chapter
    //
    // We have 5 chapters in our prelude section, which also count as `heading`
    // Increment an extra by 5 to get chapter_location, starting from the actual Chapter 1
    // `at()` index starts from 0
    let chap_loc = query(heading.where(level: 1), loc).at(chap - 1 + 5).location()
    let num_before = counter(math.equation).at(chap_loc).first()
    str(chap) + "-" + str(num - num_before)
  })
}



//!
//!
//! MAKE FANCY QUOTE ENVIRONMENT
//!
//!
#let make-quote(content, author) = {

  set align(center)
  author = text("~ " + author + " ~", style: "italic", size: 10pt)
  content = text("\" " + content + " \"", size: 12pt)

  let lightColour = colourPalette.lightblueslate.components()
  lightColour.at(3) = 50% // set alpha to 30%
  content += "\n" + author
  place(
    bottom + right,
    box(
      align(
        center,
        content
      ),
      radius: 2pt,
//      stroke: colourPalette.lightblueslate,
      stroke: (
        bottom: rgb(..lightColour),
        right: rgb(..lightColour),
        ),
      inset: 0.75em
    )
  )

  
}


//! 
//! Make pdb accession code hyperlinked
//! 
#let pdb-code(pdbstring) = {
  link("https://www.rcsb.org/structure/" + pdbstring)[#pdbstring]
}

#let get-page-by-query(tag) = {
  // some magic mumbo jumbo, this `context keyword`
  let pagenumber = context counter(page).at(locate(tag)).at(0)
  [p. #pagenumber]
}
//! 
//! Make pdb accession code hyperlinked
//! 
#let intermezzo(header, content) = {

  let content = [#text(style: "italic", weight: "bold" , header) #v(-0.5em)] + align(right)[#content]
  set text(fill: colourPalette.blueslate, style: "italic")

  let lightColour = colourPalette.lightblueslate.components()
  lightColour.at(3) = 10% // set alpha to 30%
  block(
    width: 100%,
    fill: rgb(..lightColour), // unpack array into the rgb() function
    radius: 2pt,
    inset: 10pt,
    breakable: false,
    content
  )
}


