#import "../../lib/colours.typ": colourPalette
#import "../../lib/multi-bib.typ": mcite
#import "bib_00_chapter.typ": biblio



// Xenobiotic Nucleic Acids
== The Nucleic Acid molecule
//
Once upon a time, in 1869 in the Kingdom of Württemberg - now Germany, a Swiss scientist by the name of Friedrich Miescher discovered a precipitate substance that would not be susceptible to enzymes that would otherwise degrade lipids and proteins #mcite(("Dahm2007discoverDNA"), biblio). It was described to be high in phosphorous and was dubbed _nuclein_ as it originates from the nucleus of the cell. 
Later in 1928, the British bacteriologist Frederick Griffith discovered throughout his many years on the study on _pneumococcus_ strains that bacteria are able to transfer their genetic material, something we nowadays casually refer to as _bacterial transformation_. He devised that a non-virulent strain of bacteria, that would not harm the utilised mice in the experiment, could be inoculated with heat-inactivated virulent strains to receive their pathogenic properties. This resulted in mice succumbing by being exposed to a formely benign _pneumococcus_ strain #mcite(("Griffith1928bacteria"), biblio).
It wasn't until the famed _Avery–MacLeod–McCarty experiment_ in 1944 that nucleic acids (NAs) were determined to be the bearers of this genetic material. At the time, proteins were initially considered to portray this property and this empirical evidence revolutionised the idea to the outside world, as the analogy from bacteria to human cells would not be that farfetch'd #mcite(("Avery1944macleodmccarty"), biblio).

Only a handful of years later, in 1953, was the helical structure of this deoxyribose nucleic acid (DNA) unveiled by Watson and Crick, whose validity was backed by the experiments done by Rosalind Franklin #mcite(("WATSON1953CrickFranklin"), biblio). This model, the B-DNA helix, is the structure that holds the key to our hereditary information.

//
//=== What are nucleic acids
//! -> Three moieties: sugar, phosphate and nucleobase
//! -> Driving force to form nucleic acid helices: basepairing and stacking
//==== central dogma shizzle
//

=== Nucleic acids 
==== as genetic biopolymers
#let content-dogma = [
DNA monomers (@fig-centraldogma A.) are chained together to form the biopolymer that stores our genetic information.
These DNA strands are locked away in the nucleus of the cell and only specific enzymes are allowed access to read and process them.
//
Accessing this information has been formalised as the _Central Dogma of Biology_ (@fig-centraldogma B.).  
Cells have a way of keeping this data uniform across all tissues. When a cell is at the end of its lifetime, it readies itself to divide into two equal parts. To make sure that the genetic information is not lost, it makes copies (_replication_) of the DNA strands so that the its offspring both receive a copy of this data. 
]
#let figure-dogma = [
  #figure(
    image("./figures/nucleicacids/nucleicacids.svg", width: 100%),
    caption: [
      *A.* Standard DNA chain.
      *B.* Central dogma of biology.
    ]
  ) <fig-centraldogma>
]

#grid(content-dogma, figure-dogma, columns: (1fr, 1.5fr), gutter: 1em) #v(-0.5em)
Cells are in constant communication with themselves and the outside. The incessant impulses are primordial to maintain the homeostatis of the tissue they make up, and allow the cells to respond with their environment through biological responses.
This response entails the production of a variety of proteins to react on or maintain the cell's physiology. The impulses are, depending on the situation, propagated to the cell's core where a reaction will be kickstarted.
The DNA strands are transcribed (_transcription_) to single stranded (ss) RNA. Important to clarify is that not the entire genome is fit for translation, but is divided into _introns_ and _exons_. These exons are the ssRNA sequences that go by messenger RNA (mRNA). This mRNA is escorted outside of the nucleus and accepted by a protein complex, the ribosomes. These read the nucleic acid sequence and form a complementary strand of amino acids (_translation_), whose composition is determined by the mRNA sequence. This specific chain of amino acids will then be accepted by a machinery to be processed and folded into a protein suitable to handle the incoming physiological signals. 


