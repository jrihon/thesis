// Import from the typst package repository: https://typst.app/docs/packages/
#import "lib/layout.typ" : * 
#import "lib/colours.typ": *

//!
//!
//! PRELUDE
//!
//!
// Pages to roman numerals, do not include numbering in headers and ToC
#let colour00 = colourPalette.fountain
#let colour01 = colourPalette.fountain
#show: document => layout(document, "I", none, colour00) 

//Format Headers
#show heading.where(level: 1): element => prelude_header(element, colour00)

#include {"./chapters/99_prelude/mod.typ"} 

// Format Table of Content
#show outline.entry: it => format-entries(it)
#tableofcontents(colour00)

// style link elements as a different colour
#show link: element => style_href(element, colour01)

//!
//!
//! CHAPTER 00
//!
//!
#show: document => layout(document, "1", "1.1.1.", colour01)  // Set page counter to arabic numbers
#counter(page).update(1)                // Reset page counters

//
// Since we made a prelude, where `numbering : none` and we reset the `heading` after this,
// we need to add the figure formatting after the prelude and page counting update
//
// Format figure captions for the entire document
#show figure.caption: set text(font: "Liberation Sans", size: 8pt, style: "italic")
#show figure.caption: set align(left)
#show: set figure(numbering: num => figure-numbering(num))

// equations numbering
#show: set math.equation(numbering: num => equation-numbering(num))



// Format headers
#show heading.where(level: 1): element => headerL1(element, colour01)
#show heading.where(level: 2): element => headerL2(element, colour01)
#show heading.where(level: 3): element => headerL3(element, colour01)
#show heading.where(level: 4): element => headerL4(element, colour01)
// Include manuscript
#include {"./chapters/00_chapter/mod.typ"} 

//!
//!
//! CHAPTER 01
//!
//!
// Format headers
//#let colour02 = colourPalette.darkrose
//#show heading.where(level: 1): element => headerL1(element, colour02)
//#show heading.where(level: 2): element => headerL2(element, colour02)
//#show heading.where(level: 3): element => headerL3(element, colour02)
//#show heading.where(level: 4): element => headerL4(element, colour02)
// Include manuscript
#include {"./chapters/01_chapter/mod.typ"} 

//!
//!
//! CHAPTER 02
//!
//!
// Format headers
//#let colour03 = colourPalette.fountain
//#show heading.where(level: 1): element => headerL1(element, colour03)
//#show heading.where(level: 2): element => headerL2(element, colour03)
//#show heading.where(level: 3): element => headerL3(element, colour03)
//#show heading.where(level: 4): element => headerL4(element, colour03)
// Include manuscript
#include {"./chapters/02_chapter/mod.typ"} 

//!
//!
//! CHAPTER 03
//!
//!
// Format headers
//#let colour04 = colourPalette.myrtlegreen
//#show heading.where(level: 1): element => headerL1(element, colour04)
//#show heading.where(level: 2): element => headerL2(element, colour04)
//#show heading.where(level: 3): element => headerL3(element, colour04)
//#show heading.where(level: 4): element => headerL4(element, colour04)
// Include manuscript
#include {"./chapters/03_chapter/mod.typ"} 

//!
//!
//! CHAPTER 04
//!
//!
// Format headers
//#let colour04 = colourPalette.yellow
//#show heading.where(level: 1): element => headerL1(element, colour04)
//#show heading.where(level: 2): element => headerL2(element, colour04)
//#show heading.where(level: 3): element => headerL3(element, colour04)
//#show heading.where(level: 4): element => headerL4(element, colour04)
// Include manuscript
#include {"./chapters/04_chapter/mod.typ"} 

//!
//!
//! CHAPTER 05
//!
//!
// Format headers
//#let colour05 = colourPalette.roseorange
//#show heading.where(level: 1): element => headerL1(element, colour05)
//#show heading.where(level: 2): element => headerL2(element, colour05)
//#show heading.where(level: 3): element => headerL3(element, colour05)
//#show heading.where(level: 4): element => headerL4(element, colour05)
// Include manuscript
#include {"./chapters/05_chapter/mod.typ"} 


//!
//!
//! APPENDIX
//!
//!
#show: document => layout(document, "1", none, colour00) 
#show heading.where(level: 1): element => prelude_header(element, colour00)
#show heading.where(level: 2): element => prelude_subheader(element, colour00)
#include {"./chapters/06_appendix/mod.typ"} 
