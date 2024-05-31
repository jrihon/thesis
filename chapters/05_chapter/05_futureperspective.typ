#import "../../lib/colours.typ" : colourPalette


== Future perspectives
I have had the pleasure to experiment and research on wonderfully interesting topics in the field of synthetic nucleic acids.
During my PhD, I quickly realised that in order to progress this field of study, I was lacking several things I felt I required to do the research in a manageable fashion.

One major consideration was the programming language I wanted to master and use for the tools I'd write. Another consideration was which type of tools would have the most impact on our research currently. 
The output of my research - in part - stems from my personal desires to have had such tools and knowledge at hand when I started the PhD four years ago.  

//
//
//
//
//
//
=== Considering a programming language for research 
Looking back to when I starting out with programming and Computer Science related topics, I wish I knew several considerations that would've made my choices easier. 

==== Personal consideration
When I started out on my first Linux distribution, the first language I encountered was _Bash_ - a _shell_ dialect. It initially suited my needs for general scripting and parsing of data files. Because I knew I wanted to learn and improve on programming, which would serve me tremendously during my PhD, I would need to pick a programming language and stick to it. The choice for anything data science related would be between _Python_, _Julia_ or _R_. I chose for Python, since it reigns supreme in terms of seniority and popularity and because it profiles itself as general purpose. This last aspect impacted my decision the most, since I might want to develop myself further in the direction of software engineering. To jump to Julia's defense, the syntax, ecosystem, package manager and runtime are by far superior. But - and this is a big but - the popularity of Python vastly outshines Julia's and this would impact the traffic my work would receive. 
The R language just rubbed my the wrong way and it is not at all used for cheminformatics, so that was an easy scrap from the list.

==== Crabs all the way down
After getting comfortable with Python and writing most of the Ducque software, I wanted to learn a compiled language.
A consideration I had was that I wanted to learn more about Computer Science, about pointers, memory allocation, types and such. The following languages present themselves : _C_ - and by extension _C++_ - , _Go_ or _Rust_ . A Language like _Fortran_ would still be interesting to learn as it incredibly performant and is experiencing a second coming at the moment, making it useful for performance benefits in codebases. Java is already older and being passed up for many languages both in academia and industry. The reason I chose for Rust is the strong and static typing model. It picked the best parts of the Functional Programming paradigm - pattern matching, composition ... - it has gained a tremendous amount of popularity, being picked 'most desired programming language' for eight years in a row in GitHub's yearly survery.  To top it all off, the package manager and compiler are a literal godsent gift, all the documentation is centralised and the community is a gift that keeps on giving.
No other commercial language does it like Rust.

==== A language should fit the problem and not the other way around
It might occur to the reader that the previous paragraph is heavily biased. A programming language should be chosen along what the developer needs and how the language fits the needs of the desired goals. For example, one shouldn't develop a webframework using the R language - whose only purpose is statistics and data science - and a developer should steer clear from Ocaml if they only want to write code along a procedural and object-oriented paradigm. 

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
For Ducque to build a complementary strand, it appoints specific atoms of the nucleobase basepair to function as a plane and rotate into this plane (@fig-buildmethod B.). Figuring out a way to build with modified nucleobases that does not mess up the building of the complementary strand could go two ways. It either requires  extensive documentation and the goodwill of the user to learn a bit of mathematics, or I just don't implement it yet and think about the problem later.
In all honesty, if I had picked the first option Ducque would've been ugly. I want to solve this issue in a way to make it simple for myself to implement and intuitive for the user to apply. An ugly solution would damage the reputation of Ducque, whereas an elegant solution will be beneficial for everyone in the long run.

==== Eureka!
Two months after its official release - February 2024 - it finally hit me. Instead of implementing it during the build process, I alter existing models by the queried nucleobase.
#figure(
  image("./figures/nucleobase-ducque.svg", width: 100%),
  caption: [
    From middle to the right: A regular DNA A:T basepair that has been altered to a Hoogsteen bp orientation.
    From middle to the left: A regular DNA A:T basepair that has been altered to the Z#sub("Kool"):F hydrophobic bp dyad. Changing both the orientation and the type of nucleobase is also a possible outcome.
  ]
)
The issue resolves two huge problems. First, implementing modified nucleobases this way would require minimal effort from the user. From a software point of view, I can assume that whatever the user queries is correct, in other words, the user is responsible to satisfy their basepairing and modification needs. Ducque just supplies a way to automate modifications.
A second two-birds-with-one-stone resolve is that because now all moieties - the sugar, the nucleobase and the linker - originate from separate files, it means that the user can mix and match the modifications at their free will. The original backbone is defined by the sugar moiety, which is required to build the structure and assign basepairs with one of the five canonical nucleobases. A linker moiety can be associated with any backbone. A nucleobase moiety can be associated with any sugar and can have its orientation manipulated.

