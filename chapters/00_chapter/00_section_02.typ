#import "../../lib/multi-bib.typ": mcite
#import "../../lib/layout.typ": intermezzo
#import "../../lib/colours.typ": colourPalette
#import "bib_00_chapter.typ": biblio

//#let svg-icon-put(filename) = {
//  let original = read(filename)
//  let a = box(image.decode(original), height:0.8em, baseline: 0em)
//  [#a]
//}

== Characterisation of nucleic acid structures
Before any technical section, like the upcoming part, it is always a good idea to exactly define the terms used to remove ambiguity from the proverbial equations. 
As it stands, this is the vision statement of the _International Union for Pure and Applied Chemistry_ (IUPAC) #mcite(("Iupac1983nucleicacids"), biblio).

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
Similarly to nucleic acid duplexes, proteins are composed of chains of amino acid monomers. The degree of freedom these peptide chains have is immense, which explains why the _protein folding problem_ is currently one of the biggest and most competitive research domains for structural bioinformaticians and AI engineers #mcite(("Jumper2021Alphafold"), biblio). Luckily for us, all cells contain machinery that assembles the structure of the amino acid polymers, synthesised by the ribosomes, to form constructs with a specific three dimensional shape with an even more specific function within the cell #mcite(("Vabulas2010proteinfolding"), biblio).\
The amino acid is simple compared to nucleic acids. The backbone consists of (-NH-C#sub("ɑ")-CO-) repeats that are linked through amide bonds, with a specific sidechain appended to the C#sub("ɑ") that defines the type of amino acid (@fig-proteins A.).
There are a total of twenty natural amino acids that make up human proteins; valine, histidine and glutamate to name a few. Because of the structural and sidechain diversity in proteins, they underpin almost cellular functioning. They propagate biochemical signals, recognise and act upon changes in the environment, support the structural integrity of cells and many other functions far beyond the scope of this explanation. 

The structure of a protein can be divided into three typical motifs: _alpha-helices_, _beta-strands_ and _loop_ regions that connect motifs together.
These motifs, consisting of linked amino acids, can be abstracted to the phi-psi (φ-ψ) dyad. This dyad is defined by two consecutive dihedrals of a backbone chain of residues. Each dyad pertains to a specific amino acid residue on the structure, which quantifies its conformation. These dyads can then be plotted on a Ramachandran plot, which makes it easy to assess to assess the prevalent motifs of the protein in the blink of an eye (@fig-proteins A.-C.) #mcite(("Hollingsworth2010Ramachandran"), biblio).
#figure(
  image("./figures/conformers/proteinstructure.svg", width: 100%),
  caption: [
    *A.* Representation of a standard amino acid, with the addition of the $phi$ (-C#super("-1")-NH-C#sub("ɑ")-CO-) and $psi$ (-NH-C#sub("ɑ")-CO-N#super("+1")) dihedral respectively.
    *B.* A $beta$-sheet and $alpha$-helices.
    *C.* Ramachandran plot with assigned location on where to find $phi-psi$ dyads for a given tertiary structure. The regions where we can find the $alpha$- and $beta$-motifs are assigned on the plot.
  ]
  )<fig-proteins>

While the description of proteins is not limited to just these definitions, they do form the basis of decade-long research on structural properties of proteins and are still actively used in Artificial Intelligence (AI) models to predict viable solutions to the _protein folding problem_ #mcite(("Jumper2021Alphafold"), biblio).

// Figure needs :
// Twist and Envelope conformation 
// Pseudorotational wheel 
// Mean plane stuff, show that with the conformation. 
//
==== five-membered rings
When talking about abstracting the conformation of a five-membered ring, such as a ribose sugar moiety in nucleic acids, the concept of pseudorotation or _puckering_ is the first thing in need of clarification. A cyclic #v(-0.5em)
#let content-fivering= [
molecule can vary in its endocyclic torsion angles ($nu_(0 arrow.r 4)$), meaning atoms in the molecule will move out-of-plane (@fig-fivering A.). For five-membered rings, we recognise two distinct puckering modes: the Envelope (E#super("x")) and the Twist (#super("x")T#sub("y")).\
The ribose sugar is the most notable five-membered we find in nature as it constitutes the backbone of our genetic material. Thanks to years of structural determination of  
know that the DNA chemistry favours the #super("2")T#sub("3") conformation, while RNA adopts (#super("3")T#sub("2")) under normal conditions.
This //proclivity for a specific conformer makes it so that we were able to assign typical structures of NA helices as B-DNA and A-RNA respectively. These structures are recognised by processing enzymes, like ligases and polymerases, by the structural features of the helix itself. 
]
#let figure-fivering = [
  #figure(
    image("./figures/conformers/five-memberedring-conformation.svg", width: 100%),
    caption: [
      *A.* Envelope and Twist conformations. The mean plane is denoted in gray.
      *B.* Pseudorotational wheel according to the AS formalism. The region where DNA's and RNA's ribose moieties are found under normal conditions is assigned on the plot.
    ]
  )<fig-fivering>
]
#grid(content-fivering, figure-fivering, columns: (1fr, 1.5fr), gutter: 1em) #v(-0.5em)
//DNA and RNA fibers, we know that the DNA chemistry favours the (#super("2")T#sub("3")) conformation, while RNA adopts #super("3")T#sub("2") under normal conditions. This
proclivity for a specific conformer ultimately defines the form the NA helices; the B-DNA and A-RNA structures. These duplexes are recognised by processing enzymes, whose interactions are driven by the fact that these enzymes only accepts specific shapes. if the biopolymers do not fit the required shape, they cannot be processed. This has implications in i.e. ASO research, where this can be exploited to halt physiological processes.

