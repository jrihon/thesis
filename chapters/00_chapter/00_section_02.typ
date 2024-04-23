#import "../../lib/multi-bib.typ": mcite
#import "../../lib/layout.typ": intermezzo
#import "../../lib/colours.typ": colourPalette
#import "bib_00_chapter.typ": biblio

#let svg-icon-put(filename) = {
  let original = read(filename)
  let a = box(image.decode(original), height:0.8em, baseline: 0em)
  [#a]
}

== Characterisation of nucleic acid structures
=== IUPAC nomenclature of polynucleotide chains
//! Abbreviations and Symbols for the Description of Conformations of Polynucleotide Chains
//-> IUPAC_Abbreviations and symbols for the description of conformations of polynucleotide chains.pdf
//! Reference 1983 IUPAC
//! Reference Saenger 1984 book
//! 
//! -> Backbone chain (alpha, beta ...)
//! -> endocyclic angles (v0, v1 ...)
//! -> endocyclic angles (v0, v1 ...)
//! 
Before any technical section, like the upcoming part, it is always a good idea to exactly define the terms used to remove ambiguity from the equations. 
As it stands, this is the vision statement of the _International Union for Pure and Applied Chemistry_ (IUPAC).
//
//
//
//
=== Quantitative abstraction of conformations
//! CONFORMATIONAL NOMENCLATURE FOR FIVE- AND SIX-MEMBERED RING FORMS OF MONOSACCHARIDES AND THEIR DERIVATIVES
//-> IUPAC_conformational_nomenclature_on_five and sixrings.pdf

A lengthy title to a paragraph like this one signifies a mathematical section is coming right ahead. The purpose of abstracting conformers is to denote a simple description of an otherwise complex structural positioning of the molecule that is numerically verifiable and unambiguous with respect to other conformations. To simplify, the quantitative abstraction _measures_ the conformations and returns a set of values that can be used to distinguish it from other conformations.

A common analogy to highlight the importance of describing the conformation, or the shape, of a molecule can be done by referring to the _Lock and Key_ analogy. For a drug to act upon a receptor or enzyme, it must fit in the active or allosteric site of that protein. This fit is defined dipole interactions between drug and protein and by the conformation the molecule favours to adopt. This shape-specificity is crucial for all physiological processes in the biochemical world.

