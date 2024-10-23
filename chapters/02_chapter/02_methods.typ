#import "../../lib/multi-bib.typ": mcite
#import "bib_02_chapter.typ": biblio

== Methods

//
//
//
//
//
//
//
=== Characterisation of the nucleosides through quantum mechanics
The conformational sampling method has been previously reported and applied on DNA, RNA, HNA and dXyNA, in Mattelaer _et al._ #mcite(("Mattelaer2021efficient"), biblio). For MNA, the Cremer-Pople (CP) coordinates can be reversed engineered to Strauss-Pickett (SP) improper dihedrals (#link("https://github.com/Marcello-Sega/sugar-puckering")[github.com/Marcello-Sega/sugar-puckering]), by generating equidistributed coordinate points on the surface of a sphere 
#mcite(("Deserno2004generate"), biblio).
The generated spherical coordinates ($r$, $theta$, $phi$) are converted to local elevation (z#sub("j")) from a mean plane per respective atom #mcite(("Cremer1975general"), biblio), by assuming bond lengths and angles, which positions the atoms in the ring in cartesian space. From the atomic coordinates, the improper dihedrals ($alpha_1$, $alpha_2$, $alpha_3$) can be calculated for #mcite(("Strauss1970conformational"), biblio). Graphical representations of these formalisms have been added (@fig-sixring, @fig-spimpropers).
These improper dihedrals are used as restraints for the ORCA software (v. 5.0.2) #mcite(("Neese2020orca"), biblio). Several backbone torsion angles were restrained as follows : $beta$ (180.1$degree$), $gamma$ (60.1$degree$), $epsilon$ (180.1$degree$), $chi$ (193.9$degree$) #mcite(("Mattelaer2021efficient"), biblio).
First, a lightweight semiempirical HF-3c (Hartree Fock) geometry optimisation is performed to relax the respective conformations after imposing the restraints. Afterwards, a single point energy (SPE) evaluation, through Møller-Plesset 2nd order perturbation theory (MP2) is performed to evaluate the potential of the respective conformers. The specific accompagnying basis set for MP2 is 6-311++G(2df,2p) with  the def2-qzvpp/C basis as an auxiliary basis set for the RI approximation and the def2/JK auxiliary basis set for the RI approximation of Coulomb and exchange integrals in the HF step #mcite(("Mattelaer2021efficient"), biblio). A total of 630 conformers were sampled for the each morpholino nucleoside.
The geography library, _cartopy_ (≤ python3.6), is employed to make a 2D projection of the $RR^3$ surface of the conformational sphere of HNA and MNA from which we sampled (@fig-sixring). The Mollweide projection is used, together with a PlateCarree transformation. The SciPy Radial basis function (Rbf) is used to interpolate the values to generate the PES.
QM calculations were performed on a Ryzen ThreadRipper 3970, with a memory capacity of 32GB RAM.
The standard MNA has been altered to a methyl-capped O6_'_ and N3_'_ variant before sampling the conformations.

The linker moiety, N,N-dimethyl-O-methylaminophosphoroamidate, has been subjected to a conformational sampling following the same methodology, but instead of varying endocyclic torsion angles, the ($zeta$, $alpha$) dihedral dyad was varied from 0$degree$ to 360$degree$ in steps of 10$degree$ along both axes (@fig-PesLinker), for a total of 1369 conformers.

//
//
//
//
//
//
//
=== The Ducque model builder for (X)NA structures
Ducque is written in Python3 and uses only built-in modules as well as NumPy-based modules (NumPy, SciPy) #mcite(("Harris2020numpy"), biblio). Ducque is functional both in the Commandline Interface (CLI) and with a GUI (Tkinter). It is free and open-source software (#link("www.github.com/jrihon/Ducque")[jrihon/Ducque]), under the MIT license.
Ducque uses a mechanical building method that functions solely on the given nucleoside conformers and backbone parameters of the respective nucleotides it builds into a strand, meaning it only takes into account the input bond angles and dihedrals. Array rotation in $RR^3$ is supported by quaternion mathematics.


Ducque's core functionality is extrapolation of the backbone dihedral by requiring only torsion and angle values. To position an atom in $RR^3$, there is only one location that satisfies both the given angle and dihedral.
Ducque functions by extrapolating for the fourth atom, in a set of atoms of a dihedral. In two dimensions, one can calculate for a vector when only knowing the direction of one vector and the supposed angle between the two vectors.
In three dimensions one will be left with an infinite amount of vectors in a conal space. Trying to extrapolate the fourth atom in a dihedral will leave one with infinite vectors in a plane. By exploiting the fact that there exists only a single vector that lives in both the cone and the plane, the last atom can be determined, completing the atom set of the dihedral.
With this process, and an associated fitting of the following linker and nucleoside, the leading strand is built (@fig-buildmethod A.-C.).
To build to complementary sequence, a fitting of the complementary strand's nucleobase to the leading strand's nucleobase is performed, by posing the complementary nucleobase onto the plane of its basepair and shifting it into the desired hydrogen bonding pattern (@fig-buildmethod D.). An added fitting of the backbone with neighbouring residues resolves most, if not all, clashes. Any remaining clashes are easily resolved through minimisation in the next stage of MD, with the correct force field. This building method assumes planarity of the input monomer's nucleobases, which is simply achieves by a cheap and restraintive geometry optimisation.
#figure(
  image("./figures/build_methods.svg", width: 100%),
  caption: [
        Ducque's methodology of extrapolation to atomic position, by angle and dihedral.
        The unit vectors ($accent(i, hat)$, $accent(j, hat)$, $accent(k, hat)$) are coloured in pink.
        Dihedral extrapolation of the $beta$ dihedral, of the nucleotide backbone, is visualised by extrapolating to the P atom with  C4$'$, C5$'$ and O5$'$ given.
        *A.* Generate a cone of equidistributed vectors around $accent(k, hat)$, by a set angle that represents the angle between the 3#super("rd") and the 4#super("th") atom. 
        *B.* Superpose $accent(k, hat)$ on the middle bond of the supposed dihedral. Calculate all possible dihedral with the three given atoms and the respective vectors (P atoms) in the cone. 
        *C.* Find the two vectors that lie the closest to the given dihedral and interpolate for vector you require, effectively giving you the position of the 4#super("th") in the set of atoms.
        *D.* Visualisation of how Ducque builds the complementary strand. First, the plane in which the leading strand's nucleobase (left) lies needs to be defined (#text(fill: rgb("B64848"), $accent(A, arrow.r)$)) .
          The complementary nucleoside (right) is then rotated so that the cross product (vector orthogonal to the plane) of its nucleobase is oriented exactly opposite to that of the leading strand's nucleobase's cross product (#text(fill: rgb("B64848"), $accent(B, arrow.r)$)).
          The initial position for the complementary base is determined for (#text(fill: rgb("4A91A6"), $Phi_R$)).
          The final rotation (#text(fill: rgb("476934"), $accent(J, arrow.r)$)) is effectuated by defining the (#text(fill: rgb("D4AC1A"), $Phi_Q$)) dihedral to position the complementary nucleoside with the correct hydrogen bonding pattern of the respective basepair. This in turn ensures a correct structure of the overall NA duplex. \
          The basepairing is dependent on correct naming of the atoms in the model building blocks. This is the main reason why nucleobase modifications are not in place yet.
  ]
) <fig-buildmethod>

//
//
//
//
//
//
//
=== Extending the XNA library of Ducque
Ducque allows the user to implement a custom repository of new chemistries, which function as building blocks for the virtual duplexes. This module requires the additional information on the input angles and the _pdb_ format nucleoside itself. Furthermore, one can generate randomised sequences through the randomisation module, or manually customise sequences, giving the user the freedom of choice when designing a duplex, e.g. multiple chemistries. Lastly, the _xyz_ format files, generated during Conformational Sampling by ORCA, can be converted to a _pdb_ format by Ducque. This implies batch conversion through Ducque as well.

For the extension of the Ducque library with new inputs, a _pdb_ inputfile of the new nucleoside must be provided by the user. It is converted to the _json_ format (\-\-transmute), which requires parameters like residue name, backbone angles and dihedrals to generate a suitable _json_ inputfile. The _xyz_ format files, generated during conformational sampling to characterise nucleosides (ORCA output), can be converted to _pdb_ format files by Ducque (\-\-xyz\_pdb) and subsequently used to supply to the user library. 
One can generate strands with randomised sequences for a specific XNA chemistry through the randomisation module (\-\-randomise), or manually customise sequences. The latter option allows to design a nucleobase sequence as well as the nucleic acid backbone on a residue specific level, giving freedom of choice for duplex design with multiple chemistries in the (customised) library.
The randomisation functionality was used to generate a multitude of different models for DNA::DNA, DNA::RNA, RNA::RNA, dXyNA::dXyNA, RNA::HNA and finally RNA::MNA. A sequence was specified manually to generate double-Drew Dickerson dodecamer (DDD) structures. Nucleic acid duplex models were built (\-\-build) from the randomised/DDD sequences and were subjected to MD. 


The respective nucleobases were flattened using the HF-3c level geometry optimisation, with the atoms in and on the sugar restrained in cartesian space and the math.chi - χ dihedral restrained at its current position. The improper dihedral for purines (C1_'_, C8, N9, C4) and pyrimidines (C1_'_, C6, N1, C2) is also restrained to -179.5° math.degree to ensure a plane as flat as the standard nucleobases provided with NAB to satisfy the planarity assumptions in the rotations.
For benchmarking the build quality of the structures, python scripting (for NAB) and Ducque's randomisation module were used to generate ten RNA and DNA homoduplexes of a randomised sequence of 12 basepairs (bp), respectively. These were compared to duplexes generated by the NAB language (@tbl-suppl-DucqueVsNab).
The _time_ shell command (logging the _real_ output) was used to compare build times for chronometric benchmarking. NAB was logged for combined time of compiling from the Domain-specific Language (DSL) to the binary and executing the binary, while Ducque can only be logged for Python's runtime. The structures were evaluated based on RMSD and difference in interbasepair-parameters using Curves+ #mcite(("Lavery2009curves"), biblio).
//
//
//
//
//
//
//
=== Force field parametrisation for molecular mechanics
The AMBER FF #mcite(("Case2005amber", "Salomon2013amberpackage"), biblio) is compatible with restrained electrostatic potential (RESP) charges #mcite(("Bayly1993wellbehaved"), biblio). This is a subset of molecular electrostatic potential (MEP) sampled with the Merz-Singh-Kollman (MK) population analysis scheme #mcite(("Singh1984approach", "Besler1990semiempirical"), biblio), followed by a two-stage restraint procedure to derive atomic charges (RESP fitting).
The nucleosides were superposed on the X-Z cartesian plane by the (C1_'_, C5_'_, N3_'_) atoms in the nucleosides through an in-house scripted reorientation #mcite(("Dupradeau2010redtools"), biblio).

The MK population analysis scheme has been implemented, by the authors, for ORCA and detailed here below. Geometry optimisation of the molecules was done at the PBE0 level, which was followed by an SPE at the HF/6-31G\* level/basisset, with ORCA, to generate the correct molecular density orbitals for RESP #mcite(("Cieplak1995respnuc"), biblio). The gridpoints are generated through the MSMS software #mcite(("Sanner1996surface"), biblio) at a range of factors times (1.4, 1.6, 1.8 and 2.0) the van der Waals (vdW) radius, defined by the Connolly surface algorithm #mcite(("Connolly1983analytical"), biblio). The probe radius was set to 1.4 $angstrom$, the density of the points on the surface was set to $frac(3, angstrom^2)$ (@fig-mkscheme).
MSMS employs a further triangulation of the vertices to distribute them more equally. ORCA's _orca\_vpot_ program is used to map the orbitals and their densities to the respective gridpoints, in atomic units (a.u.). Afterwards, the ESP-loaded grid is provided to the RESP script for a two-stage restraint procedure, deriving point charges for the atoms. Similar atoms are equivalenced and internal fragments are restrained to a set charge for the respective nucleosides, which ultimately returns the needed RESP charges for the FF #mcite(("Bayly1993wellbehaved", "Cieplak1995respnuc", "Aduri2007paramnuc"), biblio).

This uses the Chirliam-Francl least square fitting algorithm to fit the ESP onto the atomic points #mcite(("Chirlian1987atomic"), biblio).
This methodology was compared against results from GAMESS #mcite(("Gourdon2020gamess"), biblio) to compare the grid generation, and against the R.E.D. server to compare charge derivation.
With respect to the nucleosides, all atoms in the ring and all substituents were set for equivalencing, except for C1_'_ and H1_'_ which should be equivalenced with the nucleobases on the occasion of multiple conformers. Hydrogens belonging to amines of nucleobases are also equivalenced, as are the OP1 and OP2 oxygens in the phosphoramidate linker. For second stage RESP, all methyls and methylenes were equivalenced, due to degenerate hydrogens. The force field of MNA contains charges for 6_'_-head, 6_'_-fragments-3_'_, 3_'_-tail, neutral and methyl-capped MNA. Only the lowest energy #super("4'")C#sub("1'") conformer was considered for charge derivation. To create terminal residues and in-strand fragments, 6_'_ and 3_'_ ends were appropriately restrained with the linker to have a net charge of zero.

Finally, all bond, angle and torsion parameters for the morpholino chemistry were manually curated from the _parm10.dat_ frcmod file, contained within the AMBER package, of terms that already described parts of the molecule well, before fitting to the conformers. Only torsion terms of the morpholino ring moiety were fitted for.
Paramfit #mcite(("Betz2015paramfit", "Weiner1984originalamber"), biblio) was used to equate QM to MM energies correctly, which also produces a valid _frcmod_ file. All conformers in @tbl-ErelConformers were initially considered for fitting torsion angles. Finally, only #super("4'")C#sub("1'") , #super("2'")T#sub("3'"), #super("2'")S#sub("4'"), #super("4'")S#sub("2'"), #super("3'")T#sub("2'") of the MNA cytosine were employed for fitting.

A customised CF atom type was created, which was made equivalent to the standard CT atom type, common in AMBER FFs. This was done so as not to override any parameters when loading in the MNA FF together with the standard FFs.
//
//
//
//
//
//
//
=== Molecular mechanics simulations
The Molecular Dynamics simulations were run using the AMBER18 software package #mcite(("Case2005amber", "Salomon2013amberpackage"), biblio) joined with AMBERTools19, employing the Particle Mesh Ewald (PMEMD) simulation engine #mcite(("Darden1993pmemd"), biblio). The MNA force field was imported into LEaP, together with the DNA.OL15 and the RNA.OL3 FF #mcite(("Zgarbova2015dnaol15", "Zgarbova2011rnaol3"), biblio). The TIP3P water model is used for the explicit solvation, in a truncated octahedron box, and the charges were neutralised.
dXyNA parameters #mcite(("Mattelaer2021dxylose"), biblio) use the DNA.OL15 FF, HNA parameters were derived from a similar methodology as the one described in this article #mcite(("Schofield2023hnaaptamer"), biblio). Torsion angles for the linker were taken from the GAFF2 parameters, in combination with phosphate parameters from _parm10.dat_.
A cutoff distance of 12 $angstrom$ was used for non-bonded interactions. The minimisation ran for a total of 30 000 cycles, with the first 22 500 cycles employing the steepest descent method and the last 7 500 the conjugate gradient method. The SHAKE algorithm #mcite(("Krautler2001shake"), biblio) was employed to allow a timestep of 2 fs. An initial heating was performed for 50 ps, from 0 K to 100 K with _vlimit_ set to 15. The rest of the heating, from 100 K to 300 K, ran for an additional 50 ps. Density and equilibration ran for 100 ps each, with density set at 1 g/mL. The Langevin thermostat #mcite(("Davidchack2009langevin"), biblio) and the Berendsen barostat #mcite(("Berendsen1984molecular"), biblio) were used to keep the temperature and density at a constant value. The production simulations were run for 200 ns, unless stated otherwise. Trajectory analysis of the simulations calculated through Cpptraj #mcite(("Roe2013cpptraj"), biblio). MD simulations were run on NVIDIA GeForce RTX 2070 and 2060 through the _cuda_ accelerated simulation engine #mcite(("Salomon2013cuda1", "Legrand2013spfpcuda2"), biblio).
For all duplexes, distance-based NMR restraints were employed for the first 15 ns.
For structural comparison, superpositioning of the structures was done with UCSF Chimera's MatchMaker tool and all structures were entirely fitted according to their secondary structure. The Curves+ software was used to extract interbasepair data #mcite(("Lavery2009curves"), biblio).

