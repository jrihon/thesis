#import "../../lib/colours.typ" : colourPalette
#import "../../lib/multi-bib.typ": mcite
#import "bib_05_chapter.typ": biblio


== Future perspectives
//I have had the pleasure to experiment and research wonderfully interesting topics in the field of synthetic nucleic acids and beyond.
//During my PhD, I quickly realised that in order to progress this field of study, I was lacking several things I felt I needed to carry out research in a manageable fashion.
//
//The output of my research - in part - stems from my personal need to have had such tools and knowledge at hand when I started the PhD four years ago.  
//

//
//
//
//
//
//
//=== Considering a programming language for research 
//For a computational chemist to progress smoothly through research, it is highly recommend to learn a computer language and use it day-to-day.
//Diversifying your portfolio is always a good idea, regardless of the field one specialises in.
//
//The researcher needs to make two considerations when starting out with computational research. 
//One consideration is the type of scripts and tools the student would write for the purpose of continuing the research. 
//The second major consideration is the programming language that person wants to master.
//
//A little knowledge on how the programming landscape is laid out goes a long way.
//
//==== A language should fit the problem and not the other way around
//A programming language should be chosen along  the needs of the developer and  how the language fits the needs of the desired goals. For example, one should avoid developing a website using a framework written in the R language - whose original purpose was, and still is, statistics and data science. Even though it is perfectly possible to do so, it makes more sense to apply a suitable language to the task at hand.
//Shoehorning technology into a problem for the sake of maintaing a monolithic repository might not give the desired long-term solution.
//Placing duct tape over a crack in the wall might help you ignore the problem, but at the end of the day there is still a crack in the wall in need of fixing.
//
//Python and Javascript are to the highest degree both general purpose languages, but technological advances have established for the former to dominate data science applications while the latter lives in the web browser. While either language is up to both tasks, a premeditation on how they have evolved since their conception will carry you further in the long run.
//An important component for learning a language is understanding the ecosystem it lives in and why it was originally developed. PHP for the browser, R for statistics, Python for scripting, Golang for networking and distributed systems, Fortran for low-level computing, Godot for game development et cetera . It is always good to keep in mind the design paradigm of a language before learning its ins and outs and hitting brick walls in the future.
//
//==== General is good, but others do it better
//Another thing about general purpose languages is that they can resolve nearly all problems, but specific languages just do it better. Take Julia for example. A language developed at MIT for the sole purpose of handling big data. It has a centralised repository for libraries, it boasts a JIT compiler, it uses typed variables to its advantage and natively supports access to the GPU just to name a few ... It triumphs over Python in all aspects except for popularity. 
//
//While frameworks like PyTorch and Jax, and supersets like Mojo are being released, it becomes increasingly more attractive to stick to Python. At the end of the day, no matter the incremental improvements made, the developer is still stuck with issues like weak typing, conflicting package managers and hundreds of layers of abstraction - problems all resolved with Julia. 
//
//==== Languages for scientific programming
//Scientific programming in this context relates to the field of chem- and bioinformatics. While both fields rest on the shoulders of languages like C and Fortran, due to hardware improvements it has become possible to use Java, Python and R. While Java is has faded out of academia and finds its place in industry doing backend services, the two latter are still in active use in scientific literature. 
//
//Recently, languages like Golang and Rust have gained in popularity in bioinformatics, with popular algorithms being rewritten in these languages which have in faultless and performant programs (#link("https://github.com/rust-bio/rust-bio")[rust-bio]). Cheminformatics is still invested on Python, mainly because the field revolves heavily on drug design applications in Machine learning and packages like RDKit dominating the field, which are mainly C++ and Java packages wrapped in Python for scripting capabilities.
//
//This last property is why Python has remained at the top. Garnering the benefits of Rust, C and Fortran without the hassle of writing a memory managed language makes Python incredibly convenient and why it is going to remain there for the foreseeable future.

