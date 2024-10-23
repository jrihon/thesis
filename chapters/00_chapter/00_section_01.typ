#import "../../lib/colours.typ": colourPalette
#import "../../lib/multi-bib.typ": mcite
#import "../../lib/layout.typ": get-page-by-query
#import "bib_00_chapter.typ": biblio



// Xenobiotic Nucleic Acids
== The Nucleic Acid molecule
//
Once upon a time in 1869, in the Kingdom of Württemberg - now Germany, a Swiss scientist by the name of Friedrich Miescher discovered a precipitated substance that was not susceptible to enzymes that would otherwise degrade lipids and proteins #mcite(("Dahm2007discoverDNA"), biblio). It was described to be high in phosphorus and was dubbed _nuclein_ as it originates from the nucleus of the cell. 
Later in 1928, the British bacteriologist Frederick Griffith discovered throughout his many years of study on _pneumococcus_ strains that bacteria are able to transfer their genetic material, something we nowadays casually refer to as _bacterial transformation_. He deduced that a non-virulent strain of bacteria, that would not harm the utilised mice in the experiment, could be inoculated with heat-inactivated virulent strains to receive their pathogenic properties. This resulted in mice succumbing by being exposed to a formerly benign _pneumococcus_ strain #mcite(("Griffith1928bacteria"), biblio).
//It was not until the famed _Avery–MacLeod–McCarty experiment_ in 1944 that nucleic acids (NAs) were determined to be the bearers of this genetic material. At the time, proteins were initially considered to portray this property and this empirical evidence revolutionised the idea to the outside world, as the analogy from bacteria to human cells would not be that farfetch'd #mcite(("Avery1944macleodmccarty"), biblio).
It was not until the famed _Avery–MacLeod–McCarty experiment_ in 1944 that nucleic acids (NAs) were determined to be the bearers of this genetic material, which at the time was attributed to proteins. This empirical evidence dramatically changed the established, scientific consensus,  as the analogy from bacteria to human cells would not be that farfetch'd #mcite(("Avery1944macleodmccarty"), biblio).

//The helical structure of this deoxyribose nucleic acid (DNA) later unveiled by Watson and Crick in 1953, whose validity was backed by the experiments done by Rosalind Franklin #mcite(("WATSON1953CrickFranklin"), biblio). This model, the B-DNA helix, is the structure that holds the key to our hereditary information.
Watson and Crick, in 1953, unveiled the helical structure of this deoxyribose nucleic acid (DNA) , whose validity was backed by the experiments done by Rosalind Franklin #mcite(("WATSON1953CrickFranklin"), biblio). This model, the B-DNA helix, is the structure that holds the key to our hereditary information.

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
//The previous section gave us a brief overview into how important nucleic acid molecules are to all living organisms. Though we've discussed their biological potential, our invested interest is in the fundamental characterisation of DNA and RNA, and especially chemically modified variants thereof. Continuing into this chapter, we need to formalise the definitions we conventionally use when discussing nucleic acid molecules.
//Continuing into this chapter, we need to formalise the definitions we conventionally use when discussing nucleic acid molecules. These become important to us later on because our vested interest is in the fundamental characterisation of these molecular building blocks, and especially variants thereof.
//
The native nucleic acids, DNA and RNA, are composed of three core moieties: the ribose ring (sugar), the nucleobase and a phosphate (linker) (@fig-iupacnames A.). The two chemistries differ only by an hydroxyl on the C2_'_ in RNA. The sugar moiety is the central part of the molecule, with the phosphate linking two subsequent nucleosides together, hence their combination being referred to as the backbone of the nucleic acid helix. 
Chaining multiple nucleotides together through phosphate linkage forms an oligonucleotide strand. A duplex is formed when two strands interact by their nucleobases to form a helical structure (@fig-iupacnames E.).

