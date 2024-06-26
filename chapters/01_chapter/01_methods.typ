#import "../../lib/multi-bib.typ": mcite
#import "bib_01_chapter.typ": biblio
//
//
//
#pagebreak()
//
//
//

== Methods
=== Generating initial structures
The CS methodology consists of three parts, starting with the generation of torsion angle constraints to produce initial conformations, which cover the full conformational landscape.
The _pucke.rs_ CLI-tool provides simple query functions to generate the desired axes to generate structures in order to sample the conformational landscape.
The Python module (_pucke.py_) contains this functionality in the _confsampling_ module and works analogously.
Using either tools requires the user to specify the type of molecular system (-\-peptide, -\-fivering or -\-sixring) to be called. Both the peptide and fivering system employ a _linear space_ function, which asks the user to pass an amount of points to be computed for in a preset range.

For the example at the end of the chapter (@fig-ShowcasePES A.), the peptide landscape was queried to produce the axes ($phi$, $psi$) at an interval of 10$degree$ to generate 1369 distinct sets of ($phi$, $psi$)-constraints, for the inclusive range of [0. $arrow.r$ 360.]. The L-Alanine (Me-NH-Ala-CO-Me) was used to sample the peptide space (@fig-ConfSamplingExplained A.) and did not require additional constraints. The axes were later transformed to [-180. $arrow.r$ 180] for visual comparison of the energetically favourable regions of the peptide backbone, with the popular Ramachandran plot #mcite(("Rosenberg2023ramachandran"), biblio).

For the dA ribose ring, the inclusive range [-60. $arrow.r$ 60.] was divided in 21 segments to allow a sampling at an interval of 6$degree$ on the $Z_x$ and $Z_y$ axes, defined by Huang _et al._ #mcite(("Huang2014improve"), biblio).
For each generated datapoint, _pucke.rs_ generates a set of ($nu_1$, $nu_3$)-constraints (@fig-ConfSamplingExplained B.).
Additional exocyclic constraints were applied to generate five-membered ring conformers for the CS experiment. $beta$: 180.1$degree$, $gamma$: 60.0$degree$, $epsilon$: 180.1$degree$ and $chi$: 210.59$degree$.

For conformational sampling of an unsaturated six-membered ring, a set of datapoints is generated on the surface of the CP-sphere that represents the conformational space of six-membered rings. The CP formalism lets us invert from spherical coordinates to atomic coordinates, which are then used by the Strauss-Pickett formalism converts this information to impromper dihedrals ($alpha_1$, $alpha_2$, $alpha_3$). These are used as constraints are used to generate initial structures in the CS methodology (@fig-ConfSamplingExplained C.)
The hexitol NA adenosine (hA) monomer sampling was imposed with the following constraints: $beta$: 180.1$degree$, $gamma$: 60.0$degree$, $epsilon$: 180.1$degree$ and $chi$: 210.59$degree$.
//

=== Quantum Mechanics
The CS methodology is subjected to various computational chemistry approaches to assess consumption of resources and quality of their results.
Each initial structure is subjected to a constrained GO and an SPE through QM approaches. Here the DNA adenosine nucleoside is used for benchmarking since its Potential Energy Surface (PES) is well described #mcite(("Huang2014improve", "Mattelaer2021efficient"), biblio).
This study utilises ORCA v5.0.4 #mcite(("Neese2020orca"), biblio), as this version applies the latest correction on the D4 dampening #mcite(("Caldeweyher2017d4corr", "Caldeweyher2019londondisp"), biblio), courtesy of Grimme lab. 

The Gold Standard Quality (GSQ) was decided to be the Møller–Plesset 2#super("nd") order perturbation theory (MP2) #mcite(("Cremer2011mppt"), biblio).
//as the CI-CCSD(T) LoT does not lend itself well to geometry optimisations and still a remains a demanding LoT, though incredibly accurate.
The CI-CCSD(T) level of theory (LoT), generally considered one of the most accurate methods, does not lend itself well to geometry optimisations.
This LoT is accompagnied by the 6-311++G (2df,2p) basis #mcite(("Krishnan1980molorbital", "Frisch1984diffusemolorbital"), biblio), with the Resolution of Identity (RI) approximation #mcite(("Neese2003rijk"), biblio). The def2-QZVPP/C auxiliary basisset#mcite(("Hellweg2007auxqzvpp"), biblio) is used for the RI approximation of the MP2 density, together with the def2/JK for approximation on Coulombic and Exchange integrals #mcite(("Weigend2007def2jk"), biblio), hereafter mp2q. The same basis set and approximations are used for the CS methodology at the _ab initio_ Hartree-Fock (HF) level (hfq). 