// =============================
//==== Personal consideration
//When I started out on my first Linux distribution, the first language I encountered was _Bash_ - a _shell_ dialect. It initially suited my needs for general scripting and rudimentary parsing. Because I knew I wanted to learn and improve on programming, I would need to pick a programming language that would last me for the entirety of my PhD. The choice for anything data science related would be between _Python_, _Julia_ or _R_. I chose Python, since it reigns supreme in terms of seniority and popularity and because it profiles itself as general purpose. This last aspect impacted my decision the most, since I might want to develop myself further in the direction of software engineering and not just data science. To jump to Julia's defense, the syntax, ecosystem, package manager and runtime are by far superior. But - and this is a big but - the popularity of Python vastly outshines Julia's and this would impact the traffic my work would receive. 
//The R language just rubbed my the wrong way and finds no support in the cheminformatic ecosystem, so that was an easy scrap from the list.
//
//==== Crabs all the way down
//After getting comfortable with Python and writing most of the Ducque software, I wanted to learn a compiled language.
//A consideration I had was that I wanted to learn more about Computer Science, about pointers, memory allocation, types and such. The following languages present themselves : _C_ - and by extension _C++_ - , _Go_ or _Rust_ . A Language like _Fortran_ would still be interesting to learn as it is incredibly performant and is experiencing a second coming at the moment, making it useful for performance benefits in codebases. _Java_ is quite older and is being passed up for many languages both in academia and industry. For the standard Java enthusiast, do not fear, you still get to maintain legacy codebases. The reason I chose Rust is the strong and static typing model. It picked the best parts of the Functional Programming paradigm - pattern matching, errors as types, composition etc. - and it has gained a tremendous amount of popularity, being picked 'most desired programming language' for eight years in a row in GitHub's yearly survey.  To top it all off, the package manager and compiler are a literal godsent gift, all the documentation is centralised and the community is a gift that keeps on giving.
//No other commercial language does it like Rust.
//
//There exists an article titled "Why are scientists turning to Rust - 2020" (#link("https://www.nature.com/articles/d41586-020-03382-2")[https://www.nature.com/articles/d41586-020-03382-2]) that describes the problems Rust solves in comparison to languages like C, Python and R, and the steady increase in popularity it has seen in the realm of bioinformatics.
//
//=== Considering a programming language for research 
//Looking back to when I starting out with programming and Computer Science related topics, several considerations would have wisened the choices I made. 
//One major consideration was the programming language I wanted to master and use for the tools I'd write.
//The second consideration was which type of tools could potentially make the most impact on our labs's research. 
//
//==== Personal consideration
//When I started out on my first Linux distribution, the first language I encountered was _Bash_ - a _shell_ dialect. It initially suited my needs for general scripting and rudimentary parsing. Because I knew I wanted to learn and improve on programming, I would need to pick a programming language that would last me for the entirety of my PhD. The choice for anything data science related would be between _Python_, _Julia_ or _R_. I chose Python, since it reigns supreme in terms of seniority and popularity and because it profiles itself as general purpose. This last aspect impacted my decision the most, since I might want to develop myself further in the direction of software engineering and not just data science. To jump to Julia's defense, the syntax, ecosystem, package manager and runtime are by far superior. But - and this is a big but - the popularity of Python vastly outshines Julia's and this would impact the traffic my work would receive. 
//The R language just rubbed my the wrong way and finds no support in the cheminformatic ecosystem, so that was an easy scrap from the list.
//
//==== Crabs all the way down
//After getting comfortable with Python and writing most of the Ducque software, I wanted to learn a compiled language.
//A consideration I had was that I wanted to learn more about Computer Science, about pointers, memory allocation, types and such. The following languages present themselves : _C_ - and by extension _C++_ - , _Go_ or _Rust_ . A Language like _Fortran_ would still be interesting to learn as it is incredibly performant and is experiencing a second coming at the moment, making it useful for performance benefits in codebases. _Java_ is quite older and is being passed up for many languages both in academia and industry. For the standard Java enthusiast, do not fear, you still get to maintain legacy codebases. The reason I chose Rust is the strong and static typing model. It picked the best parts of the Functional Programming paradigm - pattern matching, errors as types, composition etc. - and it has gained a tremendous amount of popularity, being picked 'most desired programming language' for eight years in a row in GitHub's yearly survey.  To top it all off, the package manager and compiler are a literal godsent gift, all the documentation is centralised and the community is a gift that keeps on giving.
//No other commercial language does it like Rust.
//
//There exists an article titled "Why are scientists turning to Rust - 2020" (#link("https://www.nature.com/articles/d41586-020-03382-2")[https://www.nature.com/articles/d41586-020-03382-2]) that describes the problems Rust solves in comparison to languages like C, Python and R, and the steady increase in popularity it has seen in the realm of bioinformatics.
//
//==== A language should fit the problem and not the other way around
//A programming language should be chosen along  the needs of the developer and  how the language fits the needs of the desired goals. For example, one shouldn't develop a web framework using the R language - whose only purpose is statistics and data science - and a developer should steer clear from Ocaml if they only want to write code along a procedural and object-oriented paradigm. 
//
//Some languages are still on my bucket list - Julia, Ocaml and Go. As we say in Flemish _'Ge hebt maar vierentwintig uur op nen dag'_, there is only so much time one can invest in learning while working productively day-to-day tasks. Python can handle all tasks, but most languages do it better. More often than not I've only needed convenient solutions and not the ultimate solution, which is why Python still remains my go-to pick.
//
//To the novice informatician I impart this piece of advice : learn the basics of a language but do not get stuck in tutorial hell. The best way to understands the ins and outs is to come up with a small project you have a personal interest in and make it work with whatever means the language provides you with. That is how the _pucke.rs_ toolkit came to be.
//
//
//
//
//
//
=== Nucleobase modifications for Ducque 
The Ducque model builder resolved a big issue in the field of XNA modeling. The challenge was to figure out a model builder that makes it possible to accept all kinds of modifications without limits. This means accepting sugar, linker and nucleobase modifications, without constraining the user. 
//Because I couldn't account for all modifications in the field, a unique feature of the software should provide users to implement their own chemistries.
A unique feature of the software should be to provide users to implement their own chemistries.
So far, any model builder 'on the market' only provided builds of experimentally determined structures and only provides builds with preset chemistries given by the maintainers.