//In 1947, Kilpatrick _et al._ devised a relation to the potential energy of the molecule and the fact a simple cyclopentane does not favour a planar conformation, but actually favours atoms to deviate out-of-plane #mcite(("Kilpatrick1947pseudorotation"), biblio). To calculate the energy of the various conformers of the ring, @eq-kilpatrick was produced in order to define out-of-plane deviations. The parameter $q$ is the magnitude of the deviation and $phi$ the phase that assigns the atoms to deviate. The integer $j$ represents iterating over the amounts of atoms (0-based indexing). Seeing as their data consists of vibrational spectra, the deviations proved favourable as they calculated that bondangles were strained in a planar position when keeping bondlengths constant.
In 1947, Kilpatrick _et al._ devised a relation to the potential energy of the molecule and the out-of-plane displacement of the atoms of a five-membered ring, specifically the cyclopentane molecule #mcite(("Kilpatrick1947pseudorotation"), biblio). To calculate the energy of the various conformers of the ring, @eq-kilpatrick was produced in order to define deviations per atoms. The parameter $q$ is the magnitude of the deviation and $phi$ phase that assigns the atoms to deviate. The integer $j$ represents iterating over the amounts of atoms (0-based indexing). Seeing as their data consists of vibrational spectra, the deviations proved favourable as they calculated that bondangles were strained in a planar position when keeping bondlengths constant.
$
z_j = sqrt(frac(2,5)) q · cos(2(frac(2 pi j,5) + phi))
$<eq-kilpatrick>

This particular research brought the concept of puckering to a wider public. In the following decades, scientists efforted to improve the definitions and produced different formalisms to define the conformation of a five-membered ring.\
// intermezzo paragraph -> formalise this
#intermezzo("Symbols and semantics")[
As a sidenote, many of the formulas in this section come from various sources that each employ a set of symbols to define the same parameters. As some papers were released prior to the IUPAC convention #mcite(("Iupac1983nucleicacids"), biblio), I took it upon myself to formalise all semantically equivalent symbols and employ IUPAC nomeclature.
]

// AS formalism
===== Altona-Sundaralingam (AS)
A relationship was described between the values of the endocyclic torsion angles ($nu_(0 arrow.r 4)$) and the puckering itself #mcite(("Altona1968pseudorot"), biblio). The AS formalism was also the first to popularise the usage of puckering behaviour on the nucleic acid ribose sugar and introduces the pseudorotational wheel. The latter makes it possible to, when a nucleic acid crystal structure is determined, to graph occurences of the various puckers of the ribose sugars on a polar coordinate system (@fig-fivering B.) #mcite(("Altona1972formalism"), biblio).\
@eq-as-phaseangle details on a formula where all endocyclic angles are passed to a function to return the phase angle. This parameters allows the calculation @eq-as-amplitude to complete, given $j=0$ and a trivial rearrangement left to the reader.