Being able to unambiguously define conformations allows us to also define when a conformation deviates from the norm. In large molecules, like proteins and nucleic acid duplexes which are respectively composed of the a single type of monomer, understanding changes in their behaviour and being able to quantify these changes allows us to comfortably study biological processes at a fundamental level. These parameters are meaningful because they are directly related to the behaviour of the molecules we research. 
//
//
//
//
//
==== peptides
// Ramachandran plots
// Maak kleine svg bestanden, ipv een volledige figuur, en insert deze in de tekst om de conformatie te duiden
Similarly to nucleic acid duplexes, proteins are composed of chains of amino acid monomers. The degree of freedom these peptide chains have is immense, one of the reason the protein folding problem is currently one of the biggest and most competitive research domains for structural bioinformaticians and AI engineers #mcite(("Jumper2021Alphafold"), biblio). Luckily for us, all cells contain machinery that assembles the structure of the amino acid polymers, synthesised by the ribosomes, to form constructs with a specific three dimensional shape with an even more specific function within the cell #mcite(("Vabulas2010proteinfolding"), biblio).\
The amino acid is simple compared to nucleic acids. The backbone consists of (-NH-C#sub("ɑ")-CO-) repeats that are linked through amide bonds, with a specific sidechain appended to the C#sub("ɑ") that defines the type of amino acid 
//(#svg-icon-put("./figures/conformers/amino-acid.svg")).
There are a total of twenty natural amino acids that make up human proteins; valine, histidine and glutamic acid to name a few. Because of the structural and sidechain diversity in proteins, they underpin almost cellular functioning. They propagate biochemical signals, recognise and act upon changes in the environment, support the structural integrity of cells and many other functions far beyond the scope of this explanation. 

The structure of a protein can be divided into three typical motifs: _alpha-helices_ (ɑ, #svg-icon-put("./figures/conformers/alphahelics.svg")) and _beta-strands_ (β, #svg-icon-put("./figures/conformers/betasheets.svg")), which are connected through _loop_ regions.
These motifs, consisting of linked amino acids, can be abstracted to the phi-psi (φ-ψ) dyad. This dyad is the resulted of calculating two consecutive dihedrals of a backbone chain of residues in the backbone. Each dyad pertains to a specific amino acid residue on the structure, which quantifies its conformation. These dyads can then be plotted on a Ramachandran plot, which makes it easy to assess the conformations of all the amino acids and more importantly to assess the prevalent motifs of the protein in the blink of an eye #mcite(("Hollingsworth2010Ramachandran"), biblio).\
While the description of proteins is not limited to just these definitions, they do form the basis of decade-long research on structural properties of proteins. 


==== five-membered rings
When talking about abstracting the conformation of a five-membered ring, such as a ribose sugar moiety in nucleic acids, the concept of pseudorotation or _puckering_ is the first thing in need of clarification. A cyclic molecule can vary in its endocyclic torsion angles ($nu_(0 arrow.r 4)$), meaning atoms in the molecule will move out-of-plane (figure). For five-membered rings, we recognise two distinct puckering modes: the Envelope (_E#super("x")_) and the Twist conformation (_#super("x")T_#sub("y")).
In 1947, Kilpatrick _et al._ devised a relation the potential energy of the molecule and the fact a simple molecule like cyclopentane does not appear as planar, but actually favours atoms to deviate out-of-plane #mcite(("Kilpatrick1947pseudorotation"), biblio). To calculate the energy of the various conformers of the ring, @eq-kilpatrick was produced in order to define out-of-plane deviations. The parameter $q$ is the magnitude of the deviation and $phi$ the phase that assigns the atoms to deviate. The integer $j$ represents iterating over the amounts of atoms (0-based indexing). Seeing as their data consists of vibrational spectra, the deviations proved favourable as they calculated that bondangles were strained in a planar position when keeping bondlengths constant.
$
z_j = sqrt(frac(2,5)) q · cos(2(frac(2 pi j,5) + phi))
$<eq-kilpatrick>

This particular research broadened the concept of puckering to a wider public. In the following decades, scientists efforted to improve the definitions and produced different formalisms to define the conformation of a five-membered ring.\
// intermezzo paragraph -> formalise this
#intermezzo()[
As a sidenote, many of the formulas in this section come from various sources that each employ a set of symbols to define the same parameters. As some papers were released prior to the IUPAC convention #mcite(("Iupac1983nucleicacids"), biblio), I took it upon myself to formalise all semantically equivalent symbols and employ IUPAC nomeclature.
]

===== Altona-Sundaralingham (AS)
// AS formalism
A relationship was described between the values of the endocyclic torsion angles ($nu_(0 arrow.r 4)$) and the puckering itself #mcite(("Altona1968pseudorot"), biblio). The AS formalism was also the first to popularise the usage of puckering behaviour on the nucleic acid ribose sugar and introduces the pseudorotational wheel. The latter makes it possible to, when a nucleic acid crystal structure is determined, to graph occurences of the various puckers of the ribose sugars on a polar coordinate system #mcite(("Altona1972formalism"), biblio).\
@eq-as-phaseangle details on a formula where all endocyclic angles are passed to a function to return the phase angle. This parameters allows the calculation @eq-as-amplitude to complete, given when $j=0$ and a trivial rearrangement left to the reader.

$
tan(phi) = frac((nu_4 + nu_1) - (nu_3 + nu_0) , 2 nu_2 (sin(frac(pi,5)) + sin(frac(2pi,5))) ) 
$ <eq-as-phaseangle>
$ 
nu_j = q cos(phi + frac(4pi,5)j)
$ <eq-as-amplitude>
===== Cremer-Pople (CP) 
// CP formalism
Two computational chemists build further on the concepts of quantifying the magnitude of the out-of-plane deviation of atoms in a cyclic molecule, as a basis for what constitutes puckering behaviour #mcite(("Cremer1975general"), biblio).

===== Relations between CP and AS
They are pretty much interchangeable #mcite(("Rao1981asvscp"), biblio), but vary slightly in amplitude and their phase angle differ by roughly $frac(pi,2)$.
What is really cool about the CP formalism is that, unlike the AS, the formalism is generalised for any $n$-membered ring system ($n$ ≥ 4). Additionally, one can reconstruct the entire ring based on the given CP coordinates #mcite(("Cremer1990analytical"), biblio)!
==== six-membered rings
// CP formalism
// SP formalism
#lorem(10)
==== n-membered rings
// CP formalism goes beyond, but let us just describe 4-membered and 7-membered rings.
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

At an EMBO (European Molecular Biology Organization) conference in Cambridge in 1988 #mcite(("Dickerson1989Cambridge"), biblio), a workshop _DNA Curvature and Bending_ was held by renowned nucleic acid chemists and biologist to attempt to resolve a particular issue: to quantitatively describe intra- and interbasepair orientations. This description was meant to prove useful in order to further expand the geometric descriptors of nucleic acid chains and helices. 
Several groups (e.g. Lavery of Curves+ #mcite(("Lavery2009Curves"), biblio), Wilson of 3DNA #mcite(("Lu20033DNA"), biblio) and others) were tasked to come up with a program that would be held against the following criteria: (i) follow IUPAC nomenclature #mcite(("Iupac1983nucleicacids"), biblio), (ii) make a general purpose software to describe polynucleotide chains, (iii) adhere to a specific set of instructions on how to construct reference basis frames in order to (iv) define parameters on rotations and translations of basepairs (see @fig-appendix-basepairorient).

Over the years, the two aforementioned packages have blown the competition out of the field. Their usage is applied to parametrising groove widths, helical size of duplexes and of course basepair orientations itself.
Unfortunately, there are gaping problems with the current set of definitions employed to describe these basepair orientations. While widths, size and inclination degree per basepair are unequivocally defined by the objective atomic positioning, the protocols on how the reference basisframes are derived - used to compute for the orientations - are decided based upon the sole discretion of the group producing the software itself. 
//
==== The problem with the current definitions
@fig-referenceframes visually represents the algebra that goes on in the backend - the logic and calculations - of the respective software that will be discussed.
At present, one key problem is the report of the convention #mcite(("Dickerson1989Cambridge"), biblio) basing the definitions off of the HELIB software, a tool and its publication that have been lost to the annals of science. This is quite the problem because the way basisframes were defined had to follow the reasoning of the authors that designed HELIB. The point made in the previous paragraph (iii) lacks substance, because definitions were based on tradition and not on objective matters.
For a reference system to be an objective way of quantification, it musn't be biased and yet the report dictates the orientation and location of an arbitrary orthonormal basis. It is stated that the x-axis needs to be pointed into the major groove, the y-axis towards the backbone and the z-axis is the cross product of this plane. 

For instance with Curves+, the basisframe is decided by the orientation of the glycosidic bond of the nucleotides. A normal vector $accent(v_z, arrow)$ is produced from $accent(j_1, arrow)$ #sub("(N1"+$arrow$+"C1')") $times accent(j_2, arrow) #sub("(N1"+$arrow$+"C2)")$ 
and defines the orientation of the subsequent rotations. The first operation describes assignment of point $p_p$, which is the location of the basisframe. The $accent(j_1, arrow)$ vector is rotated by the angle $tau_1$ (141.47°) around $accent(v_z, arrow)$ and stretched by a distance $d$ (4.702 Å). The second operation rotates a copy of the original $accent(j_1, arrow)$ vector by the angle $tau_2$ (-54.41°), assigned $accent(v_y, arrow)$. Both vectors are moved to $p_p$ and a cross product ($accent(v_y, arrow) times accent(v_z, arrow)$) defines $x'$. With local basisframes on both nucleobases of the basepair, a mid-frame is calculated and this mid-frame is used for operations to derive intra-bp and dyad-parameters. With two subsequent basepairs, both mid-frames define an inter-mid-frame that is used for operations to derive inter-bp parameters #mcite(("Lavery1988Curves", "Lavery2009Curves"), biblio).

On the other hand, 3DNA #mcite(("Lu20033DNA"), biblio) takes on a very different approach. The nucleobases are first fitted to a flat plane before assigning the reference basisframes. The y-axis of the basisframes, on the respective nucleobases, are to be aligned on the middle of the six-memberded rings in both purines (C4-N1) and pyrimidines (N3-C6). The mid-frame is decided by taking half of the distance between either C1' of the ribose sugars and finding the shortest distance to the C6-C8 line, a line connecting the extremities of the basepair. The z-axis is just the normal of the plane in which the nucleobases lie in and the x-axis is the result of the cross product ($y times z$) #mcite(("Babcock19933DNA", "Olson20013DNA", "ElHassan1995Calc3DNA"), biblio). The mid-frame and inter-mid-frame, like with Curves+, are also utilised in 3DNA's protocols but the orientations are produced with different operations.
#figure(
  image("./figures/refframe/reffframes-explained.svg", width: 100%),
  caption: [
    *A.* A pyrimidine is used to illustrate the operations. 
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
Even though these tools all revolve around the same semantics, it cannot be ignored that the methodology in which these are computed are wildly different. Non-indentical reference basisframes give slightly different results and that has been known for a long time now #mcite(("Lu1999ConfDiscrepancy"), biblio). Every individual software released in the aftermath of the Cambridge Convention employs an independent protocol to set up and compute the parameters.
Even though the parameters result in numerically similar values, one cannot compare data from these various softwares in good conscience because the data will always be offset.

The definitions were put in place over thirty years ago and since then, these orientation parameters have not shown profound relevance to the biological mode of action the nucleic acid structure has. It has even been shown that the orientation parameters between A-RNA and B-DNA models are rather the same #mcite(("Lu1999ConfDiscrepancy"), biblio)! In contrast, deformations like enlarged grooves and decrease in helical size (Å) have a direct implication for the nucleic acid structure to be accepted by its processing enzyme, thereby influencing a biological process. 
The only somewhat relevant parameters are interbasepair rotation, especially the twist, but that is directly related to the amount of basepairs per helical turn ($frac("bp", 2pi)$) and thus the helical size ($frac("Å", 2pi)$).
So far, quantification of basepair orientation has not resulted in a meaningful distinction between different helical structures or drastic change in one parameter influences cellular processes.
A good metric for structures should be objective, semantically meaningful and translate into something applicable. 
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
