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
The DNA strands are transcribed (_transcription_) to single stranded (ss) messenger RNA (mRNA). This mRNA is escorted outside of the nucleus and accepted by a protein complex, the ribosomes. These read the nucleic acid sequence and form a complementary strand of amino acids (_translation_), whose composition is determined by the mRNA sequence. This specific chain of amino acids will then be accepted by a machinery to be processed and folded into a protein suitable to handle the incoming physiological signals. 


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
The previous section gives us a brief overview into how important nucleic acid molecules are to all living organisms. Though we've discussed their biological potential, our invested interest is in the fundamental characterisation of DNA and RNA, and especially chemically modified variants thereof. Continuing into this chapter, we need to formalise the definitions we conventionally use when discussing nucleic acid molecules.

The native nucleic acids, DNA and RNA, are composed of three core moieties: the ribose ring (sugar), the nucleobase and a phosphate (linker) (@fig-iupacnames A.). The sugar moiety is the central part of the molecule, with the phosphate linking two molecules together, hence their combination being referred to as the backbone of the nucleic acid helix. The nucleobase pairs with a complementary nucleobase that is part of a different NA strand.

The nucleic acids were assigned names by letters of the greek alphabet. The dihedrals of the backbone trace the consecutive chain, which follow the direction 5_'_ $arrow.r$ 3_'_ and thusly follow the alphabet's lexicographical order,  and are named from $alpha arrow.r zeta$ (@fig-iupacnames C.), with the glycosidic torsion angle denoted as $chi$ .(@fig-iupacnames A.) The endocyclic torsions of the sugar ribose consist of five dihedrals $nu_(0 arrow.r 4)$ that start at the O4_'_-C1_'_ bond and circle about the sugar clockwise (@fig-iupacnames B.).
The atomnames in the nucleotides belonging to the backbone are always highlighted by a tick, to distinguish them from the atoms of the nucleobase. As nomenclature is extremely sensitive on the modifications applied to molecules, a robust naming convention is worth its weight in gold to avoid confusion #mcite(("Iupac1983nucleicacids", "Saenger1984"), biblio).   
As a sidenote, the reader is invited to peak ahead to @sec-intro-dihedrals to understand what a torsion angle is.

Standard nucleobases are composed of the set Adenine (A), Guanine (G), Cytosine (C) and Thymine (T)/Uracil (U), with the last two belonging to the DNA and RNA chemistry respectively (@fig-iupacnames D.). Standard basepair (bp) patterns are established by the Watson-Crick-Franklin (WCF) basepairing between a purine:pyrimdine pair. Hydrogen bonds are the dominant force (A:T/U, C:G) for keeping associating strands together. In the way that nucleotides are stacked above one another contributes further to solid nucleic acid helices, which finds its principle in the efficient stacking of aromatised orbitals in the rings of the nucleobases.
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
The B-DNA and A-RNA are two types of helices associated with biological processes. The B-type DNA structure is innately recognised by DNA processing enzymes to transcribe DNA to RNA in human cells (@fig-centraldogma B.), while the A-type RNA structure helices are more commonly found in most bacterial genomes where it analogously functions as their genetic system (@fig-iupacnames E.). The A-type is also associated with siRNA studies. 
They are characterised by differences in major and minor grooves (Å), and helical size ($frac(Å, 2pi)$). 

Lastly, the symbol for Ångstrom (Å) is a measure of distance equal to $10^(-10)$ meters, or also 0.1 nanometer. To put this on a rough scale, nucleic acid monomers are relative to humans in size as humans are to the distance from the earth to the sun. \ 
\
\
//
//
//
//
//
//
//
=== Synthetic Nucleic Acids
//
Chemically altering the composition of native NAs can be done by appending or modifying (groups of) atoms in one of the three moieties.
Modifying these molecules is not a trait that is exclusive to enzymes in cells. Researchers have also figured out methods to succesfully harness the utility that comes from changing the defining characteristics of DNA and RNA.  

