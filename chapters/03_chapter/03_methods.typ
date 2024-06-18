#import "../../lib/layout.typ": headingL5, pdb-code
#import "../../lib/multi-bib.typ": mcite
#import "../../lib/colours.typ": colourPalette
#import "bib_03_chapter.typ": biblio
#import "@preview/tablex:0.0.8": tablex

#show "HAPT": [_hApt#super("50")_]
#show "Core13" : [_Core-13_]
#show "Core14" : [_Core-14_]
#show "Gq" : [_Gq_]

#let conform(conf, upper, lower) = {
  [#super(upper)#conf#sub(lower)]
}

== Experimental studies
=== Laboratory experiments (Collaborators's work)
The following laboratory experiments have been extensively detailed in Schofield _et al_. #mcite(("Schofield2023HNAaptamer"), biblio).
==== Truncation experiments
//! een klein beetje vertellen over de manier hoe dat ze SPR en BLI gebruiken.
//Since the sequence of the _Lys-S8-19_ aptamer, hereafter HAPT (refering to its size of 50 nucleotides), had already been identified, chemical synthesis of the HNA nucleotides for the following experiments #mcite(("Lagoja2003HNAsynthesis"), biblio).  
Sequences of the original _Lys-S8-19_ aptamer, hereafter HAPT (refering to its size of 50 nucleotides) were shortened on head and tail ends, to search for the motif with the maximum potential. Enzymatic processing employed the HNA polymerase with the usage of specifically designed DNA templates with in-house synthesised hNTPs #mcite(("Lagoja2003HNAsynthesis"), biblio).
Truncated HNA aptamers were subjected to a Surface Plasmon Resonance (SPR) study #mcite(("Homola2008SPR", "Rubio2016SPR"), biblio). To highlight, SPR is a label-free, optical detection method for the binding affinity and kinetics of molecular interactions. Elaborating further, a solid gold plate contains excitable electrons. Upon pointing a polarised light source at this gold plate, electrons will absorb some of the emitted energy. A detector can measure the loss of intensity and the refracted angle of the outgoing light. In this particular experiment, the HEL enzyme is affixed to the gold plate, where this plate is in direct contact with a glass sheet that allows for reflection of the incoming light. Binding of the ligand (the truncated aptamers) to the stationary protein will influence the behaviour of the electrons in the plate. Subsequent application of polarised light onto the surface will return a difference in angle (Refractive Index) and intensity. This change can be measured and directly correlated with dissociation constants, giving us information on kinetics and affinity. This methodology makes it possible to measure the rate of interaction with the various aptamers against the HEL enzyme. As a result, the Core-14#super("38") and Core-13#super("33") (@tbl-aptamerSequences) showed longer retention and enhanced affinity towards the enzyme. A BioLayer Interferometry (BLI) study confirmed a binding affinity of 31nM for the HAPT #mcite(("Schofield2023HNAaptamer"), biblio).

#show table.cell.where(y: 1): set text(size: 9pt)
#show table.cell.where(y: 2): set text(size: 9pt)
#show table.cell.where(y: 3): set text(size: 9pt)
#let tag1(name) = table.cell(text(fill: rgb("#fff6d4").darken(30%), name))
#let tag3(name) = table.cell(text(fill: rgb("#dbcee6").darken(30%), name))
#let core(name) = table.cell(align(center, name))
//#let core(name) = table.cell(text(name, size: 10pt))
#figure(
  supplement: [Table],
  tablex(
    columns: 6,
    map-cells: cell => {
    if cell.y > 0  {
      cell.content = {
        set text(size: 9pt)
        cell.content // also return the cell content
      }
    }
    if cell.x == 1  {
      cell.content = {
        set align(right)
        cell.content // also return the cell content
      }
    }
    cell
  },
//    map-cells: cell => (..cell, content: text(cell.content, size: 10pt)),
    stroke: 0.5pt + colourPalette.lightblueslate,
    // Header
    [ ]  , [tag1] , core[core] , [tag3] , [Length (nt)] , [SPR UR#sub("max")],
    // Content
    [HAPT]  , tag1[AGGTAGTGCTGTTCG]      , [TTTAAATGTGTGTCGTCG]      , tag3[TTCGCTATCCAGTTGGC] , [50]      , [80]  ,
    [Core13]  ,        tag1[GTTCG]      , [TTTAAATGTGTGTCGTCG]      , tag3[TTCGCTATCC]      ,   [33]      , [114]  ,
    [Core14]  ,   tag1[GTGCTGTTCG]      , [TTTAAATGTGTGTCGTCG]      , tag3[TTCGCTATCC]      ,   [38]      , [113]  ,
  ),
  caption : [
    _Tag1_ and _tag3_ are primers sequences that were initially pre- and appended to the core sequence as primers for SELEX to work. The outcome is that the _tags_ are of significance to the functionality of the HNA aptamer. This table is a truncated version of the original.
  ]
) <tbl-aptamerSequences>
//This involves HNA synthesis #mcite(("Hendrix1997HNAsynthetic"), biblio), truncating  measuring binding capability through SPR surface plasmon resonance, BLI biolyaer interferometry.
//! Hier een figuur komen over de truncation experimenten en welke sequent uiteindelijk te beste was (core 13 ; 14)

\
==== Functional characterisation of the HNA aptamer
===== Competition assays
The whereabouts of the epitope of the Core14 aptamer was assessed to understand structural binding motifs. Several antibodies, like the camelid V#sub("H")H (nanobody) D2-L24 [#pdb-code("1ZVH")], D3-L11 [#pdb-code("1ZVY")] and D2-L19 #mcite(("DeGenst2006camelidHEL"), biblio), the human V#sub("H") H04 and D05 #mcite(("Rouet2015HumanAb"), biblio) [#pdb-code("4PGJ"), #pdb-code("4U3X")] and the V#sub("L") VL5 and VL12 #mcite(("Rouet2017HumanAb"), biblio) [#pdb-code("4N1E"), #pdb-code("4N1C")], and the HyHEL5 [#pdb-code("3HFL")] and HyHEL10 antibodies #mcite(("Cohen1996hyhel"), biblio). It is noted is that D2-L24 Nb and the HyHEL Ab do not bind in the active site cleft, but on the opposite site, which is in contrast with the other mentioned Abs.
The assay revealed that HyHEL10 and especially D2-L24 resulted in the most competition with the Core14 aptamer (@fig-hel-heatmap). From previous research on the D2-L24, we know exactly where it binds and can run mutational scans on its surface to understand which key residues are required for binding.

===== Epitope mapping
An alanine scan, meaning select residues are mutated from amino acid _X_ to an _alanine_, was carried out on the HEL enzyme to deduce which amino acids are crucial to the binding interaction between the nanobody and the aptamer respectively. This study reveals the nanobody's binding is mainly directed by the Y53, D66 and R84 surface residues (@fig-hel-heatmap B.), while the aptamer is more affected by mutations on the neighbouring residues R61 and 73R (@fig-hel-heatmap C.).
//! hier een figuur over het HEL enzyme, toon de cleft waar de activiteit gebeurt en vertel dat er veel antilichamen zijn tegen dit enzyme. Er was specifieke competitie met de Fab HyHEL10 en met het camelid domain VHH D2-L24 voor binding. Er was zeker geen competitie met H06 human single VH domain die voornamelijk interageert met de active site cleft.

//! Figure made with ChimeraX
// -> Surface HEL enzyme : lavender
// -> Low  : #B0D0D5
// -> Mid  : #89A6AA
// -> High : #527A80
//===== Epitope mapping
#figure(
  image("./figures/hel-epitope.svg", width: 100%
  ),
  caption : [
    Adapted figure from the original manuscript #mcite(("Schofield2023HNAaptamer"), biblio) *A.* Surface model of the HEL enzyme [#pdb-code("1ZVH")] #mcite(("DeGenst2006camelidHEL"), biblio). The active site cleft, responsible for enzymatic catalysis, and the binding site of the D2-L24 nanobdy are located on opposite sides of the protein. *B.* Heat Map of the alanine scan performed on the HEL enzyme and the subsequent altered binding capacity of the D2-L24 nanobody. *C.* Heat Map of the alanine scan performed on the HEL enzyme and the subsequent altered binding capacity of the Core14 aptamer.
Darker regions are correlated with a more impactful difference in retained binding.
  ]
) <fig-hel-heatmap>
===== Identification of the G-quadruplex (Gq) <sec-identifygq>
One possibility of assessing structural characteristics of the Core14 aptamer, is to probe it with conformation-specific antibodies. The BG4 Ab #mcite(("Biffi2013GqAntibody"), biblio) is able to report on Gq structures in large DNA molecules. With the use of a negative control (human Ab Herceptin #mcite(("Carter1992Herceptin"), biblio)), it was unequivocally determined that Core13 and Core14 contain a Gq structures. A mutational analysis was provided, by changing Guanosine residues to Adenosine, and assessed by incubating with the anti-Gq Ab. The results showed that hG#sub("1"), hG#sub("13"), hG#sub("20") and hG#sub("23") were essential for the Ab to recognise the aptamer. This finding also comes with the appendage that the applied Ab seems indifferent to the sugar chemistry used in nucleosides. Additionally, the nucleoside mutation studies found that hT#sub("3"), hA#sub("11") and hT#sub("29") are needed for Core13's binding activity to HEL or for the structural integrity of the molecule itself. The upcoming Molecular Dynamics study will be specifically carried on Core13 as it contains 33 residues, five less than Core14, to minimise the degrees of freedom of the experiment.
//
//
//
//
=== Molecular Modeling
Molecular graphics and analyses performed with UCSF ChimeraX, developed by the Resource for Biocomputing, Visualization, and Informatics at the University of California, San Francisco #mcite(("ChimeraX"), biblio). This part has been fully detailed, and contains more experiments, in the Ph.D. thesis of dr. Charles-Alexandre Mattelaer #mcite(("mattelaer2021PHD"), biblio). The following section will paraphrase its method's section and the search for the initial structure.
\
\
==== Parametrisation
//Orca and conformational sampling
//Paramfit
Since XNAs are comparatively niche in usage, both in _wet_ and _dry_ lab, force field parameters are generated only for these specific use cases. As there exists no HNA force field with fitted parameters for the bonded terms, it was decided to revisit the entire parametrisation.
The force field consists of two major parts.  

