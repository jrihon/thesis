#import "../../lib/multi-bib.typ": mcite
#import "../../lib/colours.typ": colourPalette
#import "bib_00_chapter.typ": biblio


== Fundamentals on the behaviour of molecules
//== Computational Chemistry

//
//
=== Quantum Mechanics

==== Mathematical lore
#lorem(20)
// Discuss some formal objects and notations for people to understand and interpret concepts in QM

==== Semi-empirical methods
#lorem(20)

==== _Ab Initio_ methods
#lorem(20)

//
//
=== Forcefields : the ultimate interface
The research carried out during this thesis has always employed the AMBER MD software package. As every Molecular Mechanics (MM) package has their specific interpretation on how to calculate the total energy (hamiltonian) of a system, we will confine the explanation to this scientific software package. 

Fundamentally speaking, the potential energy of a molecule (or a system in general) is defined by the relative positioning of the orbitals in a molecule. Because these computations already require heavy consumption of resources on systems larger than 25 atoms, performing simulations at this level is inconceivable. However, by abstracting atomic properties to classical mechanics concepts, we are able to reduce the expensiveness of the calculations.   

To encapsulate the essence of a standard Molecular Dynamics simulations, a set of molecules are spawned inside a virtually limitless box. The properties of the molecules are defined in several files located on the machine - the _force field_. These files supply the simulation engine with information on how the molecules are allowed to behave, and most important, restrict unfavoured behaviour. The engine itself is the program that lets the molecules move about, logs and corrects the motion of molecules.
$
E#sub("amber") = E#sub("bondstretch") + E#sub("anglebend")  + E#sub("torsion") + E#sub("electrostatic") + E#sub("VdW")
$ <eq-AMBER>
@eq-AMBER gives a brief overview of how AMBER's simulation engine derives the potential energy of a system.
The first three terms are defined as the bonded term interactions. All bonded interactions can be condensed to bonds (two), angles (three) and dihedrals (four), which are respectively composed of atoms linked together.
The final two are the non-bonded term interactions, concerned with attractive and repulsive effects within and around the molecule.
While the simulation runs, the atoms move within their bounds. Every shift in movement, all atoms in the system take a slightly different position within the box. Bad movements get penalized, while good movements are left as is. Deciding on the alignment of a movement depends on the results of @eq-AMBER.
//
//
//
//
//
//
//
==== Bonded-term parameters
===== Bond stretching and angle bending
As Molecular Mechanics rests on principle of classical mechanics, a bo-
#v(-0.4em)
#let fig-bondangle = [#figure(
  image("./figures/bondlength-and-bondangle.svg", width: 100%),
  caption: [
    Red arrows signify motion in a particular direction. \
    *A.* Bond stretching: An atomic bond can be compressed or drawn out and will be biased towards a length where the atoms a#sub("1") and a#sub("2") are in equilibrium with one another ($r#sub("eq")$).
    *B.* Angle bending : the atoms b#sub("1") and b#sub("3") can rock back and forth, while remaining tied to b#sub("2"). The equilibrium angle ($theta#sub("eq")$) assigns the equilibrium of the three atoms in which they are allowed to exist.
  ]
) <fig-bondsangleparams>
]
#let content-bondangle = [
nd between two atoms can be represented through an adapted newtonian potential energy equation (@eq-ballspring), commonly referred to as _ball-spring_ model. Here, the _K#sub("r")_ refers to the _stifness_ of the spring that connects the atoms. Like a spring, the bond between two atoms, here a#sub("1") and a#sub("2"), can compress and stretch ever so slightly.
They are allowed to vary around
their equilbrium value (_r#sub("eq")_), meaning they constantly dance around a// set distance, a length defined by the force field (@fig-bondsangleparams A.). Angle bending is little different from bond stretching, but involves a semantic spring between two atoms, b#sub("1") and b#sub("3"), being indirectly linked 

]
//and _K#sub(math.theta)_
// and _θ#sub("eq")_ 
//and angle bending 
#grid(fig-bondangle, content-bondangle, columns: (2fr, 1fr), gutter: 1em)

#v(-0.4em)
set distance, a length defined by the force field (@fig-bondsangleparams A.).
$
E#sub("bondstretch") = sum_("bonds") K#sub("r") (r - r#sub("eq"))^2 #h(1em) ; #h(1em) E#sub("anglebend") = sum_("angles") K#sub(math.theta) (theta - theta#sub("eq"))^2
$ <eq-ballspring>
Angle bending is little different from bond stretching, but involves a semantic spring between two atoms, b#sub("1") and b#sub("3"), being indirectly linked through b#sub("2"). The _K#sub(math.theta)_ parameter defines the rigidity of this particular spring, which hovers around the equilbrium angle _θ#sub("eq")_.
These parameters are originally derived from spectroscopy data and normal mode analysis, but can also be retrieved from NMR and _ab initio_ computations, and have remained relatively stable since they were established #mcite(("Cornell19952ndgenff", "Wang2004GAFF"), biblio). This especially holds true for ground-state organic molecules. 
 
