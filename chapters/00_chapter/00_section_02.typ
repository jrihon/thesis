#import "../../lib/multi-bib.typ": mcite
#import "../../lib/colours.typ": colourPalette
#import "bib_00_chapter.typ": biblio

== Characterisation of nucleic acid structures
=== IUPAC nomenclature of polynucleotide chains
//! Reference 1983 IUPAC
//! Reference Saenger 1984 book
//! 
//! -> Backbone chain (alpha, beta ...)
//! -> endocyclic angles (v0, v1 ...)
//! -> endocyclic angles (v0, v1 ...)
//! 
#lorem(100)
//
//
//
//
=== Quantitative abstraction of conformations
//! CONFORMATIONAL NOMENCLATURE FOR FIVE- AND SIX-MEMBERED RING FORMS OF MONOSACCHARIDES AND THEIR DERIVATIVES
//-> IUPAC_conformational_nomenclature_on_five and sixrings.pdf
//
//! Abbreviations and Symbols for the Description of Conformations of Polynucleotide Chains
//-> IUPAC_Abbreviations and symbols for the description of conformations of polynucleotide chains.pdf
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

At an EMBO (European Molecular Biology Organization) workshop in Cambridge (1988) #mcite(("Dickerson1989Cambridge"), biblio), the workshop _DNA Curvature and Bending_ was held between renowned nucleic acid chemists and biologist to attempt to resolve a particular issue: to quantitatively describe intra- and interbasepair orientations. This description was meant to prove useful in order to describe the geometry of nucleic acid chains and helices. 
Several groups (e.g. Lavery of Curves+ #mcite(("Lavery2009Curves"), biblio), Wilson of 3DNA #mcite(("Lu20033DNA"), biblio) and two others) were tasked to come up with a program that would be held against the following criteria: (i) follow IUPAC nomenclature #mcite(("Iupac1983nucleicacids"), biblio), (ii) make a general purpose software to describe polynucleotide chains, (iii) adhere to a specific set of instructions on how to construct reference basis frames in order to (iv) define parameters on rotations and translations of basepairs (@fig-appendix-basepairorient).

Over the years, the two mentioned packages have blown the competition out of the field. Their usage is applied to parametrising groove widths, helical size of duplexes and of course basepair orientations.
Unfortunately, there are gaping problems with the current set of definitions employed to describe nucleic acid helical models. While widths, size and inclination degree per basepair are unequivocally defines by the objective atomic positioning, the reference basisframes to calculate orientations is entirely not.  
//
==== The problem with the current definitions
@fig-referenceframes visually represents the algebra that goes on in the backend (meaning logic and calculations) of the respective software that will be discussed.
Starting off, one key problem starts of with the report of the convention #mcite(("Dickerson1989Cambridge"), biblio) basing the definitions off of the HELIB software, a tool that has been lost to the annals of history. Furthermore, the main issue is with point (iii) of the previous paragraph. For a reference system to be an objective way of quantification, it musn't be biased and yet the report dictates the orientation and location of an arbitrary orthonormal basis. It is stated that the x-axis needs to be pointed into the major groove, the y-axis towards the backbone and the z-axis is the cross product of this plane. 

For instance with Curves+, the basisframe is decided on the orientation of the glycosidic bond of the nucleotides. A normal vector $accent(v_N, arrow)$ is spawned and defines the orientation of the subsequent rotation. The first manipulation describes assigning the location of the basisframe $p_R$, with a angle $tau_1$ (141.47°) and stretched by a distance $d$ (4.702 Å). The second manipulated rotates a vector by angle $tau_2$ (-54.41°) and moved to point $p_R$, assigned $accent(v_L, arrow)$. The normal $accent(v_N, arrow)$ is then moved to $p_R$ and a cross product ($accent(v_L, arrow) times accent(v_N, arrow)$) defines $accent(v_D, arrow)$. With a local frame on both nucleobases of the basepair, a mid-frame is calculated and this mid-frame is responsible for the operations on intra-bp and dyad-parameters. With two subsequent basepairs, both mid-frames define an inter-mid-frame responsible for inter-bp parameters #mcite(("Lavery1988Curves", "Lavery2009Curves"), biblio).

On the other hand, 3DNA #mcite(("Lu20033DNA"), biblio) takes on a far different approach. The nucleobase are first fitted to a flat plane before assigning the reference frames. The frames on the respective nucleobases are aligned on the middle of the six-memberded rings in both purines (C4-N1) and pyrimidines (N3-C6). The mid-frame is decided by taking half of the distance between either C1' of the ribose sugar and finding the shortest distance to the C6-C8 line. The z-axis is just the normal of the plane in which the nucleobase lie in and the x-axis is the result of the cross product ($y times z$) #mcite(("Babcock19933DNA", "Olson20013DNA", "ElHassan1995Calc3DNA"), biblio). The inter-mid-frame, like with Curves+, is also utilised in 3DNA's protocols. 
#figure(
  image("./figures/refframe/reffframes-explained.svg", width: 100%),
  caption: [
    *A.* 
    *B.* 
    *C.* 
  ]
) <fig-referenceframes>
//3DNA citation : 
// standard ref frame : Olson20013DNA . They fit bases to their plane (z = 0) and perform operations on in
// iets met calculaties voor 3DNA Babcock19933DNA
// feitelijke 3DNA publicatie : Lu20033DNA
// berekeningen waarop 3DNA zich heeft gebaseerd : ElHassan1995Calc3DNA
// Leg even uitleg hier over, maak figuur af
//
Even though these tools all revolve around the same semantics, it cannot be ignored that the methodology in which these are computed are wildly different. Non-indentical reference frames give slightly different results and that has been known for a long time now #mcite(("Lu1999ConfDiscrepancy"), biblio), with every software release brought forth from the Cambridge Convention employing an independent methodology.
Even though the parameters result in numerically similar values, one cannot compare data from these various softwares in good conscience.

