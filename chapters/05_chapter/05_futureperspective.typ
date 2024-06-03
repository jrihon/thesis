#import "../../lib/colours.typ" : colourPalette


== Future perspectives
I have had the pleasure to experiment and research on wonderfully interesting topics in the field of synthetic nucleic acids and beyond.
During my PhD, I quickly realised that in order to progress this field of study, I was lacking several things I felt I needed to carry out research in a manageable fashion.

The output of my research - in part - stems from my personal desires to have had such tools and knowledge at hand when I started the PhD four years ago.  

//
//
//
//
//
//
=== Considering a programming language for research 
Looking back to when I starting out with programming and Computer Science related topics, several considerations would have wisened the choices I made. 
One major consideration was the programming language I wanted to master and use for the tools I'd write.
The second consideration was which type of tools could potentially make the most impact on our labs's research. 

==== Personal consideration
When I started out on my first Linux distribution, the first language I encountered was _Bash_ - a _shell_ dialect. It initially suited my needs for general scripting and rudimentary parsing. Because I knew I wanted to learn and improve on programming, I would need to pick a programming language that would last me for the entirety of my PhD. The choice for anything data science related would be between _Python_, _Julia_ or _R_. I chose for Python, since it reigns supreme in terms of seniority and popularity and because it profiles itself as general purpose. This last aspect impacted my decision the most, since I might want to develop myself further in the direction of software engineering and not just data science. To jump to Julia's defense, the syntax, ecosystem, package manager and runtime are by far superior. But - and this is a big but - the popularity of Python vastly outshines Julia's and this would impact the traffic my work would receive. 
The R language just rubbed my the wrong way and finds no support in the cheminformatic ecosystem, so that was an easy scrap from the list.

==== Crabs all the way down
After getting comfortable with Python and writing most of the Ducque software, I wanted to learn a compiled language.
A consideration I had was that I wanted to learn more about Computer Science, about pointers, memory allocation, types and such. The following languages present themselves : _C_ - and by extension _C++_ - , _Go_ or _Rust_ . A Language like _Fortran_ would still be interesting to learn as it incredibly performant and is experiencing a second coming at the moment, making it useful for performance benefits in codebases. _Java_ is quite older and is being passed up for many languages both in academia and industry. For the standard Java enthusiast, do not fear, you still get to maintain legacy codebases. The reason I chose for Rust is the strong and static typing model. It picked the best parts of the Functional Programming paradigm - pattern matching, errors as types, composition etc. - and it has gained a tremendous amount of popularity, being picked 'most desired programming language' for eight years in a row in GitHub's yearly survey.  To top it all off, the package manager and compiler are a literal godsent gift, all the documentation is centralised and the community is a gift that keeps on giving.
No other commercial language does it like Rust.

==== A language should fit the problem and not the other way around
A programming language should be chosen along what the developer needs and how the language fits the needs of the desired goals. For example, one shouldn't develop a webframework using the R language - whose only purpose is statistics and data science - and a developer should steer clear from Ocaml if they only want to write code along a procedural and object-oriented paradigm. 

Some languages are still on my bucket list - Julia, Ocaml and Go. As we say in Flemish _'Ge hebt maar vierentwintig uur op nen dag'_, there is only so much time one can invest in learning while working productively on the day-to-day work. Python does it all, but most languages do it better and more often than not I've only needed convenient solutions and not the ultimate solution.

To the novice informatician I impart this knowledge : learn the basics of a language but do not get stuck in tutorial hell. The best way to understands the ins and outs is to come up with a small project you have a personal interest in and make it work with whatever means the language provides you with. That is how the _pucke.rs_ toolkit came to be.
//
//
//
//
//
//
=== Nucleobase modifications for Ducque 
The Ducque model builder resolved a big issue in the field of XNA modeling. The challenge was to figure out a model builder that makes it possible to accept all kinds of modifications without limits. This means accepting sugar, linker and nucleobase modifications, without constraining the user. Because I couldn't account for all modifications in the field, a unique feature of the software should provide users to implement their own chemistries.
So far, any model builder 'on the market' only provided builds of experimentally determined structures that already resemble DNA or RNA and you could only build with chemistries provided by the maintainers.

