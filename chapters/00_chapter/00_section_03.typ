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
The research carried out during this thesis has always employed the AMBER MD software package. As every Molecular Mechanics (MM) package has their specific interpretation on how to calculate the potential energy (hamiltonian) of a system, we will confine the explanation to just the utilised scientific software package. 
$
E#sub("amber") = E#sub("bondstretch") + E#sub("anglebend")  + E#sub("torsion") + E#sub("electrostatic") + E#sub("VdW")
$ <eq-AMBER>
#lorem(40)
//
//
//
//
//
//
//
==== Bonded-term parameters
===== Bond stretching and angle bending

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
As Molecular Mechanics rests on principle of classical mechanics, the way a bond between two atoms and an angle between three atoms can be represented through the newtonian potential energy equation (@eq-ballspring), commonly referred to as _ball-spring_ model. Here, the _K#sub("r")_ and _K#sub(math.theta)_ refer to the _stifness_ of the spring that connects the atoms. Like a spring, the interacting atoms are allowed to vary around their equilbrium value, respectively _r#sub("eq")_ and _θ#sub("eq")_ .  Bondlength stretching and angle bending parameters were originally derived from spectroscopy data and have remained mostly unchanged since they were establish-// 
]
#grid(fig-bondangle, content-bondangle, columns: (1fr, 1fr), gutter: 1em)

#v(-0.4em)
ed. This especially holds true for ground-state organic molecules. 
//
//
$
E#sub("bondstretch") = sum_("bonds") K#sub("r") (r - r#sub("eq"))^2 #h(1em) ; #h(1em) E#sub("anglebend") = sum_("angles") K#sub(math.theta) (theta - theta#sub("eq"))^2
$ <eq-ballspring>
//
//
//
//
//
//
//
===== Fitting torsional parameters
//https://en.wikipedia.org/wiki/Fourier_series
Describing the dihedral or torsion angle in a set of four atoms is perhaps the most complicated part of creating a force field that perfectly approximates molecular realism.  
A dihedral is defined as the angle ($phi$) which is the result of two planes intersecting (@fig-torsionexplain A.). 
//
//
#figure(
  image("./figures/dihedraltorsions.svg", width: 100%),
  caption: [
    *A.* First plane (blue-greyish) consist of the set [d#sub("1"), d#sub("2"), d#sub("3")], the second plane (grey) contains the set [d#sub("2"), d#sub("3"), d#sub("4")]. One way to think of dihedrals is that the middle bond (d#sub("2")-d#sub("3")) is that one that rotates.
    *B.* 
  ]
) <fig-torsionexplain>

#lorem(30)
$
E#sub("torsion") = sum_("dihedrals") frac(V#sub("n"), 2) [1 + cos(n phi - gamma)]
$
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
An additional procedure to these derived charges is the application of the Restraintive ESP (RESP) protocol #mcite(("Bayly1993resp"), biblio). This protocol is necessary to equate semantically similar atoms, like the hydrogens (HN41, HN42) in the amine of the purine. Also restraints to account for buried atoms. Due to the grid being defined by the surface, atoms like the carbons in the methylene moieties (-CH#sub("2")-) of the morpholino ring will be underrepresented, since they are shadowed by their hydrogens. Restraining these _degenerate hydrogens_ will balance out the result. Upon completing the scheme, the user is returned with discrete values for all the atoms in the system.

Other charge derivation schemes, like CHELPG and CHELMO differ grid generation (like cubic grids) and the applied basissets and functionals used #mcite(("Sigfridsson1998ComparePAschemes"), biblio).

//
//
//
//
//
//
//
===== Lennard-Jones potential

$
E#sub("VdW") = sum_(i<j) (frac(A#sub("ij"), R#sub("ij")^12) + frac(B#sub("ij"), R#sub("ij")^6))
$

//
//
=== Molecular Mechanics
#lorem(50)

==== Applications of Molecular Dynamics
#lorem(20)

=== Modeling Synthetic Nucleic Acids
// ===== Searching for parameters of XNA
// ===== Acquiring models for simulations
// ===== Pitfalls in current methods for modeling
#lorem(50)

