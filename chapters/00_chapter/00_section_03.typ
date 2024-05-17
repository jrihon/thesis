#import "../../lib/multi-bib.typ": mcite
#import "../../lib/layout.typ": intermezzo
#import "../../lib/colours.typ": colourPalette
#import "bib_00_chapter.typ": biblio

#show "compchem": [Comp. Chem.]
#show "HamilSym": [$ℋ$]
#show "HamilOp": $accent(ℋ, "^")$
#show "FockOp": $accent(f, "^")$
== Fundamentals on the behaviour of molecules
#let content-nucleielectron = [
Now that we've touched upon the application potential of XNAs and discussed how we can geometrically characterise the molecules themselves, it is time to dig even deeper.
A molecule like a DNA nucleoside is simply a bunch of atoms grouped in such a way it became relevant to life on earth. When we magnify our view on atoms, we see that they are composed of a nucleus - protons and neutrons - and are cloaked by electrons.  
The field of Computional Chemistry (compchem) concerns itself with describing atoms and molecules by the positioning of the electrons around their nuclei. Asserting their probable whereabouts lets us calculate the energy of the molecular system. In other words, by looking at how the electrons behave in the vinicity of other electrons and the surrounding nuclei, we can eventually make predictions on how molecules interact with other molecules and their environment.
]

#let figure-nucleielectron = [
  #figure(
    image("./figures/nucleus-electron.svg", width: 100%),
    caption: [
      The nucleus contains protons (red) and neutrons (blue), with electrons 'flying' about the nucleus.
    ]
  ) <fig-nucleielectron>
]
#grid(content-nucleielectron, figure-nucleielectron, columns: (1fr, 0.35fr), gutter: 1em)
One of the pillars of Computational Chemistry is that of Quantum Mechanics (QM). This scientific field's main mission is to work with the Schrödinger equation in order to assess the properties of a molecule at their fundamental level. Since these calculations are extremely heavy on computational resources, we will also discuss the field of Molecular Mechanics (MM). The main difference is the timescale at which we study the molecules of interest. While QM studies an atomic system at an extreme depth by the positional snapshot, MM provides us with means to let molecules move about and interact with each other, giving us a realtime view of how they behave at a nanosecond ($10^(-9)$) to microsecond ($10^(-6)$) timescale. While these calculations are several order of magnitude faster, they bring along an accuracy penalty we incur in favour of the information we receive. In order for the simulated molecules to virtually move according to their behaviour observed in nature , we design _force fields_ to abstract and compact the information from QM and bring it over to MM.   
//Briefly, a force field makes it possible to compact the information from a molecule and use it for Molecular Mechanics (MM)studies. When employed, MM methodologies make it possible to move the molecules are efficiently and accurately, thereby allowing us to study interactions of i.e. small molecule drugs with their target protein. 
//==Computational Chemistry
//https://www.youtube.com/@TMPChem/videos
//
// Find the essence of QM -> What is the Schrodinger equation, what does it describe?
// ==> describe what orbitals are -> spherical harmonics
// ==> show these orbitals
//
//
// => We need to simplify in order to approximate
// ==> Approximate independently through theorems (variational theorem e.g.)
// ==> functional approximation, like HF, DFT, MP2
//
//
=== Quantum Mechanics
// Discuss some formal objects and notations for people to understand and interpret concepts in QM
The field of QM studies the principle that every particle, like electrons, has a _quantized_ amount of energy it carries. The goal is to be describe the total energy of a system by the energy of all the individual particles that compose the system itself.

==== Schrödinger's equation
This equation forms the foundation of all of compchem 
In @eq-base-schrodinger, we encounter Hamiltonian (HamilSym) which acts an operator over the wave function ($Psi$). This wave function describes the movement of the electrons in a system. In order to use this equation, it had to be accepted that at the _"quantum"_ level of such particles - like photons - they also behave themselves like waves.
On the righthand side of the equation, we find the energy $E$ which is the eigenvalue of the eigenfunction $Psi$. This just means that $E Psi$ can be evaluated to the most elementary form of the position of the electrons and this is associated with a discrete amount of energy, while $ℋ Psi$ allows us to express and calculate for the former. 
$
ℋ Psi = E Psi
$ <eq-base-schrodinger>
//This function gives us the $accent(ℋ, "^")$ operator, which describes the kinetic ($accent(T, "^")$) and potential ($accent(V, "^")$) energy of the system. We can further divide all this in blablabla
//The $Psi$ is the wave function of system. Squaring the wave function gives us the probability density of finding an electron within a normalised space ($Psi^2$).
//This is for one-dimensional and this is for three-dimensional. This represents an orbital, a volumetric space in which we are very likely to find the electron we are computing for.