$
tan(phi) = frac((nu_4 + nu_1) - (nu_3 + nu_0) , 2 nu_2 (sin(frac(pi,5)) + sin(frac(2pi,5))) ) 
$ <eq-as-phaseangle>
$ 
nu_j = q cos(phi + frac(4pi,5)j)
$ <eq-as-amplitude>

// CP formalism
===== Cremer-Pople (CP) 
Two computational chemists built further on the concepts of quantifying the magnitude of the out-of-plane deviation of atoms in a cyclic molecule, as a basis for what constitutes puckering behaviour #mcite(("Cremer1975general"), biblio). 
To define the local elevation $z_j$ requires defining a plane going through the molecule itself. This plane is set as going through the geometrical center of the molecule, meaning that the plane should satisfy the sum of all the displacements be equal to zero ($sum z_j = 0$). 
@fig-fivering A. for furanoses and @fig-sixring A. for pyranoses depict the mean plane for the various puckering modes. 
From this follows another condition to satisfy that every mean plane constitutes a unique puckering mode (@eq-cp-cossinplane). 
$
sum^(N-1)_(j=0) z_j cos((2 pi j)/N) = 0 #h(2em) ; #h(2em) sum^(N-1)_(j=0) z_j sin((2 pi j)/N) = 0
$<eq-cp-cossinplane>

Computing for the set of displacements, by virtue of @eq-cp-cossinplane, we can define the mean plane by taking the cross product of $n = R' times R''$ (@eq-cp-crossplane). The $R_j$ parameter represents iterating over the atoms of the ring system.
$
R' = sum^(N-1)_(j=0) R_j sin((2 pi j)/N) #h(2em) ; #h(2em) R'' = sum^(N-1)_(j=0) R_j cos((2 pi j)/N)
$<eq-cp-crossplane>
 Setting the geometrical center of the ring to the origin of the cartesian coordinate system ($x,y,z$), we can apply the dot product of the normalised $n$ to every atom to get the displacements per atom ($z_j = R_j · n$).

The displacements $z_j$ are employed to calculate the actual puckering coordinates that define the CP formalism.
This leads to the generalisation of @eq-kilpatrick for any type of _odd_-membered cyclic molecule, where $N$ is equal to the amount of atoms in the ring and $m = (N-1)/2$ :  
$
q_m cos phi_m = sqrt(frac(2,N)) sum^(N-1)_(j=0) z_j cos(frac(2 pi m j, N)) #h(2em) ; #h(2em)
q_m sin phi_m = - sqrt(frac(2,N)) sum^(N-1)_(j=0) z_j sin(frac(2 pi m j, N))
$<eq-odd-membered>
We can @eq-odd-membered simplify for $N=5$: 
$
q_2 cos phi_2 = sqrt(frac(2,5)) sum^4_(j=0) z_j cos(frac(4 pi j, 5)) #h(2em) ; #h(2em)
q_2 sin phi_2 = - sqrt(frac(2,5)) sum^4_(j=0) z_j sin(frac(4 pi j, 5))
$<eq-cp-five-membered>
@eq-cp-five-membered gives us the puckering coordinates we can use to represented the abstracted conformation of a five-membered ring. The keen observer might have noticed the recurrence of the parameters $q$ and $phi$. It is because these values, or coordinate as we tend to denote them by, relate to the same semantics as with the AS formalism.
However, because the CP formalism is able to generalise the way it calculates the puckering of a cyclic molecule for any $n$-membered ring - as we will see later -, we denote the multitude of puckering parameters by an integer $m$. 
//
//
//
//
//
//
==== six-membered rings

