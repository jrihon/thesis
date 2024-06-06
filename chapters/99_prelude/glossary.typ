// do #set() call before everything else
#set page(columns: 2)

= GLOSSARY
#v(1em)
#let glossary-layout(name, content) = {
  [*#name* : #content \ ]
}
// Numbers
#glossary-layout(
  "2'-O-MeRNA",
  "2'-O-Methyl RNA"
)

#glossary-layout(
  "2'-O-MOE",
  "2'-O-Methoxyethyl RNA"
)

// AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
#glossary-layout(
  "A",
  "Adenine/Adenosine"
)

#glossary-layout(
  "Å (Ångstrom)",
  "a measure of distance equal to " + $10^(-10)$ + "meters"
)

#glossary-layout(
  "Ab",
  "Antibody"
)

#glossary-layout(
  "AGOx",
  "Argonaute protein family"
)

#glossary-layout(
  "AMBER",
  "Assisted Model Building with Energy Refinement. The MM package of choice."
)

#glossary-layout(
  "ANA",
  "Arabinose Nucleic Acid"
)

#glossary-layout(
  "AS",
  "Altona-Sundaralingam"
)

#glossary-layout(
  "ASL",
  "Anticodon-Stem Loop"
)

#glossary-layout(
  "ASO",
  "Antisense Oligonucleotide"
)

// BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
#glossary-layout(
  "bp",
  "basepair"
)

#glossary-layout(
  $beta$ + "homo-DNA",
  $beta$ + "-D-glucopyranosyl NA"
)

#glossary-layout(
  "BLI",
  "Biolayer Interferometry"
)

// CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
#glossary-layout(
  "C",
  "Cytidine/Cytosine"
)

#glossary-layout(
  "CeNA",
  "Cyclohexenyl NA"
)

#glossary-layout(
  "CLI",
  "Commandline Interface"
)

#glossary-layout(
  "Comp.chem",
  "Computational Chemistry"
)

#glossary-layout(
  "CP",
  "Cremer-Pople"
)

#glossary-layout(
  "CS",
  "Conformational Sampling"
)

#glossary-layout(
  "CST",
  "Compartmentalized Self-Tagging"
)

// DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
#glossary-layout(
  "DDD",
  "Drew Dickerson Dodecamer"
)

#glossary-layout(
  "DE",
  "Directed Evolution"
)

#glossary-layout(
  "DFT",
  "Density Functional Theory"
)

#glossary-layout(
  "DG",
  "Differential Geometry"
)

#glossary-layout(
  "DNA",
  "Deoxyribose Nucleic Acid"
)

#glossary-layout(
  "d(A,C,G,T)",
  "DNA (Adenosine, Cytidine, Guanosine, Thymidine)"
)

#glossary-layout(
  "DP",
  "Dynamic Programming"
)

#glossary-layout(
  "ds",
  "double stranded"
)

#glossary-layout(
  "DSL",
  "Domain Specific Language"
)

#glossary-layout(
  "dXyNA",
  "Deoxylose Nucleic Acid"
)

// EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
#glossary-layout(
  "EMBO",
  "European Molecular Biology Organization"
)

#glossary-layout(
  "ESP",
  "Electrostatic Potential"
)

// FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
#glossary-layout(
  "FF",
  "Force field"
)

#glossary-layout(
  "FFT",
  "Fast Fourier Transform"
)

#glossary-layout(
  "FNA",
  "2'-Fluoro NA"
)

// GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
#glossary-layout(
  "G",
  "Guanine/Guanosine"
)

#glossary-layout(
  "GAFF",
  "General Amber Force Field"
)

#glossary-layout(
  "GO",
  "Geometry Optimisation"
)

#glossary-layout(
  "Gq",
  "G-quartet/G-quadruplex"
)

#glossary-layout(
  "GSQ",
  "Gold Standard Quality"
)

#glossary-layout(
  "GUI",
  "Graphic User Interface"
)

// HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
#glossary-layout(
  "HEL",
  "Hen Egg Lyzosyme"
)

#glossary-layout(
  "HF",
  "Hartree-Fock"
)

#glossary-layout(
  "HG",
  "Hoogsteen"
)

#glossary-layout(
  "HIV",
  "Human Immunodeficiency Virus"
)

#glossary-layout(
  "HNA",
  "Hexitol Nucleic Acid or 2',3'-dideoxy-1',5'-anhydro-D-arabino-hexitol"
)

#glossary-layout(
  "h(A,C,G,T)",
  "HNA (Adenosine, Cytidine, Guanosine, Thymidine)"
)

// IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
#glossary-layout(
  "IUPAC",
  "International Union for Pure and Applied Chemistry"
)

// JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
// KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK
// LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
#glossary-layout(
  "LNA",
  "Locked Nucleic Acid"
)

