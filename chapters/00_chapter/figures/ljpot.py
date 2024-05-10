import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator

ARANGE = np.linspace(0.05, 10.05, 401)

class Radius:

    def __init__(self, radius: float, eps: float) -> None:
        self.radius = radius
        self.eps = eps


# Radii repulsive force
def repulsion(lhs: Radius, rhs: Radius) -> np.ndarray :

#    rmin_ij = lhs.radius + rhs.radius
    rmin_ij = (lhs.radius + rhs.radius) / 2
    eps_ij = np.sqrt(CT1.eps * CT2.eps)

    arr = np.zeros(shape=len(ARANGE))

    for i, ele in enumerate(ARANGE): 
        arr[i] = (rmin_ij / ele) ** 12

    return eps_ij * arr

# London dispersion
def dispersion(lhs: Radius, rhs: Radius) -> np.ndarray :

#    rmin_ij = lhs.radius + rhs.radius
    rmin_ij = (lhs.radius + rhs.radius) / 2
    eps_ij = np.sqrt(CT1.eps * CT2.eps)

    arr = np.zeros(shape=len(ARANGE))

    for i, ele in enumerate(ARANGE): 
        arr[i] = -2 * ((rmin_ij / ele) ** 6)

    return eps_ij * arr


#CT carbon : 1.9080 Ri, 0.1094 epsilon value
#H1 : 1.3870 Ri, 0.0157 epsilon value
#OH : 1.7210 Ri, 0.2104 epsilon value
# two carbons
CT1 = Radius(radius=1.9080, eps=0.1094)
CT2 = Radius(radius=1.9080, eps=0.1094)
# one carbon and one hydrogen
CT1 = Radius(radius=1.9080, eps=0.1094)
CT2 = Radius(radius=1.3870, eps=0.0157)
# two oxygens
CT1 = Radius(radius=1.7210, eps=0.2104)
CT2 = Radius(radius=1.7210, eps=0.2104)

# Calculation
eps_ij = np.sqrt(CT1.eps * CT2.eps)

repulse = repulsion(CT1, CT2)
disperse = dispersion(CT1, CT2)


figure = plt.figure(figsize=(5,3))
ax0 = figure.add_subplot(111)

onec = "#639481"
twoc = "#235441"
#resultc = "#7F534A"
resultc = "#DD9080"

ax0.plot(
        ARANGE,
        repulse,
        c=onec,
        linestyle="-.",
        label="repulsion",
        )

ax0.plot(
        ARANGE,
        disperse,
        c=twoc,
        linestyle="-.",
        label="dispersion",
        )

ax0.set_xlim(0, 5)
ax0.set_ylim(-0.3, 0.3)
ax0.plot(
        ARANGE,
        repulse + disperse,
        c=resultc,
        label="Lennard-Jones Potential",
        )



ax0.spines["bottom"].set_position("center")
ax0.spines["top"].set_visible(False)
ax0.spines["right"].set_visible(False)


ax0.yaxis.set_major_locator(MultipleLocator(0.1))
ax0.yaxis.set_minor_locator(MultipleLocator(0.02))

ax0.xaxis.set_major_locator(MultipleLocator(1))
ax0.xaxis.set_minor_locator(MultipleLocator(0.2))

ax0.set_xticklabels(["", "", "1", "2", "3", "4", "5"])
plt.legend()
plt.tight_layout()


#plt.show()
plt.savefig("lennardjones-fig.svg")
