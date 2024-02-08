// Import from the typst package repository: https://typst.app/docs/packages/
#import "lib/layout.typ" : * 

#show: document => layout(document, "I") // Set page counter to roman numbers

#let colour00 = colourPalette.charcoal
#include {"./chapters/00_titlepage/titlepage.typ"} 

#tableofcontents(colour00)


#show: document => layout(document, "1")  // Set page counter to arabic numbers
#counter(page).update(1)                // Reset page counters

// Format headers
#let colour01 = colourPalette.darkpurple
#show heading.where(level: 1): element => headerL1(element, colour01)
#show heading.where(level: 2): element => headerL2(element, colour01)
#show heading.where(level: 3): element => headerL3(element, colour01)
#show heading.where(level: 4): element => headerL4(element, colour01)
// Include manuscript
#include {"./chapters/01_chapter/mod.typ"} 

// Format headers
#let colour02 = colourPalette.darkrose
#show heading.where(level: 1): element => headerL1(element, colour02)
#show heading.where(level: 2): element => headerL2(element, colour02)
#show heading.where(level: 3): element => headerL3(element, colour02)
#show heading.where(level: 4): element => headerL4(element, colour02)
// Include manuscript
#include {"./chapters/02_chapter/mod.typ"} 

// Format headers
#let colour03 = colourPalette.fountain
#show heading.where(level: 1): element => headerL1(element, colour03)
#show heading.where(level: 2): element => headerL2(element, colour03)
#show heading.where(level: 3): element => headerL3(element, colour03)
#show heading.where(level: 4): element => headerL4(element, colour03)
// Include manuscript
#include {"./chapters/03_chapter/mod.typ"} 

// Format headers
#let colour04 = colourPalette.myrtlegreen
#show heading.where(level: 1): element => headerL1(element, colour04)
#show heading.where(level: 2): element => headerL2(element, colour04)
#show heading.where(level: 3): element => headerL3(element, colour04)
#show heading.where(level: 4): element => headerL4(element, colour04)
// Include manuscript
#include {"./chapters/04_chapter/mod.typ"} 