//The backbone of a helix is assigned letters of the greek alphabet as a shorthand to categorise key elements.
The dihedral angles of the backbone follow the consecutive chain, which follow the 5_'_ $arrow.r$ 3_'_ direction and hence follow the Greek alphabet's lexicographical order, and are named from $alpha arrow.r zeta$ (@fig-iupacnames C.). 
The sugar and nucleobase are bonded together through the glycosidic bond (torsion angle $chi$), specifically the C1_'_ of the ribose covalently binds the N9/N1 of the purine/pyrimidine nucleobase (@fig-iupacnames A., D.). The endocyclic torsions of the sugar ribose consist of five dihedrals $nu_(0 arrow.r 4)$ that start at the O4_'_-C1_'_ bond and circle about the sugar clockwise (@fig-iupacnames B.) #mcite(("Iupac1983nucleicacids", "Saenger1984"), biblio).
As a sidenote, the reader is invited to peek ahead to #get-page-by-query(<sec-intro-dihedrals>) to understand what a dihedral is.
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

Standard nucleobases are composed of the set adenine (A), guanine (G), cytosine (C) and thymine (T)/uracil (U), with the last two belonging to the DNA and RNA chemistry respectively (@fig-iupacnames D.). The A and G are chemically known as purines and the C, T and U nucleobases as pyrimidines.
//The atomnames in the nucleotides belonging to the backbone are always highlighted by a tick, to distinguish them from the atoms of the nucleobase. 
//
//As stated, the nucleobases are what keeps the helical shape intact and is driven by the interactions between them.
The canonical basepairing patterns are established by the Watson-Crick-Franklin (WCF) basepairing, between a purine:pyrimdine couple. Hydrogen bonds are the dominant force (A:T/U, C:G) for associating strands together. In the way that nucleotides are stacked above one another contributes further to solid nucleic acid helices, which finds its principle in the efficient stacking of the aromatic rings of the nucleobases.

The B-DNA and A-RNA are two types of right-handed helices associated with biological processes. The B-type DNA structure is innately recognised by DNA processing enzymes for replication or to transcribe DNA to RNA in human cells (@fig-centraldogma B.), while the A-type RNA structure helices are more commonly found in bacterial and many viral genomes where it analogously functions as their genetic system (@fig-iupacnames E.). 
They are characterised by differences in major and minor grooves (Å), and helical size ($frac(Å, 2pi)$). 
//
//
//
//=== What are nucleic acids
//! -> Three moieties: sugar, phosphate and nucleobase
//! -> Driving force to form nucleic acid helices: basepairing and stacking
//

=== Nucleic acids 
==== ... as genetic biopolymers

DNA monomers (@fig-centraldogma A.) are chained together to form the biopolymer that contain our genetic information.
These DNA strands are neatly stored in the nucleus of our cells and only specific enzymes are allowed access to read and process them.
Processing and using this information has been formalised as the _Central Dogma of Biology_ (@fig-centraldogma B.).  

Cells have a way of stably transferring the genetic code to their offspring. When a cell is signalled to multiply, it readies itself to divide into two equal parts (_mitosis_). To make sure that the genetic information is not lost, it makes copies (_replication_) of the DNA strands so that both daughter cells receive a copy of this data upon cell division.
Important to note is the 5_'_ $arrow.r$ 3_'_ direction of the backbone here. When enzymes synthesise a new strand, nucleotide molecules are appended in this direction. Often, this direction is referred to as the _leading_ strand, while the _complementary_ strand follows the 3_'_ $arrow.r$ 5_'_ direction.
//This is done by DNA processing enzymes that retrieve the stored helices and expose the genetic information for replication.

Cells are also in constant communication with themselves and the outside. The incessant impulses they are subjected to are important to maintain the homeostasis of the tissue they make up, and allow the cells to interact with their environment through biological responses.
In turn, the cells respond by producing a variety of proteins as a reaction to the impulses or to simply maintain the cell's physiology. Depending on the signals received, the impulses can be propagated to the cell's core where a reaction will be kickstarted.
The DNA strands are transcribed then (_transcription_) to single stranded (ss) RNA.

#let content-dogma = [
//Cells are also in constant communication with themselves and the outside. The incessant impulses they are subjected to are important to maintain the homeostatis of the tissue they make up, and allow the cells to interact with their environment through biological responses.
//In turn, the cells respond by producing of a variety of proteins as a reaction to the impulses or to simply maintain the cell's physiology. Depending on the signals received, the impulses can be propagated to the cell's core where a reaction will be kickstarted.
//The DNA strands are transcribed then (_transcription_) to single stranded (ss) RNA.