//
//
//
//
//
//
//
//
//
===== Fitting torsional parameters <sec-intro-dihedrals>
//https://en.wikipedia.org/wiki/Fourier_series
Describing the dihedral or torsion angle in a set of four atoms is perhaps the most complicated aspect of creating a force field that approximates molecular realism.  
A dihedral is defined as the angle ($phi$) by which two planes intersect (@fig-torsionexplain A.). As a trigonometric axiom states that three points define a plane, two planes can be defined from a set of four directly bonded atoms. 
A dihedral's importance lies in the 1-4 interaction it makes. In other words, the atoms d#sub("1") and d#sub("4") in the dihedral set are directly correlated with establishing a part of the potential energy. This is mainly asserted through their steric hindrance, which is the result of a combination of the effects of (i) the radii of the various atoms, (ii) types of hybridisation in the set (which define bondlength and angles) and eventually (iii) the dihedral angle $phi$.
//
#figure(
  image("./figures/dihedraltorsions.svg", width: 100%),
  caption: [
    *A.* First plane (blue-greyish) consist of the set [d#sub("1"), d#sub("2"), d#sub("3")], the second plane (grey) contains the set [d#sub("2"), d#sub("3"), d#sub("4")]. One way to think of dihedrals is that the middle bond (d#sub("2")-d#sub("3")) is that one that rotates.
    *B.* The difference in potential energy (y-axis) according to the change torsion angle $phi$ (x-axis). This depicts four consecutive carbon atoms, all sp#super("3")-hybridised. Angle expressed in radians ($pi$). To clarify, atom d#sub("2") is being eclipsed by d#sub("3"), as we are faced directly onto the middle bond of the dihedral.
  ]
) <fig-torsionexplain>
//
$
E#sub("torsion") = sum_("dihedrals") frac(V#sub("n"), 2) [1 + cos(n phi - gamma)]
$ <eq-torsions>
//
@fig-torsionexplain B. is to be understood alongside @eq-torsions. The change of potential as a result of torsional rotation is defined through Fourier series #mcite(("Kania2021Fouriertorsion"), biblio). Fourier series are composed of multiple periodical functions and our torsion terms are no different.
@eq-torsions describes the _force constant_ ($V_n$) which defines the height of the amplitude, the _multiplicity_ ($n$) defines the amount of minima in the continuous function and ($gamma$) is the _phase_ of the function. The $phi$ angle here is the empirical dihedral angle.
 For example, the resultant periodic in @fig-torsionexplain B. is the summation of the following periods :