#intermezzo("Operator")[ An operator is just a mathematical entity that takes in a group of values or a function and modifies it. For example, the _summation_ operator '+' is the transformation of adding N amount of values together to output a single value. Here, the HamilOp operator influences the outcome of the wave function $Psi$ by mapping a transformation over all the described electrons of the wave function to return the energy of the electrons.
]
When we expand on the HamilSym, we understand that it defines the kinetic ($T$) and the potential ($V$) energy of the system. 
$
accent("HamilSym", "^") = accent(T, "^") + accent(V, "^")
$ <eq-hamiltonian-simple>
The individual terms can be further expanded to the Schrödinger equation for a many-body system - meaning more than two electrons and more than two nuclei : 
$
accent("HamilSym", "^") = 
underbrace(
sum^(N_K)_(I=1) - frac(gradient^2_I , 2 M_I) 
+ sum^(n_e)_(i=1) - frac(gradient^2_i , 2) 
, "Kinetic Operator" accent(T, "^")
)
+
overbrace(
 sum^(N_K)_(I=1) sum^(n_e)_(i=1) frac(-Z_I, r_(i I)) 
+ sum^(n_e)_(i=1) sum^(n_e)_(j>i) frac(1, r_(i j)) 
+ sum^(N_K)_(I=1) sum^(N_K)_(J>I) frac(Z_I Z_J, R_(I J))
, "Potential Operator" accent(V, "^")
)
$ <eq-hamiltonian-full>
All uppercase parameters and subscripts pertain to the nuclei, the lowercase ones to the electrons.
The first term describe the kinetic energy of the movement of the nuclei, the second that of the electrons.
The latter three terms describe the potential energy of the atomic system. The first term describes the potential experiences between each nucleus and each respective electron. In other words, the interaction potential between the $I^(t h)$ nucleus and the $i^(t h)$ electron is evaluated. Since electrons are negatively charged and the nuclei are positively charged, this can be considered the attraction term.
The fourth term considers the pairwise evaluation of each electron with all the other electrons in the system. The fifth term does the same, but with nuclei instead. That is why we consider them the _electronic repulsion_ term and the _nucleic repulsion_ term respectively.
//
//

===== Zeeman effect
We have mentioned already that in the field of QM, we study the positioning of the electrons in the vinicity of other electrons and nuclei and try to calculate the energy ($E$) of the system. To be accurate, we must understand that the quantity of energy an electron can hold lies in a discrete spectrum. This means that electrons only emit photons after absorbing a set amount of energy, be that through heating or light, before releasing it into their environment.
#figure(
  image("./figures/orbitals/spectrum.svg", width: 100%),
  caption: [
    Illustrative example of a spectrum where an electron can absorb energy within most of the visible light spectrum, but can only emit packets of energy in at certain, discrete wavelengths. Furthermore, this behaviour changes when induced by a magnetic field.
  ]
) <fig-zeeman>
When subjecting electrons to a magnetic field however, we see that the discrete spectrum becomes split. As it turns out, the emitted spectra are what we consider to be degenerate and consist of multiple hidden layers that are observable under select conditions.

==== Orbital theory
===== Probability density
The wave function $Psi$ has the particular property that when taking its square $Psi^2$, we receive the probability distribution of the whereabouts of an electron within the x-direction ($x + d x$), under normalised conditions. This is formally done taking the complex conjugate ($Psi ^*$) of the wave function and apply the dot product to the wave function ($Psi$) itself. 
$
angle.l Psi bar.v Psi angle.r = integral^(+ infinity)_(- infinity) Psi^* (x) Psi (x) d x = 1
$
We can extend this to three dimensions and generalise for a set of electrons : 
$
angle.l Psi bar.v Psi angle.r = integral ... integral integral integral^(+ infinity)_(- infinity) Psi^* (x_1, y_1, z_1, x_2, y_2 ... z_N) Psi (x_1, y_1, z_1, x_2, y_2 ... z_N) d v_1 ... d v_N = 1
$ <eq-probability-allelectrons>
Where we integrate over the volume $v_N$ that describes the location ($x_N, y_N, z_N$) of an electron $e_N$.
Indeed, with this equation we can describe the chance of encountering an electron within a specific volume in space.
//One thing to keep in mind is that @eq-probability-allelectrons tells us that Vx 


//https://scipython.com/blog/visualizing-the-real-forms-of-the-spherical-harmonics/
//https://irhum.github.io/blog/spherical-harmonics/index.html
//
//https://en.wikipedia.org/wiki/Quantum_number
//https://en.wikipedia.org/wiki/Spherical_harmonics
===== Spherical harmonics
This specific volume in space in which the electron will likely appear in is tightly linked with the amount of energy the electron holds. As mentioned and illustrated through @fig-zeeman, the quantity of energy they carry lies in a discrete spectrum. While we've mainly regarded electrons in a Cartesian system ($x, y, z$), it will simplify the calculations tremendously if we were to represent the position of the electrons through a spherical coordinate system ($r, theta, phi$).

