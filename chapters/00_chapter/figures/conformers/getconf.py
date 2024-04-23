import puckepy
from puckepy.formalism import write_to_pdb



#a = puckepy.formalism.CP5(0.5, 270.).invert()
#write_to_pdb("twist3.pdb", a, "FIV")

a = puckepy.formalism.CP5(0.5, 288.).invert()
write_to_pdb("endo3.pdb", a, "FIV")