The semi-empirical HF-3c LoT #mcite(("Kruse2012hf3c", "Grimme2010dftcorrection", "Grimme2011dispersion"), biblio) is employed as it is fast and cheap and before due to its cost efficiency and is employed here to compare against the other methods. #mcite(("Mattelaer2021efficient"), biblio). The double hybrid functional PBE0 #mcite(("Adamo1999pbe0"), biblio), with the D4 dampening, uses the same basis as mp2q but with the def2/J auxiliary set #mcite(("Weigend2006def2j"), biblio) (pbeq). Both hf3c and pbeq have shown to output optimised structures of great quality for a fraction of the cost of the for the fraction of a cost of the pure  wave function theory methods. All GOs are performed with the _VeryTightOpt_ keyword.

Other methods are the MP2 def2-TZVP/C (mp2t) #mcite(("Hellweg2007auxqzvpp"), biblio) and the hfq without RIJK approximation (hfnorijk). These are used to compare their _consumables_ and quality of results within the LoT with the other variants.

The dA molecule, which counts 31 atoms in total,  uses 103 basis functions for hf3c and 742 basis functions for the calculations with the pbeq, the hfq and the mp2q LoT respectively.
The benchmarking consists of comparing different LoTs' resources and assessing their RAM usage, wallclock time and Disk Space usage and the _consumables_ used during computations, and comparing this to the GSQ.
Comparison of the GO quality will be done by going through a pairwise structure comparison, where differences are measured with the Kabsch RMSD algorithm #mcite(("Kabsch1976rmsd"), biblio) (#link("www.github.com/charnley/rmsd")[github.com/charnley/rmsd]).
All sets of optimised geometries will also be subjected to an SPE with all four functionals hf3c, pbeq, hfq, mp2q.
The MAXCORE keyword is utilised to max out at 1500 MiB per thread engaged. For the GO part, every optimisation allocates six threads per conformation. A total of ten conformations, at one time, can be concurrently optimised. For the SPE, every evaluation allocates one thread per conformation with a total of 35 threads active at one time.
Calculations were performed on a Ryzen ThreadRipper 3970 (32 cores / 64 threads) with a RAM capacity of 64 GiB.

=== Potential Energy Surface
From a landscape of _in silico_ generated and evaluated conformers of a molecular type, a PES is generated, as described by Mattelaer _et al._ #mcite(("Mattelaer2021efficient"), biblio).
The PES itself is expressed as the relative difference in energy ($Delta E$) of all conformations with respect to the global minimum of the landscape. To evaluate the produced PESs, the differences in relative energy($Delta Delta E$) are compared, for all combinations of LoTs, against the GSQ. 
The $Delta Delta E$ and RMSD maps are used to identify which combinations (GO-SPE) can best represent the optimal PES (@fig-PESALL).

Figures are made with Matplotlib and Cartopy. Figure SISphericalConvention details on the conventions used to define the CP six-membered ring space in relations to the mathematical convention of defining latitude-longitude coordinates, for graphical purposes.
Cartopy, a Python geography library superset of Matplotlib, was exploited to project the PES of six-membered ring systems onto the surface of the sphere. This was done with the Mollweide projection, and transforming the data by the PlateCarree projection. Because $Q$ tends to stabilise around 0.67 for biologically relevant puckering modes, the CP coordinates $(Q, phi_2, theta)$ were simplified to 2D to better graphically visualise the CP sphere, by neglecting the amplitude.
For the RMSD contourplots, the _oslo_ colourscheme was used #mcite(("Cramericolourmaps"), biblio) for the RMSD contourmaps.

