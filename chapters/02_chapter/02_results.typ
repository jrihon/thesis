#import "../../lib/multi-bib.typ": mcite
#import "../../lib/colours.typ": colourPalette
#import "bib_02_chapter.typ": biblio

// https://github.com/PgBiel/typst-tablex/
#import "@preview/tablex:0.0.8": tablex
// https://github.com/ntjess/wrap-it
#import "@preview/wrap-it:0.1.0": wrap-content

== Results 
=== Charge derivation using ORCA
The ORCA QM package does not contain the MK population analysis scheme. To keep the workflow free, local and easy to use, we implemented the population analysis scheme for ORCA to generate ESP charges that are ready to use for the RESP fitting.
Two programs were used to compare Connolly surface grid generation to decide which program is most suited for the task at hand. The AMBERTools-script _molsurf.c_, which calculates molecular surface areas, was modified to output the vertices of the surface points  by which it computes surface areas. A second program, MSMS was also tested (Scripss Research Institute, utilised by VMD #mcite(("Humphrey1996vmd"), biblio) and UCSF Chimera #mcite(("Pettersen2004ucsf"), biblio)). The latter computes a further triangulation of the solvent excluded surfaces (SES) to generate an even distribution of points across the surface of the molecule. Upon visual inspection and level of customisability of the grid (atomic and probe radii, point density), MSMS was hugely favoured.
//
Further comparison of the method was done against GAMESS' output, which defaults to a grid with a density of 1/$angstrom^2$. Our implementation for ORCA uses a density of 3/$angstrom^2$ #mcite(("Singh1984approach", "Besler1990semiempirical"), biblio). Point density of 1/$angstrom^2$ was used for our method to compare against GAMESS. 
Our methodology shows an even distribution of the surface, compared to GAMESS, and decided to proceed with this approach as it produced a near-identical range of ESP values to that of GAMESS' (Figure MKPopAnalScheme and ESPGrid).
A benchmarking against RESP-charge derivation by the R.E.D. server #mcite(("Vanquelef2011redsa"), biblio) was carried out on HNA nucleosides. We see near-identical atomic charges being fitted to the atoms in the respective nucleosides (Figure CompareChargederivation). 
Data points from either methodology were compared by pairwise atom alignment (linear regression, SciPy) per nucleoside. This results in an $r^2$ of 0.985 for hA, 0.985 for hC, 0.987 for hG and 0.979 for hT.
//
//
//
//
//
//
//
//
//
=== Model building by Ducque
//A-type and B-type duplexes of DNA and RNA (Fig. SIShowcase A1.) have been built by Ducque and its performance was compared to NAB to assess its model building capacity.
Conserving the planarity of the nucleobases is necessary because Ducque's placement and fitting of the nucleosides in the strands assumes planarity of the nucleobases (@fig-buildmethod). Because of their sp#super("3") type hybridisation, amines tend towards slight tetrahedral structures in nucleobases, and this gets more pronounced in _ab initio_ calculations at MP2 levels with midsized basis sets for geometry optimisations. This compromises the flatness of the nucleobase by several tenths of degrees for the nitrogen involved in the glycosidic bond, to several degrees for the amine on the six-membered ring in purines #mcite(("Sychrovsky2009pyramidnuc"), biblio). Optimising at the current level compromises the planarity assumption, introducing distortions during duplex building and causes peculiar rotations of nucleotides in the final model. _Nota bene_, using larger basis sets, i.e. reaching complete basis set, decreases the degree of pyramidalisation #mcite(("Zierkiewicz2008cbsamine"), biblio). Using this basis would be too computationally intensive for our needs and would only finetune details that would be negated in the following simulations.
Therefore, the planarity issue of nucleobases was resolved by the use of planarity restraints on nucleobases during HF-3c geometry optimisations, providing nucleosides for the Ducque library with planar nucleobases, like in NAB.

//#let content-showcase = [@fig-modelshowcase showcases the variety of models the user can build! 
//]
//*A1.* Shows a standard RNA::RNA homoduplex ( [O5_'_, C5_'_, C4_'_, C3_'_, O3_'_]).
//*A2.* Shows the homoduplex of the $beta$-homo DNA (brown rose), with a backbone sequence  [O6_'_, C6_'_, C5_'_, C4_'_, O4_'_]. Notice the righthanded ladder-like helix, which is typical for this chemistry. The manuscript showcases the DXYNA homoduplex too (Fig. DXYLO; [O5_'_, C5_'_, C4_'_, C3_'_, O3_'_]).
//*B.* Shows a heteroduplex of DNA::s-DNA (salmon). The complementary strand consists of a racemised mixture of thiophosphate residue, both in R- and S-configuration. They follow the standard backbone [O5_'_, C5_'_, C4_'_, C3_'_, O3_'_] of DNA. The 1DX and 2DX residues specifically query for the S- or R-configuration of the thiophosphate linker, respectively. 
//*C1.* This shows a duplex where the complementary strand has been altered to incorporate two different chemistries; the native RNA and the three 2-O-Methyl RNA residues (light green), which has the same backbone as RNA. This particular application has a lot of potential in the antisense design field of research.
//*C2.* To go a step further and show Ducque allows for highly customised structures, the complementary strand holds four different chemistries! The native RNA, HNA (dark red), 2-Fluoro RNA (hot pink, same backbone as RNA) and Cyclohexenyl NA (sea green; [O7_'_, C7_'_, C4_'_, C3_'_, O3_'_])! 
//         All duplexes were built by Ducque. Figures are of the direct output of Ducque, meaning no minimisation or MD simulation interfered in the depicted structures.
//#let fig-showcase = [#figure(
#figure(
  image("./figures/showcase-models02.svg",
  width: 100%
    ),
  caption: [ 
             All tags (\-\-sequence, \-\-complement) near their respective structures are the actual inputs used to produce the molecular structures. 
         *A1.* RNA::RNA homoduplex.
         *A2.* $beta$-homo DNA (brown rose). 
         *B.* Thiophosphate complement; DNA::s-DNA (salmon). The 1DX and 2DX residues specifically query for the S- or R-configuration of the thiophosphate linker, respectively. 
         *C1.* RNA::RNA/2_'_-O-MeRNA (light green).
         *C2.* Complementary strand consists of RNA, HNA (dark red), 2_'_-Fluoro RNA (hot pink) and Cyclohexenyl NA (sea green). 
         All duplexes were built by Ducque. Figures are of the direct output of Ducque, meaning no minimisation or MD simulation interfered in the depicted structures.
//         The manuscript showcases many other heteroduplexes, like DNA::RNA (Suppl. Inf.), RNA::HNA (Fig. fig:HNAduplex; [O6_'_, C6_'_, C5_'_, C4_'_, O4_'_]) and the RNA::MNA (@fig-fullRNAMNA [O6_'_, C6_'_, C5_'_, C4_'_, N3_'_]).

  ]
) <fig-modelshowcase>
//]
@fig-modelshowcase showcases the variety of models the user can build! 
The upper left figure (A.1-2) shows the standard RNA homoduplex, as well as a $beta$-homo DNA homoduplex. The latter is a result of sampling the chemistry  and iteratively finetuning the backbone inputs, whereby the logical outcome turned out to be a left-handed ladder-like helix. This matches current literature #mcite(("Mattelaer2021efficient", "Lescrinier2003difference"), biblio). On the right hand side (B.), we provide the reader with a generated structure of a racemised mixture of R- and S-Thiophosphate moieties of the linker. The lower part (C.1-2) provides an example on the different combinations the user is allowed to query, showing point mutations (2_'_-O-Methyl RNA) in the complementary sequence. This chemistry holds particular applications in antisense design research. Going a step further, Ducque even allows building with multiple chemistries in a either strand; e.g. RNA, 2_'_-FNA, HNA and CeNA in the complement. For reference, the proto-NAB tool only builds homoduplex models from chemistries already experimentally determined, which provides only seven chemistries (of which DNA and RNA) with no user-input possibilities. Users of Ducque can customise the entire backbone to their heart's content.
//#grid(fig-showcase, content-showcase, columns: (3fr, 1fr), gutter: 1em) #v(-0.5em)
// This chemistry holds particular applications in antisense design research. Going a step further, Ducque even allows building with multiple chemistries in a single strand; e.g. RNA, 2_'_-FNA, HNA and CeNA. For reference, the proto-NAB tool only builds homoduplex models from chemistries already experimentally determined, which tend to fit only A-type duplexes and provides only six chemistries with no user-input possibilities.
==== Comparing against the state-of-the-art
The quality of the model building is assessed by superpositioning generated models from NAB #mcite(("Macke1996nab"), biblio) vs. Ducque (Suppl. Inf.), which was done across all (twelve) residue pairs on heavy atoms, for ten models of DNA and RNA each per software. For DNA, mean RMSD value is 0.011 $angstrom$ ($plus.minus$ 0.005) with the lowest value being 0.004 $angstrom$. For RNA, mean RMSD value is 0.169 $angstrom$ ($plus.minus$ 0.042) with the lowest value being 0.109 $angstrom$. The near-zero RMSD showcases Ducque's qualitative output. For the interbasepair-parameters, we see that the Ducque structures are in good agreement with NAB's. Only the roll parameter, for RNAs, seems to slightly differ. This stems from the fitting protocol not rolling all nucleobases with the exact same value, as this feature is not hardcoded. 
The simulated structure for the DNA and RNA homoduplex experiments, generated by both NAB or Ducque, show equivalent RMSD trajectories, as is to be expected given the similarity of the starting structures.
Since all structures minimised without a problem, both the comparison of structural parameters and the following simulations indicate the quality of the generated structures.
With respect to wallclock building-time, NAB averaged 0.272 s and 0.245 s for DNA and RNA respectively. Ducque, averaging 0.328 s and 0.234 s for DNA and RNA respectively, takes infinitesimally longer for DNA as it considers multiple conformers during the fitting (benchmarked with Python3.12).