To represent the probable volume in which these electrons can appear in, we make use of a concept called _spherical harmonics_. These comprise of a set of orthonormal functions in with which we can represent the probability of finding an electron. Through a transformation of the coordinate system, we get : 
$
Psi (x, y ,z) => Psi (r, theta, phi) = 
overbrace(
R_(n, l) (r), "Radial component" 
)
+ 
underbrace(
Y_(l, m_l) (theta, phi), "Angular component" 
)
$
Only the angular component describes the spherical harmonics, while the radial component describes a dependence of the nucleic charge of the atom. This dependence describes why electrons of a Carbon will not visit the same discrete energy states as those of the Oxygen atom, even though spherical harmonics expand into the same orthonormal function for a given state ($n, l, m_l$). In other words, this radial component will differentiate into why an emission spectrum of the two atoms of a different element won't hold the same amounts of energy, at least not at the ground state.

//MAAK FIGUUR MET ENERGIE NIVEAUS AND SPHERICAL COMPONENTS
// Leg uit wat de quantum getallen zijn (n, l, m_l). Spin komt later pas aan bod bij de slater determinant
//

==== Solving the wave function $Psi$
Because the full equation @eq-hamiltonian-full can be so incredibly complex to numerically compute, researchers are always searching for ways to downsize an equation analytically in order to make the computational cost of solving it cheaper. The introduction of the _Born-Oppenheimer approximation_ is one paradigm that has faciliated research on atomic systems.

===== Born-Oppenheimer approximation
This simplification of the Schrödinger equation stems from the fact that the nucleus moves at a much slower pace than electrons do. This is because the mass of protons is roughly two thousand times larger than that of electrons. We can consider that in the timeframe in which the electrons travel a particular distance, the protons would remain stationary. Applying this principle of _frozen nuclei_ - frozen in space, mind you - we can analytically derive the _electronic Schrödinger equation_. 
$
accent("HamilSym", "^")_e = 
underbrace(
  0
+ sum^(n_e)_(i=1) - frac(gradient^2_i , 2) 
, "Kinetic Operator" accent(T, "^")
)
+
overbrace(
 sum^(N_K)_(I=1) sum^(n_e)_(i=1) frac(-Z_I, r_(i I)) 
+ sum^(n_e)_(i=1) sum^(n_e)_(j>i) frac(1, r_(i j)) 
+ C
, "Potential Operator" accent(V, "^")
)
$<eq-electron-schrodinger>
If we consider the nuclei at a standstill, this means their kinetic energy goes to zero as they portray no velocity. Since they do not move, we do not need to account for a change in positions of the nuclei with respect to their repulsion. In other words, we can safely assume that the nucleic repulsion term will not vary, therefor becoming a constant value. What we end up with is an analytical equation where we consider (i) the kinetic energy of the individual electrons (ii) the attraction of the electrons to the stationary nuclei (iii) the repulsion of the electrons with one another and lastly (iv) the repulsion of stationary nuclei - a constant value.

//
//
===== Many-body problem for electrons
Continuing this subsection, we need to highlight the fact that for a system with more than two electrons it is impossible to analytically solve the @eq-electron-schrodinger, even with the Born-Oppenheimer approximation. The main reason lies in the _electronic repulsion term_. 

Consider a set of electrons $S(e_1, e_2, e_3, e_4, ... e_N)$. While they move about freely, they experience repulsion from other electrons. This means that the momentum and position of $e_1$ depends on the movement and positions of ($e_2, e_3, e_4, ... e_N$), which goes for $e_2$ depending on ($e_1, e_3, e_4, ... e_N$) and so on. The problem becomes too convoluted, as there arise too many factors and variables to account for, for which we know no analytical solution to. This particular problem is generalisable to _classical mechanics_, where it even occupied the likes of Sir Newton with respect to the movement of celestial bodies.

If we cannot figure out the most probable position of an electron, it becomes to derive a good estimate of the electronic repulsion term.
Luckily, we can further approximate in order the equation so that we may nonetheless derive a value of $E$ that closely resembles the true state of $Psi$.
//https://newton.ex.ac.uk/research/qsystems/people/jenkins/mbody/mbody3.html
//impossible to solve because the behaviour of e1 depends on e2, e3... eN ; that of e2 on e1, e3 ... eN and so on. The equation knows no analytical solution, but can be numerically approximated, which is good enough.
//===== Variational theorem
//Because we approximate, we may never state that we can find the true ground state of a function
//
//Exchange symmetry : https://www.youtube.com/watch?v=aoL5SikmPz8
//
//

==== Hartree-Fock (HF)
One way to approximate this repulsion is by considering the idea that the electrons do move independently from one another. While in reality we know this to be false, this assumption makes for new equations that are easily solved numerically and approach the experimentally determined values of the $E$ rather well.

