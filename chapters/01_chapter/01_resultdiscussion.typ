#import "../../lib/colours.typ": colourPalette
#import "../../lib/multi-bib.typ": mcite
#import "bib_01_chapter.typ": biblio
#import "@preview/tablex:0.0.8": tablex

#show "SICodeExamples" : [#link("https://github.com/jrihon/puckepy/blob/main/docs/documentation.md")[https://github.com/jrihon/puckepy/blob/main/docs/documentation.md]]
== Result & Discussion
=== The _pucke.rs_ toolkit
In the first stage of generating a conformational landscape, the pucke.rs toolkit is used to select gridsystem for a set of axes and produces a set of constraints. These can then imposed on the respective dihedrals of the molecule; ($phi, psi$) for peptides, ($nu_1, nu_3$) for fiverings and ($alpha_1, alpha_2, alpha_3$) for sixrings. The constraints are applied during GO procedures, which generate all the possible conformations that molecule's system can adopt, given that the query amply covers the landscape.
The accelerated methodology #mcite(("Mattelaer2021efficient"), biblio) employs two levels of theory to dramatically speed up the duration of the experiment, by applying a cheap one for the GO stage (hf3c) and an expensive one for the SPE stage (mp2q) to accurately sample the behaviour of the molecules subjected to this study. All this comes together to generate a PES that represents the behaviour of the studied molecule.

The constraints of the peptide-like landscapes are simply procured by iterating over the $phi-psi$ axes in a nested fashion. The values gathered from iterating over these axes are directly used as the constraints of the particular dihedrals.The peptide method returns a 2D grid, returning sets of proper dihedrals to be used as constraints for GO procedures (@fig-ConfSamplingExplained A.).

For ring systems, puckering formalisms are exploited, as they neatly abstract the conformation of an N-membered ring system to a set of coordinates. For the fivering system, the methodology has been applied from Huang _et al._'s #mcite(("Huang2014improve"), biblio) way of combining the Altona-Sundaralingam (AS) and Sato formalism, projected on a Cartesian system with ($Z_x, Z_y$) axes. 
$
    nu_1 &= (Z_x cos(frac(4pi,5)) + Z_y sin(frac(4pi,5))) \
    nu_3 &= (Z_x cos(frac(4pi,5)) - Z_y sin(frac(4pi,5)))
$ <eq-Huang>
//
//
//
//
By iterating over a set of $Z_x$ and $Z_y$ values, ranging from [-60. $arrow.r$ 60.], one calculates a set of $(nu_1, nu_3)$ endocyclic torsion angles per gridpoint. 
@eq-Huang simply rearranges the terms from Huang _et al._ to return the pair of endocyclic torsion angles #mcite(("Huang2014improve"), biblio).
The five-membered ring method return a 2D grid, returning sets of proper dihedrals to be used as constraints for GO procedures (@fig-ConfSamplingExplained B.). 

Sampling the six-membered ring space exploits two puckering formalisms. Through the use of the CP formalism, one can calculate a set of local elevations from a spherical coordinate $(Q, theta, phi)$, which is an abstraction of a six-membered ring conformation. It has been theoretically detailed by Cremer #mcite(("Cremer1990analytical"), biblio) and applied by Sega _et al._ #mcite(("Sega2011sixring"), biblio), to reverse engineer (or invert) the puckering coordinates to a full conformation. Starting from an equidistributed globe #mcite(("Deserno2004equiglobe"), biblio), the coordinates are passed into the function to calculate the set of local elevations per conformation. Based on assumptions on the magnitude of the bondlengths and -angles, the atoms are assigned a position in $RR^3$. Afterwards, the improper dihedrals ($alpha_1, alpha_2, alpha_3$) (Strauss-Pickett formalism; SP) are computed for and are used as constraints.
The sphere represents the CP sphere (@fig-ConfSamplingExplained C.).
The amplitude is kept as a constant at $Q$ = 0.67, as this is the value at which biologically relevant six-membered rings exist #mcite(("Haasnoot1992conformation"), biblio) @eq-GeneralCpEven defines all ringsystems with an even amount of atoms.