The definitions were put in place over thirty years ago and since then, these orientation parameters have not shown profound relevance to the biological mode of action the nucleic acid structure has. It has even been shown that the orientation parameters between A-RNA and B-DNA models are rather the same #mcite(("Lu1999ConfDiscrepancy"), biblio)! In contrast, deformations like enlarged grooves and decrease in helical size have a direct implication for the nucleic acid structure to be accepted by its processing enzyme, influencing a biological process. 
The only somewhat relevant parameters are interbasepair rotation, especially the twist, but that is directly related to the amount of basepairs per helical turn and thus the helical size.
So far, quantification of basepair orientation has not resulted in a meaningful distinction between different helical structures or drastic change in one parameter influences cellular processes.
A good metric for structures should be semantically meaningful and translate into something applicable. 
// Het punt dat er verscheidene software zijn die hun berekeningen allemaal op een andere manier doen, om semantisch hetzelfde te willen beschrijven, zijn eigenlijk problematisch.
// Het punt blijft dat je niet kan vergelijken tussen verschillende softwares in, waardoor je een vertekend beeld krijgt van de literatuur. 
// In de literatuur wordt er her en der vergeleken met de resultaten van basepairing, zonder veel melding te maken van uit welke software de berekingen komen.
// In deze publicatie  wordt er zeffs (in 1999, Lu1999ConfDiscrepancy) duidelijk gemaakt dat er variaties zijn die uitkomsten. Hoewel ze numerically similar zijn, is het bepalen van de frames, mid-frames en inter-mid-frames anders. Ook het bepalen van de orientatie parameters wordt anders gedaan! Are we even talking about the same thing?
//
// Wat is eigenlijk het nut van deze parameters als er geen relevantie kan aangetoond worden met de biologische realiteit, een gegeven die uiteindelijk als enige van belang is.
// Het kwantificeren van dergelijke parameters heeft enkel nut als men hier ook verschillen kan aantonen.
//
// Which brings me to the following : DNA en RNA zijn insignificant verschillend als het aan komt op deze basepairing parameters. Wel zijn er significante verschillen als we het hebben over de verscheidene baseparing patronen (HG, wobble, parallel strands ... ). Maar is het dan de moeite om het verschil tussen deze te quantificeren als we toch al objectief kunnen beschrijven dat het patroon verschilt. 
//
// Laat me ook nog duidelijk maken dat de Proto XNA builder de manier van 3DNA gebruikt om zijn duplexen te maken, iets dat eigenlijk al in de 3DNA software tool zat sinds 2003. Omdat deze parameters gehaald zijn van experimentele data, kan de proto xna builder ook enkel experimentele structuren herbouwen .. case and point bitch
// Show with a figure how the definition came to be, with the rotation of the vectors
// starting from this point, everything is biased
// Say that in 1998, they even changed the angles of rotation => every previous data is now unusable and has to be redone
// The properties, like roll, twist, propel and stuff .. these are 'properties' asserted by wet lab scientists at the time
// A quantitative measure for a phenomenom they can observe in crystals.
// However, no evidence suggests that this makes for a good metric 
// it shows in paper ".. discrepancies .. " that RNA and DNA features are relatively similar
// Positive (x,y,z) axis directions were chosen so that all the rotational parameters except for propeller twist had the same sign as in the present HELIB library and in the published literature of the past decade "Definitions and nomenclature of nucleic acid structure parameters"
// There are no possible rotations and translations for dyads in the z-direction, because that xy-plane is the plane in which the reference frame lies, because it is defined in such a way. The way they define the reference frame is biased and every calculation from there on is defined by that bias.

==== Curvature Torsion ?
// For CT, change in the trace chain is something we strive for.
// By applying CT to helices that are continuous and can be defined by simple functions, we get small differences that 
// are not significant between A- and B-helices => we want to have a metric that shows differences between those two 
// as that is what actually matters. 
#lorem(20)
