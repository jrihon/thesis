

/* Utility functions */
// Works for Linux/MacOS only
#let basename_yml(pathtofile) = {

  if pathtofile.ends-with(".yml") == false {
    panic("The called file : (" + pathtofile + ") does end in the .yml format")
  }

  let basename = ""
  if pathtofile.contains("/") {
    basename = pathtofile.split("/").at(-1).split(".").at(0) // take yml file (foo.yml) and cut off extension
  } else {
    basename = pathtofile.split(".").at(0)
  }
  basename
}
//
/* Bilbiography functions */

// name_pub : key of the citation
// yml_dict : the dict, parsed by python
// style    : citation style
#let mcite(arr_of_pubs, bilbio) = {

  let basename = basename_yml(bilbio.bibyml)
  let bibchapter = bilbio.bibchapter

  // if the array contains one value, Typst coerces it to extract to only value and give it to you
  if type(arr_of_pubs) == "string" {

    let name_pub = arr_of_pubs // array got coerced into a single string
    let val = bibchapter.at(name_pub, default: 404) // find name of citation in the bibyml
   
    if val == 404 {
      panic("The key: " + name_pub + " was not found in the queried yml.")
    }

    // the link is make by concatenating the :
    // "key of the publication in yml" + "the name of the bibliography.yml file"
    link(
      label(name_pub + basename), // string coerced into label
      text(
//        weight: "bold",
//        fill: rgb("#FF4252"),     // red, just for highlights, can be deleted later
//        super(str(val)))          // the citation-indexing superscripted
        "[" + str(val) + "]")          // the citation-indexing superscripted
    ) 

  // if the type is an array
  } else if type(arr_of_pubs) == "array" {

    let counter = 0
    text("[")
    for name_pub in arr_of_pubs {

      let val = bibchapter.at(name_pub, default: 404)
     
      if val == 404 {
        panic("The key: " + name_pub + " was not found in the queried yml.")
      }

      let citation = ""
      if counter == 0 {

        // the link is make by concatenating the :
        // "key of the publication in yml" + "the name of the bibliography.yml file"
        link(
          label(name_pub + basename), // string coerced into label
          text(
//        weight: "bold",
//        fill: rgb("#FF4252"),     // red, just for highlights, can be deleted later
//        super(str(val)))          // the citation-indexing superscripted
        str(val))          // the citation-indexing superscripted
        )
      } else {  // if there are multiple citations
        link(
          label(name_pub + basename), 
          text(
//            weight: "bold",
//            fill: rgb("#FF4252"),
//            super(",") + super(str(val))  // add comma in between citations
            ", " + str(val)  // add comma in between citations
          ) 
        )
      }
      counter += 1
    }
    text("]")
  } else {
    panic("Invalid parameters passed to mcite() : " + str(type(arr_of_pubs)))
  }
}

#let set_authors(publication, fontsize) = {

  let authors = publication.at("author", default: 404)

  if authors == 404 {
      [#text("NO AUTHORS, ", size: fontsize)]
  } else {
      for auth in authors {
        if type(auth) == "string" {
          let lastname = auth.split(",").at(0)
          let firstname = auth.split(",").at(1, default:"Err").slice(0,2)
          [#text(lastname + "," + firstname + "., ", size: fontsize)]
        }
      }
  }
}

#let set_title(publication, fontsize) = { 

  let title = publication.at("title", default: 404)

  if title == 404 {
    [#text("NO TITLE, ", style: "italic", size: fontsize)]
  } else {
    [#text(title + ", ", style: "italic", size: fontsize)]
  }
}

#let set_date(publication, fontsize) = { 

  let date = publication.at("date", default: 404)

  if date == 404 {
    [#text("NO DATE, ", style: "italic", size: fontsize)]
  } else {
    [#text("(" + str(date) + ")", size: fontsize)  ]
  }
}


#let set_journal(publication, fontsize) = {

  let parent = publication.at("parent", default: 404)

  if parent == 404 {
    [#text("NO PARENT FOUND, ", style: "italic", size: fontsize)]
  } else {

    let journal = parent.at("title", default: 404)
    if journal == 404 {
      [#text(str("NO JOURNAL, "), style: "italic", size: fontsize)  ]
    } else {
      [#text(str(journal) + ", ", style: "italic", size: fontsize)  ]
    }
  }


}
#let set_issue(publication, fontsize) = {

  let parent = publication.at("parent", default: 404)

  if parent == 404 {
    [#text("NO PARENT FOUND, ", style: "italic", size: fontsize)]
  } else {

    let issue = parent.at("issue", default: 404)
    if issue == 404 {
      [#text(str("NO ISSUE"), style: "italic", size: fontsize)  ]
    } else {
      [#text(str(issue), style: "italic", size: fontsize)  ]
    }

    let volume = parent.at("volume", default: 404)
    if volume == 404 {
      [#text("(" + str("NO VOLUME") + "),", size: fontsize)  ]
    } else {
      [#text("(" + str(volume) + "),", size: fontsize)  ]
    }
  }
}

#let set_pages(publication, fontsize) = {
  let pagerange = publication.at("page-range", default: 404)

  if pagerange == 404 {
    [#text("NO PAGERANGE", size: fontsize)]
  } else {
    [#text(str(pagerange), size: fontsize)  ]
  }
}

#let set_doi(publication, fontsize) = {
  let doi = publication.at("doi", default: 404)
  let url = publication.at("url", default: 404)

  if doi == 404 {
    [#text("NO DOI", size: fontsize)]
  } else {
    [#link(url)[doi: #doi]]
  }
}

#let apa_style(biblio) = {

  let bibchapter = biblio.bibchapter
  let bibyml = yaml(biblio.bibyml)

  let fontsize = 10pt

  let basename = basename_yml(biblio.bibyml)

  let counter = 0

  for name_pub in bibchapter.keys() {
    counter += 1

    // unique labels indicate the name of the `author key` and the name of the `yaml bibliography`
//    [[]#text(str(counter) + ". ", size: fontsize) #label(name_pub + basename)] // labels have to remain in local scope to their appended text
    [#text("[" + str(counter) + "] ", size: fontsize) #label(name_pub + basename)] // labels have to remain in local scope to their appended text
    h(0.5em) // extra space before citation
    
    // Authors, Date, Title, Journal, volume number(issue number), pages, DOI

    let publication = bibyml.at(name_pub)

    set_authors(publication, fontsize)
    set_date(publication, fontsize) 
    set_title(publication, fontsize)
    set_journal(publication, fontsize)
    set_issue(publication, fontsize)
    set_pages(publication, fontsize); [#text(". ")] // punctuation before DOI
    set_doi(publication, fontsize)
    [ \ ] // set newline



//    let publications = bibyml.at(name_pub)
//    for (key, value) in publications {
//      if key == "author" { set_authors(value, fontsize) }
//      if key == "title" [#text(value + ", ", style: "italic", size: fontsize)] 
//      if key == "date" [#text("(" + str(value) + ")", size: fontsize)  \ ] // "\" is a newline character in typst
//    }
  }
}

#let mbibliography(biblio, style) = {

  pagebreak() // page break to start bibliography

  let fontsize = 10pt
  [== References]
//  [#text("Bibliography", weight: "bold", size: 16pt) \ ]

  if style == "apa" {
    apa_style(biblio)
  } else {
    panic("Style of the bilbiography " + style + "is not implemented.")
  }

}

