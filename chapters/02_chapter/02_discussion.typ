#import "../../lib/multi-bib.typ": mcite
#import "bib_02_chapter.typ": biblio
// https://github.com/ntjess/wrap-it
#import "@preview/wrap-it:0.1.0": wrap-content


== Discussion
Xeno-nucleic acids (XNAs) are a class of synthetic molecules that differ from naturally occurring nucleic acids in the use of altered backbones that can impact the three dimensional structure, stability and processing by naturally occurring biological processes. Numerous XNAs have been synthesized and characterized in the last decades revealed  that ability to form stable homoduplexes and heteroduplexes with natural nucleic acids determines potential applications #mcite(("Anosova2015structuraldiversity"), biblio). Molecular modeling simulations can provide understanding and predict how changes in the sugar-phosphate backbone impact on the complementation properties of the nucleic acids. However, the missing link in this field is a software tool that builds initial XNA models beyond ribose-based nucleic acids and robust force field parametrisation to perform molecular mechanics simulations within standard packages such as AMBER. To fill this gap, we introduced a streamlined molecular modeling approach starting from quantum mechanics on XNA fragments. 
The versatile nucleic acid builder (Ducque) presented here builds XNA structures with unlimited backbone chemistry. It relies on a library of nucleosides and linkers that is user-extendable. We demonstrated the tool can build initial models starting from preferably low energy conformations of nucleosides and linkers, extracted from conformational sampling experiments. The latter also delivered data for force field parametrisation required to perform molecular mechanics simulations on the initial model.    
Ducque produces models of RNA and DNA duplexes as fast as the NAB tool.

#let ion-bb-fig = [
  #figure(
    image("./figures/ion-to-backbone-justfig.svg"),
    caption : [
      The K#super("+") ion enclosed in the backbone. Notice the mA30's glycosidic bond angle having shifted to a _syn_ configuration. 
//      See Figure IonBackbone for an detailed look into the enclosed ion throughout the MD simulation. 
    ]
  ) <fig-ion2bbjustfig>
]
#let ionbbcontent = [
The latter is part of the AMBER toolkit and requires other AMBER programs (like tLEaP) to run, whereas Ducque functions as a standalone software. Syntactically, Ducque reads in simple text files to directly generate a model, as opposed to NAB's DSL which writes like C code and requires compilation of and executing the produced binary.
Produced initial models are highly similar for both model builders and provided the same results in a subsequent MD simulation in standard force fields of AMBER. In contrast to NAB, Ducque is not limited to ribose based nucleic acids. Low energy conformations for non-ribose based nucleosides with hexitol and xylose sugars were included in the Ducque library, among others, and served to build nucleic acid duplexes for which //MD simulations could be performed using a parametrised force fields within AMBER #mcite(("Schofield2023hnaaptamer", "Mattelaer2021dxylose"), biblio).
]
//#wrap-content(ion-bb-fig, ionbbcontent)
#wrap-content(ion-bb-fig, ionbbcontent, align: right)
#v(-0.5em)
MD simulations could be performed using newly parametrised force fields within AMBER #mcite(("Schofield2023hnaaptamer", "Mattelaer2021dxylose"), biblio).

//
//
//
//
//
As sugar puckering is crucial for the backbone geometry and flexibility, we used Paramfit to optimise dihedral angle parameters on non-ribose nucleosides by fitting QM to MM energies of selected conformations of nucleosides after RESP charges had been calculated through the ORCA implementation. Linker parameters from GAFF2 were validated through QM approaches.

The initial RNA::HNA duplex was built and remained stable during the MD round. Ducque’s model of dXyNA homoduplex with backbone dihedrals for a ladder-like structure converged towards the left-handed helical structure in the MD simulation, confirming what was predicted in the dXyNA duplex #mcite(("Maiti2011deoxyxylose", "Ramaswamy2009xylonastruct", "Ramaswamy2017xylonastruct"), biblio) (@fig-hna-dxylo C.). This result, and that of the DNA::RNA heteroduplex, ensured that dihedral angles used for model building in Ducque did not determine the outcome of the MD simulation.  