==== as regulators of cellular functioning
===== RNA interference (RNAi)
A natural process in which mRNA translation is inhibited by other small ssRNA is through RNAi. Depending on the pathway, we encounter silencing RNA (siRNA) and micro RNA (miRNA). 
Though many pathways exist, the most known are guided by the family of _Argonaute_ (AGO) proteins.\
The siRNA are doublestranded (ds) RNA that typically originate from exogenous sources like virusses or synthetic RNAs. They will be recognised by the RNA-induced silencing complex (RISC) in the cytoplasm in order to be processed down to the correct size of about 20 nucleotides (nt). As this constitutes dsRNA, one strand is assigned to be the guide, while its complement functions as the passenger. After manipulation by RISC, the pre-siRNA is managed by the AGO2 complex that will discard the passenger strand. This complex of enzyme-siRNA will be able to bind to free ssRNA in the vinicity - given a matching complement - and cleave those sequences, by having the guide strand bind to the target RNA and the enzyme exerting its catalytic activity. Cleaved mRNA cannot function as a template for the ribosomes anymore, thereby stopping protein synthesis.\
The functioning of miRNA starts from an endogenous path and needs to be induced first by a endogenous signal. DNA will be transcribed to primary miRNA that will be processed accordingly and then translocated from the nucleus to the cytoplasm. There is will undergo a similar treatment as with the siRNA in terms of RISC and the AGO family, but will eventually bind its target mRNA to repress translation of the sequence to a protein #mcite(("Ghildiyal2009rnainterference", "Zhang2023sirna"), biblio).

===== Tertiary RNA structures
NA structures are not constrained to just helical structures, but can fold into three dimensional structures capable of enzymatic activity or being involved in it. The first example is that of the transfer RNA (tRNA), which is involved in matching codons of mRNA and appending to the growing amino acid chain, when being processed by the ribosome complex. To clarify, a codon is a triplet of nucleotides - like AUG or GUC - that codifies for an amino acid. Another example is that of _ribozymes_, capable of catalytic activity. These include folded RNAs that can splice ssRNA and even an _in vitro_ evolved RNA polymerase ribozyme that is capable of extending an RNA strand based on an RNA template 
#mcite(("McRae2024ribozyme"), biblio).
=== IUPAC nomenclature of polynucleotide chains
//! Abbreviations and Symbols for the Description of Conformations of Polynucleotide Chains
//-> IUPAC_Abbreviations and symbols for the description of conformations of polynucleotide chains.pdf
//! Reference 1983 IUPAC
//! Reference Saenger 1984 book
//! 
//! -> Backbone chain (alpha, beta ...)
//! -> endocyclic angles (v0, v1 ...)
//! -> endocyclic angles (v0, v1 ...)
//! 
The previous section gave us a brief overview into how important nucleic acid molecules are to all living organisms. Though we've discussed their biological potential, our invested interest is in the fundamental characterisation of DNA and RNA, and especially chemically modified variants thereof. Continuing into this chapter, we need to formalise the definitions we conventionally use when discussing nucleic acid molecules.

The native nucleic acids, DNA and RNA, are composed of three core moieties: the ribose ring (sugar), the nucleobase and a phosphate (linker) (@fig-iupacnames A.). The sugar moiety is the central part of the molecule, with the phosphate linking two molecules together, hence their combination being referred to as the backbone of the nucleic acid helix.
//The nucleobase pairs with a complementary nucleobase that is part of a different NA strand.

The nucleic acids were assigned names by letters of the greek alphabet. The dihedrals of the backbone trace the consecutive chain, which follow the 5_'_ $arrow.r$ 3_'_ direction and thusly follow the alphabet's lexicographical order,  and are named from $alpha arrow.r zeta$ (@fig-iupacnames C.), with the glycosidic torsion angle denoted as $chi$ (@fig-iupacnames A.). The endocyclic torsions of the sugar ribose consist of five dihedrals $nu_(0 arrow.r 4)$ that start at the O4_'_-C1_'_ bond and circle about the sugar clockwise (@fig-iupacnames B.).
The atomnames in the nucleotides belonging to the backbone are always highlighted by a tick, to distinguish them from the atoms of the nucleobase. As nomenclature is extremely sensitive on the modifications applied to molecules, a robust naming convention is worth its weight in gold to avoid confusion #mcite(("Iupac1983nucleicacids", "Saenger1984"), biblio).   
As a sidenote, the reader is invited to peak ahead to @sec-intro-dihedrals to understand what a dihedral is.

