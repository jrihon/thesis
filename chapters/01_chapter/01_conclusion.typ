#import "../../lib/multi-bib.typ": mcite
#import "bib_01_chapter.typ": biblio

//
//
== Conclusion
//
Molecular dynamics simulations have proven to be useful to gain insight and predict how changes in the backbone impact on the complementation properties of proteins and (synthetic) nucleic acids. Accurate parametrisation of the forcefield used in molecular dynamics is a prerequisite to obtain reliable results. Available tools to perform force field parametrization rely on transitional pathways for conformational changes in fragments of the biomolecules that can be derived from a PES. Here we introduce the _pucke.rs_ CLI and _pucke.py_ library that streamline calculation of PESs for amino acids, five and six-membered ring systems. The _pucke.rs_ toolkit and the Conformational Sampling methodology synergises with the Ducque model builder #mcite(("Rihon2024Ducque"), biblio) , where evaluated conformers can be curated from the landscape to use as building blocks for XNA model building.

This work also demonstrates how different levels of theory in computational chemistry perform, both in terms of qualitative output and by logging their _consumables_, allowing the user to make informed decisions for their own experiments and what their hardware allows them to do. 
While this work based itself on the accelerated methodology of Mattelaer _et al._ #mcite(("Mattelaer2021efficient"), biblio), the goal was to explore the possibilities a researcher can use for this type of experiments.

The free and open-source toolkit allows for a pragmatic approach to these experiments, by simplifying the workflow to what is actually desired; the sampling, defining and documenting of the configurational space of the biomolecular monomer of interest. The _inversion_ method for the Cremer-Pople formalism is particularly useful to recreate conformations from literature, to reproduce and understand puckering behaviour.


Physical links to software releases can be found in _Published Works_ section of the thesis.
