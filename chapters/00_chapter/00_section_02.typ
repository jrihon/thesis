#import "../../lib/multi-bib.typ": mcite
#import "../../lib/colours.typ": colourPalette
#import "bib_00_chapter.typ": biblio

== Characterisation of nucleic acid structures
=== IUPAC nomenclature of polynucleotide chains
#lorem(100)
//
//
//
//
=== Quantitative abstraction of conformations
#lorem(50)
==== peptides
#lorem(10)
==== fiverings
#lorem(10)
==== sixrings
#lorem(10)
==== n-membered rings
#lorem(10)

//
//
//=== Setting the curve
//#lorem(50)
//
//==== Curvature ($kappa$) and Torsion ($tau$)
//#lorem(20)
// 
// 
// 
// 
//
=== A basis for definitions

At an EMBO (European Molecular Biology Organization) workshop in Cambridge (1988) #mcite(("Dickerson1989Cambridge"), biblio), the workshop _DNA Curvature and Bending_ was held between renowned nucleic acid chemists and biologist to attempt resolving a particular issue: to quantitatively describe intra- and interbasepair orientations.
Several groups (e.g. Lavery of Curves+ #mcite(("Lavery1988Curves"), biblio), Wilson of 3DNA #mcite(("Babcock19933DNA"), biblio)) were tasked to come up with a program that would be held against the following criteria: (i) follow IUPAC nomenclature #mcite(("Iupac1983nucleicacids"), biblio), (ii) make an general purpose software to describe polynucleotide chains, (iii)
adhere to a specific of instructions on how to construct reference basis frames in order to (iv) define parameters on rotational and translation of basepairs (@fig-appendix-basepairorient).


==== The problem with the current definitions
// Show with a figure how the definition came to be, with the rotation of the vectors
// starting from this point, everything is biased
// Say that in 1998, they even changed the angles of rotation => every previous data is now unusable and has to be redone
// The properties, like roll, twist, propel and stuff .. these are 'properties' asserted by scientists at the time
// A quantitative measure for a phenomenom they can observe in crystals.
// However, no evidence suggests that this makes for a good metric 
// Do a simulation with DNA and RNA and show that, based on these definitions, they're pretty much the same.
// Positive (x,y,z) axis directions were chosen so that all the rotational parameters except for propeller twist had the same sign as in the present HELIB library and in the published literature of the past decade "Definitions and nomenclature of nucleic acid structure parameters"
#lorem(20)

==== Curvature Torsion ?
// For CT, change in the trace chain is something we strive for.
// By applying CT to helices that are continuous and can be defined by simple functions, we get small differences that 
// are not significant between A- and B-helices => we want to have a metric that shows differences between those two 
// as that is what actually matters. 
#lorem(20)