Standard nucleobases are composed of the set Adenine (A), Guanine (G), Cytosine (C) and Thymine (T)/Uracil (U), with the last two belonging to the DNA and RNA chemistry respectively (@fig-iupacnames D.). Standard basepair (bp) patterns are established by the Watson-Crick-Franklin (WCF) basepairing between a purine:pyrimdine. Hydrogen bonds are the dominant force (A:T/U, C:G) for keeping associating strands together. In the way that nucleotides are stacked above one another contributes further to solid nucleic acid helices, which finds its principle in the efficient stacking of aromatised orbitals in the rings of the nucleobases.
#figure(
  image("./figures/nucleicacids/iupac-naming.svg", width: 100%),
  caption: [
    Parts A.-C. are adapted from the IUPAC paper #mcite(("Iupac1983nucleicacids"), biblio).
    *A.* DNA nucleotide. The 2'-OH (bordeaux) appended depicts the RNA chemistry.
    *B.* Endocyclic torsion angles of the ribose sugar.
    *C.* Backbone torsion angles.
    *D.* G:C and A:T/U basepairing with nomenclature. Note that G:C form three hydrogen bonds and A:T/U form two. The methyl (bordeaux) appended to the T-nucleobase represents the U-nucleobase associated with RNA.
    *E.* Stylised structures of the A-RNA (bordeaux) and the B-DNA (slate blue) helices.
  ]
) <fig-iupacnames>
The B-DNA and A-RNA are two types of righthanded helices associated with biological processes. The B-type DNA structure is innately recognised by DNA processing enzymes to transcribe DNA to RNA in human cells (@fig-centraldogma B.), while the A-type RNA structure helices are more commonly found in most bacterial genomes where it analogously functions as their genetic system (@fig-iupacnames E.). The A-type is also associated with siRNA studies. 
They are characterised by differences in major and minor grooves (Å), and helical size ($frac(Å, 2pi)$). 
//
//
//
//
//
//
//
=== Synthetic Nucleic Acids
//
Chemically altering the composition of native NAs can be done by appending or modifying (groups of) atoms in one of the three moieties. These modifications both prevail in nature's perpetual development and in the chemistry labs lit by fluorescent tubes.
The purpose of a collective of enzymes in our cells is to alter the composition of the NAs to meet cellular needs, whereas researchers have designed methodologies to succesfully harness the utility that comes from changing the defining characteristics of DNA and RNA.
//Modifying NA molecules is not a task exclusively carried out by scientists though. 

The main reason to change the molecule from a pharmaceutical perspective, and thusly to change the application potential of native nucleotides, is because they exhibit a short lifespan in the human bloodstream. Its cause lies in the evolutionary defense mechanism our body has developed against all foreign invasion. This includes nuclease enzymes that break down NA strands. Another culprit is the high renal clearance of these molecules, which works synergetically with the breakdown into small oligomers.
To circumvent this, scientists have applied synthetic modifications to make these Xenobiotic Nucleic Acids (XNAs) in order to increase the lifespan of the drug and to diversify the interaction potential to their target. 

There is an abundance of modifications the field of XNA has provided us, which would require a second thesis to even iterate over most of them. The aim is to give some examples into the popular synthetic nucleotides to give the reader an inkling of what viable possibilities exist and how they are applied in science.  
//These modifications occur naturally in the cell in regulating gene expression, in replication and translation processes and RNAi. These modifications are often undergone by the nucleobases in polynucleotide chains, resulting in a change of interaction between the chain and its target and influencing a biochemical reaction in the process #mcite(("Chen2016mods", "Aduri2007mods", "Bentley2014mods", "Helm2006postmods"), biblio).

//
//! -> nucleobase
//
//
//
==== Nucleobase modifications
//=== Modifications to nucleic acids
//
//
===== Natural modifications
Common modifications undergone by canonical NAs are modifications to the C5 in pyrimidine and N7 in purines. These modifications are oriented towards the major groove and aid in the favourable hydrophobicity that trademarks this part of the helix, which is important to maintain for the recognition by NA processing enzymes #mcite(("Helm2006postmods", "MozoVillaras2021hydrophobicgroove"), biblio). During (co-) and after (post-) transcription, nucleobases are modified along a cellular need, which will determine signalling of pathways and folding of the RNA constructs #mcite(("Bentley2014mods"), biblio). Another popular modification is that of the pseudouridine (Ψ) nucleoside, which contains an isomerisation of the uracil nucleobase (@fig-nucleomods A.). The Ψ nucleotide is involved in the tRNA structure, where it has been mutated on key positions of the 76mer ssRNA. Its effects are involved in the sensitive role the tRNA plays in recognising codon triplets at its Anticodon-Stem-Loop (ASL). Matching the correct codon to the correct tRNA variant consequently appends the correct amino acid to the growing peptide chain in the ribosomes. Even more so, modifications applied by enzymes to tRNA molecules contain the bulk of the known analogues documented in the field with respect to nucleobase modifications #mcite(("Helm2006postmods"), biblio).