===== Charge Derivation
The R.E.D. server #mcite(("Vanquelef2011RED"), biblio) was used to compute point charges of the nucleosides. To make AMBER compatible charges, the molecule needs to be subjected to the Merz-Kollman population analysis scheme (MK) at the HF/6-31G\* level #mcite(("Singh1984MK"), biblio). The #conform("C", "4'", "1'") conformation of the four different nucleosides (A, C, G, T) were applied to this protocol. The sugar moieties were equivalenced across all four molecules. Identical atoms, like the hydrogens to the amine off the purine ring, are also equivalenced individually. The returned electrostatic potentials (ESPs) were further refined using the Restraint ESP (RESP) fitting protocol #mcite(("Bayly1993RESP"), biblio) to account for buried carbons in methylenes in the sugar moiety. The buried carbon are a results of the population analysis protocol that makes use of the Solvent-Excluded-Surface (SES) volume around the molecule. The grid generated on this surface is used to derive the ESP itself. The hydrogens in methylene moieties therefore _bury_ the carbon, obfuscating its stake during the MK charge derivation; RESP corrects this.

#let text-confs = [
===== Bonded-term fitting
Since bondlength and angle bending parameters remain steady across all ranges of organic molecules, only the torsion term requires fitting. 
At first, a conformational path through which the HNA chemistry could naturally move through was researched. Conformations were optimised using the ORCA computational chemistry package #mcite(("Neese2020ORCA"), biblio), employing the PBE0/ma-def2-svp method #mcite(("Adamo1999PBE0", "Zheng2010madef2"), biblio).  After having defined these pathways (@fig-pathway), a Nudged Elastic Band #mcite(("Asgeirsson2021NebTS"), biblio) protocol was applied to gather intermediary conformations between the established puckering modes. A total of 192 total conformations were fitted, meaning 48 distinct and intermediary conformations per nucleobase, to fit the behaviour of the HNA chemistry to the forcefield. The fit itself was done using the _Paramfit_ script, provided within AMBERTools #mcite(("Betz2014paramfit"), biblio).
]

