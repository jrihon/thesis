#show "HAPT": [_hApt#super("50")_]
#show "Core13" : [_Core-13_]
#show "Core14" : [_Core-14_]
#show "Gq" : [_Gq_]

== Result & Discussion
As recapitulated, the devised Gq motif consists of the hG#sub("1"), hG#sub("13"), hG#sub("20") and hG#sub("23") residues. The previous experiments on the Core13 simulations had been done using residue hG#sub("27"), instead of hG#sub("23"), as a product of the REMD experiments. Several different structures were sampled throughout the calculations and, at the time, this model made to most sense thermodynamically, as it answered to the requirement of containing a Gq motif and had an elongated loop between residue 20 and 23. 
However, later experiments showed that the hG#sub("23") residue contributed to the stability of the Gq motif. After several rounds of Simulated Annealing, an intensily iterative approach was applied to converge towards a fixed and sound structure.

Setting up each iteration included imposing restraints during the first 50 ns of the simulation in explicit solvent. This allows for structural relaxation of the model, after which a 1 μs simulation is run in the presence of ions to check the stability.
//The model obtained by simulated annealing was first subjected to a 50 ns restrained MD experiment in explicit solvent to allow structural relax- ation. Next, the structure was submitted for an unrestrained MD simulation in explicit solvent for 1 ␮s in the presence of ions to check the stability.

During the unrestrained MD simulation, the overall structure of the folded oligonucleotide remained intact. The planarity of the G-quartet stacking on proposed hTTT and hTAT triplets in a short quadruplex was well preserved. Two of the nucleobases in the hTTT triplet are involved in hT-hT base pairing (45) through hydrogen bonds formed by hT#sub("2"):O4-hT#sub("12"):H3 and hT#sub("2"):H3-hT#sub("12"):O2. Base pairing of hG#sub("24") with hT#sub("12") is quickly lost during MD, but nucleobases of these residues remain in the same plane, stacked between the G quartet and the TAT triplet in the structure. The hA#sub("11") in the proposed hTAT triplet is involved in a stable WCF basepair with hT#sub("3"), and Hoogsteen interaction with hT#sub("31"). Indeed, mutation of hA#sub("11") abolishes HEL binding. The amino group of hC#sub("26") interacts with O4 of hT#sub("31") and hT#sub("3") to form a stable hTAT + C quartet, which appears to be important for HEL binding as mutation of hT#sub("3") abolishes binding. A K#super("+") ion remains in the central tunnel of the quadruplex, between the G-quartet and nucleobases of hG#sub("15") and hC#sub("19"). The monovalent cation is coordinated by O6 of all nucleobases in the Gq, O6 and N7 of hG#sub("15"), O2 and N3 of hC#sub("19") that closely hold the ion in place throughout the full length of the simulation.

#figure(
  image("./figures/total-figure-aptamer.svg", width: 100%),
  caption: [
    *A.* Projection of the three dimensional structure of the Core13 aptamer. 
    *B.* Three dimensional structure of the Core13 aptamer. 
  ]
) <fig-totalaptamer>

A partially hydrated Mg#super("2+") ion bridges phosphate oxygens of hT#sub("12") and hT#sub("21"), thereby stabilizing the short loop between hG#sub("20") and hG#sub("23"). An second Mg#super("2+") ion bridges this short loop with the 4_'_-end of the aptamer. To clarify, the first Mg#super("2+") ion was selectively placed there to avoid repulsion of the phosphate backbones residing in close proximity of one another. In a later _wet lab_ study, on the substitution or absence of the various ion types, it was confirmed the presence Mg#super("2+") has a stabilising effect to the Gq itself.
//Only the six mem- bered sugar in hT21 (3 S5 ) tends to adopt higher energy skew-like conformations at the equator of the conforma- tional globe (␾ = ±40◦ for hT21) instead of traditional chair
The core of the aptamer is flanked a hG#sub("5")-hG#sub("27")-hA#sub("30") triplet stacking on the hTAT + C quartet. It is stabilized by hG#sub("5") and hG#sub("27")'s carbonyls that coordinate a Na#super("+") ion together with hC#sub("26") carbonyl of the quartet above. The nucleobase of hA#sub("30") sandwiched between hC#sub("26") and the hT#sub("6")-hT#sub("29") base pair that has a stable hT#sub("6"):H3-hT#sub("29"):O4 hydrogen bond and is formed during the MD. This stable base pairing of hT#sub("29") with hT#sub("6") appears to be important for HEL binding as _in vitro_ mutation of hT#sub("29") appears to diminishes binding against HEL.

For reference, the hG#sub("27")A mutation was simulated. During the MD of this mutant, the core of the structure remained stable but the Na#super("+") ion was released from its pocket causing some rearrangements in the hT#sub("6")-hA#sub("10") loop the 4-tail starting with residue 27 and resulting in the loss of hT#sub("6")-hT#sub("29") base pairing.








// A. Recap what happened previously in C.A.'s work -> done
// - Explain the current experiments run and how the results came to be
//  -> forcefield building and simulated annealing. Not in methods because that is not what I did
// - Explain truncation experiments
//  => experiment with truncating from either side, they came up with core13 and core14 as the best one in SPR experiments
//  => chemically synthesised the strands and did competition studies with known anti-HEL antibodies; camelid came out on top
//  => single alanine scans and charge reversion mutations were introduces. Several site mutations overlapped with mutations needed
//    for camelid and aptamer to bind together, meaning they share common hotspots.
//  => to understand whether or not it has a Gq4, a specific BG4 monoclonal antibody (BG4) was used. Na veel vijven en zessen was it 
//    confirmed (or at least highly likely) that this aptamer contains a G4 quadruplex structure, as the epitope recognised by both 
//      antibodies is largely independent of sugar configuration.
//  => From Suppl. Table 3, we can see that G1, G13, G20 and G23 (not G27) are making up the Gq
//    They saw this because they mutated all Gs to an A and observed inactivity with the first four!
//    => Affinity measured against an antibody that detects quadruplexes
//  => Detailed investigation says that T3, A11 and T29 are also needed for core13 binding or in the aptamer structure folding.
//    Then, for other mutation studies, they also saw that those others seemed to be very important through other mutation studies.
//    => Affinity measured on HEL itself as saw that it didn't work anymore
// - Show the comparison with the camelid epitope (whatever that is)
// - 
//
// B. Show the computational timeline via the modelled structures
// - Start with the 29mer first
// - Go on to do the 33mer after
// -> Finalise with one of the figures I made from the manuscript, the one with the projected aptamer.
// => Talk about the Mg2+ ion that seemed to be very important for model to be stable.
// => There is the scatterplot also, maybe use the plattecarree projection (square) to make a prevalence plot of that scattering
//
// C. Make a hypothetical model of the camlid eptiope vs the HNA aptamer epitope -> done
//