#let content-sixring = [
The concept of pseudorotation is also ascribed to six-membered rings, and any $n$-membered ring for that matter where $n$ ≥ 4. The definition of puckering here is particularly important to us in the field of synthetic nucleic acids, as we are able to substitute the ribose moiety for another type of small molecule. This modification can bring about improved properties for pharmaceutical applications, as stated in Section 1.1 .
//Six-membered sugars, like glucose and derivatives, are conventionally considered in topics like glycosylation of protein residues and the Krebs cycle. As it stands, these molecules are often studied for their biochemical properties, like the former often being involved in interactions of antibodies with proteins on the surface of the cell.
//In our research, we desire to quantify the degree of puckering in order to measure differences in behaviour of the molecule.
A common modification is that of the Hexitol NA, an XNA with a backbone modification where a methylene (-CH#sub("2")-) is added between the oxygen and the anomeric carbon in DNA. This results in a sturdy modification that is able to pair well with RNA oligonucleotides and has the potential to function as a genetic biopolymer #mcite(("Lescrinier2000rnahna", "Groaz2023hna"), biblio).\
Like five-membered rings, these six-membered rings are categorised into different conformations. As an extra atom was added to the molecule, the dimensionality of the puckering has increased, resulting in five distinct puckering modes. The Chair (#super("Z")C#sub("W")) and Boat (B#sub("Z,W")) are most well known. Adjacent to the latter, we //encounter the _Skew_ configuration (#super("Z")S#sub("X")), also labeled a _half-boat_. As with the five-membered ring, the six-membered ring includes the _Envelope_ (E#super("Z")) and the _Twist_  (#super("Z")T#sub("Y")) in its repertoire. While the T-conformer is more commonly referred to as a _half-chair_, it makes much more sense to assign it as a _Twist_, as with both five- and six-membered rings this defines a configuration where two consecutive atoms are displaced out-of-plane in opposite directions.
]
#let figure-sixring = [
#figure(
  image("./figures/conformers/six-memberedring-conformation.svg", width: 100%),
  caption: [
    *A.* The five distinct conformers a six-membered ring can adopt: Twist, Envelope, Chair, Boat and Skew.
    *B.* Representation of the puckering modes of a six-membered ring, projected on the surface of the Cremer-Pople globe. The amplitude $q$ is abstracted as it is nearly constant for biologically relevant puckers #mcite(("Haasnoot1992sixrings"), biblio).
  ]
) <fig-sixring>
]

#grid(content-sixring, figure-sixring, columns: (1fr, 1fr), gutter: 1em) #v(-0.5em)
encounter the _Skew_ configuration (#super("Z")S#sub("X")), also labeled a _half-boat_. As with the five-membered ring, the six-membered ring includes the _Envelope_ (E#super("Z")) and the _Twist_  (#super("Z")T#sub("Y")) in its repertoire. While the T-conformer is more commonly referred to as a _half-chair_, it makes much more sense to assign it as a _Twist_, as with both five- and six-membered rings this defines a configuration where two consecutive atoms are displaced out-of-plane in opposite directions.
#intermezzo("Spherical conventions")[
The following definitions employ the physics convention for spherical coordinates ($r, theta, phi$), with $theta [0 arrow.r pi]$ and $phi [0 arrow.r 2pi]$. These differ from the mathematical convention as the latter swapped the meaning of $theta$ and $phi$. This information is relevant as projections onto a sphere, coming from a geographical perspective, use the mathematical convention.
]
//
// SP formalism
===== Strauss-Pickett (SP)
Considering the period at which this formalism was devised, in the 1970's, the reader must understand that conformations other than C and B evaded many scientists and remained strictly theoretical. This formalism deals not in puckering coordinates, but rather assigns a set of _internal_ coordinates: the set of improper dihedrals [ɑ#sub("1"), ɑ#sub("2"), ɑ#sub("3")] and the set of angles [β#sub("1"), β#sub("2"), β#sub("3")] #mcite(("Strauss1970conformational"), biblio). By these internal coordinates, it is possible to denote a specific conformation and even reconstruct the molecule itself.
As with Kilpatrick _et al._, this research made us of vibrational spectra involving angle bending and torsional parameters that are used to compute for the potential energy of the molecule itself. Through pseudorotational movement, the endocyclic angles vary and so will the potential energy. 

One key component to this formalism is the first usage of the spherical coordinates system ($r, theta, phi$) to represent a six-membered ring configuration. The three improper torsions can be solved for $j = 1, 2, 3$, in @eq-sp-sixring.
$
alpha_j = r [ cos theta + 2 [ cos(frac(4 pi j, 3) - frac(2pi,3) + phi )] sin theta]
$<eq-sp-sixring>
Here, a coordinate on a globe can reflect the puckering of a six-membered ring. This is a particularly convenient observation, as we recall that five-membered rings can be reflected by a set of polar coordinates. 
The rest of the research papers makes use of calculating the potential energy of a variety of conformations, by relating ring-bending parameters derived from vibrational spectra. The result is a Potential Energy Surface (PES) where we can observe transition states and energy difference in between the puckering modes in a single figure. 