// figure made using pucke.py module to generate conformers
// Got em :  4'C1', 1'C4', o5'H5' , o5'H1', 3'S1', O5'S2', 
// To make : 3'H4', 3'H2' 
#let fig-confs = [
#figure(
  image("./figures/conformationpathway.svg", width: 100%),
  caption: [
    Adapted figure from " _Structure and folding of XNA aptamers studied by computational and experimental methods_ (Figure 4.5)" #mcite(("mattelaer2021PHD"), biblio).\
    Two distinct pathway for an HNA nucleoside to go from #conform("C", "4'", "1'") (North Pole pucker) to #conform("C", "1'", "4'") (South Pole pucker).
    *A.* First pathway goes #conform("C", "4'", "1'") $arrow.r$ #conform("H", "O'", "1'") $arrow.r$ #conform("S", "3'", "1'") $arrow.r$ #conform("H", "3'", "4'") $arrow.r$ #conform("C", "1'", "4'").
    *B.* Second pathway goes #conform("C", "4'", "1'") $arrow.r$ #conform("H", "O'", "5'") $arrow.r$ #conform("S", "O'", "2'") $arrow.r$ #conform("H", "3'", "2'") $arrow.r$ #conform("C", "1'", "4'"). 
    Conformations generated using the _pucke.py_ library. Blue ball on the _C2'_ carbon denotes the nitrogen that is part of the glycosidic bond between the nucleobase and sugar moieties and represents an abstraction of the nucleobase itself.
  ]
) <fig-pathway>
]

#grid(text-confs, fig-confs, columns: (1fr, 1fr), column-gutter: 1em)
//==== Forcefield
==== Molecular Mechanics
//#lorem(20)

