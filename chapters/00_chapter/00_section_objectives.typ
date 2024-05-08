#import "../../lib/multi-bib.typ": mcite
#import "bib_00_chapter.typ": biblio

//
#pagebreak()
//
//
//
== Objectives

=== Current state of affairs 
Recent advances in the field of computational research on XNA #mcite(("mattelaer2021PHD"), biblio) made it possible to robustly characterise modified nucleosides in a short timeframe with a modest workstation.
This methodology could be further popularised with the aid of computational tools that relieve other researchers from the mathematics of abstracting conformations and gives them the power to access the formalisms through simple scripting.

// https://www.rcsb.org/stats/growth/growth-released-structures
// https://www.rcsb.org/stats/growth/growth-dna
// https://www.rcsb.org/stats/growth/growth-rna
// https://www.rcsb.org/stats/explore/polymer_entity_type
One other key problem is the lack of virtual _pdb_ models to use for Molecular Dynamics studies. At the time of writing this - May 2024 - the entire RCSB database accounts for almost 215.000 protein structures. The share of nucleic acid models is about 18.000, with nearly 75% of them complexed to a protein. Of the remaining standalone models, many are just DNA and RNA with unique three dimensional shapes. A minority of those determined NA models exhibit rather unique modifications to either of the three core moieties that NAs exhibit. There is a high diversity in published XNA, which makes it difficult to characterise their behaviour based off of a few structures.

Added to this, using organic synthesis to make the XNA building blocks is resource intensive and can take months, if not an entire year, to create a set of compounds. This does not account testing their viability in one of the applicative fields.

The field currently lacks a streamlined way to carry out computational studies on synthetic nucleic acids by a set protocol.
A number of issues are at the cause, where the first one 
(i) The lack of structural models for XNA in the database makes it difficult to
(ii) generate a force field that correctly models the properties of the modifications. 

=== The resolve 
What we want to do is to concatenate and streamline several methodologies to establish a protocol in which we can predict the influence of a synthetic modification on the helical structure. There is integral part missing, which is procuring a suitable XNA model to run simulations with.  

//We want to be able to predict a structure of particular modifications we have a vested interest in to understand their behaviour. 
The protocol should contain the following flow :  
+ Characterise the behaviour of a modification _in silico_ . A toolkit to streamline this process would facilitate the methodology.

+ Use generated data to derive a force field that encapsulates the behaviour of the molecule

+ Create and design a tool from scratch to assemble XNA models. This should synergise with the characterisation of the molecules. This tool, a model builder, should provide the user with user-implementable chemistries and work dynamically with the given inputs.

+ Perform Molecular Dynamics studies and work towards predicting new XNA helical models.

#v(2em)
The key belief for this doctoral thesis is that the field of computational research on XNA requires the leap forward to flourish. While the possibility to do so has been made available to the public already, it requires the combination of molecular modeling, cheminformatics and a strong theoretical background in chemical biology.   