==== No modified nucleobases just yet ... 
Implementing a dynamic way to build along a given backbone made it possible to surmount the biggest hurdle of XNA model building. The next problem - figuring out a way to implement modified nucleobases - would prove difficult in a different way. Where the former was a mathematical problem, the latter is a user experience conundrum.
//One big issue that I had was to implement a way in which the user could also provide their own set of nucleobases to the software and that Ducque would simply build with it.
For Ducque to build a complementary strand, it appoints specific atoms of the nucleobase basepair to function as a plane and performs operations onto this plane (@fig-buildmethod B.). Figuring out a way to build with modified nucleobases that does not mess up the building of the complementary strand could go two ways. It either requires  extensive documentation and the goodwill of the user to learn a bit of mathematics, or this part of the builder would be tabled until a good idea came along.
Picking the first option would have damaged Ducque's reputation. Implemented good solutions require elegance and should be intuitive for the user. 
//In all honesty, if I had picked the first option, Ducque would've been ugly. I want to solve this issue in a way to make it simple for myself to implement and intuitive for the user to apply. An ugly solution would damage the reputation of Ducque, whereas an elegant solution will be beneficial for everyone in the long run.

==== Eureka!
//Two months after Ducque's official release - February 2024 - it finally hit me while I was videochatting with Shamal. The funny thing is that we were just having a catch-up about our lives and my mind wandered off - as it often tends to do - only to find a solution to this problem. Instead of implementing it during the build process, I alter existing models by the queried nucleobase.
Two months after Ducque's official release - February 2024 - it occured that instead of using modified nucleobases in the build process, it would be much easier for both parties - maintainer and user - to  alter existing models by the queried nucleobase. 
//The funny thing is that we were just having a catch-up about our lives and my mind wandered off - as it often tends to do - only to find a solution to this problem. Instead of implementing it during the build process, I alter existing models by the queried nucleobase.

