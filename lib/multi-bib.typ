

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
#let mcite(arr_of_pubs, biblio) = {

  let basename = basename_yml(biblio.bibyml)
  let bibchapter = biblio.bibchapter

  // if the array contains one value, Typst coerces it to extract to only value and give it to you
  if type(arr_of_pubs) == "string" {

    let name_pub = arr_of_pubs // array got coerced into a single string
    let val = bibchapter.at(name_pub, default: 404) // find name of citation in the bibyml
   
    if val == 404 {
      panic("The key: " + name_pub + " was not found in the queried yml.")
    }

    // the link is make by concatenating the :
    // "key of the publication in yml" + "the name of the bibliography.yml file"
    text("[")
    link(
      label(name_pub + basename), // string coerced into label
      text( str(val)) 
    ) 
    text("]")

  // if the type is an array
  } else if type(arr_of_pubs) == "array" {

    let counter = 0
    text("[")
    for name_pub in arr_of_pubs {

      let val = bibchapter.at(name_pub, default: 404)
     
      if val == 404 {
        panic("The key: " + name_pub + " was not found in the queried yml.")
      }

      if counter == 0 {

        // the link is make by concatenating the :
        // "key of the publication in yml" + "the name of the bibliography.yml file"
        link(
          label(name_pub + basename), // string coerced into label
          text( str(val) )          
        )
      } else {  // if there are multiple citations
        text(", ") // add comma in between citations

        link(
          label(name_pub + basename), 
          text( str(val) ) 
        )
      }
      counter += 1
    }
    text("]")
  } else {
    panic("Invalid parameters passed to mcite() : " + str(type(arr_of_pubs)))
  }
}

#let set_authors(publication) = {

  let authors = publication.at("author", default: 404)

  if authors == 404 {
      [#text("NO AUTHORS, ")]
  } else {
      if type(authors) == "array" {
        for auth in authors {
          if type(auth) == "string" {
            let splitnames = auth.split(",")
            let lastname = splitnames.at(0)
            let firstname = ""
//            if splitnames.at(1, default: "Err") == "Err" {
//              [HERE]
//            }
            if splitnames.at(1).len() < 3 {
              firstname += splitnames.at(1, default:"Err")
              [#text(lastname + "." + firstname + ", ")]
            } else  {
              firstname += splitnames.at(1, default:"Err").slice(0,2)
              [#text(lastname + "." + firstname + "., ")]
            }
        }
      }
    } else {
        if type(authors) == "string" {
          let splitnames = authors.split(",")
          let lastname = splitnames.at(0)
          let firstname = splitnames.at(1).slice(0,2)
            [#text(lastname + "." + firstname + ". ")]
        }
    }
  }
}

#let set_title(publication) = { 

  let title = publication.at("title", default: 404)

  if title == 404 {
    [#text("NO TITLE, ")]
  } else {
    [#text(" \"" + title + "\" ")]
  }
}

#let set_date(publication) = { 

  let date = publication.at("date", default: 404)

  if date == 404 {
    [#text("NO DATE, ", style: "italic")]
  } else {
//    [#text("(" + str(date) + ")")  ]
    [#text(str(date) + ", ")  ]
  }
}


#let set_journal(publication) = {

  let parent = publication.at("parent", default: 404)

  if parent == 404 {
    [#text("NO PARENT FOUND, ", style: "italic")]
  } else {

    let journal = parent.at("title", default: 404)
    if journal == 404 {
      [#text(str("NO JOURNAL, "), style: "italic")  ]
    } else {
      [#text(str(journal) + ", ", style: "italic")  ]
    }
  }


}
#let set_issue(publication) = {

  let parent = publication.at("parent", default: 404)

  if parent == 404 {
    [#text("NO PARENT FOUND, ", style: "italic")]
  } else {

//    let issue = parent.at("issue", default: 404)
//    if issue == 404 {
//      [#text(str("NO ISSUE"), style: "italic")  ]
//    } else {
//      [#text("vol." + str(issue), style: "italic")  ]
//    }

    let volume = parent.at("volume", default: 404)
    if volume == 404 {
      [#text("(" + str("NO VOLUME") + "),")  ]
    } else {
      [#text("vol. " + str(volume) + ", ")  ]
    }
  }
}

#let set_pages(publication) = {
  let pagerange = publication.at("page-range", default: 404)

  if pagerange == 404 {
    [#text("NO PAGERANGE")]
  } else {
    [#text("pp. " + str(pagerange) + ", ")  ]
  }
}

#let set_doi(publication) = {
  let serial-number = publication.at("serial-number", default: 404)
  let url = publication.at("url", default: 404)

  if serial-number == 404 {
    [#text("NO DOI")]
  } else {
    let doi = serial-number.at("doi", default: 404)
    [#link(url)[#text("doi:" + doi)]]
  }
}
#let set_month(publication) = {

  let month = publication.at("month", default: 404)

  if month == 404 {
    [#text("")]
  } else {
    let Imonth = upper(month.at(0))
    let Emonth = month.slice(1)
    [#text(Imonth + Emonth + ". ")]
  }

}
#let ieee_style(biblio) = {

  let bibchapter = biblio.bibchapter
  let bibyml = yaml(biblio.bibyml)

  set par(leading: 0.5em)
  set text(size: 8pt)

  let basename = basename_yml(biblio.bibyml)

  let counter = 0

  // if no citations have been used, early return
  if bibchapter.len() == 0 {
    return
  }
  for name_pub in bibchapter.keys() {

    let publication = bibyml.at(name_pub, default: 404)
    if publication == 404 { continue }

    counter += 1
    // unique labels indicate the name of the `author key` and the name of the `yaml bibliography`
//    [[]#text(str(counter) + ". ", size: fontsize) #label(name_pub + basename)] // labels have to remain in local scope to their appended text
    [#text("[" + str(counter) + "] ") #label(name_pub + basename)] // labels have to remain in local scope to their appended text
    h(0.5em) // extra space before citation
    
    // Authors, Date, Title, Journal, volume number(issue number), pages, DOI


    set_authors(publication)
    set_title(publication)
    set_journal(publication)
    set_issue(publication)
    set_pages(publication)
    set_month(publication)
    set_date(publication)
    set_doi(publication)
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

  [== References]

  if style == "ieee" {
    ieee_style(biblio)
  } else {
    panic("Style of the bibliography " + style + "is not implemented.")
  }

}

