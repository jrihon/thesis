#import "../../lib/colours.typ" : colourPalette
#import "../../lib/multi-bib.typ": mcite
#import "bib_03_chapter.typ": biblio
== Introduction
//
// One problem is that in our introduction of the thesis, we are already going to mention a bunch of applications of XNA, so here we should not repeat ourselves.
//=== Current background on aptamers
//This thesis has gone through the fundamentals of nucleic acid behaviour and applied this to XNA therapeutics in antisense oligonucleotide (ASO) research. 
//Branching out in a different direction, we encounter the scientific field of aptamers. These aptamers, derived from the Latin word _aptus_ "to fit", are often single-stranded oligonucleotides that can adopt a sequence-specific three dimensional form. This provides the property to selectively recognise and bind molecules, ranging from small compounds to larger protein complexes. This means that aptamers can be applied in similar therapeutic and diagnostic applications as the common antibody (Ab) and, more specifically for this chapter, the nanobody (Nb) #mcite(("Mayer2009AptamerReview", "Adachi2019AptamerReview"), biblio)
Aptamers, derived from the Latin word _aptus_ "to fit", are often single-stranded oligonucleotides that can adopt a sequence-specific three dimensional form. This provides the property to selectively recognise and bind molecules, ranging from small compounds to larger protein complexes. This means that aptamers can be applied in similar therapeutic and diagnostic applications as the common antibody (Ab) and, more specifically for this chapter, the nanobody (Nb) #mcite(("Mayer2009AptamerReview", "Adachi2019AptamerReview"), biblio)
//
//The production of antibodies brings about many ethical dilemmas and costs an extraordinary amount of resources. They are typically conceived by introducing a protein of interest to the immune system of a living organism, oftentimes in rodents and camelids.
//Maintenance of animals and downstream processing of antibodies is time consuming and a burden on finances.
These are typically produced by introducing a protein of interest to the immune system of a living organism, oftentimes in camelids. The goal is for the immune system to recognise the protein as a foreign intruder, thereby encouraging the immune system to develop targetted antibodies. The maintenance of such animals brings about many ethical dilemmas and the downstream processing of such Abs costs an extraordinary amount of resources to generate and extract these molecules. Additionally, should these be used for therapeutic indications, the patient themself might reject the adminstered drug over time by producing their own anti-antibodies, rendering these therapies useless over time. A cheap and non-immunogenic alternative to Abs is therefore highly sought after in the world of medical sciences #mcite(("Golay2012Abreview", "Muyldermans2020Nbreview"), biblio).

//==== Systematic evolution of ligands by exponential enrichment (SELEX)

#let content-selex = [In contrast, the conception of new aptamers is realised through the SELEX method (Systematic evolution of ligands by exponential enrichment). This methodology requires no interference of living organisms and can be entirely done _in vitro_ . This employs general Polymerase Chain Reactions (PCRs), an extremely common methodology to produce a quantitatively amplified pool of nucleic acid strands. The researchers start with a randomised library of 10#super("8") - 10#super("14") amounts of such strands. These molecules are incubated with the target. The goal is to gather as many good binders as possible to the target molecule, after which non-functional strands are washed away after incubation. These binders are then dissociated from the target and amplified using the PCR step (@fig-selex). Multiple cycles are required to end up with a pool of strands that are theoretically specific enough to hone in on the desired target while also portraying a high affinity to it. A major upside to aptamers is that, since they are composed of nucleic acid compounds, they rarely elicit immunogenic reactions. Flipping the proverbial coin, aptamers are prone to efficient degradation in the human bloodstream, as they are composed of native NAs. #mcite(("Mayer2009AptamerReview", "Dunn2017AptamerDiscovery"), biblio)
] 

#let figure-selex = [#figure(
  image("./figures/selex-process.svg", width: 100%),
  caption: [Simplified schematic representation of the inner workings of _Selex_ . *A.* The target is  incubated with a pool of randomised sequence strands. *B.* Non-functional strands are washed away and the remaining candidate aptamers are *C.* amplified through a PCR reaction. This cycle is continued several times to achieve a library of binders specific to the desired target.],
) <fig-selex>]

