// Import from the typst package repository: https://typst.app/docs/packages/
#import "lib/layout.typ" : * 
#import "lib/colours.typ": *
#import "@preview/tablex:0.0.8": tablex


//!
//!
//! PRELUDE
//!
//!
// Pages to roman numerals, do not include numbering in headers and ToC
#let colour00 = colourPalette.lightblueslate
#show: document => layout(document, "I", none, colour00) 

//Format Headers for prelude
#show heading.where(level: 1): element => prelude_heading(element, colour00)

#include {"./chapters/99_prelude/mod.typ"} 

// Format Table of Content
#show outline.entry: it => format-entries(it)
#tableofcontents(colour00)

// style link elements as a different colour
#show link: element => style_href(element, colour00)

//!
//!
//! CHAPTER 00 : Introduction
//!
//!
#show: document => layout(document, "1", "1.1.1", colour00)  // Set page counter to arabic numbers
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
#show heading.where(level: 1): element => headingL1(element, colour00)
#show heading.where(level: 2): element => headingL2(element, colour00)
#show heading.where(level: 3): element => headingL3(element, colour00)
#show heading.where(level: 4): element => headingL4(element, colour00)
#show heading.where(level: 5): element => headingL5(element, colour00)
// Include manuscript
#include {"./chapters/00_chapter/mod.typ"} 

//!
//!
//! CHAPTER 01: PUCKERS
//!
//!
// Format headers
// Include manuscript
#include {"./chapters/01_chapter/mod.typ"} 

//!
//!
//! CHAPTER 02: DUCQUE
//!
//!
// Include manuscript
#include {"./chapters/02_chapter/mod.typ"} 

//!
//!
//! CHAPTER 03: APTAMER
//!
//!
// Format headers
// Include manuscript
#include {"./chapters/03_chapter/mod.typ"} 

//!
//!
//! CHAPTER 04: NUCLEOBASE MODS
//!
//!
// Format headers
// Include manuscript
//#include {"./chapters/04_chapter/mod.typ"} 

//!
//!
//! CHAPTER 05: CONCLUSION
//!
//!
// Include manuscript
#include {"./chapters/05_chapter/mod.typ"} 


//!
//!
//! APPENDIX
//!
//!
#show heading.where(level: 1): element => prelude_heading(element, colour00)
#include {"./chapters/06_appendix/mod.typ"} 
//!
//!
//! SUPPLEMENT OF THE THESIS
//!
//!
#show: document => layout(document, "1", none, colour00) 
#show heading.where(level: 1): element => prelude_heading(element, colour00)
#show heading.where(level: 2): element => prelude_subheading(element, colour00)
#include {"./chapters/07_suppl/mod.typ"} 