===== Basis sets
Before we touch on the actual HF method, we need to clarify what a basis set is. In compchem, it is necessary to define the atomic orbitals ($phi.alt_i$) to calculate for the potential energy of an electron, as the orbital defines its energy level. However, this would make it calculating for the position of the electron wildly more difficult than it has to be. Instead, we predefine a basis function ($chi_i$) that closely resembles the atomic orbital ($phi.alt_i$) already. These basis functions are described through an adaptation of the spherical harmonics and are finetuned for every element that the basis set comprises. This means that whenever we start a new computation, we can query the desired basis functions for a set of electrons and get already rather close to the most favourable shape of the atomic orbitals.
$
phi.alt_i = sum^b_(i=1) c_(i s) chi_i
$<eq-basisset>
@eq-basisset denotes that a linear combination of basis sets $chi_i$, with their respective coefficient $c_(i s)$, can define an atomic orbital. 

===== LCAO
Because we approximate to independent positioning of the electrons, we ultimately approximate the idea of what a molecular orbital ($psi_i$) is. By defining a hybridised orbital as a _Linear Combination of Atomic Orbital_ (LCAO) and add the contribution of their possible _overlap_ in atomic orbitals to the energy of the system. These _overlap integrals_ simulate as though the $phi.alt_i$ were actually hybridised into a $psi_i$.

$
psi_i = sum^(n_e)_(i=1) phi.alt_i
$<eq-LCAO>

===== HF equation

In @eq-basisset, we encounter the $c_(i s)$ coefficient to the basis sets. 
In the Hartree approach we need to optimise

The _Fock operator_ FockOp (@eq-h-fock) can be expanded to return us the 
$
accent(f, "^") phi.alt_i = epsilon.alt_i phi.alt_i
$<eq-h-fock>
//===== Roothaan-HF 
As such, the Roothaan basis set gave way for one of the first "commercialised" ways to robustly compute for molecular energy ($E$) of a system ($Psi$).
//When searching for an optimal solution for a given molecular system, we require a numerical approach to solve
//
//
//Solve one-electron operators $accent(f, "^")$ orbital $accent(phi.alt, "^")$ and make them not aware of each other. Problem is that we cannot guarantee that when we optimise the positions, that we are comparing against averaged positions of other electrons, meaning that we cannot exclude from two electrons existing in the same position. This would be impossible.
//

The one big caveat to the HF method is that it still do not explicitly concern itself with the positional relation amongst the electrons - the many-body problem -  but more about their average whereabouts in the orbitals. Remember, the orbitals are now linear combinations of optimised basis sets. The _two-electron integrals_ do account for a simulated electronic repulsion and exchange, but as these are with respect to an averaged position it comes with a philosophical problem. Since orbitals can overlap and the two-electron integrals deal with the averaged position, it cannot be excluded that at a certain timeframe some electrons would occupy the same point in space. This of course would negatively impact the energy of the system, as the repulsion term would contribute heavily as the distance between the two particles is _zero_, exploding the value of the coulombic term and negatively impacting the $E$. Nonetheless, the RHF has made a serious impact on the field of compchem for decades to come after its conception.

//===== Slater Determinants 
//A way to account for the HF method to account for the exchange functionals. Not coulombic, coulombic is better accounted for. This is a contribution, not an approximation.
//
//

==== Density Functional Theory (DFT)
//
//

==== Møller-Plesset Perturbation Theory (MPn)
//
//
//
//
//
//
//
//
//
//
//
=== Forcefields : the ultimate interface
The research carried out during this thesis has always employed the AMBER MD software package. As every Molecular Mechanics (MM) package has their specific interpretation on how to calculate the total energy (hamiltonian) of a system, we will confine the explanation to this scientific software package. 

Fundamentally speaking, the potential energy of a molecule (or a system in general) is defined by the relative positioning of the orbitals in a molecule. Because these computations already require heavy consumption of resources on systems larger than 25 atoms, performing simulations at this level is inconceivable. However, by abstracting atomic properties to classical mechanics concepts, we are able to reduce the expensiveness of the calculations.   