$
z_j = sqrt(frac(2,N)) q_m cos(phi_m + (2pi m frac(j-1, N))) + frac(1, sqrt(N)) q_(m+1) (-1^(j-1))
$ <eq-GeneralCpEven>
//
//
For sixring systems ($N = 6 arrow.r m = 2$), the equation is simplified.
$
z_j = sqrt(frac(1,3)) q_2 cos(phi_2 + (2pi frac(j-1, 3))) + frac(1, sqrt(6)) q_3 (-1^(j-1))
$ <eq-GeneralCpSixring>
//
//
By definition, @eq-GeneralCpSixring can be assigned as : 
$
q_2 = Q sin(theta) #h(1em) | #h(1em) q_3 = Q cos(theta) #h(1em) | #h(1em) phi = phi_2 
$ <eq-VirtueEquation>
//
//
Which results in @eq-SoftwareEquation, that is used to perform the actual computation for the set of local elevations in a sixring system (iterating over j = $0 arrow.r 5$) in the software. The generated spherical coordinates $(Q, theta, phi)$ are passed to this function. 
$
z_j = [sqrt(frac(1,3)) sin(theta) cos(phi + ( frac(2pi j, 3))) + frac(1, sqrt(6)) cos(theta) (-1^(j))] Q
$ <eq-SoftwareEquation>
//
//

#figure(
  image("./figures/02_confsampl.svg"),
  caption : [
    Explanation of conformational sampling experiments. 
    *A.* Sampling over peptide-like systems, akin to the concept of a Ramachandran-plot. 
    *B.* Sampling the fivering space, employing the Altona-Sundaralingam/Sato formalism (@eq-Huang) #mcite(("Huang2014improve"), biblio). 
    *C.* Sampling over the sixring space, reverse engineering spherical coordinates to local elevation. Local elevation is returned through @eq-SoftwareEquation, after which the atomic positions are computed for and the SP improper dihedrals are calculated. See SICodeExamples for code examples.
  ]
) <fig-ConfSamplingExplained>
//
//
//
==== The pucke.py module
In order to make the methodology more user-friendly, we provide both a CLI tool (_pucke.rs_) and a scripting library (_pucke.py_, a Python-wrapped Rust library) to allow users to implement either option into their own workflows.
The Rust language was a deliberate choice to ensure the robustness of the toolkit.
In the Python module, the CLI-tool has been implemented as the _confsampling_ module. Additionally, the _pucke.py_ module contains the _formalism_ module that allows the user to calculate various puckering formalisms for five- (AS, CP5) and six-membered (SP, CP6) rings. Furthermore, the user can pass specific Cremer-Pople coordinates to the CP5($r, phi_2$) or CP6($r, phi_2, theta$) class and invert these coordinates to produce the 3D structure they have defined, as an xyz- or pdb-formatted file (@fig-InversionConf).
This feature allows users to explore and understand the intricacies of the different formalisms, as well as derive specific constraints by the queried conformer.
//
//
#figure(
  image("./figures/conformations_02.svg"),
  caption : [
            Examples of conformations produced by querying for specific Cremer-Pople coordinates, for five- and six-membered ring systems. This employs the inversion algorithm, detailed by Cremer #mcite(("Cremer1990analytical"), biblio). The library produces just the base ring, hydrogens and nitrogen (representing the nucleobase) were added with UCSF Chimera #mcite(("Pettersen2004ucsf"), biblio).
            *A.* Various conformations of the DNA nucleoside, produced by inverting CP-coordinates for five-membered rings (CP5).
            *B.* Various conformations of the Hexitol NA nucleoside, produced by inverting CP-coordinates for six-membered rings (CP6).
  ]
) <fig-InversionConf>
//
//
Additionally, the _geometry_ module is supplemented with three functions to calculate molecular geometries (bondlength, bondangle and dihedral). These works by passing in coordinates from parsed molecule files.
The library provides classes to manipulate pdb and xyz coordinate files, which parse the coordinates of the molecule in question. 

//
//
//
//
//
#pagebreak()
=== The construction of a PES for DNA Adenosine
==== Benchmarking on a local machine
A set of levels of theory [hf3c, pbeq, hfq and mp2q] for the geometry optimisation procedure was applied on the DNA Adenosine nucleoside. Every respective set of optimised structures is then also subjected to potential energy evaluations by the four LoTs respectively. This generates sixteen different landscapes at various levels of accuracy to describe the behaviour of the DNA nucleoside (@fig-PESALL). 
Obtained PESs are compared with @tbl-wallclock) and the Consumables (@fig-supplementary-consumables).