==== No modified nucleobases just yet ... 
Implementing a dynamic way to build along a give backbone made it possible to surmount the biggest hurdle of XNA model building. The next problem - figuring out a way to implement modified nucleobases - would prove difficult in a different way. Where the former was a mathematical problem, the latter is a user experience conundrum.
//One big issue that I had was to implement a way in which the user could also provide their own set of nucleobases to the software and that Ducque would simply build with it.
For Ducque to build a complementary strand, it appoints specific atoms of the nucleobase basepair to function as a plane and performs operations onto this plane (@fig-buildmethod B.). Figuring out a way to build with modified nucleobases that does not mess up the building of the complementary strand could go two ways. It either requires  extensive documentation and the goodwill of the user to learn a bit of mathematics, or I just don't implement it yet and think about the problem later.
In all honesty, if I had picked the first option, Ducque would've been ugly. I want to solve this issue in a way to make it simple for myself to implement and intuitive for the user to apply. An ugly solution would damage the reputation of Ducque, whereas an elegant solution will be beneficial for everyone in the long run.

==== Eureka!
Two months after Ducque's official release - February 2024 - it finally hit me while I was videochatting with Shamal. The funny thing is that we were just having a catch-up about our lives and my mind wandered off - as it often tends to do - only to find a solution to this problem. Instead of implementing it during the build process, I alter existing models by the queried nucleobase.
#figure(
  image("./figures/nucleobase-ducque.svg", width: 100%),
  caption: [
    *A.* A regular DNA A:T basepair that has been altered to a Hoogsteen bp orientation.
    *B.* A regular DNA A:T basepair that has been altered to the Z#sub("Kool"):F hydrophobic bp dyad. Changing both the orientation and the type of nucleobase is also a possible outcome.
  ]
)
The issue resolves two huge problems. First, implementing modified nucleobases this way would require minimal effort from the user. From a developer's point of view, I can assume that whatever the user queries is correct, i.e. the user is responsible to satisfy their basepairing and modification needs. Ducque just supplies a way to automate modifications.
A second two-birds-with-one-stone resolves the fact that all moieties are interchangeable. The sugar, the nucleobase and the linker originate from separate files, resulting in synthetic modifications that can be mixed and matched at the volition of the user. The original backbone is defined by the sugar moiety, which is required to build the structure and assign basepairs with one of the five canonical nucleobases. A linker moiety can be associated with any backbone. A nucleobase moiety can be associated with any sugar and can have its orientation manipulated.

//
//
//
==== No rhymes, no embellishments
With Ducque, I designed a system that would require the user to prompt a specific chemistry and supply the inputs with additional information on backbone angles and dihedrals. 
This means that Ducque simply builds along the given parameters. If the structure turns out faulty, it is up to the user to inspect the passed conformation and parameters. After all, Ducque just builds with the given inputs and does not try to predict any outcome.

Trying to anticipate - accounting for the high variety in synthetic modifications - is impossible and it would be foolish to pretend one could predict the polymeric structure of all modification.
The field of biomolecular modeling is all too infatuated with quick and fast predictions. While this holds for the field of proteins, synthetic nucleotides just do not have the available data to train on.

To provide a way to actually model the structure, we append an all-purpose methodology to design a force field for the built models. A good force field in combination with a well established simulation engine is going to give better results.
Ducque is concise, depends on extremely stable packages and builds by simple queried inputs. The ease of its maintainability and its modularity is why I think Ducque will be able to stand the tests for at least the upcoming decade.

//
//
//
=== Clear protocols for fitting nucleoside backbones
Coupling a model builder like Ducque to a protocol on creating a force field for any desired chemistry proved to be robust. Fitting for nucleobase torsional parameters is incredibly simple, since these moieties are forced to remain planar during the simulation.
Emulating the puckering behaviour of endocyclic systems, however, is one can of worms I have not been able open explicitly just yet.

