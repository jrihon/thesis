#import "../../lib/colours.typ": colourPalette

#let chapter-style(content) = text(fill: colourPalette.lightblueslate, weight: "bold")[#content]

= ABSTRACT
#v(1em)

#chapter-style()[Chapter 1] gives us a broad introduction on nucleic acid molecules and how they evolved to partake in physiological processes to maintain human life. We discuss the modifications one can apply to access better or new properties and apply such synthetic nucleic acids for pharmaceutical applications. 
A detailed explanation is given on how we can _measure_ the structure of nucleic acid molecules and the duplexes that are composed of these molecules.
Lastly, an overview of how we mathematically interpret molecules is given by elaborating on the field of _Computational Chemistry_. First, we describe a set of atoms by the orientation of their nuclei and electrons, which returns us the energy of the system. We transfer this information through a _force field_ that allows us to exploit the desired molecule's behaviour during Molecular Dynamics simulations. To simulate is to mimic how molecules interact with eachother and their environment.

In #chapter-style()[Chapter 2], we focus on the methodology of Conformational Sampling. This type of experiment returns us information on which conformations a molecule favours to adopt and which one it does not tend to visit. We have previously applied this on modified nucleic acids that are of interest to our lab, through an accelerated methodology that makes it manageable to run it on local workstation. However, understanding and applying the mathematical descriptions used to generate the landscapes can be cumbersome, which is why we introduce to _pucke.rs_ toolkit to simplify the scripting approach to this method. Alongside a benchmarking study, we provide a commandline tool and a Python library that should aid any researcher in applying the methodology for their own molecules without having to trouble themselves with the algebra that goes on behind it.  

The largest fruits of my labour are condensed in #chapter-style()[Chapter 3]. The core idea is to be able to generate and model nucleic acid helices, starting from a pure _in silico_ point. We are interested in the Morpholino Nucleic Acid, which has been heavily used in antisense oligonucleotide therapeutics, though its atomic structure is not determined. If we want to exploit the molecule further, we need to be able to rationalise how it exerts its power on a fundamental level.
By using the methodology from the previous chapter, we can characterise the behaviour of a molecule. Information from this landscape can then be curated to insert into the Ducque model builder so one can build atomic models out of them. Ducque has been specifically designed to accomodate building atomic models for (synthetic) nucleic acids, a tool that did not exist but is a necessity to have when modeling in this field. The data from the landscape can also be used to design a force field that correctly describes the molecules. This can all be concatenated to perform accurate Molecular Dynamics simulations for chemical alterations that have so far been difficult to structurally determine in the lab.

#chapter-style()[Chapter 4] is a continuation of the work of a previous colleague. The collaborative effort to characterise the HNA Aptamer was an arduous task that took several years to complete. Thanks to the experimental efforts conducted by our collaborators in Cambridge, London and Sydney, we were able to rationalise the structure of the elusive Hen Egg Lysozyme aptamer through _in silico_ means. Through complementary efforts, we were able to devise that this HNA Aptamer structure contains a non-canonical G-quadruplex motif, which is essential to its stability and thus its interaction potential to the enzyme it binds to.

Finally,  #chapter-style()[Chapter 5] concludes the thesis. We discuss a project that will soon see the light of day, as an addendum to the Ducque model builder.
We talk about how the computational study on XNA could grow and which directions are likely outcomes of the research carried out in this thesis.







// Lastly ... 
What I want to convey to the laypeople reading this thesis is that _in silico_ research, now more than ever, plays a crucial part in designing new molecules and that this way of carrying out experimental research rationalises the way we look at molecules. Computational research gives insight into the mechanisms at play that can be exploited for our goals, while laboratory research gives us a determinstic point of view with which we move research forward. These methodological branches of science are complementary to one another. Using only one will forever keep us from achieving our true potential.

#pagebreak()