#figure(
  image("./figures/PES_ALL.svg"),
  caption : [
            Conformational sampling of the DNA Adenosine nucleoside, carried out at the various levels of theory, combining different 
            (#text(fill: rgb("#A38550"))[GO] - #text(fill: rgb("#8D4DA3"))[SPE]) resulting in different Potential Energy Surfaces.
            Geometry optimisations (brown; columns) were carried out at the HF3c, PBE0, HF and MP2 level. All GOs were subjected to an additionl Single Point Evaluation (mauve; rows), respectively the three other functionals. A #math.equation("4x4") matrix shows the result of all the samplings, visualing the respective combinations of GO and SPE.
            To clarify, combinations involving the same functional did not require an additional SPE; shown on the diagonal of the matrix. The GSQ has highlighted borders (lower right).
  ]
) <fig-PESALL>
//
//
The selected GSQ, mp2q, are the heaviest computations, clocking in at roughly 548h or about 22.8 days of calculations. The geometry optimisation capped out at about 48 GiB of RAM, while at most 40 GiB of _tmp_-files were stored on disk by ORCA when ten conformations were optimised concurrently.
The hf3c was logged for the same parameters and finished in about 0.7h, capping at almost 3GiB of RAM and almost 1 GiB in Disk Space in _tmp_-files.
The GO experiment with hfq finished around the 30h mark and showed little hardware consumption compared to the GSQ, topping at 10 GiB of RAM with an excess of 6 GiB of _tmp_-files produced by ORCA at most. The pbeq consumes relatively the same as the hfq, but clocks in at 58h or 2.4 days (@fig-supplementary-consumables A.,B.).
//
//
//

#show table.cell: it => text(it.body, size: 10pt)

#figure(
  supplement: [Table],
  tablex(
    columns: 5,
    map-cells: cell => (..cell, content: text(cell.content, size: 10pt)),
    stroke: 0.5pt + colourPalette.lightblueslate,
          // Header
//          [_LoT_], [A], [B], [C], [D],
          [*_LoT_*], [*hf3c*], [*pbeq*], [*hfq*], [*mp2q*],
          // Content
          [hf3c] , [0.67]    , [58.08]    , [30.13]    , [548.01]    ,
          [PBE0] , [5.12]    , [57.97]    , [34.53]    , [552.41]    ,
          [HF]   , [5.12]    , [62.48]    , [30.02]    , [552.36]    ,
          [MP2]  , [6.42]    , [63.43]    , [35.73]    , [547.91]    ,

  ),
  caption: [
      Wallclock Time to completion, with reference to the generated PESs from @fig-PESALL. All times expressed in hour (h).
      For different combinations of LoT for  GO (columns) and SPE (rows). The diagonal of the table highlights the wallclock time of identical LoT for both GO and SPE.
  ]
) <tbl-wallclock>
//
When looking at @tbl-wallclock, we see that the SPE calculations run at most a total of six hours for this set of geometry optimised conformers.
The hfq (max. 28.9 GiB) and mp2q (max. 28.6 GiB) have similar RAM requirements, while the latter still required a tremendous amount of free disk space to store _tmp_-files. All this in contrast to the pbeq that needs (max. 9 GiB) of additional space on disk to run succesfully. The SPE at the hf3c finished so quickly that only a couple of measurements could have been taken (@fig-supplementary-consumables C.,D.).
The conclusion remains that the (hf3c - mp2q) combination still is a robust competitor in approximating the GSQ, as these calculations are perfectly manageable within a single workday, on hardware with 64 GiB of RAM and 32 cores.
Still, the established methodology #mcite(("Mattelaer2021efficient"), biblio) returns a comparatively amazing result for the frugality of its expenditure. To combat the storing of _tmp_-files, one allocates more RAM per thread. In the interest of the research, a concession had to be made towards the cheaper LoTs , by not exaggerating the resources allocated with respect to their computational requirements.
//A comparison between (mp2q vs. mp2t) and (hfq vs. hfnorijk) is presented in Suppl. Fig. SIConsumablesExtra.
//  
//