To encapsulate the essence of a standard Molecular Dynamics simulations, a set of molecules are spawned inside a virtually limitless box. The properties of the molecules are defined in several files located on the machine - the _force field_. These files supply the simulation engine with information on how the molecules are allowed to behave, and most important, restrict unfavoured behaviour. The engine itself is the program that lets the molecules move about, logs and corrects the motion of molecules.
The following expression (@eq-AMBER) describes how the position - or coordinates ($x,y,z$) - of the atoms in a system relates to the potential energy of this system.   
$
E#sub("amber") = E#sub("bondstretch") + E#sub("anglebend")  + E#sub("torsion") + E#sub("electrostatic") + E#sub("LJ")
$ <eq-AMBER>
//@eq-AMBER gives a brief overview of how AMBER's simulation engine derives the potential energy of a system.
The first three terms are defined as the bonded term interactions. All bonded interactions can be condensed to bonds (two), angles (three) and dihedrals (four), which are respectively composed of atoms linked together.
The final two are the nonbonded-term interactions, concerned with attractive and repulsive effects within and around the molecule and at least one dihedral away #mcite(("Cornell19952ndgenff"), biblio).
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
E_("bondstretch") = sum_("bonds") K_("r") (r - r_("eq"))^2 #h(1em) ; #h(1em) E_("anglebend") = sum_("angles") K_(theta) (theta - theta_("eq"))^2
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
The $q_i$ and $q_j$ parameters are the charges of the two atoms being evaluated and $r_("ij")$ is the distance between them. 
//
$
//E_("electrostatic") = sum_(i<j)  frac(e^2 q_("i")q_("j"), r_("ij"))
E_("electrostatic") = sum_(i<j)  frac(q_("i")q_("j"), r_("ij"))
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
#let content-lj = [
Atoms are not only interacting through attraction and repulsion based on fixed charges, but also experience these forces through instantaneous dipole moment. These are fleeting moment in which atoms can induce a dipole in other atoms, creating an momentary shift in repulsive force. This phenomenom is known as the _London dispersion_. Due to the 'cloud' of electrons cloaking the core of an atom, they portray an _atomic radius_ that sterically hinders other atoms from getting too close as these clouds repulse each other (@fig-lennardjones).
We often refer to @eq-lenardjones as the 12-6 potential.
]
#let fig-lj = [
  #figure(
    image("./figures/lennardjones-fig.svg", width: 100%),
    caption: [
      Lennard-Jones potential. X-axis is the distance between two atoms (Å), the y-axis is the potential energy between the two atoms (kcal/mol). There exists a 'sweet spot' where atoms favour eachother presence. This graph represents two oxygens that are respectively part of a hydroxyl group.
    ]
  ) <fig-lennardjones>
]
#grid(content-lj, fig-lj, columns: (1fr, 1.5fr), column-gutter: 1em)

$
E_("LJ") = sum_(i<j) epsilon_("ij") (frac(R_("min,ij"), r_("ij")))^12 - 2(frac(R_("min,ij"), r_("ij")))^6 
$ <eq-lenardjones>
Keeping consistent with the symbols, the $r_("ij")$ parameter represents the distance between the two atoms $i$ and $j$.
The $R_("min,ij")$ is the optimal distance between two atoms where, or in other words where the Lennard-Jones potential is at its minimum at a well depth $epsilon_("ij")$.
To give a physical representation, we think of the $R_("min,ij")$  and $epsilon_("ij")$ parameters as a link to Van der Waals radii of the atoms #mcite(("Li2015ljpotential", "Sengupta2021ljpotential"), biblio). 

  The first term computes for the repulsion between two atoms and the second term for the London dispersion forces. The $R_("min,ij") = R_("min,i") + R_("min,j")$ is calculated by the adding the two 'radii' together. The potential well depth is derived by $epsilon_("ij") = sqrt(epsilon_i epsilon_j)$. Both parameters are brought forth from the Berthelot-Lorentz combining rules.

//
//
//
//
//
//
===== Special cases for ions in nonbonded-term interactions
To account for ionic atoms, the nonbonded-term need specific revisions. For @eq-charges-in-amber, the valence of the ion is taken into account by the parameter $e$, relevant in multivalent ions like Mg#super("2+") and Fe#super("3+"). For the Lennard-Jones potential, ions represent a particular population of atoms that induce strong dipole moments in other atoms. To account for this, @eq-lenardjones is appended with a final term, making it the 12-6-4 potential. 
//The final term $ - frac(C_4, r_("ij"))$ is the ion-dipole interaction that should be accounted for to correctly represent then when interacting with organic compounds.
$
E#sub("electrostatic") = sum_(i<j)  frac(e^2 q_i q_j, r_("ij")) #h(1em) ; #h(1em) E#sub("LJ") = sum_(i<j) epsilon_("ij") ((frac(R_("min,ij"), r_("ij")))^12 - 2(frac(R_("min,ij"), r_("ij")))^6 ) - frac(C_4, r_("ij") #super("4"))
$ <eq-ions-nonbonded>
These additions are extremely important, as many biomolecular simulations are run using ions to simulate biological conditions.
//
//
//
//
//
//
//
//
//
// (TALK ABOUT THE HARMONIC POTENTIAL !!!)
// TALK ABOUT PARTICLE MESH EWALD METHOD !!!
=== Molecular Mechanics
//To encapsulate the essence of a standard Molecular Dynamics simulations, a set of molecules are spawned inside a virtually limitless box. The properties of the molecules are defined in several files located on the machine - the _force field_. These files supply the simulation engine with information on how the molecules are allowed to behave, and most important, restrict unfavoured behaviour. The engine itself is the program that lets the molecules move about, logs and corrects the motion of molecules.
==== Making the molecules move
While Quantum Mechanics approximates the Schrödinger equation to retrieve the potential energy of small molecules, Molecular Mechanics (MM) performs atomistic simulations that can handle thousands of atoms at a time. One way of applying this, is by carrying out a Molecular Dynamics (MD) simulation: a long and continuous calculation that is steered by the provided force field. The simulation part is because we attempt to recreate what happens to the molecules we want to study in real life. The virtual atoms are 'free' to move about and are left to make instantaneous interactions with the possibility of stabilising.
To correctly represent the movement of the atoms, MM makes use of classical mechanics to model the dynamic trajectory through Newton's equation of motion : 
$
f_i = m_i a_i #h(1em) arrow.r #h(1em) f_i = m_i frac(d^2 r_i, d t^2) = - frac(diff, diff r_i) U(r_1, r_2, ... r_N)
$ <eq-classnewtion>
The $r_i$ represent the $i#super("th")$ atom's position in cartesian space. The potential energy function $U(r_1, r_2, ..., r_N)$  calculates the potential based on those positions, for a total of $N$ particles #mcite(("Gonzalez2011ffandmd"), biblio).