Important to clarify is that not the entire genome is fit for translation, but is divided into _introns_ and _exons_. These exons are the DNA sequences that are transcribed to become messenger RNA (mRNA). When transcribed, this mRNA is escorted outside of the nucleus and accepted by a collection of proteins to form the ribosome. This complex reads the nucleic acid sequence by the codon - a triplet of nucleobases - and form a growing strand of amino acids, whose composition is determined by the codons read from mRNA sequence itself (_translation_). 
This specific chain of amino acids will then be accepted by a machinery //to be processed and folded into a protein suitable to handle the incoming physiological signals. 
//A third division can be made for RNA molecules who provide a necessary functioning to the cell.
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

#grid(content-dogma, figure-dogma, columns: (1fr, 1.5fr), gutter: 1em) #v(-0.75em)
to be processed and folded into a protein suitable to handle the incoming physiological signals. 
A third division can be made for RNA molecules who provide a necessary functioning to the cell.

//This specific chain of amino acids will then be accepted by a machinery to be processed and folded into a protein suitable to handle the incoming physiological signals. 
//A third division can be made for RNA molecules who provide a necessary functioning to the cell.
//stranded (ss) RNA.

//Important to clarify is that not the entire genome is fit for translation, but is divided into _introns_ and _exons_. These exons are the DNA sequences that are transcribed to become messenger RNA (mRNA). When transcribed, this mRNA is escorted outside of the nucleus and accepted by a protein complex, the ribosomes. These read the nucleic acid sequence by the codon - a triplet of nucleobases - and form a growing strand of amino acids, whose composition is determined by the codons read from mRNA sequence itself (_translation_). This specific chain of amino acids will then be accepted by a machinery to be processed and folded into a protein suitable to handle the incoming physiological signals. 
//A third division can be made for RNA molecules who provide a necessary functioning to the cell.


==== ... as regulators of cellular functioning
===== RNA interference (RNAi)
A natural process in which mRNA translation is inhibited by other small RNA oligomers is through RNAi. Depending on the pathway, we encounter silencing RNA (siRNA) and microRNA (miRNA). 
Though many enzymes exist that coordinate these pathways, the most known are guided by the family of _Argonaute_ (AGO) proteins.

#figure(
  image("./figures/siRNA-complex.svg", width: 100%),
  caption: [
    Silencing RNA pathway - simplified (adapted from #mcite(("Ghildiyal2009rnainterference"), biblio)).
    *A.* double stranded RNA enters the cytoplasm from exogenous sources.
    *B.* The RISC-AGO complex is mobilised, binds to the dsRNA and degrades the passenger strand.
    *C.* The enzyme:guide-siRNA binds to matching mRNA and cleaves it into non-functional strands. The complex can then be recycled.
  ]
) <fig-silencingRNA>
The siRNA typically originates from double stranded (ds) RNA, which was produced by the cell itself or released into the cells by exogenous sources like viruses. Here we need to understand that viruses sometimes depend on human cells for their protein synthesis. These dsRNA will be recognised by the RNA-induced silencing complex (RISC) in the cytoplasm in order to be processed down to the correct size of about 20 nucleotides (nt). As this constitutes dsRNA, one strand is assigned to be the guide, while its complement functions as the passenger. After manipulation by RISC, the pre-siRNA is managed by the AGO2 complex that will discard the passenger strand. This complex of enzyme:guide-siRNA will be able to bind to free floating ssRNA from viral origin and - given a matching complement - cleave those sequences, by having the guide strand bind to the target ssRNA and the enzyme exerting its catalytic activity (@fig-silencingRNA). Cleaved, viral RNA cannot function as a template for the ribosomes anymore, thereby prohibiting protein synthesis of the viral RNA. This mechanism is typically associated with the cell's innate, protective measures against foreign invasion.

The functioning of miRNA starts from an endogenous path and needs to be induced first by an endogenous signal. DNA will be transcribed to primary miRNA that will be processed accordingly and then translocated from the nucleus to the cytoplasm. It will undergo a similar treatment as with the siRNA in terms of RISC and the AGO family, but will eventually bind the target endogenous mRNA to repress translation of the sequence to a protein #mcite(("Ghildiyal2009rnainterference", "Zhang2023sirna"), biblio). This can be in response to an overabundance of proteins in the cytoplasm that the cell is producing or as a response to clean up the mRNA when its use has been fulfilled.

