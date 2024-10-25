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
  "2'-O-methyl RNA"
)

#glossary-layout(
  "2'-O-MOE",
  "2'-O-methoxyethyl RNA"
)

// AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
#glossary-layout(
  "A",
  "adenine/adenosine"
)

//#glossary-layout(
//  "Å (Ångstrom)",
//  "a measure of distance equal to " + $10^(-10)$ + "meters"
//)

#glossary-layout(
  "Ab",
  "antibody"
)

#glossary-layout(
  "AGOx",
  "argonaute protein family"
)

#glossary-layout(
  "AMBER",
  "Assisted Model Building with Energy Refinement."
)

#glossary-layout(
  "ANA",
  "arabinose NA"
)

#glossary-layout(
  "AS",
  "Altona-Sundaralingam"
)

#glossary-layout(
  "ASL",
  "anticodon-stem loop"
)

#glossary-layout(
  "ASO",
  "antisense oligonucleotide"
)

// BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
#glossary-layout(
  $beta$ + "-homo-DNA",
  $beta$ + "-D-Glucopyranosyl NA"
)

#glossary-layout(
  "BLI",
  "Bio-layer Interferometry"
)

#glossary-layout(
  "bp",
  "basepair"
)

// CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
#glossary-layout(
  "C",
  "cytidine/cytosine"
)

#glossary-layout(
  "CeNA",
  "cyclohexenyl NA"
)

#glossary-layout(
  "CLI",
  "commandline interface"
)

#glossary-layout(
  "Comp.chem",
  "computational chemistry"
)

#glossary-layout(
  "CP",
  "Cremer-Pople"
)

#glossary-layout(
  "CS",
  "conformational sampling"
)

#glossary-layout(
  "CST",
  "compartmentalized self-tagging"
)

// DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
#glossary-layout(
  "DDD",
  "Drew Dickerson dodecamer"
)

#glossary-layout(
  "DE",
  "directed evolution"
)

#glossary-layout(
  "DFT",
  "density functional theory"
)

#glossary-layout(
  "DG",
  "differential geometry"
)

#glossary-layout(
  "DNA",
  "deoxyribose NA"
)

#glossary-layout(
  "d(A,C,G,T)",
  "DNA (adenosine, cytidine, guanosine, thymidine)"
)

#glossary-layout(
  "DP",
  "dynamic programming"
)

#glossary-layout(
  "ds",
  "double stranded"
)

#glossary-layout(
  "DSL",
  "domain specific language"
)

#glossary-layout(
  "dXyNA",
  "Deoxylose NA"
)

// EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
#glossary-layout(
  "EMBO",
  "European Molecular Biology Organization"
)

#glossary-layout(
  "ESP",
  "electrostatic potential"
)

// FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
#glossary-layout(
  "FF",
  "force field"
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
  "guanine/guanosine"
)

#glossary-layout(
  "GAFF",
  "general AMBER force field"
)

#glossary-layout(
  "GO",
  "geometry optimisation"
)

#glossary-layout(
  "Gq",
  "G-quartet/G-quadruplex"
)

#glossary-layout(
  "GSQ",
  "gold standard quality"
)

#glossary-layout(
  "GUI",
  "graphic user interface"
)

// HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
#glossary-layout(
  "HEL",
  "hen egg lyzosyme"
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
  "human immunodeficiency virus"
)

#glossary-layout(
  "HNA",
  "Hexitol NA or 2',3'-dideoxy-1',5'-anhydro-D-arabino-Hexitol"
)

#glossary-layout(
  "h(A,C,G,T)",
  "HNA (adenosine, cytidine, guanosine, thymidine)"
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
  "locked NA"
)

#glossary-layout(
  "LoT",
  "level of theory"
)

// MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
#glossary-layout(
  "MD",
  "molecular dynamics"
)

#glossary-layout(
  "miRNA",
  "microRNA"
)

#glossary-layout(
  "MK",
  "Merz-Kollman"
)

#glossary-layout(
  "MM",
  "molecular mechanics"
)

#glossary-layout(
  "MNA",
  "morpholino NA"
)

#glossary-layout(
  "m(A,C,G,T)",
  "MNA (adenosine, cytidine, guanosine, thymidine)"
)

#glossary-layout(
  "MPn",
  "Møller–Plesset n" + super("th") + " order perturbation theory"
)

#glossary-layout(
  "mRNA",
  "messenger RNA"
)

#glossary-layout(
  "MSA",
  "multiple sequence alignment"
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
  "nanobody"
)

#glossary-layout(
  "NGS",
  "next-generation sequencing"
)

#glossary-layout(
  "NMR",
  "nuclear magnetic resonance"
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
  "oligonucleotide"
)

// PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
#glossary-layout(
  $Psi$,
  "Pseudo-uracil"
)

#glossary-layout(
  "PA",
  "population analysis"
)

#glossary-layout(
  "PBC",
  "periodic boundary conditions"
)

#glossary-layout(
  "PCR",
  "polymerase chain reaction"
)

#glossary-layout(
  "PES",
  "potential energy surface"
)

#glossary-layout(
  "PME",
  "particle mesh ewald"
)

#glossary-layout(
  "PMO",
  "dimethylamino-phosphorodiamidate MNA"
)

// QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
#glossary-layout(
  "QM",
  "quantum mechanics"
)

// RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
#glossary-layout(
  "RAM",
  "random access memory"
)

#glossary-layout(
  "RBS",
  "ribosome binding site"
)

#glossary-layout(
  "REMD",
  "replica exchange MD"
)

#glossary-layout(
  "RESP",
  "restrained ESP"
)

#glossary-layout(
  "RISC",
  "RNA-induced silencing complex"
)

#glossary-layout(
  "RMSD",
  "root-mean-square deviation"
)

#glossary-layout(
  "RNA",
  "ribose NA"
)

#glossary-layout(
  "r(A,C,G,U)",
  "RNA (adenosine, cytidine, guanosine, uridine)"
)

// SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
#glossary-layout(
  "SA",
  "simulated annealing"
)

#glossary-layout(
  "SAS(A)",
  "solvent accessible surface (area)"
)

#glossary-layout(
  "SELEX",
  "systematic evolution of ligands by exponential enrichment"
)

#glossary-layout(
  "SES",
  "solvent excluded surface"
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
  "single point evaluation"
)

#glossary-layout(
  "SPR",
  "surface plasmon resonance"
)

#glossary-layout(
  "ss",
  "single stranded"
)

// TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
#glossary-layout(
  "T",
  "thymine/thymidine"
)

#glossary-layout(
  "TNA",
  "threose NA"
)

#glossary-layout(
  "tRNA",
  "transfer RNA"
)

// UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU
#glossary-layout(
  "U",
  "uridine/uracil"
)

// VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
#glossary-layout(
  "WCF",
  "Watson-Crick-Franklin"
)

#glossary-layout(
  "WFT",
  "wave function theory"
)

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#glossary-layout(
  "XNA",
  "xenobiotic nucleic acid"
)

#glossary-layout(
  "XyNA",
  "xylose NA"
)

// YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
// ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
#glossary-layout(
  "ZNA",
  "phosphonomethyl glycol NA"
)

//Lastly, the symbol for  is a measure of distance equal to $10^(-10)$ meters, or also 0.1 nanometer. To put this on a rough scale, nucleic acid monomers are relative to humans in size as humans are to the distance from the earth to the sun. \ 
//#pagebreak()
