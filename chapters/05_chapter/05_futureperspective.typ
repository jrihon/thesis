#import "../../lib/colours.typ" : colourPalette
== Future perspectives

The future perspectives will discuss topics that I had struggled with during my PhD and how I think it should be resolved.
=== Considering a programming language for research 
Looking back to when I starting out with programming and Computer Science related topics, I wish I knew several considerations that would've made my choices easier. 

When I started out on my first Linux distribution, the first language I encountered was _Bash_ - a _shell_ dialect. While it suited my needs for general scripting and parsing of data files. Because I knew I wanted to learn and improve on programming, which would serve me tremendously during my PhD, I would need to pick one. The choice for anything data science related, would be between _Python_, _Julia_ or _R_. Since Python reigns supreme in terms of seniority and popularity, I chose for this language - much to the dismay of Rinaldo, whom would've preferred I started out in Julia. I'll have to give him that much, Julia trumps Python on many aspects but just hasn't enjoyed to same popularity, which is unfortunate. The syntax, ecosystem, package manager and runtime are by far superior. And R ... well, let's not get into R.

After getting comfortable with Python - and learning to troubleshoot the problems that come with becoming one of the biggest languages in the world - I felt to need to progress to something else. By then I had already written most of the Ducque software. Investing time to learn Julia at this point would be overkill, since they're both scripting languages for general purpose usage, with similar syntax. It would learning the same thing over.
A consideration I had was that I wanted to learn more about Computer Science, about pointers, memory allocation, types and such. The following languages present themselves : _C_ - and by extension _C++_ - _Fortran_, _Go_, _Rust_,  or _Zig_ . The reason I chose for Rust is the strong and static typing model, you get to implicitly allocate data structures while the compiler holds you back from making mistakes, it is high-level enough to have an enjoyable syntax and low-level enough to be unencumbered by a garbage collector. Above all, it doesn't mess around with _try - except_ checks, but treats _errors_ as variables. To top it all off, the package manager is a literal godsent gift and all the documentation is centralised.
No other language does it like Rust.

Of course, I chose it as my second language because of personal needs and aspirations for scientific programming. Go works perfectly fine and has been used in bioinformatics, as has R, Julia and Python. The field of cheminformatics is still going strong on C++, Fortran and Python.
I have dabbled in other languages like _Lua_ - for writing plugins for my text editor - and using the _LaTeX_ and _Typst_ typesetter languages for writing large manuscripts.

=== Nucleobase modifications for Ducque 
The Ducque model builder has solved a big issue in the field of XNA modeling. One of the most difficult things was to figure out a model builder that makes it possible to accept all kinds of backbone modifications without limits. Any model builder 'on the market' only provided modeling experimentally determined structures that already resemble DNA or RNA. Reiterating on what I said in the introduction, I would need a second thesis just to catalog the different backbones that have been dreamt up by colleagues around the globe for the last fourty years.

One big issue that I had was to implement a way in which the user could also provide their own set of nucleobases to the software and that Ducque would simply build with it.
The reason I had never implemented it before lies in the _user experience_ of it all. For Ducque to build a complementary strand, it appoints specific atoms of the nucleobase basepair to function as a plane and rotate into this plane (@fig-buildmethod B.). Figuring out a way to build with modified nucleobases that does not screw up the building of the complementary strand could go two ways. It either requires  extensive documentation and the goodwill of the user to learn a bit of mathematics, or I just don't implement it yet and think about the problem later.
Straight up, if I had picked the first option, Ducque would've been ugly. I had to come up with a way to make it simple for myself to implement and intuitive for the user to apply. An ugly solution would damage the reputation of Ducque, whereas an elegant solution will be beneficial for everyone in the long run.

Two months after its official release - February 2024 - it finally hit me.

With Ducque, I designed a system that would require the user to prompt a specific chemistry and supply the inputs with additional information on backbone angles and dihedrals. 
I refused to make a blitzy tool that claims to _predict all possible structures_. It is impossible to predict the structure of something you have no idea how it behaves. I also wasn't going to try and embed a force field or something similar into the software. Only a mad man would attempt such a thing that reaks of overkill. 
The probable cause why for the past thirty years there has not been a model builder that suited the field of synthetic nucleotides, is because _predictions_ have always been more interesting than simple building. Also, we have the added benefit of being familiar being Conformational Sampling experiments, which is how I got the idea for a model builder.
Ducque just builds by simple inputs. No rhymes, no embellishments - WYSIWYG.

This brings me to the next point.

=== Clear protocols for fitting nucleoside backbones
The success of Ducque would not be without already showcasing its prowess within a protocol to also generate a force field for a given chemistry. One of the key issues for designing a force field is that we need to understand and know how a nucleotide behaves in a duplex chain, which puckering modes it favours to visit and ...  

=== A system do meaningfully distinguish structrures 
#lorem(50)
// elgi paper on angle the trace backbone makes with the nucleobase plane
// curvature torsion