While we were successful in describing the behaviour of the MNA (Chapter 3) and HNA (Chapter 4) puckering, the fitting of the parameters was done by fitting to the overall energy of the whole nucleoside using the _paramfit_ tool within AMBER. This meant that one needs to include all bondedterm parameters that already describe the bond, angles and dihedrals well and assign torsional angles that were in need of fitting. With multiple conformers, the torsional parameters are fitted along a linear regression against the energy of the entire molecule.

One thing I never got around to was seeing if it would be a qualitative improvement if we were to fit the bondedterm parameters by hand.
Fitting along endocyclic angles can be done by looking at the energy profile of a dihedral when varying the angle in a small range. Suppose we have endocyclic angle, we can study the energy profile of the molecule when varying the torsion angle within a range $[phi_0 - Delta , phi_0 + Delta]$ where $phi_0$ is the optimal angle for the given puckering configuration.
This could then be done for all conformations we want to include in the force field and apply a fitting procedure to it.

Another thing to consider is the fitting of the $chi$ dihedral angle of endocyclic systems, which is point highlighted by my predecessor in the conclusion of his thesis. While the standard DNA and RNA parameters do provide good estimates of this particular angle, the energy profile of the $chi$ angle is a big determinant for the basepairing capability and stability of a particular chemistry.
In the final stretch of my PhD, I have tried my hand at fitting two dihedrals of both the R-ZNA and S-ZNA chemistry for a project of a colleague. Having the knowledge to parametrise molecules with high fidelity and maintaing this knowledge in-house will keep us at the forefront of Xenobiotic Nucleic Acid sciences. \
 \
//
//
//
=== A system do meaningfully distinguish structrures 
In Chapter 1, I took the liberty of detailing some parameters by which the field chooses to characterise nucleic acid structures.
The main criticism was on the way basepairing parametrisation was handled and how little applicable the parameters are. We know for a fact that values for either B-DNA and A-RNA structures are similar. Would it then not be useful to devise a metric that distinguishes either structure - or better - categorises general structures by an objective definition and not by a set of sixteen parameters? \  #text(fill: rgb("#D8E4F2"))[_ \~ This is a rhetorical question - don't come at me \~ _ ]

==== Differential Geometry 
Differential Geometry (DG) is the field of mathematics that concerns itself with quantifying the way a curve bends. We can represent nucleic acid and protein chains as a curve through their chain trace along the backbone.
The field of DG has already been applied to proteins, where local structural patterns between a variety of protein families were succesfully matched. 
With this information, it was then possible to superpose protein structures on top of eachother by their best match in local structure and not the global structure. This made it evident to find conserved regions in a wide variety of protein families.

The way a curve is parametrised is by the tangent to the curve at distinct points of the trace. The tangent is a vector that touches the curve only in one place - the knot - and points in the direction of the continuous curve. Its size determines the magnitude of the bend at the specified knot.
Taking the second and third derivative of this tangent vector returns us the curvature ($kappa$) and torsion ($tau$) metrics. These two coordinates measure tell us how the magnitude of the bend and the direction of the curve change from knot to knot. 

One problem with nucleic acid helices is that they are periodic in nature. This continuous periodicity gives way to a relatively constant magnitude and direction of the tangent vector at every knot, meaning there will be little to no difference between subsequent knots in the trace. While the tangent vector might be different vary slightly between A-type and B-type structures, their ($kappa, tau$) parameters will always result in equivalent values due to the nature of a continuous helix. 

That being said, Egli and colleagues have used the concept of a tangent vector to make a meaningful impact by quantifying crosstalk capabilities of several chemistries. Apparently, the angle the tangent vector makes with the nucleobase plane at its knot is a good indicator of its basepairing capabilities.
If two chemistries should have equivalent values for this metric, it is reasonable to presume they pair with eachother.   (FIGURE MAKEN)
While this observation might not have been obvious before this study, it rationalises the idea that the backbone is only there to hold the nucleobase at a certain position and orientation, for it to make basepairing possible. Would the nucleobase be angled differently, this would be reflected in this metric and orthogonality would be concluded. 
//Since the curvature-torsion parameters shine in parametrising the change in magnitude per knot 
// elgi paper on angle the trace backbone makes with the nucleobase plane
// curvature torsion