#figure(
  image("./figures/nucleobase-ducque.svg", width: 100%),
  caption: [
    *A.* A regular DNA A:T basepair that has been altered to a Hoogsteen bp orientation.
    *B.* A regular DNA A:T basepair that has been altered to the Z#sub("Kool"):F hydrophobic bp dyad. Changing both the orientation and the type of nucleobase is also a possible outcome.
  ]
) <fig-nucleobase-modify>

The issue resolves two huge problems. First, implementing modified nucleobases this way would require minimal effort from the user. From a developer's point of view, the assumption can be made that the user is responsible to satisfy their basepairing and modification needs. Ducque just supplies a way to automate implementing modifications.
A second two-birds-with-one-stone solution resolves the fact that all moieties are interchangeable. The sugar, the nucleobase and the linker originate from separate files, resulting in synthetic modifications that can be mixed and matched at the will of the user. The original backbone is defined by the sugar moiety, which is required to build the structure and assign basepairs with one of the five canonical nucleobases. A linker moiety can be associated with any backbone. A nucleobase moiety can be associated with any sugar and can have its orientation manipulated (@fig-nucleobase-modify).
//
//
//
==== No rhymes, no embellishments
The Ducque's design philosophy has always been _What you see is what you get_. The problem with other model builders is that they constrain the user by implementing a small set of modifications that have been finetuned to only produce a good result, while discarding anything that does not work. Freed from these constraints, Ducque promises to build by whatever the user queries and truly delivers on that respect. The caveat here is that the inputs should be optimised by the user in order to build suitable models, but Ducque has always been clear about this. The only certainty one has in trying to predict or refine structures of underresearched chemistries is the certainty of forever tinkering with the source code.     

To provide a way to actually model the structure, we append an all-purpose methodology to design a force field for the built models. A good force field in combination with a well established simulation engine is going to give far better results than minimising along parameters meant for small molecules.
Ducque is concise, depends on extremely stable packages and builds by simple queried inputs. The ease of its maintainability and its modularity is why the reason Ducque will be able to stand the tests for at least the upcoming decade.
//
//With Ducque, I designed a system that would require the user to prompt a specific chemistry and supply the inputs with additional information on backbone angles and dihedrals. 
//This means that Ducque simply builds along the given parameters. If the structure turns out faulty, it is up to the user to inspect the passed conformation and parameters. After all, Ducque just builds with the given inputs and does not try to predict any outcome.
//
//Trying to anticipate for a structure in a field with a high variety in synthetic modifications is impossible and it would be foolish to pretend one could predict the polymeric structure of all modification.
//The field of biomolecular modeling is all too infatuated with quick and fast predictions. While this holds for the field of proteins, the study of Xenobiotic Nucleic Acids just does not have the available data to train on.
//
//To provide a way to actually model the structure, we append an all-purpose methodology to design a force field for the built models. A good force field in combination with a well established simulation engine is going to give better results.
//Ducque is concise, depends on extremely stable packages and builds by simple queried inputs. The ease of its maintainability and its modularity is why I think Ducque will be able to stand the tests for at least the upcoming decade.

//
//
//
=== Clear protocols for fitting nucleoside backbones
Coupling a model builder like Ducque to a protocol on creating a force field for any desired chemistry proved to be robust. Fitting for nucleobase torsional parameters is incredibly simple, since these moieties are forced to remain planar during the simulation.
//Emulating the puckering behaviour of endocyclic systems, however, is one can of worms I have not been able open explicitly just yet. 
Emulating the puckering behaviour of endocyclic systems, however, is one can of worms that remains unopened during this research. 

While we were successful in describing the behaviour of the MNA (Chapter 3) and HNA (Chapter 4) puckering, the fitting of the parameters was done by fitting to the overall energy of the whole nucleoside using the _paramfit_ tool within AMBER. This meant that one needs to include all bonded-term parameters that already describe the bond, angles and dihedrals well and assign torsional angles that were in need of fitting. With multiple conformers, the torsional parameters are fitted along a linear regression against the energy of the entire molecule.