//
// CP formalism
===== Cremer-Pople (CP)
Since the CP formalism is generalised to any $n$-membered ring, an extra coordinate is added to the set to formalise a _3-tuple_ ($q_2, phi_2, q_3$) for six-membered rings. As a sidenote, the relation for the amount of coordinates for a given ring system is $N-3$ in the CP domain. For _even_ ring systems, @eq-odd-membered applies up to $m = N/2$.
$
q_m = sqrt(frac(1,N)) sum^(N-1)_(j=0) z_j (-1)^j #h(2em) arrow.r #h(2em) q_3 = sqrt(frac(1,6)) sum^5_(j=0) z_j (-1)^j
$<eq-even-membered>
Fortunately for us, the authors understood the pragmatic implementation of the spherical coordinates. In a later chapter of the thesis, the CP formalism is implemented in the methodology of Conformation Sampling #mcite(("Mattelaer2021efficient"), biblio) and we refer to @eq-VirtueEquation and @eq-SoftwareEquation for converting the _3-tuple_ to the spherical system #mcite(("Cremer1975general", "Haasnoot1992sixrings"), biblio).

//!==== n-membered rings
//!_Not sure I am going to write anything here. Placehold for now, might delete OR add to this section later_
//!// CP formalism goes beyond, but let us just describe 4-membered and 7-membered rings.

==== Relations between CP and other formalisms
The fact that the CP formalism is applicable to all ring systems of a type $n$ ≥ 4, it makes it algorithmically interesting and concise to write a program that calculate the puckering coordinates of those molecules. Instead, the usage of AS for five-membered rings has been far more popularised in literature. There is little semantic difference in their applications #mcite(("Rao1981asvscp"), biblio), but the phase angle is shifted by roughly $frac(pi,2)$. The amplitude varies little between the five-membered ring formalisms.

Additionally, one can reconstruct the entire ring based on the given CP coordinates #mcite(("Cremer1990analytical"), biblio) for all ring systems. We can rearrange @eq-odd-membered and @eq-even-membered to return the local elevation per atom $z_j$ for either discussed ring system: 
$
z_j = sqrt(frac(2,N)) sum^((N-1)/2)_(m=2) q_m cos(phi_m frac(2 pi m j, N)) #h(2em) arrow.r #h(2em) z_j = sqrt(frac(2,5)) sum^2_(m=2) q_2 cos(phi_2 frac(4 pi j, 5))
$<eq-odd-locelevation>

$
z_j = sqrt(frac(2,N)) sum^((N)/2-1)_(m=2) q_m cos(phi_m frac(2 pi m j, N)) + frac(q_(N/2),N)  (-1)^j #h(1em) arrow.r #h(1em) z_j = sqrt(frac(1,3)) sum^2_(m=2) q_2 cos(phi_2 frac(4 pi j, 6)) + frac(q_3,6) (-1)^j
$<eq-even-locelevation>

@fig-cp-inversionprotocol below gives a simplified representation on how to invert CP coordinates to their original structure, which was analytically described by Cremer _et al._ #mcite(("Cremer1990analytical"), biblio).
#figure(
  image("./figures/cp_inversion.svg", width: 100%),
  caption: [
    Projection, partition and create segments for *A.* five-membered and *B.* six-membered rings.
    Align segments in the $x y$-plane for *C.* five-membered and *D.* six-membered rings.
    Add local elevation and align coordinates on mean plane *E.* five-membered and *F.* six-membered rings. The mean plane here is denoted by the sides $(R_1, R_2, R_3)$.
    Courtesy of M. Sega's documentation #mcite(("Sega2011inversion"), biblio) on GitHub (#link("https://github.com/Marcello-Sega/sugar-puckering")[github/Marcello-Sega/sugar-puckering])
  ]
)<fig-cp-inversionprotocol>

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

#pagebreak()