===== Tertiary RNA structures
NA structures are not constrained to just double stranded helical structures, but can fold into three dimensional structures capable of playing various roles in enzymatic activity. The first example is that of the transfer RNA (tRNA), which is involved in matching codons of mRNA in the ribosome complex and appending to the growing amino acid chain. For every codon - i.e. every permutation of a nucleobase triplet, like AUG - there exists a specific tRNA molecule that encodes for one of the twenty amino acids used in human proteins. Matching the tRNA to the codon means the correct peptide sequence will be generated by the ribosomes and thus ensuring the production of a sound protein.

Another example is that of _ribozymes_, capable of catalytic activity. These include folded RNA strands that can splice ssRNA, and recently an _in vitro_ RNA polymerase ribozyme was designed that is capable of extending the complementary strand of an RNA template #mcite(("McRae2024ribozyme"), biblio).
//
//
//
//
//
//
//
//
=== Synthetic Nucleic Acids
//
Chemically altering the composition of native NAs can be done by appending or modifying (groups of) atoms in one of the three moieties. These modifications are prevalent in both nature's perpetual development and in the chemistry labs lit by fluorescent tubes.
The former's purpose is for a collective of enzymes to alter the composition of the NAs to meet cellular needs, whereas researchers have designed methodologies to successfully harness the utility that comes from changing the defining characteristics of DNA and RNA.
//Modifying NA molecules is not a task exclusively carried out by scientists though. 

The initial reason to change the molecule from a pharmaceutical perspective, and hence to change the application potential of native nucleotides, is because oligonucleotides are quickly degraded in the human bloodstream. Its cause lies in the evolutionary defense mechanism our body has developed against all foreign invasion. This includes nuclease enzymes that break down NA strands. Another culprit is the high renal clearance of these molecules, which works synergetically with the breakdown into small oligomers.
To circumvent this, scientists have applied synthetic modifications resulting in xenobiotic nucleic acids (XNAs) in order to increase the lifespan of the drug and to diversify the interaction potential to their target. 

There is an abundance of modifications the field of XNA has provided us, which would require a second thesis to even iterate over most of them. The aim is to give some examples into popular synthetic nucleotides to give the reader an inkling of what viable possibilities exist and how they are applied in science.  
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
Common modifications undergone by canonical NAs are modifications to the C5 in pyrimidines and N7 in purines. These modifications are oriented towards the major groove of the double stranded helix and aid in the favourable hydrophobicity that trademarks this part of the helix, which is important for its recognition by NA processing enzymes #mcite(("Helm2006postmods", "MozoVillaras2021hydrophobicgroove"), biblio). During (co-) and after (post-) transcription, nucleobases are modified according to a cellular need, which will determine signalling of pathways and folding of the RNA constructs #mcite(("Bentley2014mods"), biblio). A popular modification is that of the pseudouridine (Ψ) nucleoside, which contains an isomerisation of the uracil nucleobase (@fig-nucleomods A.). The Ψ nucleotide is involved in the tRNA structure, where it has been mutated on key positions of the ssRNA structure. Its effects are involved in the sensitive role the tRNA plays in recognising codon triplets at its anticodon-stem-loop (ASL). Matching the correct codon to the correct tRNA variant consequently appends the correct amino acid to the growing peptide chain in the ribosomes. Even more so, modifications applied by enzymes to tRNA molecules contain the bulk of the known analogues documented in the field with respect to nucleobase modifications #mcite(("Helm2006postmods"), biblio).