//One thing I never got around to was seeing if it would be a qualitative improvement if we were to fit the bondedterm parameters by hand.
Something worth investigating is the qualitative improvement of fitting bondedterm parameters by hand versus the parameters produced by _paramfit_.
Fitting along endocyclic angles can be done by looking at the energy profile of a dihedral when varying the angle in a small range. Given an endocyclic angle, we can study the energy profile of the molecule when varying the torsion angle within a range $[phi_0 - Delta , phi_0 + Delta]$ where $phi_0$ is the optimal angle for the given puckering configuration.
This could then be done for all conformations we want to include in the force field and apply a fitting procedure to it. The supplementary information of the publication, released by Villa's group on the LNA molecule #mcite(("Xu2017lnafit"), biblio), is one of the few papers having personally encountered where parameter fitting for torsional angles in nucleic acids has been done explicitly. Fitting torsional parameters for multiple conformations simultaneously is a different beast altogether.

Another thing to consider is the fitting of the $chi$ dihedral angle of endocyclic systems, which was also highlighted by my predecessor in the conclusion of his thesis. While the standard DNA and RNA parameters do provide good estimates of this particular angle, the energy profile of the $chi$ angle is a big determinant for the basepairing capability and stability of a particular chemistry.
A small project in the final stretch of this PhD, on the R-ZNA and S-ZNA chemistries, allowed us to gather insight on manual parametrisation protocols. 
Having the knowledge to parametrise molecules with high fidelity and maintaing this knowledge in-house will keep us at the forefront of Xenobiotic Nucleic Acid sciences. 

#v(1em)


//In the final stretch of my PhD, I have tried my hand at fitting two dihedrals of both the R-ZNA and S-ZNA chemistry for a project of a colleague. Having the knowledge to parametrise molecules with high fidelity and maintaing this knowledge in-house will keep us at the forefront of Xenobiotic Nucleic Acid sciences. 

//
//
//
//=== A system do meaningfully distinguish structrures 
//In Chapter 1, I took the liberty to divulge on parameters by which the field chooses to characterise nucleic acid structures.
//The main criticism was on the way basepairing parametrisation was handled and how little applicable the parameters are. We know for a fact that values for either B-DNA and A-RNA structures are similar. Would it then not be useful to devise a metric that distinguishes either structure - or better - categorises general structures by an objective definition and not by a set of sixteen parameters? \  #text(fill: rgb("#D8E4F2"))[_ \~ This is a rhetorical question - don't come at me \~ _ ]
//
//==== Differential Geometry 
//Differential Geometry (DG) is the field of mathematics that concerns itself with quantifying the way a curve bends. We can represent nucleic acid and protein chains as a curve through their chain trace along the backbone.
//The field of DG has already been applied to proteins, where local structural patterns between a variety of protein families were successfully matched. 
//With this information, it was then possible to superpose protein structures on top of eachother by their best match in local structure and not the global structure. This made it evident to find conserved substructures in a wide variety of protein families #mcite(("Montalvao2005choral", "daSilvaNeto2019DG"), biblio).
//
//The way a curve is parametrised is by the tangent to the curve at distinct points of the trace. The tangent is a vector that touches the curve only in one point - the knot - and points in the direction of the continuous curve. Its size determines the magnitude of the bend at the specified knot.
//Taking the second and third derivative of this tangent vector returns us the curvature ($kappa$) and torsion ($tau$) metrics. The first coordinate tells us how the magnitude of the bend changes from knot to subsequent knot and the second how the direction of the curve changes from knot to subsequent knot. 
//
//One problem with nucleic acid helices is that they are periodic in nature. This continuous periodicity gives way to a relatively constant magnitude and direction of the tangent vector at every knot, meaning there will be little to no difference between subsequent ($kappa, tau$) at every knot in the trace. While the tangent vector might vary slightly between A-type and B-type structures, their ($kappa, tau$) parameters will always result in equivalent values due to the nature of a continuous helix. 
//
//That being said, Egli and colleagues have used the concept of a tangent vector to make a meaningful impact by quantifying crosstalk capabilities of several chemistries. Apparently, the angle the tangent vector makes with the nucleobase plane at its knot is a good indicator of that chemistry's basepairing capabilities #mcite(("Pallan2007incl"), biblio).
//If two chemistries should have equivalent values for this metric, it is reasonable to presume they pair with eachother.
//While this observation might not have been obvious before this study, it rationalises the idea that the backbone is only there to hold the nucleobase at a certain position and orientation, for it to make basepairing possible with its complement. A nucleobase that is angled differently, directly stems from a backbone that does not follow it's complement's helical properties. This would then be reflected in this metric and orthogonality could be concluded. 
//
//I am certain we can stil unearth some mathematical concepts and apply them for the objective classification of nucleic acid structures. I could consider researching this as a future hobby instead of taking up golf, when I retire.  