#glossary-layout(
  "LoT",
  "Level of Theory"
)

// MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
#glossary-layout(
  "MD",
  "Molecular Dynamics"
)

#glossary-layout(
  "miRNA",
  "micro RNA"
)

#glossary-layout(
  "MK",
  "Merz-Kollman"
)

#glossary-layout(
  "MM",
  "Molecular mechanics"
)

#glossary-layout(
  "MNA",
  "Morpholino Nucleic Acid"
)

#glossary-layout(
  "m(A,C,G,T)",
  "MNA (Adenosine, Cytidine, Guanosine, Thymidine)"
)

#glossary-layout(
  "MPn",
  "Møller–Plesset n" + sub("th") + " order perturbation theory"
)

#glossary-layout(
  "mRNA",
  "messenger RNA"
)

#glossary-layout(
  "MSA",
  "Multiple Sequence Alignment"
)

// NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
#glossary-layout(
  "NA",
  "Nucleic Acid"
)

#glossary-layout(
  "NAB",
  "Nucleic Acid Builder"
)

#glossary-layout(
  "Nb",
  "Nanobody"
)

#glossary-layout(
  "NGS",
  "Next-Generation Sequencing"
)

#glossary-layout(
  "NMR",
  "Nuclear Magnetic Resonance"
)

#glossary-layout(
  "nt",
  "nucleotides"
)

#glossary-layout(
  "NTP",
  "nucleotide triphosphate"
)

// OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
#glossary-layout(
  "ON",
  "Oligonucleotide"
)

// PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
#glossary-layout(
  "PA",
  "Population Analysis"
)

#glossary-layout(
  "PBC",
  "Periodic Boundary Conditions"
)

#glossary-layout(
  "PCR",
  "Polymerase Chain Reaction"
)

#glossary-layout(
  "PES",
  "Potential Energy Surface"
)

#glossary-layout(
  "PME",
  "Particle Mesh Ewald"
)

#glossary-layout(
  "PMO",
  "Dimethylamino-phosphorodiamidate MNA"
)

#glossary-layout(
  $Psi$,
  "Pseudo-uracil"
)

// QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
#glossary-layout(
  "QM",
  "Quantum mechanics"
)

// RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
#glossary-layout(
  "RAM",
  "Random Access Memory"
)

#glossary-layout(
  "RBS",
  "Ribosome Binding Site"
)

#glossary-layout(
  "REMD",
  "Replica Exchange MD"
)

#glossary-layout(
  "RESP",
  "Restraint ESP"
)

#glossary-layout(
  "RISC",
  "RNA-induced silencing complex"
)

#glossary-layout(
  "RMSD",
  "Root-Mean-Square Deviation"
)

#glossary-layout(
  "RNA",
  "Ribose Nucleic Acid"
)

#glossary-layout(
  "r(A,C,G,U)",
  "RNA (Adenosine, Cytidine, Guanosine, Uridine)"
)

// SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
#glossary-layout(
  "SA",
  "Simulated Annealing"
)

#glossary-layout(
  "SAS(A)",
  "Solvent Accessible Surface (Area)"
)

#glossary-layout(
  "SELEX",
  "Systematic Evolution of Ligands by EXponential enrichment"
)

#glossary-layout(
  "SES",
  "Solvent Excluded Surface"
)

#glossary-layout(
  "siRNA",
  "silencing RNA"
)

#glossary-layout(
  "SP",
  "Strauss-Pickett"
)

#glossary-layout(
  "SPE",
  "Single Point Evaluation"
)

#glossary-layout(
  "SPR",
  "Surface Plasmon Resonance"
)

#glossary-layout(
  "ss",
  "single stranded"
)

// TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
#glossary-layout(
  "T",
  "Thymine/Thymidine"
)

#glossary-layout(
  "TNA",
  "Threose Nucleic Acid"
)

#glossary-layout(
  "tRNA",
  "transfer RNA"
)

// UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU
#glossary-layout(
  "U",
  "Uridine/Uracil"
)

// VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
#glossary-layout(
  "WCF",
  "Watson-Crick-Franklin"
)

#glossary-layout(
  "WFT",
  "Wave Function Theory"
)

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#glossary-layout(
  "XNA",
  "Xenobiotic Nucleic Acid"
)

#glossary-layout(
  "XyNA",
  "Xylose Nucleic Acid"
)

// YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
// ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
#glossary-layout(
  "ZNA",
  "Phosphonomethyl Glycol Nucleic Acid"
)

//Lastly, the symbol for  is a measure of distance equal to $10^(-10)$ meters, or also 0.1 nanometer. To put this on a rough scale, nucleic acid monomers are relative to humans in size as humans are to the distance from the earth to the sun. \ 
//#pagebreak()
