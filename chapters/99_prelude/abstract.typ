#import "../../lib/colours.typ": colourPalette



#let chapter-style(content) = text(fill: colourPalette.lightblueslate, weight: "bold")[#content]

= ABSTRACT
#v(1em)

#chapter-style()[Chapter 1] gives us a broad introduction on nucleic acid molecules and how they evolved to partake in physiological processes to maintain human life. We discuss the modifications one can apply to access better or new properties and apply such synthetic nucleic acids for pharmaceutical applications. 
A detailed explanation is given on how we can _measure_ the structure of nucleic acid molecules and their polymer structures.
Lastly, an overview of how we mathematically interpret molecules is given by elaborating on the field of _computational chemistry_. First, we describe a molecule by the orientation of its nuclei and electrons, which returns us the energy of the system. We transfer this information through a _force field_ that allows us to exploit the desired molecule's behaviour during molecular dynamics simulations. To simulate is to mimic how molecules interact with each other and their environment as they would in real life.

In #chapter-style()[Chapter 2], we focus on the methodology of conformational sampling. This type of experiment yields us potential energy surfaces with which we can understand the puckering modes a molecule of interest favours and which one it does not tend to visit. We have previously applied this on modified nucleic acids that are of interest to our lab, through an accelerated methodology that makes it manageable to run on a local workstation. However, understanding and applying the mathematical descriptions used to generate the landscapes can be cumbersome, which is why we introduce the _pucke.rs_ toolkit to simplify the scripting approach to this method. Alongside a benchmarking study to gather insightful data on the differences in methods of computational chemistry, we provide a command line tool and a Python library that should aid any researcher in applying the methodology for their own molecules without having to trouble themselves with the algebra that goes on behind it.  

The largest fruits of our labour are condensed in #chapter-style()[Chapter 3]. The core idea is to be able to generate and model nucleic acid helices through a fully computational protocol. We are interested in the morpholino nucleic acid, which has been heavily used in antisense oligonucleotide therapeutics. Unfortunately, its atomic structure is not yet determined. If we want to exploit the molecule further, we need to be able to rationalise how it exerts its power on a fundamental level.
By using the methodology from the previous chapter, we can characterise the behaviour of a molecule. Information from this landscape can then be curated to insert into the Ducque model builder to build 3D atomic models, ready for simulations.
Ducque has been designed to allow users to import custom chemistries to build their own helical models, which synergises specifically with the conformational sampling experiment.
//Ducque has been specifically designed to accomodate building atomic models for (synthetic) nucleic acids, a tool that did not exist but is a necessity to have when modeling in this field.
The data from the surfaces can also be used to generate a force field that correctly describes the molecules. This can all be concatenated to perform accurate molecular dynamics simulations for any type of synthetic nucleic acid modification.

#chapter-style()[Chapter 4] is a continuation of the work of dr. Charles-Alexandre Mattelaer. The collaborative effort to characterise the HNA aptamer was an arduous task that took several years to complete. Thanks to the experimental efforts conducted by our collaborators in Cambridge, London and Sydney, we were able to rationalise the structure of the elusive hen egg lysozyme aptamer through _in silico_ means. Thanks to complementary efforts, we were able to devise that this HNA aptamer structure contains a non-canonical G-quadruplex motif, which is essential to its stability and thus its interaction potential to the enzyme it binds to.

//Finally,  #chapter-style()[Chapter 5] concludes the thesis. We discuss a project that will soon see the light of day, as an addendum to the Ducque model builder. We talk about how the computational study on XNA could grow and which directions are likely outcomes of the research carried out in this thesis.
Finally,  #chapter-style()[Chapter 5] provides a scientific discussion on the various aspects of the presented research, effectively concluding the thesis. Firstly, we discuss a project that will soon see the light of day as an addendum to the Ducque model builder. 
//We talk about the variety of programming languages used for academic research.
A small discussion elaborates on the facilitation of the computational study on XNA, on having clear protocols for parametrisation and to make meaningful distinctions for nucleic acid structures. Lastly, the possible outcomes of this research are discussed.
// Programming languages
// Nucleobase mods
// Fitting protocols for multiconformational
// Differential Geometry

#pagebreak()