#grid(content-selex, figure-selex, columns: (5fr, 3.5fr), gutter: 1em)
//Just like with antibodies, we present a target to which we wish to make an antagonistic agent for. Only the difference is that we do not use living organisms to immunise against a certain target, but instead generated a randomised library of 10#super("8") - 10#super("12") amounts of strands. Here, the idea is that some aptamers to both specifically and unspecifically. After rounds of binding, washing and amplifying the remaining binders, the researcher should be left with a set of aptamers that should bind the specified target like a homing missile. Analysis of the set entails characterising the affinity to the target, which ultimately decides if the aptamer is fit for usage.
//A major upside to aptamers is that, since they are composed of nucleic acid compounds, they rarely elicit immunogenic reactions. 
//Flipping the proverbial coin, we do find aptamers to be prone to efficient degradation in the human
//#v(-0.4em)

=== Prelude to the HNA aptamer
//This leads to the following engineering of a HNA polymerase.
Since SELEX depends on an NA polymerase for the PCR step, the development of nuclease-resistant XNA aptamers could only be realised if engineering such an XNA processing enzyme.
//by feats of engineering in the field of _Directed Evolution_ (DE).
The work "_Synthetic genetic polymers capable of heredity and evolution_" details on the _Directed Evolution_ (DE) paradigm to modify a wildtype (WT) TgoT polymerase to process the HNA chemistry. This polymerase was then applied in rounds of SELEX to procure the first HNA aptamer to exist #mcite(("Pinheiro2012geneticpolymer"), biblio).
==== Compartmentalized Self-Tagging (CST)
The first experiment explored different XNA chemistries that are capable of pairing with DNA and RNA; the 1,5-anhydrohexitol NA (HNA), cyclohexenyl NA (CeNA), arabino NA (ANA), 2'-Fluoro-RNA (FNA), locked NA (LNA) and threose NA (TNA). The selection strategy, CST, was developed and put to the test #mcite(("Pinheiro2014CST"), biblio).
The goal is to introduce mutations to the polymerase enzyme and select enzyme candidates that manipulate the desired XNA. 

//A library of plasmids, containing the gene of the TgoT polymerase, are individually expressed in separate bacteria.
A library of plasmids is generated, which contain randomly mutated copies of the gene of the TgoT polymerase. Individual bacteria are transfected with such a plasmid, where they then express express their particular copy of the polymerase enzyme.
In theory, the different plasmids contain a variety of mutations to the polymerase gene to increase the odds of producing an enzyme that carries out succesful extensions with an XNA chemistry. A suspension of bacteria, together with XNA nucleotide triphosphates (xNTP) and biotinylated primers, is emulsified in a water-oil emulsion. These tiny oil droplets, which contain the three aforementioned components, create the compartiments for the subsequent experiment. 
The bacteria are lysed through heat disruption, exposing its intracellular content in the compartiment. The mutated TgoT polymerase can then process the bacterial plasmid by making use of the biotinylated primer that has adhered to a specific sequence of the plasmid. Only xNTPs are present, which pressure the system to only make use of synthetic building blocks. If the enzyme was positively mutated, a complementary strand of XNAs is appended to the primer and the primer-plasmid complex will remain intact for the remainder of the experiment.
Recovering the results means the compartiments are disrupted and the complexes are captured using streptavidin-coated beads. After post-processing, the plasmid that contains the mutated gene for the evolved polymerase can undergo another round of selection.
This methodology, together with random mutagenesis, resulted in the evolved HNA polymerase, which is capable of cross-talking to and from DNA #mcite(("Pinheiro2012geneticpolymer"), biblio). 

==== HNA Aptamer against the Hen Egg Lysozyme (HEL)
Rounds of SELEX with the engineered HNA polymerase revealed a hit with a dissociation constant between 107 and 141 nM, showed very little cross-reactivity with human lysozyme and did not show binding to the positive controls bovine serum albumin and streptavidin. With this aptamer, assigned the name _Lys-S8-19_, research was continued by characterising its binding properties and secondary structure thoroughly.






=== NA secondary structure prediction