#pagebreak()
=== Potential Research Outcomes

While the research carried out during this thesis has a strictly fundamental nature, it is very well applicable to problems in R&D research.

+ Predictions of nucleic acid structures. It has been made evident in this thesis that it is a definite possibility to approximate - or even solve - NA models.
  - We want to highlight the importance of experimental validation and emphasise that, although extremely useful, this data does not require to be of an atomistic nature. Validation can also be inferred through physicochemical methods like Circular Dichroism studies or understanding the affinity properties through mutational scans. 
  - Creating a force field for linker- or nucleobase-modified chemistries requires less intensive protocols to solve for the correct parameters. With the studies performed for this thesis, we attempted to push the boundaries of backbone modifications with respect to accounting for the theoretical transition states of sugar puckering.

+ The research on melting temperatures of nucleic acid duplexes through _in silico_ means. With modelled structures at hand, we can use them for further studies on the binding energy of the strands.
  - A great attempt has been made about a decade ago, using Molecular Mechanics to predict melting temperatures of DNA homoduplexes through MMGBSA and MMPBSA methods - two methods used to estimate potential binding energy #mcite(("Lomzov2015melt"), biblio). Upon inquiring, it was clarified that all simulation trajectories ran for a whole microsecond in order for the output of the energy estimates to correlate well with the given nearest neighbour parameters. For reference, a single model would take days to run on a standard GPU. A caveat I learned is that neither methodologies were ever validated on nucleic acid structures, but were meant for drug design purposes.
  - A more promising line of research is that of Local Energy Decompositions, used in Quantum Mechanic studies. The core idea is that we can extract to pairwise energy contribution of every component in a model - the basepairs - and map this information to return a total energy value of a system. This can then be converted to the melting temperature of a duplex #mcite(("Schneider2016LED", "Kruse2018stack", "Hopfinger2020NN", "Altun2021bppredict"), biblio). This methodology requires heavy computational duty suited for a supercomputer.

+ The _in silico_ design of synthetic nucleic acids and XNA enzymes. 
  - On one hand, we can perform docking studies with the produced models on NA processing enzymes, to see how the synthetic variants interact with the native enzymes. This would allow a rational approach to mutagenesis studies where we can target specific residues and get a realtime view of its effects for _Directed Evolution_ purposes. The goal would be to accodomate the new chemistry to artificial enzymes for SELEX or xenobiology.
  - On the other hand, figuring out a way to predict properties like orthogonality would expedite and substantiate the applicability of a synthetic chemistry. Such properties would substantiate the utility of a chemistry even before going into the laboratory to synthesise it.
//  - One prominent outcome is the combination of the two previous points. Predicting the structure of chimeric duplexes - where the two complementary strands are composed of a different chemistry - could determine if a designed XNA type were orthogonal. Research could be seriously expedited through these computational methods. Predicting such properties allows us to characterise key points that we can then exploit with specific pharmaceutical applications in mind.


//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
#pagebreak()
