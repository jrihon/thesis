import puckepy.formalism as formalism
from puckepy.formalism import write_to_pdb






#a = formalism.CP6(0.67, 0.1, 0.1 ).invert() # 4' C 1' 
#write_to_pdb("4chair1.pdb", a, "SIX")
#
#b = formalism.CP6(0.67, 0.1, 179.9).invert() # 1' C 4' 
#write_to_pdb("1chair4.pdb", b, "SIX")

#a = formalism.CP6(0.67, 35., 55. ).invert() # O' H 1' 
#write_to_pdb("Ohalf1.pdb", a, "SIX")

#a = formalism.CP6(0.67, 340., 55. ).invert() # O' H 5' 
#write_to_pdb("Ohalf5.pdb", a, "SIX")

#a = formalism.CP6(0.67, 330., 90. ).invert() # O' S 2' ; funny that 150 is 2' S O'
# they are both 30 degrees from the max (150 -> 180 ; 330 -> 360)
#write_to_pdb("Oskew2.pdb", a, "SIX")

#a = formalism.CP6(0.67, 30., 90. ).invert() # 3' S 1' 
#write_to_pdb("3skew1.pdb", a, "SIX")

#a = formalism.CP6(0.67, 30., 125. ).invert() # 3' H 4' 
#write_to_pdb("3half4.pdb", a, "SIX")

a = formalism.CP6(0.67, 330., 135. ).invert() # 3' H 2' 
write_to_pdb("3half2.pdb", a, "SIX")
