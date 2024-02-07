// Import from the typst package repository: https://typst.app/docs/packages/
#import "lib/layout.typ" : * 

#show: document => layout(document, "I") // Set page counter to roman numbers

#include {"./chapters/00_titlepage/titlepage.typ"} 

#tableofcontents(colorPalette.anthracite)


#show: document => layout(document, "1")  // Set page counter to arabic numbers
#counter(page).update(1)                // Reset page counters

// Format headers
#show heading.where(level: 1): element => headerL1(element, colorPalette.airBlue)
#show heading.where(level: 2): element => headerL2(element, colorPalette.airBlue)
#show heading.where(level: 3): element => headerL3(element, colorPalette.airBlue)
#show heading.where(level: 4): element => headerL4(element, colorPalette.airBlue)
// Include manuscript
#include {"./chapters/01_chapter/mod.typ"} 

// Format headers
#show heading.where(level: 1): element => headerL1(element, colorPalette.puceRed)
#show heading.where(level: 2): element => headerL2(element, colorPalette.puceRed)
#show heading.where(level: 3): element => headerL3(element, colorPalette.puceRed)
#show heading.where(level: 4): element => headerL4(element, colorPalette.puceRed)
// Include manuscript
#include {"./chapters/02_chapter/mod.typ"} 

// Format headers
#show heading.where(level: 1): element => headerL1(element, colorPalette.ultraViolet)
#show heading.where(level: 2): element => headerL2(element, colorPalette.ultraViolet)
#show heading.where(level: 3): element => headerL3(element, colorPalette.ultraViolet)
#show heading.where(level: 4): element => headerL4(element, colorPalette.ultraViolet)
// Include manuscript
#include {"./chapters/03_chapter/mod.typ"} 