//
//
//
//
=== MD simulations on Ducque’s models validated with (X)NA structures in literature
#figure(
  image("./figures/hna_dxylo_simulations.svg"),
  caption: [
    *A* Superpositioning of RNA::HNA duplex, halved, onto [PDB ID : 2BJ6] #mcite(("Maier2005rnahna"), biblio) (sky blue). The crystal structures are superposed on either half of the generated duplex. 
    *B.* Close-up of the RNA::HNA duplex, showing standard stacking conditions (standard UCSF Chimera atom colouring kept).
    *C.* dXyNA::dXyNA homoduplex simulation. Change in duplex structure from the initial built model (lower left) to the end of the simulation; visualised.


  ]
) <fig-hna-dxylo>
To assess the quality of Ducque's models for MD simulations, a series of duplexes were studied, starting with (deoxy)-ribose based nucleic acids, which employed the standard AMBER DNA.OL15 and RNA.OL3 FFs. The simulated structures for the DNA and RNA homoduplex experiments, generated by both NAB or Ducque, show equivalent RMSD trajectories (Suppl. Inf.), as expected given the similarity of the starting structures. An MD simulation on a B-type DNA::RNA and A-type RNA::DNA duplex of identical sequence both built by Ducque, converged into the same A-like structure, as experimentally determined in Davis _et al._ #mcite(("Davis2015rnadna"), biblio) (Suppl. Inf.).
Secondly, an RNA::HNA duplex was built, using the lowest energy #super("4'")C#sub("1'") conformations of the PES #mcite(("Mattelaer2021efficient"), biblio) of the four nucleobases and were prepared and loaded into Ducque's library. A duplex was generated, taken by doubling the sequence from Maier _et al_., and a subsequent MD simulation resulted in a stable duplex that matches crystallographic results on sugar puckering as well as overall helical structure #mcite(("Lescrinier2000rnahna", "Maier2005rnahna"), biblio) (@fig-hna-dxylo A.B.). Differences in overall structures as low as 0.814 $angstrom$ across all pairs of the entire first half and 0.769 $angstrom$ across all pairs for the second half.
To emphasise, the HNA parameters were derived entirely from QM #mcite(("Schofield2023hnaaptamer"), biblio). _Nota bene_, so have the DNA and RNA torsion angle parameters, who've later on been tweaked based on additional QM studies and a collaborative effort with NMR #mcite(("Cornell1995secondgenff","Zgarbova2015dnaol15","Perez2007alphagamma"), biblio).
The difference is that the fitted conformations, used to derive the force field, were already known from literature, therefore conformational sampling was not necessary. A similar methodology will be applied to the MNA chemistry.
//The methodology of deriving torsional parameters for HNA has been validated already #mcite(("Schofield2023hnaaptamer"), biblio), which has also been applied to deriving the parameters for the MNA chemistry. 
A third experiment was performed with the dXyNA homoduplex. The dXyNA homoduplex is known to not conform to the helical shape commonly attributed to the native NAs. By implementing the dXyNA into Ducque, we showcase that Ducque can freely build with any type of NA duplex into its desired shape. This started out from a typical ladder-like structure #mcite(("Mattelaer2021dxylose"), biblio). During the MD simulation, the initial structure of the duplex undergoes a remarkable transition to a highly dynamic, left-handed helix (@fig-hna-dxylo C.) that matches the type II duplex previously described for xylose based nucleic acids #mcite(("Maiti2011deoxyxylose", "Ramaswamy2009xylonastruct", "Ramaswamy2017xylonastruct"), biblio), having significantly different backbone dihedral angles compared to those in the initial model. The backbone angles (Suppl. Inf.) show great variability in the values, which is attributed to how strong the impact of the sequence is on the stacking pattern of the basepairs. Where respectively subsequent purines or pyrimidines stack in the expected parallel fashion, a purine-pyrimidine step for dXyNAs staggers, as described in literature and observed in the simulation #mcite(("Maiti2011deoxyxylose"), biblio).
//
//
//The sequence itself was taken from crystallised RNA::HNA helices [PDB ID : 2BJ6] \cite{maier2005HNARNA} and then doubled in size. Structural and puckering data was retrieved from the last 25 ns of the simulation (see Figure \ref{fig:HNAduplex}, Figure \ref{fig:XNAtrajectories}B).\\
//We used the PES data of HNA \cite{mattelaer2021efficient} to import the lowest energy $^{4'}C_{1'}$ conformations of the four nucleobases into the Ducque repository. Together with an RNA::RNA structure of the same sequence, the two models were generated through Ducque and simulated for 200 ns. The RNA homoduplex is required to compare RNA::HNA to a standard A-type duplex of the same size, while the crystallographic structure serves as the experimentally validated reference. RMSD across 20 pairs equals to 3.21 \text{\r{A}} (Figure \ref{fig:HNAduplex}C). In \ref{fig:HNAduplex}D, first and last 10 basepairs of the RNA::HNA model are overlayed separately on the
//experimental RNA::HNA structure. RMSD equals to 0.814 \text{\r{A}} across all pairs of the entire first half and RMSD equals to 0.769 \text{\r{A}} across all pairs for the second half.
//We see that the structure coincides perfectly with the available crystallographic data for HNA \cite{maier2005HNARNA}. The puckering scatterplot (Figure \ref{fig:HNAduplex}A) for RNA shows clustering in the space of $^{3'}E$ conformers, while HNA conformers occupy the north pole conformational space $^{4'}C_{1'}$. This matches perfectly with the available structural data \cite{lescrinier2000RnaHna}.
//To emphasise, the HNA parameters were derived entirely from QM \cite{mattelaer2021PHD, Schofield2023HnaAptamer}. \textit{Nota bene}, so have the DNA and RNA torsion angle parameters, who've later on been tweaked based on additional QM studies and a collaborative effort with NMR \cite{cornell1995secondGenFF,zgarbova2011RNAOL3,zgarbova2015DNAOL15, Perez2007AlphaGamma}.
//The difference is that the fitted conformations, used to derive the force field, were already known from literature, therefore conformational sampling was not necessary.
//
//
//
//
//
//
///////
//   RNA MORPHOLINO
///////
=== Using the proposed workflow to gain insight in RNA::MNA
==== Quantum Mechanics to characterise the nucleosides and linker