===== Simulated Annealing (SA)
A methodology that virtually increases the thermostat during a simulation run, in order to overcome energy barriers imposing by the force field, as a result of the nature of the molecule itself. This is characterised by a heating segment up to a preset temperature, a segment that allows the simulated molecule(s) to discover new conformational pathways as the barriers can now be crossed, and a cooling segment to relax the model. This is often done to explore the conformational diversity in molecules.

===== Replica Exchange MD (REMD)
The REMD protocol is similar to the SA protocol, but includes multiple replicas to conduct the experiment with. The respective simulations are started using the same model, but vary in starting conditions. Along the trajectory, the replicas will have differentiated in structure and therefore potential energy. Iterating and comparing over the different simulations, a check will be run to assess similarity between the produced models. By being positively congruent, simulation conditions are swapped between two respective runs. The result is to gather many different samplings of the initial replica to vary the conformation space, in this particular case. This protocol is also far more intensive on resources than SA, but produces a larger variety of configurations the simulated molecule can adopt.


===== Molecular Dynamics
All simulations were performed using AMBER18 #mcite(("Lee2018Amber18"), biblio). The exploratory replica exchange molecular dynamics (REMD) simulation was performed for 1µs with an exchange attempt frequency of 0.1 ps#super("−1") (timestep 0.002 fs). A total of 20 replicas were spaced between a simulation temperature of 300 and 506 K #mcite(("Patriksson2008RMED"), biblio). Langevin dynamics with a collision frequency of 1 ps#super("−1") was employed while applying SHAKE #mcite(("Ryckaert1977SHAKE"), biblio) to restrain bonds involving hydrogen atoms. Implicit solvation with a theoretical salt concentration of 0.2 M was included.
The proposed model itself was generated using an iterative (SA) approach where additional restraints were included in each step. Each SA step consisted of an equilibration step at 300 K (5 ps), short heating to 500 K (5 ps), a longer cool down period to 300 K (170 ps) and finally another equilibration at 300 K (20 ps). The timestep was set to 0.002 ps per MD step. Langevin dynamics with a collision frequency of 1 ps#super("-1") was employed while applying SHAKE #mcite(("Ryckaert1977SHAKE"), biblio) to restrain bonds involving hydrogen atoms. The initial model was generated after eight rounds of SA where interatomic distance restraints together with dihedral restraints were arbitrarily chosen to prevent the formation of steric clashes due to restraints. The first six rounds added restraints cumulatively. In the eight rounds of SA, planarity restraints were additionally applied on residues 1–13-20–23. A force constant of 5 $frac("kcal · Å"#super("2"), "mol")$ was employed for the restraints on interatomic distances and 20 $frac("kcal · rad"#super("2"), "mol")$ for the dihedral restraints. 


The initial model was relaxed within the conformational space governed by the set restraints in a REMD experiment for 400 ns. The restrained REMD was setup identically as previously described, only adjusting the number of replicas (16) and reducing the exchange attempts to reduce the simulation time. After cluster analysis, the structure with the lowest energy in the implicit solvent was chosen for the prolonged MD simulation in explicit solvent.

A K#super("+") ion was placed at the center of the Gq structure in the initial model , four Na+ and 26 K+ ions were added to represent experimental conditions and neutralize the molecule. 5646 TIP3P water molecules were added in a truncated octahedron that extends 12 Å from the molecule. After iterative rounds of MD, it was decided that a Mg#super("2+") ion was to be placed between phosphate moieties of hG20 and hT12.  Prior to the 1 µs unrestrained MD, a 50ns restrained MD was performed with restraints on the residues of the Gq, the TAT triplet and the two stabilising ions. For all simulations, a cutoff value of 10 Å was used for long range and electrostatic interactions.

The solvated molecule was minimized using 10 000 steps of steepest descent followed by 40 000 steps of conjugate gradient minimization. Langevin dynamics with a collision frequency of 1 ps#super("−1") was employed for all subsequent MD simulations while applying SHAKE to restrain bonds involving hydrogen atoms. After the minimization, the system was heated to 300 K in 50 ps (timestep 0.002 ps) while keeping the volume constant. The density was equilibrated afterwards in 1 ns (timestep 0.002 ps) while keeping the pressure constant. The restraints were subsequently reduced over the course of 50 ns (timestep 0.002 ps). Finally, a 1 µs production MD (timestep 0.002 ps) without any restraint was performed to check the stability of the proposed model. A mutant was run under the same condition in explicit solvent, the G27A variant, after the final HNA aptamer model was conceived, to discuss its biological implication.


// - Heel simpele uitleg over MD zaken, eigenlijk de standaard parameters voor een simulatie. 
// - Ook uitleggen dat het force field van CA-M zijn werk komt.
// - Uitleggen hoe de iteratieve methode tot stand is gekomen, dat er in het begin simulated annealing aan te pas kwam
// - Later ook van een 29mer naar een 33mer is gegaan
