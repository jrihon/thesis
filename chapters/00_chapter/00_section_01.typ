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
NA structures are not constrained to just helical structures, but can fold into three dimensional structures capable of enzymatic activity or being involved in it. The first example is that of the transfer RNA (tRNA), which is involved in matching codons of mRNA and appending to the growing amino acid chain, when being processed by the ribosome complex. Another example is that of _ribozymes_, capable of catalytic activity. These include folded RNAs that can splice ssRNA and even an _in vitro_ evolved RNA polymerase ribozyme that is capable of extending an RNA strand based on an RNA template 
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

The nucleic acids were assigned names by letters of the greek alphabet. The dihedrals of the backbone trace the consecutive chain, which follow the direction 5_'_ $arrow.r$ 3_'_ and thusly follow the alphabet's lexicographical order,  and are named from $alpha arrow.r zeta$ ,(@fig-iupacnames D.) with the glycosidic torsion angle denoted as $chi$. The endocyclic torsions of the sugar ribose consist of five dihedrals $nu_(0 arrow.r 4)$ that start at the O4_'_-C1_'_ bond and circle about the sugar clockwise (@fig-iupacnames B.).
The atomnames in the nucleotides belonging to the backbone are always highlighted by a tick, to distinguish them from the atoms of the nucleobase. As nomenclature is extremely sensitive on the modifications applied to molecules, a robust naming convention is worth its weight in gold to avoid confusion #mcite(("Iupac1983nucleicacids", "Saenger1984"), biblio).   

Standard nucleobases are composed of the set Adenine (A), Guanine (G), Cytidine (C) and Thymine (T)/Uracil (U), with the last two belonging to the DNA and RNA chemistry respectively (@fig-iupacnames D.). Standard basepairing patterns are established by the Watson-Crick-Franklin (WCF) basepairing between a purine:pyrimdine pair. Hydrogen bond patterns are the dominant force (A:T/U, C:G) for keeping associating strands together. In the way that nucleotides are stacked above one another contributes further to solid nucleic acid helices, which finds its principle in the efficient stacking of aromatised orbitals in the rings of the nucleobases.
#figure(
  image("./figures/nucleicacids/iupac-naming.svg", width: 100%),
  caption: [
    blabla
  ]
) <fig-iupacnames>
Speaking of helices, or more commonly duplexes, in biology we find two typical structures of nucleic acid duplexes. The B-type DNA structure is innately recognised by DNA processing enzymes to transcribe DNA to RNA in human cells (the central dogma), while the A-type RNA structure helices are more commonly found in most bacterial genomes where it analogously functions as their genetic system (@fig-iupacnames E.). 
They are characterised by differences in major and minor grooves, helical length and bp per turn ($frac("bp", 2pi)$).
// Dit mag eigenlijk in het hoofdstuk over nucleobase modifications komen
//However, as we will come to understand in this thesis, different types of basepairing are possible not only with doublets but also triplets and tetrads of basepairing patterns.
//
//=== The evolution of chemical biology
=== Synthetic Nucleic Acids
==== Purpose of modifications
==== Sugar-phosphate modifications
==== Nucleobase modifications
//=== Modifications to nucleic acids
//! -> nucleobase
//! -> sugar
//! -> linker
//!
#lorem(50)

//=== Current affairs on the _in silico_ side of things 
//#lorem(50)
//==== Necessity for a new class of drugs
//#lorem(20)

=== Applications of synthetic nucleic acids

==== Aptamers

==== Antisense Oligonucleotides

==== Biocontainment

==== Antiviral therapy

//#lorem(50)
//==== _Wet lab_ advances
//#lorem(20)
//
//==== _Dry lab_ approaches
//#lorem(20)
//
//==== The need for innovation
//#lorem(20)

#pagebreak()