// Rewrite and paraphrase
Garnering information on the secondary structure of folded NA strands guides us towards insights on their functioning. A popular example is that of RNA thermometers. These sequence-dependent hairpin structures within coding regions of mRNA are highly temperature-specific and can be transcribed upon denaturating. At normal condition, these hairpins hide ribosome binding sites (RBS), disabling transcription and further production of proteins from that particular sequence. Under elevated stress condition however, like with heat shock responses, the RBS becomes exposes and a proper reaction is triggered to handle the incoming stimulus. Gene expression is also regulated by small RNAs (sRNAs), which hybridise with mRNA to modulate regular cell functioning by either destabilising a nearby RNA thermometer or by blocking an RBS from being read by the nucleic acid processing macheriny #mcite(("Mortimer2014RNAstructreview", "Raden2018RNAstructures"), biblio).

Uncovering the secondary structure of a sequence of interest does not come easily. Especially with the rise of Next-Generation Sequencing (NGS), literally billions of sequences circulate in the biological realm. Assessing their structure through classical physicochemical approaches would be a tremendous burden on resources and would not be an effective way of carrying out research either way. 
The solution to this is computing the most likely secondary structure for a given sequence. A popular approach is through a primordial computer science paradigm, called Dynamic Programming (DP) #mcite(("Eddy2004whatisDP"), biblio). For a problem to be handled through the DP paradigm, it needs to portray the condition that the main problem can be partitioned into locally scoped problems that can all be solved in exactly the same way. Essentially, a global problem is solved by recursively solving for many of the same subproblem, where the subproblems vary in local parameters.
//This local problem is always dependent on the solution of its neighbouring local problems, or until a basecase is hit.
To highlight this with a topical example, the DP paradigm is used in synergy with standard thermodynamical parameters devised for RNA hybridisation. These parameters consist of calculating for _hybridisation free energy_, _nearest neighbour interactions_ and _local conformations_ (bulges, loops) of all the possible basepairing partners for a given sequence. When iterating over a selfcomplementary biopolymer strand, we can store all basepairing possibilities. Given a set of conditions (like A::U, G::C and G::U pairing) we can encourage advantageous matches and discourage mismatches or short bulges, which ultimately solve for one or several secondary structures #mcite(("Waterman1978Smith"), biblio). _Nota bene_, DP methodologies have also been used for popular Multiple Alignment Sequence methods and other combinatorial problems in bio-informatics. 

Nowadays, the thermodynamic portion has been extensively studied and expanded to include many types of substructures #mcite(("Raden2018RNAstructures"), biblio). One particular problem the field still encounters is accounting for pseudoknots and G-quadruplexes. A second problem, specific to our research domain, is the abscence of thermodynamic parameters for the HNA chemistry. While RNA has enjoyed over fifty years worth of research in any biomedial field imaginable, HNA has not been as fortunate due to the comparatively niche usage of synthetic NAs.
Solving the tertiary structure of this aptamer through NMR or X-ray crystallography has not returned us with positive results.
Our goal is to match what is described about the HNA aptamer on the _wet lab_ side, and fulfill the _dry lab_ aspect to the best of our ability by using all aspects of Molecular Modeling to produce a three dimensional model of the aptamer.

//An example is given with the ever prevalent tRNA molecules, which are hyperspecific sequences that guide the synthetis of polypeptide chains in any eurkaryotic and prokaryotic cell. 
//The function of many RNA species is guided by their structure that is defined by the formation of intramolecular base pairs. For instance, prokaryotic small RNAs show evolutionary conserved unstructured regions that regulate the expression of their target mRNAs via intermolecular base pairing . #mcite(("Raden2018RNAstructures"), biblio)
// Praten over de background
// -> vermeld dat dit werk een verderzetting is van het werk van dr. C.-A. Mattelaer en link naar de thesis! Credits voor het forcefield en als ze meer willen lezen is dat goed.
//
// - Een heel ingewikkelde achtergrond verhaal voor waarom XNAs bestaan.
// - De introductie van de HNA paper is gewoon een opsomming voor welke aptameren en tegenwoordig bestaan en hoe ze gebruikt worden.
// => "We gaan eigenlijk uitzoeken waarom dat Vitor zijn HNA aptameer werkt."
//  TODO: Lees Vitor zijn HNA aptameer Science paper " Synthetic genetic polymers capable of heredity and evolution "
//
