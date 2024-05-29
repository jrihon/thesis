#import "../../lib/layout-title.typ" as layout-title

#set text(font: "Roboto")
#set align(left)
#set page(
    paper: "a4",
    margin: (
      left: 2.0cm,
      right: 2.0cm,
      top: 2.0cm,
      bottom: 2.0cm,
    ),
  )


#counter(page).update(1)                // Reset page counters

///////////////
///
/// ENGLISH
///
///////////////
#layout-title.affiliations(
"
KU Leuven
Group Biomedical Sciences
Faculty of Pharmaceutical Sciences
Department Pharmaceutical and Pharmacological Sciences
Laboratory of Medicinal Chemistry
Rega Institute for Medical Research"
)

#layout-title.place_logo("../chapters/99_prelude/kuleuven_logo.svg")

#v(10fr)
#layout-title.set_title("MOLECULAR MODELING TOOLS TO IMPROVE AND EXPAND COMPUTATIONAL RESEARCH ON
SYNTHETIC NUCLEIC ACIDS")

#v(1fr)
#layout-title.set_name("Jérôme RIHON")

#v(7fr)
#layout-title.set_text_extras(
"Promotor
Co-Promotor 
Co-Promotor
Chair 
Jury member
Jury member"
,
"Eveline Lescrinier
Vitor Bernardes Pinheiro
Matheus Froeyen
Jef Rozenski
Kalyan Das
Joost Schymkowitz
"
,
"Dissertation presented in partial
fulfilment of the requirements
for the degree of Doctor in
Pharmaceutical Sciences"
  )

#v(2fr)
#layout-title.set_date("September 2024")




//#pagebreak(to: "even") // insert blank page after this page
#pagebreak(to: "odd") // insert blank page after this page



///////////////
///
/// DUTCH
///
///////////////

#layout-title.affiliations(
"
KU Leuven
Groep Biomedische Wetenschappen
Faculteit Farmaceutische Wetenschappen
Departement  Farmaceutische en Farmacologische Wetenschappen
Laboratorium van Medicinale Chemie
Rega Instituut voor Medisch Onderzoek"
)

#layout-title.place_logo("../chapters/99_prelude/kuleuven_logo.svg")


#v(10fr)
#layout-title.set_title("MOLECULAIRE MODELING TOOLS TER 
BEVORDERING EN UITBREIDING VAN 
COMPUTATIONEEL ONDERZOEK 
OP SYNTHETISCHE NUCLEÏNEZUREN")

#v(1fr)
#layout-title.set_name("Jérôme RIHON")


#v(7fr)
#layout-title.set_text_extras(
"Promotor
Co-Promotor 
Co-Promotor
Voorzitter 
Jurylid
Jurylid"
,
"Eveline Lescrinier
Vitor Bernardes Pinheiro
Matheus Froeyen
Jef Rozenski
Kalyan Das
Joost Schymkowitz
"
,
"Proefschrift voorgedragen
tot het behalen van de
graad van Doctor in de
Farmaceutische Wetenschappen"
)

#v(2fr)
#layout-title.set_date("September 2024")




//#pagebreak(to: "odd") // insert blank page after this page
#pagebreak(to: "even") // insert blank page after this page