===== Synthetic modifications
Most remarkable alterations are brought forth from Kool's and Benner's group respectively. One is that of (non-)canonical hydrogen bonding patterns. This is effectuated by altering the purine:pyrimdine dyad.
Kool's group advocated for widened nucleobases that added a benzene ring to the canonical nucleobases #mcite(("Gao2005kool", "Chelliserrykattil2008kool"), biblio). In @fig-nucleomods B., WCF is achieved by the #sub("x")DNA modifications, while this group also synthesised #sub("y")DNA nucleobases capable of non-canonical basepairing with the native congeners. Benner's research holds on to the canonical WCF pattern and devised a new basepair (P:Z#sub("Benner")), whose nucleobases are excluded from pairing with the native congeners. This showed promise due to extremely high rates of incorporation in Polymerase Chain Reactions (PCRs) and success in reverse transcription experiments #mcite(("Piccirilli1990benner", "Yang2011benner"), biblio). If used properly, this could mean a third pseudo-canonical basepair for an alternative genetic system (@fig-nucleomods B.).

A second, more experimental approach, is that of the hydrophobic nucleobases, in which their capacity to form pairs relies on steric complementarity (F:Z#sub("Kool")), which was also researched by Kool's and coworkers (@fig-nucleomods C.) #mcite(("Morales1998kool"), biblio). These nucleobases do resemble the canonical ones in shape, but differ highly in electron density. The lack of hydrogen bonding does mean lesser forces are at play, culminating in duplex structures  that aren't strongly complexed.
#figure(
  image("./figures/nucleicacids/mods-nucleobases.svg", width: 100%),
  caption: [
    Highlights in turquoise of synthetic modifications.
    *A.* Isomerisation of a uridine (U) to a pseudouridine (Ψ) nucleoside.
    *B.* #sub("x")DNA nucleobases of Kool's group, extended with a benzene molecule. Benner's group engineered a mutually exclusive basepair (P:Z#sub("Benner")), functioning as a third dyad. 
    *C.* Hydrophobic basepairs (Z#sub("Kool"):F). 
    The two nucleobases Z#sub("Kool") and Z#sub("Benner") are coincidentally assigned the same letter. To distinguish them, they received a specified subscript. 
  ]
)<fig-nucleomods>


//
//
//
==== Sugar-phosphate modifications
===== Natural modifications
The most well-known appendage to native nucleosides in cellular mechanisms is the methylation of the 2_'_-O atom in RNA. This analog is often found in tRNA, for possible tertiary structure formation, and in RNA strands at the 3_'_-end to 
//minimise proclivity towards splicing of the terminal ends #mcite(("Roundtree2017rnamods"), biblio).
increase resistance against enzymatic splicing of the terminal ends #mcite(("Roundtree2017rnamods"), biblio).

It must be mentioned that nucleic acids have had an incredibly well-preserved backbone since the dawn of time. While there exist a great diversity in amino acids in any organism on earth, far more than the canonical twenty variants we boast, nucleic acids have not evolved in this way. A theory on _The origin of life_ suggests that it all started with the RNA chemistry to catalyse elementary reactions. When cells began emerging, this building block allowed cellular organism to progress a lineage #mcite(("Gilbert1986rnaworld", "Higgs2014rnaworld"), biblio). The theory suggests that this chemistry has evolved early into an optimal molecule, which has been conserved in all lifeforms on earth, and has consequently been involved in all primordial pathways.

Most modifications to the backbone originate from the creativity of the scientists that apply them.
//
//

===== Synthetic modifications
// 2OMeRNA, 2' MOE
// Xylo en Threose, Arabinose
// Hexitol
// Morpholino -> linker en sugar
// ZNA R/S -> glycol linkers
The 2_'_-modifications are amongst the most common and least structure-altering changes one can apply to nucleic acids. As mentioned, 2_'_-O-Methyl RNA (2'-O-MeRNA) plays a crucial role in cell function and portrays a good resistance against nuclease activity. This substituent can be bulked up to the  2_'_-Methoxyethyl RNA (2_'_-MOE) #mcite(("Egli2000rnamimetics"), biblio). Both portray a typical A-RNA form in a duplex, due to the bulkiness of the added moiety. The Locked NA (LNA) is modified with a constraint that keeps the molecule from exploring other conformations (@fig-sugarmods A.). There exist two variants, one that resolves into an A-RNA structure and one that more adjacent to the shape of B-DNA. These synthetic analogues exhibit the trait that they pair well with RNA and DNA strands.

By mentioning _The RNA world_ - the origin of life -, we note that simulated studies have been done under conditions close to when the first molecules were formed. This brought forth the Arabinose NA (ANA), Xylose NA (XyNA) and Threose NA (TNA) chemistries that would supposedly have competed against RNA in the evolutionary drag race #mcite(("Roche2022prebiotic", "Yi2022threoseformation"), biblio). While ANA is identical to RNA in atomic composition, the 2'-OH is epimerised and causes the chemistry to favour a B-DNA type structure. It is able to communicate well with DNA as it supports transcription from and to DNA #mcite(("MartnPintado2012ANA"), biblio).
The others differ wildly from RNA in the way the backbone of the strands are formed. Even though XyNA follows the 5_'_ $arrow.r$ 3_'_ backbone, the 3_'_-OH is epimerised to, returning a ladderlike right-handed helix for double stranded XyNA #mcite(("Mattelaer2021xylose"), biblio). The xylose chemistry is unable to form a complement to either of the native nucleic acids, a property known as _orthogonality_. The TNA nucleosides lack the 4_'_ substituents that play a crucial part of the standard nucleic acid backbone. Instead they form a 3_'_ $arrow.r$ 2_'_ chain, meaning their set of backbone angles is decremented by one and reaches only up to $epsilon$-angle. Because they miss one atomic bond, the TNA::TNA homoduplex forms a right-handed and very elongated duplex #mcite(("Ebert2008tna"), biblio), showing little similarity to the native structures (@fig-sugarmods C.).

//Not just furanose (five-membered rings) sugars, but pyranoses (six-membered rings) too have proven successful in mimicking the capabilities of their natural congeners. The most notable example is that of the 1_'_,5_'_-anhydrohexitol NA (HNA), where a methylene fragment has been inserted between the C1_'_ and O4_'_ of regular DNA. This XNA pairs perfectly with RNA and DNA molecules and allows cross-talking, meaning RNA or DNA can be used as a template for building HNA strands and vice versa #mcite(("Lescrinier2003difference","Pinheiro2012geneticpolymer"), biblio) . This insertion does imply an increment of the atom numbering (6_'_ $arrow.r$ 4_'_), but this changes little to the backbone.
//One particular pyranose that presents as an orthogonal chemistry, which dictates it is not able to cross-talk with the natural nucleosides, is β-homo-DNA. Building it into a duplex structure tells us it prefers to adopt a lefthanded ladderlike model #mcite(("Lescrinier2003difference"), biblio) (@fig-sugarmods D.). 

#figure(
  image("./figures/nucleicacids/mods-backbone.svg", width: 100%),
  caption: [
    *A.* 2'-modifications to the RNA chemistry: 2'-O-MeRNA, 2'-MOE RNA and LNA (here, the A-RNA type is depicted).
    *B.* DNA and RNA to reference the native congeners.
    *C.* Five-membered rings modifications to the sugar moiety: ANA, XyNA and TNA.
    *D.* Six-membered ring modifications to the sugar moiety: HNA and β-homo-DNA.
    *E.* Full backbone modifications, to both linker and sugar moiety: MNA and ZNA.
  ]
)<fig-sugarmods>

Not just furanose (five-membered rings) sugars, but pyranoses (six-membered rings) too have proven successful in mimicking the capabilities of their natural congeners. The most notable example is that of the 1_'_,5_'_-anhydrohexitol NA (HNA), where a methylene fragment has been inserted between the C1_'_ and O4_'_ of regular DNA. This XNA pairs perfectly with RNA and DNA molecules and allows cross-talking, meaning RNA or DNA can be used as a template for building HNA strands and vice versa #mcite(("Lescrinier2003difference","Pinheiro2012geneticpolymer"), biblio) . This insertion does imply an increment of the atom numbering (6_'_ $arrow.r$ 4_'_), but this changes little to the backbone.
One particular pyranose that presents as an orthogonal chemistry, which dictates it is not able to cross-talk with the natural nucleosides, is β-homo-DNA. Building it into a duplex structure tells us it prefers to adopt a left-handed ladderlike model #mcite(("Lescrinier2003difference"), biblio) (@fig-sugarmods D.). 

A last set of synthetic chemistries in need of discussing are the fully-modified backbone chemistries. 
The morpholino nucleic acid (MNA) is a six-membered ring with a rigid backbone. While most chemistries contain a phosphodiester linkage between nucleosides, the morpholino residues are connected by a phosphoramidate bond directly onto the ring. A famous variation on the MNA is the substitution of one of the oxygen in the original phosphate ester to a dimethylamino group (-N-(CH#sub("3"))#sub("2")), providing the MNA strands with a net charge of zero #mcite(("Moulton2017PMO"), biblio). 
//Its structure, in complex with RNA for RNAi applications, is currently unknown.
The ZNA chemistry is a phosphonomethyl derivate of the Glycol Nucleic Acid (GNA) and is fundamentally acyclic. With a phosphonate linker, it is less prone to hydrolysis. The backbone itself resembles a peptide and can twist in either a left-handed or a right-handed helix depending on the stereochemistry (R/S) of the anomeric carbon in the chain (highlighted by an `*`) #mcite(("Luo2019zna"), biblio) (@fig-sugarmods E.).
//
//
//
//
//
=== Applications of synthetic nucleic acids
In our line of research, we are interested specifically in how these chemical modifications change the overall helical structure of the NA duplex.
//These type of modifications are attributed to changes in the backbone itself.
As we will come to learn, the backbone characterises how the helix bends and twists and the nucleobase modifications will determine the interactions with its target. 

This has numerous applications in the pharmaceutical field. While small molecule drugs and antibody therapeutics have reigned supreme, NA therapeutics have been able to provide long-standing solutions to problems that were not attainable by other compounds. More so, XNA research has provided the field of synthetic biology with means to tinker towards goals that were previously thought of as science fiction. 

The research carried out for this thesis means to expose the inner workings of these synthetic nucleotides to understand their potential applicability. 
//
==== Antiviral therapy
The application of nucleoside analogs as a therapeutic intervention to viral infection hampers the replicative cycle of the virus or to completely neutralise it, the latter being extremely difficult to achieve with drugs alone.
Perhaps the most famous example are that of acyclovir, against herpetic viruses (herpes simplex 1 and 2, varicella zoster and cytomegalovirus) #mcite(("Wood1992acyclovir"), biblio) and tenofovir, against hepatitis B and most famously in the prevention and treatment of HIV-infections #mcite(("DeClercq2016TAF", "SeleyRadtke2018antiviral"), biblio). 
During the life cycle of any cellular organism, it is important to store and replicate its genetic material in order to ensure the survival of the colony. The more copies and colonies, the better the survival for the species. As mentioned before in the _Central Dogma of Biology_, additional copies of the genome are created through polymerase enzymes. This is where these compounds come in.  

Both acyclovir and tenofovir are considered chain terminators, which entails that creating a copy of the genome is prematurely disrupted by the enzymes mistakenly incorporating the therapeutic drug instead of a natural nucleotide. These drugs differ from the natural furanose sugar in that they are acyclic in nature.
//They also come with a single phosphate group appended at their 5'-end, ready to become a triphosphate molecule
While they are covalently linked at their 5'-end to the previous nucleotide through a phosphate link, they miss a stable 3'-end that would otherwise allow a subsequent building block to append to, resulting in a chain that fails to grow further. Acyclovir acts on the virus' life cycle by inhibiting the functioning the DNA polymerase of the mentioned herpetic viruses #mcite(("Zarrouk2017herpesdnavirus"), biblio).

Tenofovir follows the same mode of action, but shifts its target towards HIV. This virus inserts its genome into the human cell's genetic code through _reverse transcription_. This continues the virion's life cycle by delegating its protein synthesis to the human cell it is invading.
By acting as a chain terminator, Tenofovir is able to dismantle this process. An unfinished chain is discarded and degraded by circulating enzymes. Most importantly is that this blocks HIV from incorporating its material into our genome, thereby failing to successfully establish itself into our cells and continue its lifecycle. This makes it possible to keep the virus at bay and provide patients with a quality of life improvement to the point the virus is nearly undetectable #mcite(("Kearney2004"), biblio).
//
//
#v(1em)
==== Antisense Oligonucleotides
The Antisense Oligonucleotides (ASO) are a particular class of drugs that are administered in order to emulate the effects of the endogenous RNAi pathways. Essentially, a ssNA chain is designed to complement a specific mRNA sequence; a sequence that would translate for a protein that is therapeutically interesting to interfere with. The most successful chemistry to date is that of the dimethylamino-phosphorodiamidate MNA (PMO, @fig-sugarmods E.) chemistry and the thiophosphoramidate variant (TMO) has been applied to resolve a genetic defect in a particular variant of the Duchenne's musculodystrophy #mcite(("Roshmi2019viltolarsen", "Langner2020TMO"), biblio). 
A protein is translated from mRNA, which is transcribed from multiple exon-sequences of the genomic DNA. In some of variants of this pathology, there exists a mutation in exon n°51 of the chain, causing instability of the distrophin protein - a functional protein that is key to the stability of the muscle fibers. By prohibiting transcription of this exon, the protein becomes truncated but functional, which ultimately improves the quality of life of the patients suffering from this disease.

Another application of ASOs is in the usage in preclinical research, mainly on zebrafish. These animals are interesting because they are cheap to maintain, easy to manipulate and have a short lifecycle, lowering the time between experiments dramatically. 
By adminstering these short oligomers to the zebrafish, researchers can study the effects the zebrafish's development when a gene has been knocked-out. The ASO is there to prohibit expression of a particular protein in order to study the effects of its absence #mcite(("Moulton2017PMO"), biblio). 
//The goal is to truncate the protein, in charge of structural stability of muscles, as the mutation causes instability of the muscle fibers. A specific exon sequence is targetted by the PMO strand, where hybridisation with the target sequence will prohibit the genome from being transcribed. This resulting in a smaller but functional protein and provide a increase in quality of life for the patients #mcite(("Moulton2017PMO"), biblio). 
//
//
//
//
//
==== Aptamers
Aptamers are single-stranded NA strands capable of forming three dimensional structures. What defines such an aptamer is the application of the molecule, being able to recognise ligands with a high specificity and sensitivity. This is analogous with the common antibody, but ligands are not limited to just immunogenic proteins. Aptamers are also able to bind and sequester small molecules, something antibodies are not capable of.
The production of an aptamer is comparatively cost-efficient and less labour-intensive, and this has gained them popularity in the pharmaceutical field #mcite(("Mayer2009aptamer"), biblio).

Supposing that therapeutic aptamers would be composed of DNA or RNA, they would be rapidly made ineffective by the human body. Chemical modifications prove beneficial to make aptamers viable for therapeutic interventions. We can generate aptamer against specific targets through the usage of the SELEX methodology (more about this in @chap-chapterAptamer).
When selecting for a suitable aptamer against a target - e.g. a surface receptor of a cell - modifications are applied to the nucleotide sequence in order to improve its nuclease resistance and to potentially finetune the affinity towards its target. 
Most common alterations are the 2_'_-modifications, small modifications to the linker and nucleobase. As aptamers are sensitive to chemical changes, applying these alterations to specific nucleotides in the chain are done with the anticipation to better the interactions with the target and not to destabilise the aptamer.

Because the SELEX methodology requires NA processing enzymes, using chemistries with a modified backbone are more difficult to apply because that means the enzymes need to be tailored to those specific chemistries and not DNA or RNA. Nonetheless, several groups have succeeded in creating aptamers with HNA #mcite(("Pinheiro2012geneticpolymer"), biblio) and TNA #mcite(("Dunn2020tnaaptamer"), biblio) respectively, by engineering a polymerase enzymes that are capable of manipulating these chemistries.
//
//
//
==== Biocontainment
The field of synthetic biology is driven by the philosophy of _directed evolution_. The key idea is to accelerate the evolutionary process by pushing environmental conditions onto a protein and steer it to lose or gain particular properties. For example, a DNA polymerase has been successfully evolved into an HNA polymerase and was used to conceive the first HNA aptamer #mcite(("Pinheiro2012geneticpolymer"), biblio).

It is common practice in biotechnological research and production to invest resources in the management of bacterial cultures and extraction of the target molecule(s), i.e. upstream and downstream processing respectively. A good product should be void of impurities and external invasion of pathogens can disrupt and destroy manufactured batches of proteins, such as vaccin development.

In the realm of _directed evolution_, there exists a paradigm to create an alternative genetic system, orthogonal to the natural DNA and RNA biopolymers. This encompasses all types of modifications, of which the HNA chemistry has shown success in its application. Its implications are that a bacterial system could only survive, replicate and produce in artificial conditions in micromanaged incubators. This would imply that the invasion of pathogens like viruses and other bacteria from an external source have no way of interfering and mutating the genome of the synthetic growth cultures, ensuring the purity the colonies and their product.
In biotechnological industries, purifying products and maintaining purity of the colonies is one of the most expensive aspects #mcite(("Groaz2023hna"), biblio) and this system would tremendously cut its costs.
There are, however, studies that have shown it is possible for DNA/HNA oligomers to be successfully ligated into a plasmid and serve as a template for DNA synthesis under select conditions #mcite(("Pezo2013hnatemplate"), biblio).
//
//
//

#pagebreak()