#figure(
  image("./figures/nucleicacids/mods-nucleobases.svg", width: 100%),
  caption: [
    Highlights in turquoise of synthetic modifications.
    *A.* Isomerisation of a uridine (U) to a pseudouridine (Ψ) nucleoside.
    *B.* #sub("x")DNA nucleobases of Kool's group, extended with a benzene molecule. Benner's group engineered a mutually exclusive basepair (P:Z#sub("Benner")), functioning as a third dyad. 
    *C.* Hydrophobic basepairs (Z#sub("Kool"):F).\
    The two nucleobases Z#sub("Kool") and Z#sub("Benner") are coincidentally assigned the same letter. To distinguish them, they received a specified subscript. 
  ]
)<fig-nucleomods>

===== Synthetic modifications
Most remarkable alterations are brought forth from Kool's and Benner's group respectively. One type of categorisation is that of (non-)canonical hydrogen bonding patterns. This is effectuated by altering the purine:pyrimdine dyad. Kool's group advocated for widened nucleobases that added a benzene ring to the canonical nucleobases #mcite(("Gao2005kool", "Chelliserrykattil2008kool"), biblio). In @fig-nucleomods B., WCF is achieved by the #sub("x")DNA modifications, while this group also synthesised #sub("y")DNA nucleobases capable of non-canonical basepairing with the native congeners. Benner's research holds on to the canonical WCF pattern and devised a new basepair (P:Z#sub("Benner")), whose nucleobases are excluded from pairing with the canonical nucleobases. This showed promise due to extremely high rates of incorporation in Polynucleotide Chain Reactions (PCRs) and success in reverse transcription experiments #mcite(("Piccirilli1990benner", "Yang2011benner"), biblio). If used properly, this could mean a third pseudo-canonical basepair for an alternative genetic system (@fig-nucleomods B.).\
A second category is that of the hydrophobic nucleobases, in which their capacity to form pairs relies on steric complementarity (F:Z#sub("Kool")), which was also researched by Kool's and coworkers (@fig-nucleomods C.) #mcite(("Morales1998kool"), biblio). These nucleobases do resemble the canonical ones in shape, but differ highly electron density. The lack of hydrogen bonding does mean lesser forces are at play, culminating in duplex structures  that aren't strongly complexed.

//
//
//
==== Sugar-phosphate modifications
===== Natural modifications
The most well-known appendage to native nucleosides in cellular mechanisms is the methylation of the 2_'_-O atom in RNA. This analog is often found in tRNA, for possible tertiary structure formation, and in RNA strands at the 3_'_-end to minimise proclivity of splicing terminal ends #mcite(("Roundtree2017rnamods"), biblio).

It must be mentioned that nucleic acids have had an incredibly well-preserved backbone since the dawn of time. While there exist a great diversity in amino acids in any organism on earth, far more than the canonical twenty variants we boast, nucleic acids have not evolved in this way. A theory on _The origin of life_ suggests that it all started with the RNA chemistry to catalyse reactions and allow cellular organism to progress a lineage #mcite(("Gilbert1986rnaworld", "Higgs2014rnaworld"), biblio). The theory suggests that this chemistry has evolved early into an optimal chemistry and has consequently been involved in all primordial pathways.\
Nearly all modifications to the backbone originate from the creativity of the scientists that apply them.
//
//

===== Synthetic modifications
// 2OMeRNA, 2' MOE
// Xylo en Threose, Arabinose
// Hexitol
// Morpholino -> linker en sugar
// ZNA R/S -> glycol linkers
The 2_'_-modifications are amongst the most common and least structure-altering changes one can apply to nucleic acids. As mentioned, 2_'_-O-Methyl RNA (2'-O-MeRNA) plays a crucial role in cell function and portrays a good resistance against nuclease activity. This substituent can be bulked up to the  2_'_-Methoxyethyl RNA (2_'_-MOE) #mcite(("Egli2000rnamimetics"), biblio). Both portray a typical A-RNA form in a duplex, due to the bulkiness of the appendage. The Locked NA (LNA) is modified with a constraint that keeps the molecule from exploring forms other than the A-RNA (@fig-sugarmods A.). These synthetic analogues exhibit the trait that they pair well with RNA and DNA strands.

By mentioning _The RNA world_ (the origin of life), we note that simulated studies have been done under conditions close to when the first molecules were formed. This brought forth the Arabinose NA (ANA), Xylose NA (XyNA) and Threose NA (TNA) chemistries that would supposedly have competed against RNA #mcite(("Roche2022prebiotic", "Yi2022threoseformation"), biblio) . While ANA is identical to RNA in atomic composition, it has the tendency to develop into a B-DNA type structure and supports translation from and to DNA #mcite(("MartnPintado2012ANA"), biblio).
The others differ wildly from RNA in the way the backbone of the strands are formed. Even though XyNA follows the 5_'_ $arrow.r$ 3_'_ backbone, the 3_'_-OH is epimerised to an equatorial positioning to the ring. The resultant helix forms a ladderlike righthanded helix #mcite(("Mattelaer2021xylose"), biblio). The TNA nucleosides lack the 4_'_ substituents who play a crucial part of the standard nucleic acid backbone. Instead they form a 3_'_ $arrow.r$ 2_'_ chain, meaning their set of backbone angles is decremented by one and reaches up to $epsilon$-angle. The TNA::TNA homoduplex forms a righthanded and very elongated duplex #mcite(("Ebert2008tna"), biblio), showing little similarity to the native structures (@fig-sugarmods C.).

Not just furanose (five-membered rings) sugars, but pyranoses (six-membered rings) too have proven succesful in mimicking the capabilities of the natural congeners. The most notable example is that of the 1_'_,5_'_-anhydrohexitol NA (HNA), where a methylene fragment has been inserted between the C1_'_ and O4_'_ of regular DNA. This XNA pairs perfectly with RNA molecules and allows cross-talking, meaning RNA can be used as a template for building HNA strands and vice versa. This insertion does imply an increment of the atom numbering (6_'_ $arrow.r$ 4_'_), but this changes little to the set of angles.
One particular pyranose that presents as an orthogonal chemistry, which dictates it is not able to cross-talk with the natural nucleosides, is β-homo-DNA. Building it into a duplex structure tells us it prefers to adopt a lefthanded ladderlike model #mcite(("Lescrinier2003difference"), biblio) (@fig-sugarmods D.). 

#figure(
  image("./figures/nucleicacids/mods-backbone.svg", width: 100%),
  caption: [
    *A.* 2'-modifications to the RNA chemistry: 2'-O-MeRNA, 2'-MOE RNA and LNA.
    *B.* DNA and RNA to reference the native congeners.
    *C.* Five-membered rings modifications to the sugar moiety: ANA, XyNA and TNA.
    *D.* Six-membered ring modifications to the sugar moiety: HNA and β-homo-DNA.
    *E.* Full backbone modifications, to both linker and sugar moiety: MNA and ZNA.
  ]
)<fig-sugarmods>

A last set of synthetic chemistries in need of discussing are the fully-modified backbone chemistries. 
The morpholino nucleic acid (MNA) is a six-membered ring with a rigid backbone. While most chemistries contain a phosphodiester linkage between nucleosides, the morpholino residues are connected by a phosphoramidate bond directly onto the ring. A famous variation on the MNA is the substitution of one of the oxygen in the phosphate ester to a dimethylamino group (-N-(CH#sub("3"))#sub("2")), providing the MNA strands with a net charge of zero #mcite(("Moulton2017morpho"), biblio). Its structure, in complex with RNA for RNAi applications, is currently unknown.
The ZNA chemistry is a phosphonomethyl derivate of the Glycol Nucleic Acid (GNA) and is fundamentally acyclic. With a phosphonate linker, it is less prone to hydrolysis. The backbone itself resembles a peptide and can twist in either a lefthanded or a righthanded helix depending on the stereochemistry (R/S) of the anomeric carbon in the chain #mcite(("Luo2019zna"), biblio) (@fig-sugarmods E.).



=== Applications of synthetic nucleic acids

//==== Purpose of modifications
//! -> sugar
//! -> linker
In our line of research, we are interested specifically in how these chemical modifications change the overall helical structure of the NA duplex. These type of modifications are attributed to changes in the backbone itself. As we will come to learn, the backbone characterises how the helix bends and twists and the nucleobase modifications will determine the interactions with its target. 

This has numerous applications in the pharmaceutical field. While small molecules drugs and antibody therapeutics have reigned supreme, NA therapeutics have been able to provide long-standing solutions to problems that weren't attainable by their rivaling compounds. More so, XNA research has provided the field of synthetic biology with means to tinker towards goals that were previously thought of as science fiction. 

The research carried out for this thesis means to expose the inner workings of these synthetic nucleotides to understand their potential applicability. 
==== Aptamers
Aptamers are single-stranded NA strands capable of forming three dimensional structures. What defines such an aptamer is the application of the molecule, being able to recognise proteins with a high specificity and sensitivity. This is analogous with the common antibody. In contrast, the production of an aptamer of much lower and less labour-intensive and this has gained them notoriety in the pharmaceutical field. Aptamers are also able to bind and sequester small molecules, something antibodies are not capable of.

As aptamers that are composed of DNA or RNA would be rapidly made ineffective by the human body, chemical modifications prove beneficial to make aptamers viable for therapeutic interventions. 
After searching for a suitable aptamer against a target, i.e. a surface receptor of a cell, through SELEX (more in this in @chap-chapterAptamer), post-selex modifications are applied to the sequence in order to improve its nuclease resistance and to potentially finetune the affinity towards its target. 
Most common alterations are the 2_'_-modifications, thiophosphate modifications - where an oxygen is replaced by a sulfur - and nucleobase modifications.

Because the SELEX methodology requires NA processing enzymes, using chemistries with a modified backbone are more difficult to apply because that means the enzymes need to be tailored to those specific chemistries and not DNA or RNA. Nonetheless, several groups have succeeded in creating aptamers with HNA and TNA respectively, which concludes a big milestone for the field.
==== Antisense Oligonucleotides
The Antisense Oligonucleotides (ASO) are a particular therapeutic intervention that lends its mode of action from the study on RNAi pathways. Essentially, a ssNA chain is designed to complement a specific mRNA sequence; a sequence that would translate for a protein that should be blocked from existence. The most popular chemistry is that of the dimethylamino-phosphorodiamidate MNA (PMO) chemistry and has been applied to resolve a genetic defect in a subset of the popular of Duchenne's musculodystrophy. The goals is to truncate the protein, in charge of structural stability of muscles, as the mutation causes instability of the muscle fibers. A specific exon sequence is targetted by the PMO strand, where hybridisation with the target sequence will prohibit the genome from being transcribed. This resulting in a smaller but functional protein and provide a increase in quality of life for the patients. 

==== Biocontainment
The field of Synthetic Biology is driven by the philosophy of _Directed Evolution_. The key idea is to accelerate the evolutionary process by pushing environmental conditions onto a protein and steer it to lose or gain particular properties. For example, a DNA polymerase has been succesfully evolved into an HNA polymerase and was used to conceive the first HNA aptamer #mcite(("Pinheiro2012geneticpolymer"), biblio).

In this realm, there exists an paradigm to create an alternative genetic system, orthogonal to the natural DNA and RNA biopolymers. Its implications are that a bacterial system could only survive and replicate in artificial incubators, where conditions that are micromanaged. However, this would also mean that invasion of pathogens like virusses and other bacteria from an external source have no way of interfering and mutating the genome of the synthetic bacteria.
In biotechnological industries, purifying products and maintaining purity of the colonies is one of the most expensive aspects when it comes to bio-incubators.

==== Antiviral therapy
HIV, tenofovir. Made at Rega, with collab in tsjecho. These compounds are also modified nucleosides but are not adminstered as a polymer, like aptamers and ASOs are.
They halt reverse transcription or other things, also chain terminators.

Many examples in anticancer research too.
//
//
//
//
//
//
//==== The need for innovation
//#lorem(20)

#pagebreak()
