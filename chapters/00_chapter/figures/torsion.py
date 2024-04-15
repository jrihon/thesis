import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator


def fourier(forcek, equi, multipl) -> np.ndarray :

    equi = np.deg2rad(equi)
    allvals = np.linspace(0,  2 * np.pi, 361)
    vals = forcek * (1 + np.cos((multipl * allvals) - equi))

    return vals


RANGE = np.linspace(0, 2 * np.pi, 361)

a = fourier(
        forcek=0.13,
        equi=0.00,
        multipl=3
        )


b = fourier(
        forcek=0.29,
        equi=180.0,
        multipl=2
        )

c = fourier(
        forcek=0.11,
        equi=0.00,
        multipl=1
        )
d = a + b + c


figure = plt.figure(figsize=(10,4))
ax0 = figure.add_subplot(111)

onec = "#0A404D"
twoc = "#4B90A2"
threec = "#81BDCC"
resultc = "#CD827B"
ax0.plot(
        RANGE,
        a,
        c=onec,
        linestyle="-.",
        label=r"n = 3",
        )

ax0.plot(
        RANGE,
        b,
        c=twoc,
        linestyle="-.",
        label=r"n = 2",
        )

ax0.plot(
        RANGE,
        c,
        c=threec,
        linestyle="-.",
        label=r"n = 1",
        )

ax0.plot(
        RANGE,
        d,
        c=resultc,
        label=r"Result",
        )
ax0.set_xlim(0, 2 * np.pi)
ax0.set_ylim(0, 1)

ax0.spines["right"].set_visible(False)
ax0.spines["top"].set_visible(False)

ax0.yaxis.set_major_locator(MultipleLocator(0.5))
ax0.yaxis.set_minor_locator(MultipleLocator(0.1))

ax0.xaxis.set_major_locator(MultipleLocator(np.pi / 3))
ax0.xaxis.set_minor_locator(MultipleLocator(np.pi / 12))
ax0.set_xticklabels(["0", "0", "π/3","2π/3", "π","4π/3","5π/3", "2π"])

figure.legend()


#plt.show()
plt.savefig("fourierseries.svg")
