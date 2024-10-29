//#import "../../lib/multi-bib.typ": mcite
#import "../../lib/colours.typ": colourPalette
#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx
//#import "bib_06_chapter.typ": biblio

#show "hf3c": "HF-3c"
#show "mp2q": [MP2#super("Q")]
#show "pbeq": [PBE0#super("Q")]
#show "hfq": [HF#super("Q")]
= APPENDIX

== Chapter 1 : General introduction
#figure(
  supplement: [Appendix],
  image( "../00_chapter/figures/refframe/vert-basepair-orientations.svg", height: 85%),
  caption: [
    Modes of basepair orientation. 
    *A.1* Translation intrabasepair
    *A.2* Translation of the basepair dyad
    *A.3* Translation interbasepair
    *B.1* Rotation intrabasepair
    *B.2* Rotation of the basepair dyad
    *B.3* Rotation interbasepair \ 
    Left column are manipulations of the x-axis,
    middle column are manipulations of the y-axis and
    right column are manipulations of the z-axis. 
    Displacement are assigned by (Δ), rotations are assigned by (_R_).
    Figure adapted from EMBO - Cambridge convention.
  ]
) <fig-appendix-basepairorient>



#pagebreak()

#figure(
  supplement: [Appendix],
  image("../00_chapter/figures/orbitals/vert-all-orbitals-appendix.svg", height: 90%),
  caption: [
    Representative $s$- ,$p$-, $d$- and $f$-type orbitals. Solution to the orbitals courtesy of 'christian' :  
    #link("https://scipython.com/blog/visualizing-the-real-forms-of-the-spherical-harmonics/#rating-149")[https://scipython.com/blog/visualizing-the-real-forms-of-the-spherical-harmonics/#rating-149]. 
  ]
) <fig-all-type-orbitals>

#pagebreak()

//
//
//
//
//
//
== Chapter 2: The _pucke.rs_ toolkit to calculation puckers of biomolecular monomers.

#figure(
  supplement: [Appendix],
  image("../01_chapter/figures/consumables_total.svg", width: 98%),
  caption: [
    *A.* The RAM usage and 
    *B.* disk space usage during the geometry optimisation protocol of the set of the LoTs, as mentioned in the Methods section. The mp2q surpasses the computational requirements of the second most demanded pbeq by large, requiring almost ten times more time and four times more virtual resources to complete. 
    *C.* The RAM usage and 
    *D.* disk space usage during the single point evaluation protocol. The hfq seems to be on par with the RAM usage to that of mp2q. While for disk space usage, the hfq and pbeq tend to run relatively similar. The mp2q, however, tumultuous. This is likely due to 35 SPE calculations are happening concurrently, and finishing at relatively the same pace. This means that tmp-files are constantly being written to, from and deleted, which gives rise to a high fluctuation in the storage on disk. On all graphs, the hf3c is barely visible as it finished so quickly and requires barely any resources to run successfully.
  ]
) <fig-supplementary-consumables>

#pagebreak()

#figure(
  supplement: [Appendix],
  image("../01_chapter/figures/suppl_inf_diffEnergy.svg", width: 100%),
  caption: [
    All the PESs (@fig-PESALL) are compared against the GSQ, returning the results of a ∆∆E PES. Ranges from [-3.0 $arrow.r$ 3.0] kcal/mol . The bottom row is rather monochromous because the scale of the plot has been magnified in @fig-diffErelRMSD A. with respect to this figure The bottom right square is the GSQ, which depicts a flat off-white colour equal to the value of zero.
  ]
) <fig-supplementary-deltaEnergy>

#pagebreak()

#figure(
  supplement: [Appendix],
  image("../01_chapter/figures/suppl_inf_RMSD.svg", width: 100%),
  caption: [
    $Delta$RMSD of all of all sets of optimised structures at with the respective methods, compared with each other. @fig-diffErelRMSD B. is present here as the uttermost right column. Ranges from [0. $arrow.r$ 0.10] Å.
  ]
) <fig-supplementary-deltaRMSD>
//
//
#pagebreak()
//
//
//
== Chapter 3: The Ducque model builder tool to predict synthetic nucleic acid duplexes