The methodology described to derive charges for naturally occurring RNA modifications #mcite(("Aduri2007paramnuc"), biblio) starts off differently than the one described in this work, but has the same goal. At last, experiments were performed on an RNA::MNA duplex. The charges for the MNA chemistry were derived using the new ORCA implementation, that was evaluated on HNA. According to the proposed workflow, low energy conformations of nucleosides and linker are described by QM calculations and ported to the Ducque library. In line with the available crystal structure #mcite(("Zhang2019templatemna"), biblio), the #super("4'")C#sub("1'") chair having the nucleobase in an equatorial position turned out to be the lowest energy conformation of morpholino nucleosides according to QM. An initial model was produced by Ducque and subjected to an MD simulation using a force field that was parametrised as described in the methods section. The RNA::MNA heteroduplex simulations yielded a right-handed helical structure that does not belong to the A- or B-type family #mcite(("Langner2020thiophosphoramidate"), biblio). 
The morpholino rings remain predominantly in their chair conformation with an equatorial orientation of the nucleobase.
Also in homoduplexes of (4_'_ $arrow.r$ 6_'_)-($beta$-D-glucopyranosyl) oligonucleotides (or $beta$-homo-DNA) #mcite(("Egli2023oligonucs"), biblio), (4_'_ $arrow.r$ 6_'_) and (3_'_ $arrow.r$ 6_'_) pentopyranose systems #mcite(("Eschenmoser2011naalternatives"), biblio)  this conformation is adopted by the six-membered pyranoses in the backbone but none of these XNA chemistries is able to communicate by base-pairing with either RNA or DNA. Changing the C1_'_ configuration (e.g. $alpha$-homo-DNA) or having the nucleobase on a C2_'_ axial position instead of the regular C1_'_ anomeric (equatorial) site of the six membered ring in the 'glycon' moiety (HNA), generated XNA systems that cross-pair with natural nucleic acids #mcite(("Lescrinier2003difference"), biblio).

Except for a Watson-Crick-Franklin (WCF) to Hoogsteen (HG) transition in a mA:U basepair (@fig-ion2bbjustfig), that was facilitated by K#super("+") binding and fraying at the helix end, stable WCF base pairing was observed during the MD simulation. Transitions between WCF and HG could be important in DNA recognition and replication, but are difficult to investigate experimentally because they are rare and short-lived. A transition from WCF to HG basepairing had been observed before for DNA in relaxation dispersion NMR experiments #mcite(("Nikolova2011hgindna"), biblio). The same outside-route transition from WCF to HG base pairing was observed in DNA simulations, as the nucleotide temporarily unpairs and interacts with the solute, before repairing #mcite(("Vreede2019wcftohg"), biblio). 
The occurrence of a WCF to HG transition in the final MNA::RNA simulation demonstrates that our optimised dihedral force field parameters allow puckering in the morpholino ring that is also expected in real life.

Only subtle changes in dihedral angles of the RNA strand, compared to values measured in dsRNA A-type helices, are imposed by the complementary MNA. To complement MNA, RNA adapts to the conformational constraints of the rigid binding partner with a more _anti_-characterised $chi$ torsion angles while other dihedral angles remain closely to what is observed in dsRNA (@tbl-suppl-RNAMNA_backbone, @tbl-suppl-chibackbone). This minor difference significantly changes helical parameters for helicity, groove widths, roll and twist of the duplex, as was demonstrated by restrained MD on dsRNA resulted in the same effect that is more pronounced if restraints on $chi$ torsion angles deviate further from the 199$degree$ observed in A-type duplexes (@tbl-HelicalParams). The increased diameter can be attributed to the six-membered morpholino ring in the backbone, in line to other XNA with six-membered sugar moieties #mcite(("Lescrinier2000rnahna", "Egli2006hna"), biblio). 
The unique chemistry of the MNA backbone changed orientation of the phosphoramidate in MNA and displaces the phosphorus atom in a position where it does not align with phosphates in the backbone of standard RNA (@fig-LinkerOrient). Combined with the significantly different helical parameters, like increased radius of the double helix, altered positioning of the phosphoramidate due to the morpholino ring, can all contribute to the lack of RNA degradation when bound to complementary MNA sequences #mcite(("Nan2018antisense"), biblio).   


