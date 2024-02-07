// Import from the typst package repository: https://typst.app/docs/packages/
#import "lib/layout.typ" : * 

#show: document => layout(document, "I") // Set page counter to roman numbers

// Format lv1 headers
#let headerstate = state("headercount", 0)
#show heading.where(level: 1): element => {

  set text(font: "Roboto", colorPalette.airBlue, size: 18pt)
  set align(left)

  // Place title
  box(width: 85%,
    upper(element.body)
  )

  if element.outlined { // the table of contents is not outlined
    place(top + right, text(headerstate.display(), size: 76pt))
  }
  headerstate.update(x => x + 1)
}

// Format lv2 headers
#show heading.where(level: 2): element => {

  set text(font: "Roboto", colorPalette.airBlue, size: 14pt)
  set align(left)
  let c = counter(heading).display()
  [#c #element.body]

}

// Format lv3 headers
#show heading.where(level: 3): element => {

  set text(font: "Roboto", colorPalette.airBlue)
  set align(left)

  let original = read("./src/svg/arrow-header.svg")
  let changed = original.replace(
    black.to-hex(), // blue
    colorPalette.airBlue.to-hex(),
  )
  let a = box(image.decode(changed), height:0.5em, baseline: -1pt)
  let c = counter(heading).display()
  [#h(1em)#a #element.body]

}
#include {"./chapters/00_titlepage/titlepage.typ"} 

#tableofcontents()


#show: document => layout(document, "1")  // Set page counter to arabic numbers
#counter(page).update(1)                // Reset page counters

// Include manuscript
#include {"./chapters/01_chapter/mod.typ"} 