#let fig-confs-morph = [
#figure(
  supplement: [Table],
  tablex(
    columns: 6,
    map-cells: cell => (..cell, content: text(cell.content, size: 10pt)),
    stroke: 0.5pt + colourPalette.lightblueslate,
    // Header
//    [Conformer]  , [mA#super($diamond.filled$)] , [mG#super($diamond.filled$)] , [mC#super($diamond.filled$)] , [mT#super($diamond.filled$)] , [$(theta, phi_2)$],
    [Conformer]  , [mA#super($smash$)] , [mG#super($smash$)] , [mC#super($smash$)] , [mT#super($smash$)] , [$(theta, phi_2)$],
    // Content
    [#super("4'")C#sub("1'")]  , [0.00 ]      , [ 0.00]      , [ 0.00]      , [ 0.00]      , [(  4.01, 119.75)]  ,
    [#super("2'")T#sub("3'")]  , [7.41 ]      , [ 7.48]      , [ 8.03]      , [ 7.64]      , [( 53.29, 150.11)]  ,
    [   E#sub("3'")  ]         , [15.41]      , [15.59]      , [15.83]      , [15.50]      , [( 53.29, 179.91)]  ,
    [#super("2'")S#sub("4'")]  , [10.64]      , [10.77]      , [11.25]      , [11.28]      , [( 93.97,  80.21)]  ,
    [#super("4'")S#sub("2'")]  , [7.59 ]      , [ 8.06]      , [ 8.97]      , [ 8.60]      , [( 93.97, 264.13)]  ,
    [#super("3'")E   ]         , [18.76]      , [19.39]      , [18.46]      , [18.40]      , [(126.62,   0.00)]  ,
    [#super("3'")T#sub("2'")]  , [8.90 ]      , [ 9.71]      , [ 9.35]      , [ 9.14]      , [(126.62, 330.02)]  ,
    [#super("1'")C#sub("4'")]  , [17.04]      , [17.65]      , [19.55]      , [19.15]      , [(175.90,   0.00)]  ,
  ),
  caption : [
    E#sub("rel") of the distinct conformers with energy values and their respective position on the CP-sphere's surface, per given nucleoside, _r_ is ommitted as this is assumed constant.  #super($smash$)E#sub("rel")  expressed in kcal/mol. 
  ]
) <tbl-ErelConformers>
]
#let content-confs-morph = [
Following the procedure described by Mattelaer _et al._ #mcite(("Mattelaer2021efficient"), biblio), PESs were generated for the morpholino nucleosides with adenine, guanine, thymine and cytosine nucleobases. We observed intramolecular hydrogen bonds in the initial calculations, inflating equatorial conformations towards higher energy potentials (Figure PESunrestrained). Those observed hydrogen bonds, which would not exist in a polymeric molecule, introduce a forced steric strain on the nucleoside that would not yield representative FF parameters that are applicable for simulations on //oligonucleotides. For the capped MNA variant (@fig-MethylMorpholinoPES, @tbl-ErelConformers), we see a global minimum on the north pole of the CP-sphere, a #super("4'")C#sub("1'") configuration for all four nucleosides. Local minima are observed mainly on the upper hemisphere, separated by large peaks corresponding to envelope configurations. Equatorial puckering modes tend to be more energetically favourable, with boats and skews alike. A final local minimum is observed on the southern hemisphere, in the East.
]
#grid(fig-confs-morph, content-confs-morph, columns: (7fr, 5fr), column-gutter: 1em)
#v(-0.5em)
/*which would not exist in a polymeric molecule, introduce a forced steric strain on the nucleoside that would not yield representative FF parameters that are applicable for simulations on */oligonucleotides. For the capped MNA variant (@tbl-ErelConformers, @fig-MethylMorpholinoPES), we see a global minimum on the north pole of the CP-sphere, a #super("4'")C#sub("1'") configuration for all four nucleosides. Local minima are observed mainly on the upper hemisphere, separated by large peaks corresponding to envelope configurations. Equatorial puckering modes tend to be more energetically favourable, with boats and skews alike. A final local minimum is observed on the southern hemisphere, in the East.

//Following the procedure described by Mattelaer _et al._ #mcite(("Mattelaer2021efficient"), biblio), PESs were generated for the morpholino nucleosides with adenine, guanine, thymine and cytosine nucleobases. We observed intramolecular hydrogen bonds in the initial calculations, inflating equatorial conformations towards higher energy potentials (Figure PESunrestrained). Those observed hydrogen bonds, which would not exist in a polymeric molecule, introduce a forced steric strain on the nucleoside that would not yield representative FF parameters that are applicable for simulations on oligonucleotides. For the capped MNA variant (@fig-MethylMorpholinoPES, @tbl-ErelConformers), we see a global minimum on the north pole of the CP-sphere, a #super("4'")C#sub("1'") configuration for all four nucleosides. Local minima are observed mainly on the upper hemisphere, separated by large peaks corresponding to envelope configurations. Equatorial puckering modes tend to be more energetically favourable, with boats and skews alike. A final local minimum is observed on the southern hemisphere, in the East.
//
//
//
//
#figure(
  image("./figures/MethylMorpholino_PES_InkScaped.svg"),
  caption : [
    Potential Energy Surface of the Morpholino Nucleic Acid. Methyl-caps substitued the HO6_'_ and NH3_'_ on the O6_'_ and N3_'_ atoms respectively, to mimic estimated backbone angles and prevent internal hydrogens bonds from occurring during geometry optimisations.
  ]
) <fig-MethylMorpholinoPES>

//
//
//
//
//
//
The N,N-dimethylaminophosphoramidate represents the linkage between successive morpholino nucleosides, where the N,N-dimethylamino mimics the effect of the preceeding mopholino ring. A sampling of the ($zeta$, $alpha$) dihedral dyad was carried out too.  Minima found at (t, g#super("+"), (t, g#super("-")), (g#super("-"), g#super("-")), (g#super("+"), g#super("+")) and (g#super("-"), ap#super("+")), @fig-PesLinker. A hard ridge ($alpha$ = 180$degree$ $plus.minus$ 30) splits the PES in two. Its cause is attributed to steric clashes during the sampling itself, due to methyls on either end of the linker residing in close proximity of one another at $alpha$ in the _anti_ range. 
//
//
//
//#figure(
//  supplement: [Table],
//  table(
//    columns: 6,
//  //    map-cells: cell => (..cell, content: text(cell.content, size: 10pt)),
//    stroke: 0.5pt + colourPalette.lightblueslate,
//    // Header
//    [Conformer]  , [mA#super($diamond.filled$)] , [mG#super($diamond.filled$)] , [mC#super($diamond.filled$)] , [mT#super($diamond.filled$)] , [$(theta, phi_2)$],
//    // Content
//    [#super("4'")C#sub("1'")]  , [0.00 ]      , [ 0.00]      , [ 0.00]      , [ 0.00]      , [(  4.01, 119.75)]  ,
//    [#super("2'")T#sub("3'")]  , [7.41 ]      , [ 7.48]      , [ 8.03]      , [ 7.64]      , [( 53.29, 150.11)]  ,
//    [   E#sub("3'")  ]         , [15.41]      , [15.59]      , [15.83]      , [15.50]      , [( 53.29, 179.91)]  ,
//    [#super("2'")S#sub("4'")]  , [10.64]      , [10.77]      , [11.25]      , [11.28]      , [( 93.97,  80.21)]  ,
//    [#super("4'")S#sub("2'")]  , [7.59 ]      , [ 8.06]      , [ 8.97]      , [ 8.60]      , [( 93.97, 264.13)]  ,
//    [#super("3'")E   ]         , [18.76]      , [19.39]      , [18.46]      , [18.40]      , [(126.62,   0.00)]  ,
//    [#super("3'")T#sub("2'")]  , [8.90 ]      , [ 9.71]      , [ 9.35]      , [ 9.14]      , [(126.62, 330.02)]  ,
//    [#super("1'")C#sub("4'")]  , [17.04]      , [17.65]      , [19.55]      , [19.15]      , [(175.90,   0.00)]  ,
//  ),
//  caption : [
//    E#sub("rel") of the distinct conformers with energy values and their respective position on the CP-sphere's surface, per given nucleoside, _r_ is ommitted as this is assumed constant.  #super($diamond.filled$)E#sub("rel")  expressed in kcal/mol. 
//  ]
//) <tbl-ErelConformers>
//
//
//
==== Force field parametrisation
The PESs of the four morpholino nucleosides succesfully provided valuable information on transitional pathways. By using the improper dihedrals ($alpha_1$, $alpha_2$, $alpha_3$) as restraints on the pyranose ring, we gained information of possible transitions of conformations as well as puckers we should be expecting. 
Conformations highlighted in @tbl-ErelConformers are conformations that were initially considered for parametrisation, specifically for fitting of the sugar torsion angles (see Fig. sphericalconvention for a reference to their respective physical location on the PES).
Parameters for dihedral terms of only the morpholino ring were refined by fitting to QM conformational energy #mcite(("Betz2015paramfit"), biblio) . In this procedure, the quality of the force field depends on the functionals and basis sets used for optimisations, as well as which conformations should be curated from the PES and included in the fitting process. The methylated ends were kept during optimisation and the fitting, as the initial problem of internal hydrogen bonds observed during PES calculation reappeared when reverting back to hydroxyls. Iterative curation of the returned parameters resulted in a simplification of the dataset; only the morpholino cytosine was included with the following puckers : #super("4'")C#sub("1'"), #super("2'")T#sub("3'"), #super("2'")S#sub("4'"), #super("4'")S#sub("2'"), #super("3'")T#sub("2'").

For the linker fragment, the minima and transition (g#super("-"),g#super("+")) conformers of the lower half were used to derive partial charges. Since upper half conformers are mirror images of the lower half, they were not considered.
The linker torsional parameters were obtained from GAFF2 #mcite(("Wang2004gaff"), biblio) and are in good agreement with the PES. (@fig-PesLinker C.). The ($zeta$, $alpha$) dihedral dyad values were extracted from the simulation and categorised into discrete integer values, for then to be normalised and plotted. This shows a clear and single peak at the (t, g#super("-")) range, which is in contrast with the standard phosphate, that stabilises in the (g#super("-"),g#super("+")) range in a DNA or RNA duplex #mcite(("Zhang2015polarizable"), biblio). This validates usage of the GAFF2 parameters for the linker. _Nota bene_, a single peak is attributed to the conformational constraints that the linker is submitted to in a polynucleotide chain, which clarifies why multiple minima are perceived in the PES, but only one can be inhabited.
//
//
#figure(
  image("./figures/Linker_PES_prevalence.svg"),
  caption : [
        Validation of the parametrised backbone N,N-dimethyl-O-methylaminophosphoroamidate linker; PES and torsional prevalence during the simulation. 
            *A.* The ($zeta, alpha$) dihedral dyad over which we extracted all conformers of the N,N-dimethyl-O-methylaminophosphoroamidate linker.
            *B.* Potential Energy Surface of the conformational landschape of the N,N-dimethyl-O-methylaminophosphoroamidate linker. 
            *C.* The prevalence of the ($zeta$, $alpha$) phosphoroamidate linker backbone, extracted from the last 50 ns of the 200 ns simulation. Data was extracted from the simulation and normalised according to the prevalence count of the dihedral dyad.
  ]
) <fig-PesLinker>
//
//
==== Molecular model of RNA::MNA
The RNA::MNA duplex was built in Ducque starting with a 24-mer RNA sequence corresponding to a double-Drew-Dickerson-Dodecamer (double-DDD : 5_'_-CGCGAAUUCGCGCGCGAAUUCGCG-3_'_, residues 1-24) with the geometry of an A-type duplex. All #super("4'")C#sub("1'") MNA nucleosides were ported into Ducque and queried as the complementary strand (residues 25-48). The obtained initial structure was subjected to an MM simulation. An RNA::RNA duplex with identical sequence was generated and simulated for comparative purposes.
Results of the simulation are summarised in @fig-fullRNAMNA. In the last 50 ns of the MD trajectory, a pronounced prevalence for the #super("3'")E conformation in the conformational wheel is observed for RNA nucleosides in both the dsRNA and heteroduplex model (@fig-fullRNAMNA C,D, Table backbone). The puckering modes for the morpholino rings observed  on the CP-sphere (@fig-fullRNAMNA C), in the same timeframe as stated earlier, largely correspond to the low energy regions of the PES (@fig-MethylMorpholinoPES) The scattered, equatorial conformers correspond to residues 30-31.
Their appearance correlate with a K#super("+")-ion that had been enclosed by two MNA residues (30-31) during the second half of the simulation. Its binding induced local backbone angles to deviate substantially from the other nucleosides, off-setting average and standard deviations (std.) parameters by several degrees. Up to four (25-28) residues had frayed (forming $C$, $E$ and $B$ conformers alike), causing residue 28 with guanine nucleobase (mG28) to have its $beta$ angle to twist into an unfavourable position. Structural changes due to K#super("+")-binding destabilised downstream stacking, which causes mA30 to lose pairing with its complement. This resulted in a nearby K#super("+")-ion to alter the $chi$ angle's orientation, of the freed nucleotide, from _anti_ to _syn_ #mcite(("Iupac1983nucleicacids"), biblio). The basepairing of mA30 with its complement was reinstated later, in Hoogsteen (HG), with the ion bound (@fig-ion2bbjustfig). The K#super("+") ion is coordinated by mT31:O6_'_, mT31:O5_'_ and mA30:N3_'_ in the MNA backbone and N3 of the nucleobase in mA30.

#figure(
  image("./figures/FULL_RNAMNA.svg"),
  caption : [
        Comparison of the RNA::MNA and RNA::MNA duplexes. Trajectory of the simulation in Fig. XNAtrajectories. Scatterplots are not to be confused with prevalence plots, as scatterplots do not represent normalised data, but represent all data extracted.
            *A.* Visualisation of the diameter and the helicity for the RNA::MNA duplex.
            *B.* Visualisation of the diameter and the helicity for the RNA::RNA duplex.
            *C.* Scatterplot to represent puckering modes of both RNA (leading) and MNA (complementary) during the last 50 ns of the simulation.
            *D.* Scatterplot to represent puckering modes of RNA (both leading and complementary) during the last 50 ns of the simulation.
  ]
) <fig-fullRNAMNA>
//
//
//
Coordination of K#super("+") by N3_'_ in the morpholino ring of mA30 forces it into metastable configurations (@fig-ion2bbjustfig), as can also be seen on the scatterplots, around the equator (Figure ResultFINALSIMRNAMNA C).
As this obvious abnormality is attributable to an odd occurrence of the simulation and not the FF itself, data of mA30 and m31 are excluded (Suppl. Inf.). This behaviour was not observed in the preliminary RNA::MNA simulations (Suppl. Inf.).
#let linker-param-table = [
#figure(
  placement: top,
  supplement: [Table],
  tablex(
    columns: 3, 
    map-cells: cell => (..cell, content: text(cell.content, size: 10pt)),
    stroke: 0.5pt + colourPalette.lightblueslate,

    // Header 1
    [*Helical Parameter*]                             , [*RNA::MNA*]                        , [*RNA::RNA*]  ,
    //Content 1
    [Helicity ($frac(angstrom,2pi)$)       ]  , [35.83 ($plus.minus$ 4.74)]              , [32.50 ($plus.minus$ 3.04)]  ,
    [BPs per turn $(frac("bp",2pi)$) ]  , [12                       ]              , [11                       ]  ,
    [Major Groove  ($angstrom$)            ]  , [15.90 ($plus.minus$ 3.30)]              , [ 9.86 ($plus.minus$ 3.21)]  ,
    [Minor Groove ($angstrom$)             ]  , [ 6.69 ($plus.minus$ 0.62)]              , [ 9.76 ($plus.minus$ 0.62)]  ,
    [Diameter ($angstrom$)                 ]  , [20.18 ($plus.minus$ 0.50)]              , [19.07 ($plus.minus$ 0.55)]  ,
    [Tilt      ($degree$)                  ]  , [-1.34 ($plus.minus$ 4.73)]              , [-0.05 ($plus.minus$ 4.61)]  ,
    [Twist     ($degree$)                  ]  , [28.06 ($plus.minus$ 3.99)]              , [29.64 ($plus.minus$ 4.18)]  ,
    [Roll      ($degree$)                  ]  , [ 5.51 ($plus.minus$ 6.27)]              , [ 7.37 ($plus.minus$ 6.42)]  ,
//    // Header 2
    [*Helical Parameter*]                             , [*RNA $chi_(189)$*]           , [*RNA $chi_(194)$*]  ,
//    //Content 2
    [Helicity ($frac(angstrom,2pi)$)       ]  , [35.54 ($plus.minus$ 2.89]              , [37.92 ($plus.minus$ 3.23)]  ,
    [BPs per turn ($frac("bp",2pi)$) ]  , [12                      ]              , [12 - 13                  ]  ,
    [Major Groove  ($angstrom$)            ]  , [ 9.98 ($plus.minus$ 3.17]              , [13.27 ($plus.minus$ 2.91)]  ,
    [Minor Groove ($angstrom$)             ]  , [ 9.64 ($plus.minus$ 0.49]              , [ 9.43 ($plus.minus$ 0.44)]  ,
    [Diameter ($angstrom$)                 ]  , [18.99 ($plus.minus$ 0.55]              , [18.91 ($plus.minus$ 0.60)]  ,
    [Tilt      ($degree$)                  ]  , [0.014 ($plus.minus$ 3.73]              , [-0.08 ($plus.minus$ 3.70)]  ,
    [Twist     ($degree$)                  ]  , [29.58 ($plus.minus$ 3.85]              , [28.70 ($plus.minus$ 3.85)]  ,
    [Roll      ($degree$)                  ]  , [ 4.35 ($plus.minus$ 5.46]              , [ 2.75 ($plus.minus$ 5.35)]  ,
  ),
  caption: figure.caption(position: top, [
    Helical parameters of the RNA::MNA heteroduplex in comparison with the RNA::RNA homoduplex (top), and the $chi$-restrained RNA::RNA homoduplexes (bottom. Data extracted from the last 50 ns of the 200 ns simulation. Grooves and helicity as determined in Saenger et al #mcite(("Saenger1984"), biblio). Tilt, twist and roll parameters, determined by the Curves+ software on a 1000 frames that were extracted over the whole length of the trajectory #mcite(("Lavery2009curves"), biblio) (see Suppl. Inf. for details on interbasepair parameters).
  ])
) <tbl-HelicalParams>
]
//
//
//
//
Except for the $chi$ dihedral angle with a deviation of 2.39-2.93$degree$, no significant differences in average backbone angles in the RNA backbone could be observed in the RNA::MNA duplex versus the model obtained for dsRNA (Suppl. Inf.).
However, helical parameters significantly deviate from the A-type duplex (@tbl-HelicalParams) with a deeper major groove, and conversely more narrow minor groove, an increase in basepairs per turn and therefore helical size, along with a larger diameter.
//

To investigate a possible correlation of the altered $chi$ angle in the RNA strand to the overall shape for nucleic acid duplex, we performed two supplementary RNA::RNA double-DDD simulations (Suppl. Inf.). While in the original simulations the $chi$ torsion angle was unrestrained, in the additional simulations restraints are applied on $chi$ torsion angles at 194$degree$ and 189$degree$ respectively to mimic the impact on the overall helix structure by increasing deviation from the 199$degree$ $chi$-angle in standard A-type duplexes, at 5 $degree$ increments.
The helical parameters of the RNA::RNA duplex with $chi$ torsion angles restraints at 194$degree$ are in line to those of the unrestrained RNA::MNA duplex (@tbl-HelicalParams, Suppl. Inf.). The observed deviations from the A-type duplex are more pronounced in RNA::RNA duplex with $chi$ torsion angles restraints at 189$degree$.

To compare the orientation of P atoms in the linker in complementary strands, the dot product of the cross product of the OP1-P-OP2 plane of the leading RNA nucleotide and complementary MNA nucleotide was calculated and compared to values obtained for corresponding base pairs in 3 simulations performed on dsRNA (@fig-LinkerOrient). Normalised distribution per duplex type shows a clear peak for the RNA::RNA duplexes around 137$degree$-139$degree$ while for RNA::MNA it peaks at 120$degree$-122$degree$. An overlay of a set of the unrestrained RNA::RNA and RNA::MNA C-G basepairs, shows that not only the oriention of P in the MNA strand is changed but also its position relative to the corresponding P in dsRNA.

#let orientfig = [
  #figure(
  image(
    "./figures/linker_orient_FINALvert.svg",
  ),
  caption : [
         *"A.* Calculated angles, by the dot product of the cross product of the OP1-P-OP2 plane of the leading nucleotide and complementary nucleotide.
         Sampled on 1000 frames, extracted from the entire simulation, of the double-DDD of RNA::RNA#sub("unrestr."), RNA::MNA, RNA::RNA#sub($chi$ + "189") and RNA::RNA#sub($chi$ + "194") respectively, for a total distribution of 23 000 angle values per duplex type.
         *B.* Normalised distribution per duplex type shows a clear peak for the RNA::RNA duplexes around 137$degree$-139$degree$ degrees, while for RNA::MNA it peaks at 120$degree$-122$degree$.
         *C.* Overlay of a set of RNA::RNA and RNA::MNA C-G basepairs, to visualize the displacement of P in MNA relative to the corresponding RNA in the homoduplex.
  ]
) <fig-LinkerOrient>
]
//#let linkerorientcontent = [To investigate a possible correlation of the altered $chi$ angle in the RNA strand to the overall shape for nucleic acid duplex, we performed two supplementary RNA::RNA double-DDD simulations (Figure ChiangleTrajPucker, ChiangleCurves). While in the original simulations the $chi$ torsion angle was unrestrained, in the additional simulations restraints are applied on $chi$ torsion angles at 194$degree$ and 189$degree$ respectively to mimic the impact on the overall helix structure by increasing deviation from the 199$degree$ $chi$-angle in standard A-type duplexes, at 5 $degree$ increments.
//The helical parameters of the RNA::RNA duplex with $chi$ torsion angles restraints at 194$degree$ are in line to those of the unrestrained RNA::MNA duplex (@tbl-HelicalParams, ChiBackbone). The observed deviations from the A-type duplex are more pronounced in RNA::RNA duplex with $chi$ torsion angles restraints at 189$degree$.
//
//To compare the orientation of P atoms in the linker in complementary strands, the dot product of the cross product of the OP1-P-OP2 plane of the leading RNA nucleotide and complementary MNA nucleotide was calculated and compared to values obtained for corresponding base pairs in 3 simulations performed on dsRNA (Figure LinkerOrientation). Normalised distribution per duplex type shows a clear peak for the RNA::RNA duplexes around 137$degree$-139$degree$ while for RNA::MNA it peaks at 120$degree$-122$degree$. An overlay of a set of the unrestrained RNA::RNA and RNA::MNA C-G basepairs, shows that not only the oriention of P in the MNA strand is changed but also its position relative to the corresponding P in dsRNA.
//] 
//#wrap-content(orientfig, linkerorientcontent)
#grid(orientfig, linker-param-table, columns: (1fr, 1fr), column-gutter: 1em)
#v(-0.5em)