//==== Zooming in on the best picks
#figure(
  image("./figures/delta_PDF.svg"),
  caption : [
            *A.* Comparison of the difference in relative energy ($Delta E$) between the GSQ (mp2q) CS experiments and the other GO sampling who've been subjected to an SPE at the  mp2q level. Ranges from [-0.5 $arrow.r$ 0.5] $frac("kcal","mol")$)
            *B.* Comparison of RMSD between the GSQ (mp2q) GO procedures of the experiment and the other GO sampling. Ranges from [0. $arrow.r$ 0.10] $angstrom$.
  ]
) <fig-diffErelRMSD>
To evaluate the quality of the different PESs, a closer look to the differences of individual results is required.
Relative to the GSQ, we selected the PESs of the bottom row (@fig-PESALL) for evaluation. A first analysis is done by applying the difference in relative energy to that of the GSQ ($ Delta Delta E$) (@fig-diffErelRMSD A.). To look at the quality of the optimised conformations, we assessed every conformation of a landscape in a pairwise fashion to the conformer with the same puckering coordinates in the GSQ and applied an RMSD algorithm #mcite(("Kabsch1976rmsd"), biblio), to calculate the difference in optimised structures (@fig-diffErelRMSD B.).
We highlight that the respective ranges in which we evaluate both the $ Delta Delta E$ and the RMSD are small, indicating that the differences overall are minute. The pbeq best approximates the mp2q for a fraction of its cost and optimises conformations closest in resemblance to that of the GSQ in parts of the landscape where it matters (e.g. minima and saddle points).
Its only downside is the time investment into the pbeq calculation, with respect to hf3c, as the pbeq still takes at least two days to run for such a landscape, while hf3c barely takes an hour, when all optimisations are ran concurrently.
The SPE calculations at the pbeq level are a strong candidate where hardware systems are limited as the landscapes at this level resembles the shape of the mp2q SPE the most.
@fig-supplementary-deltaEnergy compares all SPE calculations to the GSQ ($ Delta Delta E$), @fig-supplementary-deltaRMSD compares all optimised geometries from the various LoTs with one another.
//#figure(
//  image("./figures/delta_PDF.svg"),
//  caption : [
//            *A.* Comparison of the difference in relative energy ($Delta E$) between the GSQ (mp2q) CS experiments and the other GO sampling who've been subjected to an SPE at the  mp2q level. Ranges from [-0.5 $arrow.r$ 0.5] $frac("kcal","mol")$)
//            *B.* Comparison of RMSD between the GSQ (mp2q) GO procedures of the experiment and the other GO sampling. Ranges from [0. $arrow.r$ 0.10] $angstrom$.
//  ]
//) <fig-diffErelRMSD>
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
//
//
//
=== Comparison with literature data
To introduce the CP formalism, an apex (first atom in the set) needs to be assigned for the set of local elevations ($z_j$). The original paper #mcite(("Cremer1975general"), biblio) conveniently chose to have the apex to go through the oxygen atom when characterising sugars, which results in $phi_2 = 0degree$ returning an #super("O'")E conformation. While comparing this data with what is parametrised in the paper of Cornell _et al._ #mcite(("Cornell19952ndgenff"), biblio) (AMBER Forcefield parameters), it was noticed that while the CP formalism was assigned to denote the puckering modes of the conformers, that the reported pucker coordinates do not follow the same apex.
More so the apex of Cornell _et al._ seems to follow through the C3_'_, since the #super("3'")E is closest to 0$degree$, but the phase angle has also been shifted by 18 $degree$ ($frac(pi,10)$), causing the #super("3'")T#sub("2'") to appear at the top of the plot.
This, however, does exactly align with the AS formalism #mcite(("Altona1972formalism"), biblio), instead of the CP formalism, as attributed by Cornell _et al._. 

@fig-FiveringRepresentation D depicts the reported conformers used from the Cornell paper #mcite(("Cornell19952ndgenff"), biblio) and adjacently the nearest pucker coordinate from the previous CS experiment (@fig-PESALL, mp2q), as the AS formalism. Of note is the broad interpretation of the _Envelope_ ranges, as they actually lean closer into _Twist_-territory (@fig-FiveringRepresentation). The [#super("2'")E, #super("3'")E, #super("O'")E, E#sub("O'")] set of conformers are coupled to a relative energy value. From the GSQ $Delta E$ values, these are (0.00, 1.66, 2.93, 4.65). In the Cornell paper, these are respectively at [$epsilon=1$ : (0.00, 0.63, 2.87, 5.86)] and [$epsilon=4$ : (0.00, 1.04, 1.86, 5.68)]. Any differences are attributed to the basis set used (6-31G#super("*")) and the constraints at which the geometry optimisation were performed. We see the same trend of favourability in potential energy of the conformations in all three sets of results. The parametrised conformers also fall into place with the local and global minimum and the transitional states, showing the predictive quality of the CS methodology on the behaviour of these monomers.