#v(1em)
#figure(
  supplement: [Appendix],
  tablex(
    columns: 7,
    map-cells: cell => (..cell, content: text(cell.content, size: 11pt)),
    stroke: 0.5pt + colourPalette.lightblueslate,
    // Header
[*Sequence*] , [*RMSD #super($kappa$)*] , [*$Delta$tilt #super($lambda$)*] , [*$Delta$roll #super($lambda$)*] , [*$Delta$twist #super($lambda$)*] , [*NAB#super($kappa$) trj.*] , [*Ducque#super($kappa$) trj.*] ,
    // Content
[d(aaggatttacgt)]   , [0.015] ,  [0.35 ($plus.minus$ 0.12)] ,  [0.05 ($plus.minus$ 0.05)] ,  [0.27 ($plus.minus$ 0.26)] , [2.13 ($plus.minus$ 0.37)] , [2.04 ($plus.minus$ 0.34)]  ,
[d(ataaaaacatga)]   , [0.009] ,  [0.38 ($plus.minus$ 0.11)] ,  [0.08 ($plus.minus$ 0.06)] ,  [0.31 ($plus.minus$ 0.30)] , [2.41 ($plus.minus$ 0.45)] , [1.97 ($plus.minus$ 0.36)]  ,
[d(atattaagtgtt)]   , [0.013] ,  [0.32 ($plus.minus$ 0.17)] ,  [0.07 ($plus.minus$ 0.06)] ,  [0.23 ($plus.minus$ 0.20)] , [2.18 ($plus.minus$ 0.40)] , [2.43 ($plus.minus$ 0.48)]  ,
[d(caccacgtgacg)]   , [0.004] ,  [0.65 ($plus.minus$ 0.75)] ,  [0.33 ($plus.minus$ 0.69)] ,  [0.51 ($plus.minus$ 0.31)] , [2.20 ($plus.minus$ 0.45)] , [2.36 ($plus.minus$ 0.45)]  ,
[d(ggaattttaatt)]   , [0.018] ,  [0.33 ($plus.minus$ 0.14)] ,  [0.07 ($plus.minus$ 0.04)] ,  [0.15 ($plus.minus$ 0.21)] , [2.00 ($plus.minus$ 0.34)] , [2.05 ($plus.minus$ 0.35)]  ,
[d(gtgcaaccgtaa)]   , [0.009] ,  [0.37 ($plus.minus$ 0.12)] ,  [0.08 ($plus.minus$ 0.06)] ,  [0.29 ($plus.minus$ 0.29)] , [2.40 ($plus.minus$ 0.47)] , [1.94 ($plus.minus$ 0.35)]  ,
[d(tacccgagcctt)]   , [0.005] ,  [0.36 ($plus.minus$ 0.14)] ,  [0.03 ($plus.minus$ 0.04)] ,  [0.30 ($plus.minus$ 0.25)] , [2.25 ($plus.minus$ 0.51)] , [2.26 ($plus.minus$ 0.49)]  ,
[d(taggttccttcg)]   , [0.017] ,  [0.40 ($plus.minus$ 0.09)] ,  [0.08 ($plus.minus$ 0.06)] ,  [0.23 ($plus.minus$ 0.20)] , [2.63 ($plus.minus$ 0.45)] , [2.23 ($plus.minus$ 0.43)]  ,
[d(tattaatgtgcc)]   , [0.012] ,  [0.38 ($plus.minus$ 0.19)] ,  [0.07 ($plus.minus$ 0.06)] ,  [0.23 ($plus.minus$ 0.20)] , [2.30 ($plus.minus$ 0.41)] , [2.26 ($plus.minus$ 0.42)]  ,
[d(tgaagggttgtc)]   , [0.006] ,  [0.39 ($plus.minus$ 0.16)] ,  [0.08 ($plus.minus$ 0.06)] ,  [0.14 ($plus.minus$ 0.15)] , [2.32 ($plus.minus$ 0.46)] , [2.19 ($plus.minus$ 0.45)]  ,
colspanx(7)[],
//[%\hline\hline]           ]                      ]                      ]                      ]                     ]                     ]
//[\colrule     ]           ]                      ]                      ]                      ]                     ]                     ]
[r(aacaaugccuug)]   , [0.209] ,  [2.20 ($plus.minus$ 2.69)] , [11.93 ($plus.minus$ 10.48)],  [0.29 ($plus.minus$ 0.28)] , [2.29 ($plus.minus$ 0.39)] , [1.92 ($plus.minus$ 0.36)]  ,
[r(agcgacuaaaau)]   , [0.199] ,  [3.03 ($plus.minus$ 3.13)] , [15.00 ($plus.minus$ 8.53)] ,  [0.57 ($plus.minus$ 0.51)] , [1.97 ($plus.minus$ 0.39)] , [1.96 ($plus.minus$ 0.39)]  ,
[r(cugagcaacgua)]   , [0.232] ,  [2.52 ($plus.minus$ 2.61)] , [12.28 ($plus.minus$ 8.87)] ,  [0.56 ($plus.minus$ 0.42)] , [2.32 ($plus.minus$ 0.44)] , [2.22 ($plus.minus$ 0.39)]  ,
[r(gacacuucauca)]   , [0.131] ,  [2.33 ($plus.minus$ 2.90)] , [12.16 ($plus.minus$ 10.76)],  [0.63 ($plus.minus$ 0.33)] , [2.21 ($plus.minus$ 0.30)] , [2.28 ($plus.minus$ 0.40)]  ,
[r(gauacgaucgaa)]   , [0.182] ,  [3.71 ($plus.minus$ 4.15)] , [ 5.55 ($plus.minus$ 5.79)] ,  [0.63 ($plus.minus$ 0.55)] , [2.03 ($plus.minus$ 0.51)] , [1.98 ($plus.minus$ 0.38)]  ,
[r(gccucguaaagc)]   , [0.127] ,  [2.34 ($plus.minus$ 3.08)] , [10.43 ($plus.minus$ 8.81)] ,  [0.34 ($plus.minus$ 0.26)] , [2.04 ($plus.minus$ 0.38)] , [1.91 ($plus.minus$ 0.45)]  ,
[r(gcuuagagacac)]   , [0.218] ,  [1.58 ($plus.minus$ 2.02)] , [ 5.44 ($plus.minus$ 4.91)] ,  [0.52 ($plus.minus$ 0.26)] , [2.04 ($plus.minus$ 0.36)] , [2.01 ($plus.minus$ 0.36)]  ,
[r(gggugacacauu)]   , [0.188] ,  [2.64 ($plus.minus$ 3.03)] , [12.32 ($plus.minus$ 9.54)] ,  [0.65 ($plus.minus$ 0.47)] , [2.05 ($plus.minus$ 0.47)] , [1.92 ($plus.minus$ 0.41)]  ,
[r(uauuccacugaa)]   , [0.109] ,  [4.08 ($plus.minus$ 4.66)] , [ 9.76 ($plus.minus$ 9.67)] ,  [0.81 ($plus.minus$ 0.77)] , [1.92 ($plus.minus$ 0.40)] , [2.06 ($plus.minus$ 0.30)]  ,
[r(uuccuacacuag)]   , [0.174] ,  [1.43 ($plus.minus$ 1.72)] , [ 4.78 ($plus.minus$ 5.60)] ,  [0.41 ($plus.minus$ 0.38)] , [2.12 ($plus.minus$ 0.38)] , [2.17 ($plus.minus$ 0.45)]  ,
  ),
  caption : [
    Structure building comparison Ducque versus NAB, with trajectory comparison.
    Results of superpositioning of the respective structures before minimisation, RMSD expressed in Å#super($kappa$).
    Interbasepair-parameters expressed in #super($lambda$) degrees ($degree$). Calculated mean and standard deviation of all respective trajectories after 5 ns, RMSD expressed in Å#super($kappa$).  
        The _Sequence_ column represents the leading strand of the modelled homoduplex, the complementary strand is inferred.
  ]
) <tbl-suppl-DucqueVsNab>