@eq-classnewtion is a non linear second order differential equation that cannot be solved exactly. This is the reason why we need a numerical integrator that partitions the trajectory into small, discrete segments. Every segment is what is called a timestep, an amount of time spanning before and after the movement of the atoms. Because these particles are almost infathomably tiny, they move around quickly and therefor the timestep to observe their movement needs to be small as well; usually around 1 femtosecond ($10^(-12)$ s). 
When we discretise this equation, we essentially want to know the position of the atoms ($r_i$) as a function over the elapsed time ($t_0 + Delta t$) (@eq-discrete-numerical) (@fig-periodic A.).
$
r_i (t_0) #h(1em) arrow.r #h(1em) r_i (t_0 + Delta t) #h(1em) arrow.r #h(1em) r_i (t_0 + 2Delta t) #h(1em) arrow.r #h(1em) ... #h(1em) arrow.r #h(1em) r_i (t_0 + n Delta t) 
$ <eq-discrete-numerical>

//https://personal.math.ubc.ca/~CLP/CLP1/clp_1_dc/ssec_taylor_error.html
//https://www.algorithm-archive.org/contents/verlet_integration/verlet_integration.html
//https://www.youtube.com/watch?v=g55QvpAev0I
//https://www.quora.com/Why-arent-all-differential-equations-not-solvable
#intermezzo("Differential equations")[
What makes @eq-classnewtion non linear is that the variable $m_i$ - the mass of the $i#super("th")$ atom - acts as a coefficient on the second order derivative, whereas a constant value would make it linear. 
What makes it analytically unsolvable is that we cannot write this equation as a linear combination of elementary functions; i.e. a possible linear combination of polynomial and logarithmic functions. To return values for the potential energy however, we have to integrate the function and solve per each timestep of motion - a numerical solution. This is computationally less efficient but gets the job done.
]

To make this workable, we can make use of a Taylor expansion by: 
$
r_i (t_0 + Delta t) = r_i (t_0) + frac(d r_i (t_0),d t) Delta t + frac(1,2) frac(d^2 r_i (t_0),d t^2) Delta t^2 + frac(1,6) frac(d^3 r_i (t_0),d t^3) Delta t^3+ 𝒪 (Delta t^4)
$ <eq-taylorexpansion-motion>
Which is just the _kinematic's equation of motion_ : 
$
r_i (t_0 + Delta t) = r_i (t_0) + v_i (t_0) Delta t + frac(1,2) a_i (t_0) Delta t^2 + frac(1,6) b_i  Delta t^3+ 𝒪 (Delta t^4)
$ <eq-kinematicsmotion>
#intermezzo("Taylor series")[
As some differential equations cannot be analytically solved, we search to approximate the polynomial function. Every approximation has a slight error margin. In Taylor expansions, this is denoted by the $𝒪(Delta t^4)$ term for this particular expression. The error here is a function of the timestep $Delta t$, meaning if we take our step small enough, we should be able to reasonably calculate for the next positions of the atoms.
]
Here is where the _Verlet integration_ comes in. In order to computationally optimise the equation to get the $r_i$ at timestep $t_0 + Delta t$, we determine the equations at the next ($+ Delta t$) and the previous ($- Delta t$) timestep and sum them up.
$
r_i (t_0 + Delta t) = r_i (t_0) + frac(d r_i (t_0),d t) Delta t + frac(1,2) frac(d^2 r_i (t_0),d t^2) Delta t^2 + frac(1,6) frac(d^3 r_i (t_0),d t^3) +  𝒪 (Delta t^4)\