$
#text(fill: rgb("#CD827B"))[$E#sub("dihedral")$] #h(1em)= #h(1em)
#text(fill: rgb("#0A404D"))[$0.13 [1 + cos(3phi - 0)]$] #h(1em)+ #h(1em)
#text(fill: rgb("#4B90A2"))[$0.29 [1 + cos(2phi - pi)]$] #h(1em)+ #h(1em)
#text(fill: rgb("#81BDCC"))[$0.11 [1 + cos(1phi - 0)]$]
$
This is the typical profile of a (-CH#sub("2")-CH#sub("2")-CH#sub("2")-CH#sub("2")-) dihedral #mcite(("Wang2004GAFF"), biblio).
The figure tells us that when the atom d#sub("4") eclipses d#sub("1"), synonymous with a _cis configuration_, the potential rests at a local minimum. By increasing $phi$, we give a slight rise to the potential because d#sub("4")'s hydrogen atoms are hindering vicinal atoms, causing an unfavourable predicament ($plus.minus frac(2pi,3)$). The system will want to strive for a minimum, which can be achieved by visiting the _trans configuration_, at $phi = pi$. Since the molecule is symmetrical in nature, increasing the torsion angle to $2pi$ will see the potential go through the same changes, ending at a full rotation of the angle $phi$.

By populating a force field with suitable parameters for $V_n$, $n$ and $gamma$ pertaining the specific dihedrals, we can evaluate any rotation of the torsional angle occurring during a Molecular Dynamics simulation.
//
//
//
//
//
==== Non-bonded term parameters
// Molecular Orbitals = LCAO (atom orbitals - ϕ)
// Charges are a way to quantitatively compute for dipole moments -> hydrogen bridges, london dispersion
// There are multiple ways, like Mulliken en Lowdin.
// Also Merz-Kollman, CHELPG, CHELMO and stuff ...
// How does Merz work, show the figure and yeah
// Say that ORCA's vpot works by using the orbital densities from QM and effectively uses the functions in order to return ESP values on the respective gridpoints.
===== Point charge derivation
From the field of QM, we know that the charge distribution of atoms in a molecule can be described through the MO functions. Exploiting the information on orbitals directly would prove extremely inefficient when going into classical mechanics. This is because movement of the molecule during the simulation would need constant reevaluation of the orbitals, in order to calculate the dipole moment between two respective atoms. Instead, an abstraction is applied by designing point charges. This type of charge is uniform across the atom and static during the simulation, meaning the value of the charge is queried from the force field instead of a continuous calculation of the specific parameter, which is an extreme gain in computational efficiency. @eq-charges-in-amber describes pairwise energy evaluation between atoms involved in intra- and intermolecular interactions.
//
$
E#sub("electrostatic") = sum_(i<j) frac(q#sub("i")q#sub("j"), epsilon R#sub("ij"))
$ <eq-charges-in-amber>
//
Deriving point charges from quantum mechanical information is done by population analysis (PA) schemes. Most famous are the Mulliken and Löwdin PA schemes #mcite(("Mulliken1955", "Lowdin1950"), biblio), whose applications are to directly use orbital density to fit charges onto the molecule #mcite(("Sigfridsson1998ComparePAschemes"), biblio).
In MM applications however, the PA schemes take on a different approach. In protocols like Merz-Kollman (MK) and CHELPG, charges are least-squared fitted onto the atoms from Electrostatic Potential (ESP) data. This data is gathered from mapping the orbital information, which calculate potential energy by passing $(x,y,z)$-positioning to the function, onto a defined grid. 
The MK scheme is the protocol used for AMBER-compatible force fields (@fig-mkscheme). 
#figure(
  image("./figures/chargederivation/MK-charge-derivation.svg", width: 100%),
  caption: [
    Data retrieved from ORCA-implementation of the MK scheme, written by Jérôme Rihon.
    *A.* The morpholino adenosine molecule that will be subjected to a charge derivation.
    *B.* The SAS is determined by the prompted atomic radii. Multiple layers of this surface are generated, returning us with a grid.
    *C.* Orbital density information is mapped onto this grid, which makes the ESP data we need.
    *D.* The ESP is fitted onto the atomic to form atomic point charges.
  ]
) <fig-mkscheme>
The surface around the molecule is defined by the Connolly algorithm #mcite(("Connolly1983SASA"), biblio), which asserts the Solvent-Accesssible Surface (SAS) around the molecule. By modifying atomic radii by a respective factor of 1.4, 1.6, 1.8 and 2.0, a grid is defined that encloses the molecule (@fig-mkscheme B.). 
From the QM side, a calculation is carried out at the HF/6-31G\* level. The information on the orbital density from this calculation is mapped onto the grid, assigning a potential energy to every grid point (@fig-mkscheme C.). This energy will be determined by the presence, or conversely the absence, of electrons in that particular volume. 
By fitting the ESP, using the _Chirlian-Francl_ least-squared fitting procedure, we derived ESP-based partial charges #mcite(("Chirlian1987fit"), biblio) (@fig-mkscheme D.). 
An additional procedure to these derived charges is the application of the Restraintive ESP (RESP) protocol #mcite(("Bayly1993resp"), biblio). This protocol is necessary to equate semantically similar atoms, like the hydrogens (HN41, HN42) in the amine of the purine. Also restraints to account for buried atoms. Due to the grid being defined by the surface, atoms like the carbons in the methylene moieties (-CH#sub("2")-) of the morpholino ring will be underrepresented, since they are shadowed by their hydrogens. Restraining these _degenerate hydrogens_ will balance out the result. Upon completing the scheme, the user is returned with point charges for all the atoms in the system.

Other charge derivation schemes, like CHELPG and CHELMO differ in protocol like grid generation (like cubic grids) and the applied basissets and functionals used #mcite(("Sigfridsson1998ComparePAschemes"), biblio).

//
//
//
//
//
//
//
===== Lennard-Jones potential

#lorem(50)
$
E#sub("VdW") = sum_(i<j) (frac(A#sub("ij"), R#sub("ij")^12) + frac(B#sub("ij"), R#sub("ij")^6))
$

//
// TALK ABOUT THE HARMONIC POTENTIAL !!!
=== Molecular Mechanics
#lorem(50)

==== Applications of Molecular Dynamics
#lorem(20)

=== Modeling Synthetic Nucleic Acids
// ===== Searching for parameters of XNA
// ===== Acquiring models for simulations
// ===== Pitfalls in current methods for modeling
#lorem(50)

