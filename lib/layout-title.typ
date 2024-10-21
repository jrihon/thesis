#import "colours.typ": colourPalette
// Place affiliations
#let affiliations(content) = {
  place(
    top + left,
    text(content, size: 10pt)
  )
}

#let place_logo(figname) = {
  place(
    top + right,
    figure(
      image(figname,
      width: 35%
      )
    )
  )
}

#let set_title(title) = {
  text(title,
    size: 20pt,
    weight: "bold",
    colourPalette.jet
  )
}

#let set_name(name) = {
  text(name,
    size: 14pt,
  )
}

#let set_date(date) = {
  align(center,
    text(date, size: 10pt),
  )
}


#let set_text_extras(titles, jury, thingy) = {
  box(
    width: 0.6fr,
    align(left, titles),
//    fill: gray,
    )
  box(
    width: 1fr,
    align(left, jury),
//    fill: gray,
    )
  box( // align text with other box
    width: 2fr,
    align(right, thingy),
//    fill: gray,
    baseline: -2.72em
    )
//  place(
//    right,
//    text(thingy, size: 10pt),
//    dy: -74.5pt
//  )
}


/// General parameters for the layout
// Margins : 2.0 cm on left, right, top bottom
// size 12 pt
// KU Leuven
// Groep Biomedische Wetenschappen
// Faculteit Farmaceutische Wetenschappen
// Departement Farmacologische en Farmaceutische Wetenschappen

// size 20 pt
// TITEL VAN HET DOCTORAAT
//
// size 14 pt
// ONDERTITEL VAN HET DOCTORAAT

// size 12 pt
// name student

// size 10 pt 
// Promotor : Eveline Lescrinier
// Co-Promotor : Vitor Bernardes Pinheiro
// Co-Promotor : Matheus Froeyen
// Chair of TAC : Jef Rozenski
// Jurymember of TAC : Kalyan Das
// Jurymember of TAC : Joost Schymkowitz

// size 10 pt 
// Proefschrift voorgedragen tot het behalen van de graad van Doctor in de Farmaceutische Wetenschappen
//
// size 10 pt , on bottom of page
// December 2024