#pagebreak()
//\subsection{RNA::MNA and RNA::RNA backbone angles values of the simulation}
#figure(
  supplement: [Appendix],
  tablex(
    columns: 5,
    map-cells: cell => (..cell, content: text(cell.content, size: 11pt)),
    stroke: 0.5pt + colourPalette.lightblueslate,
    // Header
    rowspanx(2)[*Backbone*]        , colspanx(2)[#align(center)[*RNA::MNA*]], ()                                , colspanx(2)[#align(center)[*RNA::RNA*]] , () ,
           ()            ,  [RNA]                               , [MNA]                                     , [RNA]                            , [RNA]                         ,
    [Alpha   ($alpha$)  ],  [284.93 ($plus.minus$ 16.00)]       , [295.46 ($plus.minus$ 22.90)]             , [284.16 ($plus.minus$ 14.04)]    , [284.25 ($plus.minus$ 13.47)] ,
    [Beta    ($beta$)   ],  [175.48 ($plus.minus$  9.75)]       , [166.67 ($plus.minus$ 10.85)]             , [173.06 ($plus.minus$  9.37)]    , [173.08 ($plus.minus$  9.47)] ,
    [Gamma   ($gamma$)  ],  [ 65.57 ($plus.minus$ 14.01)]       , [ 62.70 ($plus.minus$  8.31)]             , [ 65.18 ($plus.minus$ 11.97)]    , [ 64.84 ($plus.minus$ 11.36)] ,
    [Delta   ($delta$)  ],  [ 77.89 ($plus.minus$  6.78)]       , [190.71 ($plus.minus$  8.64)]             , [ 78.23 ($plus.minus$  6.72)]    , [ 78.22 ($plus.minus$  6.65)] ,
    [Epsilon ($epsilon$)],  [201.40 ($plus.minus$ 10.84)]       , [192.19 ($plus.minus$ 14.77)]             , [201.55 ($plus.minus$ 10.39)]    , [201.49 ($plus.minus$ 10.37)] ,
    [Zeta    ($zeta$)   ],  [290.08 ($plus.minus$  9.48)]       , [175.26 ($plus.minus$ 14.54)]             , [291.53 ($plus.minus$  8.92)]    , [291.43 ($plus.minus$  8.89)] ,
    [Chi     ($chi$)    ],  [196.71 ($plus.minus$  9.90)]       , [208.32 ($plus.minus$ 11.51)]             , [199.10 ($plus.minus$  9.15)]    , [199.64 ($plus.minus$  9.48)] ,
    [P-P distance],  [  5.98 ($plus.minus$  0.32)]       , [  7.06 ($plus.minus$  0.20)]             , [  6.04 ($plus.minus$  0.31)]    , [  6.03 ($plus.minus$  0.31)] ,
  ),

  caption : [
    Torsion angles (in degrees, $degree$) of the RNA::MNA heteroduplex in comparison with the RNA::RNA homoduplex. Data extracted from the last 50 ns of the 200 ns simulation.
  ]
) <tbl-suppl-RNAMNA_backbone>