r_i (t_0 - Delta t) = r_i (t_0) - frac(d r_i (t_0),d t) Delta t + frac(1,2) frac(d^2 r_i (t_0),d t^2) Delta t^2 - frac(1,6) frac(d^3 r_i (t_0),d t^3) +  𝒪 (Delta t^4)\
  arrow.b.double \
$ <eq-verlet-sum>
$
r_i (t_0 + Delta t) = - r_i (t_0 - Delta t) + 2 r_i (t_0) + frac(1,2) frac(d^2 r_i (t_0),d t^2) Delta t^2 +  𝒪 (Delta t^4) 
$ <eq-verlet-integration>
If we substitute for the acceleration term, we get :
$
r_i (t_0 + Delta t) = - r_i (t_0 - Delta t) + 2 r_i (t_0) + a_i (t_0) Delta t^2 +  𝒪 (Delta t^4)  
$ <eq-verlet-integration-simp>
As it turns out, summing both equations in @eq-verlet-sum and analytically solving for $r_i (t_0 + Delta t)$ cancels out the velocity and the jerk.
The neat part is that when we actually calculate for the next position (@eq-verlet-integration), we can already fill in $r_i (t - Delta t)$ as this has just been computed in the previous timestep.
This means that whenever we need to calculate the next position of the atoms, we only need to current position $r_i$, a precomputed previous position $r_i (t_0 - Delta t)$ and the current acceleration $a_i$ (@eq-verlet-integration-simp).

Whenever we start a Molecular Dynamics simulation, we have to account for the fact that $r_i (t - Delta t)$ and $a_i$ cannot be solved as no time has elapsed just yet. To accomodate, these parameters are filled in by the _random seed_ of the computer's system. As such, an estimate is passed to the simulation engine to start off the actual simulation.

==== Periodic boundaries
When an MD experiment starts, the atoms of the system are spawned inside a virtual box. Employing an enclosed box with boundaries upon which the atoms would collide with will impact the course of motion of all atoms in the system. To circumvent this problem, periodic boundaries are implemented. This benefits the engine as it does not need to account for atoms wandering off into infinity - this would cause a simulation to crash anyway - and this simplifies keeping the modelled pressure and temperature constant during the experiment. To clarify this last part, we account for environmental factors to properly model the kinetic energy of a system, which impacts the total energy.  

We can make an analogy of these periodic boundaries to the 1980's Japanese retro game Pac-man. When playing, we can teleport from to right side to the left and vice versa to evade to ghosts. This is the same with atoms, whenever an atom goes out-of-bounds, it is spawned on the opposite side of the box.
#figure(
  image("./figures/periodicbounds.svg", width: 100%),
  caption: [
    *A.*  The potential energy as a function of time. Every timestep $Delta t$, the atoms incrementally shift positions and the energy is re-evaluated by the parameters queried from the force field. Future timesteps need to be calculated to estimate the potential.
    *B.* Periodic boundaries where the movement of an atom is not limited by the box it is spawned it. 
  ]
) <fig-periodic>
==== Computational optimisations to MD simulations
These calculations require quite the resources to run, especially considering the fact that these calculations have been around since at least the 1980's. To give some perspective, computers only had a single core CPU with a memory capacity (RAM) of 512 KiB to roughly 2MiB at best. Nowadays, my five-year old laptop has six cores and a RAM capacity of about 12 GiB - 6000 times more than a common household personal computer of that time. Presumably, a computational lab would have slightly better resources. 

Being efficient with storing data in memory and downsizing the amount of calculations needed for the entire simulation was a necessity. There are several ways to do so that are still of use in today's time : 

//
//
// https://computecanada.github.io/molmodsim-md-theory-lesson-novice/02-Fast_Methods_to_Evaluate_Forces/index.html
===== Verlet list
Computing the bonded-term interactions is a given, but having to calculate the pairwise interaction potential (@eq-charges-in-amber, @eq-lenardjones) between atom#sub("i") and all other atoms in the system would be a gargantuan task and beyond a certain distance this would garner negligible additions to the potential.
To remedy this, a simulation employs a cut-off distance at which the non bonded-terms are not evaluated anymore. This is formalised by the _Verlet list_.

Suppose we set the cut-off distance $d_c$ at 10 Å from atom#sub("i") and a buffer distance $d_b$ at an additional half of $d_c$. Every iteration, a distance check is in place before evaluating the terms. If an atom#sub("j") strays further than 15 Å, the Verlet list for that atom#sub("i") is re-evaluated to include a new set of atoms within 10 Å.
While this requires some additional RAM to store the lists in, a table lookup is much faster than evaluating all the atoms in the system on every iteration considering the euclidian distance is just $d = sqrt((x_i - x_j) + (y_i - y_j) +(z_i - z_j))$.
//While this requires some additional RAM to store the lists in, a table lookup is much faster than evaluating all the atoms in the system on every iteration considering the euclidian distance is simply calculated by $d = sqrt((x_i - x_j) + (y_i - y_j) +(z_i - z_j))$ 

