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

// CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
#glossary-layout(
  "C",
  "Cytidine/Cytosine"
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

// DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
#glossary-layout(
  "DFT",
  "Density Functional Theory"
)

#glossary-layout(
  "DNA",
  "Deoxyribose Nucleic Acid"
)

#glossary-layout(
  "dXyNA",
  "Deoxylose Nucleic Acid"
)

#glossary-layout(
  "ds",
  "double stranded"
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
  "FFT",
  "Fast Fourier Transform"
)

// GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
#glossary-layout(
  "G",
  "Guanine/Guanosine"
)

// HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
#glossary-layout(
  "HIV",
  "Human Immunodeficiency Virus"
)

#glossary-layout(
  "HNA",
  "Hexitol Nucleic Acid or 2',3'-dideoxy-1',5'-anhydro-D-arabino-hexitol"
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
  "MPn",
  "Møller–Plesset n" + sub("th") + " order perturbation theory"
)

#glossary-layout(
  "mRNA",
  "messenger RNA"
)

// NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
#glossary-layout(
  "NA",
  "Nucleic Acid"
)

#glossary-layout(
  "nt",
  "nucleotides"
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
  "Polynucleotide Chain Reaction"
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
  "RESP",
  "Restraint ESP"
)

#glossary-layout(
  "RISC",
  "RNA-induced silencing complex"
)

#glossary-layout(
  "RNA",
  "Ribose Nucleic Acid"
)

// SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
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
  "ss",
  "single stranded"
)

#glossary-layout(
  "SP",
  "Strauss-Pickett"
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