There is an abundance of modifications the field of Xenobiotic Nucleic Acids (XNAs) has provided us, which would require a second thesis to even iterate over most of them. The aim is to give some examples into the popular synthetic nucleotides to give the reader an inkling of what viable possibilities exist.  
//These modifications occur naturally in the cell in regulating gene expression, in replication and translation processes and RNAi. These modifications are often undergone by the nucleobases in polynucleotide chains, resulting in a change of interaction between the chain and its target and influencing a biochemical reaction in the process #mcite(("Chen2016mods", "Aduri2007mods", "Bentley2014mods", "Helm2006postmods"), biblio).
//
//
//
//
==== Sugar-phosphate modifications
//! -> nucleobase
//
//
//
==== Nucleobase modifications
//=== Modifications to nucleic acids
//!
//
===== Natural modifications
Common modifications undergone by canonical NAs are modifications to the C5-pyrimidine and N7-purines. These modifications are oriented towards the major groove and aid in the favourable hydrophobicity that trademarks this part of the helix, which is important to maintain for the recognition by NA processing enzymes #mcite(("Helm2006postmods", "MozoVillaras2021hydrophobicgroove"), biblio). During (co-) and after (post-) transcription, nucleobases are modified along a cellular need which determines signalling and folding of the RNA constructs #mcite(("Bentley2014mods"), biblio). Another popular modification is that of the pseudouridine (Ψ) nucleoside, which contains an isomerisation of the uracil nucleobase. The Ψ nucleotide is involved in the tRNA structure, where it has been mutated on key positions, namely 34 and 37, of the 76mer ssRNA. Its effects are involved in the sensitive role the tRNA plays in recognising codon triplets at its Anticodon-Stem-Loop (ASL). Matching the correct codon to the specific tRNA's ASL consequently appends the correct amino acid to the growing peptide chain in the ribosomes. Even more so, modifications at those positions in tRNA contain the bulk of the known alterations to nucleobases documented in the field
#mcite(("Helm2006postmods"), biblio).

#figure(
  image("./figures/nucleicacids/mods-nucleobases.svg", width: 100%),
  caption: [
    blabla
  ]
)<fig-nucleomods>

===== Unnatural modifications
Most remarkable alterations are brought forth from Kool's and Benner's group respectively. One type of categorisation is that of (non-)canonical hydrogen bonding patterns. This is effectuated by complete modifications of the purine:pyrimdine dyad. Kool's group advocated for widened nucleobases that added a benzene ring to the canonical nucleobases #mcite(("Gao2005kool", "Chelliserrykattil2008kool"), biblio), making different bonding patterns with the chemistries they applied. Benner's research holds on to the canonical WCF pattern and devised a new basepair (P:Z#sub("Benner")), whose nucleobases are excluded from pairing with the canonical nucleobases, that showed promise by having extremely high rates of incorporation in Polynucleotide Chain Reactions (PCRs) and even in reverse transcription experiments #mcite(("Piccirilli1990benner", "Yang2011benner"), biblio). If used properly, this could mean a third pseudo-canonical basepair for an alternative genetic system.\
A second category is that of the hydrophobic nucleobases, in which their capacity to form pairs relies on steric complementarity (F:Z#sub("Kool")), which was also researched by Kool's and coworkers #mcite(("Morales1998kool"), biblio). These nucleobases do resemble the canonical ones in shape, but differ highly electron density. The lack of hydrogen bonding does mean lesser forces are at play, culminating in duplex structures  that aren't strongly complexed.


//=== Current affairs on the _in silico_ side of things 
//#lorem(50)
//==== Necessity for a new class of drugs
//#lorem(20)

==== Purpose of modifications
//! -> sugar
//! -> linker
In our line of research, we are interested specifically in how these chemical modifications change the overall helical structure of the NA duplex. These type of modifications are attributed to changes in the backbone itself. As we will come to learn, the backbone characterises how the helix bends and twists and the nucleobase modifications will determine the interactions with its target. 

This has numerous applications in the pharmaceutical field. While small molecules drugs and antibody therapeutics have reigned supreme, NA therapeutics have been able to provide long-standing solutions to problems that weren't attainable to their rivaling compounds. More so, XNA research has provided the field of synthetic biology with means to tinker towards goals that were previously thought of as science fiction. 

The research carried out for this thesis means to expose the inner workings of these synthetic nucleotides to understand their potential applicability. 

=== Applications of synthetic nucleic acids

==== Aptamers
Many of these non-canonical nucleobases are often applied in aptamer research to vary the interaction potential between aptamer and target.

==== Antisense Oligonucleotides

==== Biocontainment

==== Antiviral therapy

//
//
//
//
//
//
//==== The need for innovation
//#lorem(20)

#pagebreak()