For the puckering behaviour of the furanose in DNA, we see a global minimum around the #super("2'")E area, which corresponds with standard DNA::DNA homoduplex configurations. At the local minimum, we find the #super("3'")E conformer, which is often adopted under conditions when hybridising with different types of backbone chemistries The PES depicts two transition states, or commonly referred to as saddlepoints. The upper saddlepoint (5, 40) locates the #super("O'")E conformation, while the lower saddlpoint at around (5, -15) depicts the E#sub("O'"). Again, this predicted behaviour of the DNA nucleoside falls in line with structural determination data.
#figure(
  image("./figures/fivering_representation_02.svg"),
  caption : [
            *A.* mp2q-optimised PES, shown as contour plot (upper), in contrast with the scatter plot (lower) that was used to interpolate the data from.
            *B.* Altona-Sundaralingam representation on a polar coordinate plot of the scatterplot in (A).
            *C.* Cremer-Pople representation on a polar coordinate plot of the scatterplot in (A).
            *D.* From Cornell _et al._ #mcite(("Cornell19952ndgenff"), biblio), the deoxyribose adenosine conformations highlighted along their denoted conformation, according to the manuscript itself. For (#super("2'")E in turquois, E#sub("O'") in green, #super("O'")E in lila and #super("3'")E) in orange. The conformation, as a result of the CS experiment itself (@fig-PESALL), nearest to the respective conformations from the Cornell paper are also highlighted as the base colour.
            *E.* The conformations described by the Cornell paper were generated by making use of the inversion methods in _pucke.py_.
  ]
) <fig-FiveringRepresentation>
//
//For the puckering behaviour of the furanose in DNA, we see a global minimum around the #super("2'")E area, which corresponds with standard DNA::DNA homoduplex configurations. At the local minimum, we find the #super("3'")E conformer, which is often adopted under conditions when hybridising with different types of backbone chemistries The PES depicts two transition states, or commonly referred to as saddlepoints. The upper saddlepoint (5, 40) locates the #super("O'")E conformation, while the lower saddlpoint at around (5, -15) depicts the E#sub("O'"). Again, this predicted behaviour of the DNA nucleoside falls in line with structural determination data.
//
//
//
=== Showcase of the peptide and six-membered ring systems

To finalise, we provide a brief showcase of the applicability of the CS methodology, by applying the methodology to generate PESs on the peptide, five-membered ring and six-membered ring experiments. These molecular systems encompass all chemical variants of biological monomers used in standard and synthetic biology.
The Peptide PES (@fig-ShowcasePES) shows a global minimum around the same region as where we would find _alpha_-helical conformers on a standard Ramachandran plot. Up from this global well, we see one local maximum and an adjacent local minimum ($phi$ = -45$degree$ $arrow.r$ -135$degree$, $psi$ = $plus.minus$135$degree$). This region constitutes where _beta_-sheet conformers are situated. On the righthand half of the PES, diagonally up from the _alpha_-helical conformers, we encounter the _alpha#sub("L")_-helical conformers, whom are involved in left-handed helical protein structures. This behaviour tends to be true for all natural amino acids.#mcite(("Hollingsworth2010ramachandran", "Rosenberg2023ramachandran"), biblio)

Finally, the HNA chemistry has been subjected to a sampling (@fig-ShowcasePES). 
At the North Pole, we find the typical #super("X")C#sub("W") conformers (example in @fig-InversionConf B.). At its antipode, the South Pole, we find their inverse conformers #super("W")C#sub("X").
At the equator, we find various Boats (#super("X,W")B, B#sub("X,W")) (example in @fig-InversionConf B.) and Skews (#super("X")S#sub("Z"), #super("Z")S#sub("X") configurations. To clarify, a halfboat conformer is the same as a skew, where three consecutive atoms are in the same plane, with the fourth in-plane atom located in between two out-of-plane atoms and both latter atoms are on either side of the plane.

#figure(
  image("./figures/all_structures_PES.svg"),
  caption : [
    Potential energy surface of 
    *A.* peptide-like systems, 
    *B.* six-membered ring systems. The six-membered ring HNA molecule is depicted in @fig-InversionConf B.
//    Explanation of the geographical vs. CP formalism on the axes ranges involved in Figure  \ref{fig:SI_spherical_convention}.
  ]
) <fig-ShowcasePES>
Around a latitude of 55$degree$, we encounter the Envelope (#super("X")E, E#sub("Y")) and Twist (#super("X")T#sub("Y")) (example in @fig-InversionConf B.) puckering modes, while at 135$degree$ we see their inverse puckering modes (#super("Y")E, E#sub("X") ; #super("Y")T#sub("X")). Twists are often referred to as halfchairs and define a conformation where only two consecutive atoms both exist out-of-plane, one on either side of the plane.
From this PES, we can safely assess the stability of both North and South pole conformations, we three large local minima around the equator. Viewing the minima from left to right, it boasts the #super("3'")S#sub("1'"), the B#sub("O',3'") and the #super("O'")S#sub("2'") respectively.