//
//
===== Particle Mesh Ewald (PME)
//https://murillo-group.github.io/sarkas/theory/PPPM.html
//https://computecanada.github.io/molmodsim-md-theory-lesson-novice/aio/index.html#particle-mesh-ewald-pme
This method is particularly applied to electrostatic interactions between atoms that make use of Periodic Boundary Conditions (PBC) (@fig-periodic B.), where the system's net charge is equal to zero.
The method differentiates two types of $E_("electrostatic")$ , namely the short-range ($E_("direct")$) and the long-range ($E_("reciprocal")$).
The $E_("direct")$ just employs the regular charge calculation (@eq-charges-in-amber), which is a pairwise computation between the nearest atoms based off the Verlet list we just discussed. To not dramatically increase the time complexity of the calculation, the long-range term exploits the Particle Mesh Ewald method to compute the $E_("reciprocal")$ for all atoms just one time per timestep. This greatly reduces the time spent calculation for electrostatic interactions, the nonbonded-term dominant in determing the potential.
//https://www.quora.com/What-is-Ewald-summation-and-why-is-the-Particle-mesh-Ewald-approach-a-good-one

To give some insight into the problem, the PBC require us to evaluate the charges in a pairwise fashion for atoms in neighbouring "boxes" to properly account for long-range interactions. This would cause an immense amount of time to iterate over every atom and over every pair of the respective atoms. 
With the Particle Mesh method, we can discretise the point charges of the molecular system onto a grid with equidistributed vertices. Applying the Fast Fourier Transform (FFT), we get an analytical approximation to the charge distribution of the system, in the form of Gaussian curves. These functions are then used by the Ewald Summation Formula (EWF) to return the potential energy for longe-range electrostatics.

#figure(
  image("./figures/particlemesh.svg", width: 100%),
  caption: [
    For a 2D distribution of atomic charges, we overlay a mesh (or commonly a grid) on the field. We then distribute the charges evenly on the gridpoints. With this discrete distribution of points, we can apply the FFT to get an analytical solution to the charge distribution. With the analytical charge distribution, we can derive the potential energy of the electrostatic potential for the $E_("reciprocal")$. \
    _Nota bene_, this is a 2D representation of the PME protocol. The Q#sub("magnitude") just gives a visual to the analytic function. In reality we deal with 3D molecular systems and thus a three dimensional FFT.
  ]
) <fig-pme-fft>
The explanation might seem unclear as to why this methodology is more efficient, but this is because the FFT is so incredibly powerful. For some background, the FFT algorithm is used in all fields of engineering due its proven efficiency. A previous application of the PME method (the particle-particle particle mesh algorithm, P#super("3")M) scaled at an exponential time complexity $O(N^2)$, meaning it slowed down when introducing more atoms to the system. The PME method scales at a linear rate $O(N log(N))$ per increasing amount of particles. 

The Ewald method is a way to compute for the potential in a periodic system using the charge distribution, derived from the _Poisson summation formula_, and was specifically derived to calculate the potential energy of an ionic crystal lattice system.
The inners of the EWF and by extension the Poisson Summation Formula involve complex mathematics are beyond the scope of this thesis.
#mcite(("Darden1993pmemd", "Essmann1995spme"), biblio)

#intermezzo("Fast Fourier Transform (FFT)")[
The FFT is the algorithm that supports calculating the Discrete Fourier Transform.
This is necessary to apply to get an analytical approximation, meaning an equation consisting of cosine and sine functions and the coefficients to those wave functions, to the discrete distribution of the charges on the mesh.
We will then pass this analytical approximation to the Ewald Summation Formula to calculate the potential of the charge distribution of the entire field.
]
//
//
//===== Graphics Unit Processor (GPU) acceleration
//
//
//
//
//
//
//
=== Modeling Synthetic Nucleic Acids
// ===== Searching for parameters of XNA
// ===== Acquiring models for simulations
// ===== Pitfalls in current methods for modeling (do not use antechamber to generalise torsion angles)
// Using generalised forcefield parameters to represent the behaviour nucleic acids is something unfortunately common in the academic field. Where this forcefield should be applied to facilitate simulation studies on small molecules, for example understanding how drugs interact with their protein, the error in these parameters are often very tolerable due to the small size of the molecule.
// Introducing unrepresentative parameters in monomers that make up the polymer will result in either an unstable structure or unrepresentative one, as the error propagates in every residue of the model.
#lorem(50)

