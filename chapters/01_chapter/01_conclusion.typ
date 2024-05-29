#import "../../lib/multi-bib.typ": mcite
#import "bib_01_chapter.typ": biblio


== Conclusion
//
//When researching puckering formalisms and working on characterising biomolecular monomers computationally, this library will prove immensely valuable.
//The _pucke.rs_ toolkit proves useful to generate the set of constraints and axes required for performing Conformational Sampling experiments. 
When researching puckering formalisms and working on characterising biomolecular monomers computationally, the _pucke.rs_ CLI and _pucke.py_ library will prove immensely valuable.

We were able to visualise how different levels of theory in computational chemistry perform, both in terms of qualitative output and by logging their _consumables_, allowing the user to make informed decisions for their own experiments and what their hardware allows them to do. Accurate characterisation of molecules should not be impaired by the specifications of one's machine. While this work based itself on the accelerated methodology of Mattelaer _et al._ #mcite(("Mattelaer2021efficient"), biblio), the goal was to explore and expand the possibilities a researcher can use for this type of experiments.
The information returned by such methodologies can be used to make informed decisions on constraintive procedures in Molecular Dynamics simulations, to firmly decide on restraintive measures in NMR-related deterministic structure elucidation studies and even derive a suitable forcefield for the XNA in question. This can all be achieved from purely _in silico_-based research.

The free and open-source toolkit allows for a pragmatic approach to these experiments, by simplifying the workflow to what is actually desired; the sampling, defining and documenting of the configurational space of the biomolecular monomer of interest. The _inversion_ method for the Cremer-Pople formalism is particularly useful to recreate conformations from literature, to reproduce and understand puckering behaviour.

The #link("https://github.com/jrihon/puckers")[CLI-tool] and the #link("https://github.com/jrihon/puckepy")[Python library] are available on GitHub, where their documentation can be found as well. The user can build the CLI from source by using the Rust toolchain, or install the library directly from pip or conda. Physical links to software releases can be found in _Published Works_ section of the thesis.