#v(1em)

#figure(
  supplement: [Appendix],
  tablex(
    columns: 5,
    map-cells: cell => (..cell, content: text(cell.content, size: 11pt)),
    stroke: 0.5pt + colourPalette.lightblueslate,
    // Header
    rowspanx(2)[*Backbone*]        , colspanx(2)[#align(center)[*RNA::RNA $chi_(189)$*]], ()                                , colspanx(2)[#align(center)[*RNA::RNA $chi_(194)$*]] , () ,
           ()            ,  [RNA]                               , [RNA]                                     , [RNA]                            , [RNA]                         ,
    [Alpha   ($alpha$)  ],  [285.42 ($plus.minus$ 13.89)]       , [284.91 ($plus.minus$ 15.35)]             , [284.64 ($plus.minus$ 14.32)]    , [284.58 ($plus.minus$ 14.07)] ,
    [Beta    ($beta$)   ],  [173.70 ($plus.minus$  9.78)]       , [174.04 ($plus.minus$ 10.81)]             , [173.09 ($plus.minus$  9.55)]    , [173.24 ($plus.minus$ 10.94)] ,
    [Gamma   ($gamma$)  ],  [ 65.65 ($plus.minus$ 12.04)]       , [ 65.71 ($plus.minus$ 13.79)]             , [ 65.52 ($plus.minus$ 12.25)]    , [ 65.19 ($plus.minus$ 12.82)] ,
    [Delta   ($delta$)  ],  [ 77.70 ($plus.minus$  6.55)]       , [ 78.08 ($plus.minus$  6.98)]             , [ 77.98 ($plus.minus$  6.54)]    , [ 78.32 ($plus.minus$  7.07)] ,
    [Epsilon ($epsilon$)],  [202.05 ($plus.minus$ 10.61)]       , [202.46 ($plus.minus$ 11.15)]             , [201.71 ($plus.minus$ 10.10)]    , [202.47 ($plus.minus$ 10.73)] ,
    [Zeta    ($zeta$)   ],  [290.53 ($plus.minus$  8.85)]       , [289.82 ($plus.minus$ 10.36)]             , [291.37 ($plus.minus$  8.85)]    , [290.76 ($plus.minus$  9.07)] ,
    [Chi     ($chi$)    ],  [190.85 ($plus.minus$  4.20)]       , [189.84 ($plus.minus$  5.82)]             , [194.80 ($plus.minus$  4.22)]    , [194.41 ($plus.minus$  6.90)] ,
    [P-P distance],  [  6.02 ($plus.minus$  0.33)]       , [  6.03 ($plus.minus$  0.33)]             , [  6.03 ($plus.minus$  0.33)]    , [  6.05 ($plus.minus$  0.32)] ,
  ),
  caption: [
        Backbone torsion angles (in degrees, $degree$) of the RNA::RNA homoduplexes, run with restraints on the $chi$ angle at 189 $degree$ and 194 $degree$, respectively. Data sampled from the last 50 ns of the 200 ns simulation.
  ]
) <tbl-suppl-chibackbone> 