==== No rhymes, no embellishments
With Ducque, I designed a system that would require the user to prompt a specific chemistry and supply the inputs with additional information on backbone angles and dihedrals. 
This means that Ducque would simply build along the given parameters. If the structure turns out wrong, the user should inspect the given conformation and the passed parameters.
Trying to accodomate for the different synthetic modifications is impossible and it would be foolish to pretend one could predict the structure of any modification.
The field of biomolecular modeling is all too infatuated with quick and fast predictions. While this holds well for the field of proteins, synthetic nucleotides just do not have the available data to train on.
To provide a way to actually model the structure, we appending an all-purpose methodology to design a force field for the built models. Why bother having a tiny software that could make wrong inferences and hence build faulty models, when we can just have a suitable force field be fed to a well established simulation engine alongside a given structure.
Ducque just builds by simple inputs. What You See Is What You Get.

This brings me to the next point.

=== Clear protocols for fitting nucleoside backbones
Coupling a model builder like Ducque to a protocol on creating a force field for any desired chemistry proved to be robust. Fitting for nucleobase torsional parameters is incredibly simple, since these moieties are forced to remain planar during the simulation.
Emulating the puckering behaviour of endocyclic systems, however, is one can of worms I have not explicitly opened yet.

While we were succesful in describing the behaviour of the MNA (Chapter 3) and HNA (Chapter 4) puckering, the fitting of the parameters was done by fitting to the overall energy of the whole nucleoside using the _paramfit_ tool within AMBER. This meant that one needs to include all bondedterm parameters to already describe the bonds well and assign torsional angles that were in need of fitting. With multiple conformers, the torsional parameters are fitted along a linear regression against the energy of the entire molecule.

One thing I never got around to was seeing if it would be a qualitative improvement if we were to fit the bondedterm parameters by hand.
Fitting along endocyclic angles would be done by looking at the energy profile of a dihedral when varying the angle in a small range.
This could then be done for all conformations we want to include in the force field and apply a fitting procedure to it.

Another thing to consider is the fitting of the $chi$ dihedral angle of endocyclic systems, which is another point highlighted by my predecessor. While the standard DNA and RNA parameters do provide good estimates of this particular angle, the energy profile of this angle is a big determinant for the basepairing capability and stability of a particular chemistry.
//The success of Ducque would not be without already showcasing its prowess within a protocol to also generate a force field for a given chemistry. One of the key issues for designing a force field is that we need to understand and know how a nucleotide behaves in a duplex chain, which puckering modes it favours to visit and ...  

=== A system do meaningfully distinguish structrures 
In Chapter 1, I took the liberty of detailing some parameters by which the field chooses to characterise nucleic acid structures.
The main criticism was on the way basepairing parametrisation was handled and how little applicable the parameters are. We know for a fact that values for either B-DNA and A-RNA structures are similar. Would it then not be useful to devise a metric that distinguishes either structure - or better - categorise structures by an objective definition and not by a set of sixteen parameters? This is a rethorical question ... 

==== Differential Geometry 
Differential Geometry (DG) is the field of mathematics that concerns itself with quantifying they way a curve or a plane bends. For our purposes though, we'll stick to curves only, as we can represent nucleic acid and protein chains through their chain trace along the backbone.
Essentially, with DG we can parametrise the magnitude of the bend in a curve. This has already been succesfully applied to proteins, where we can describe local structures - a collection of alpha-helices and beta-strands, and catalog these. With this information, it was then possible to superpose protein structures on top of eachother by their best match in local structure and not the global structure. This made it evident to find conserved regions in a wide variety of protein families.

The way a curve is parametrised is by the tangent to the curve (FIGURE HERE), where the curve depends on the position of the previous and the next knot. How DG can be exploited for protein structures is that that every knot evokes a substantial change in the magnitude of the bend and this allows us to document the changes in magnitude. These collection of change in magnitude of the tangent vector ultimately returns of the curvature-torsion parameters.  

One problem with nucleic acid helices is that they are periodic in nature. This continuous periodicity gives way to a constant magnitude of the tangent vector, meaning there will be little to no difference between subsequent knots in the trace.
However, Egli and colleagues have used concepts of DG to still make a meaningful impact with respect to characterising duplex models. Apparently, the angle the tangent vector makes with the nucleobasepair plane is a good indicator of its basepairing capabilities. This means that two chemistries should have equivalent values for this parameter, for us to then presume they would basepair. 
//Since the curvature-torsion parameters shine in parametrising the change in magnitude per knot 
// elgi paper on angle the trace backbone makes with the nucleobase plane
// curvature torsion

