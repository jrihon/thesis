import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
# The following import configures Matplotlib for 3D plotting.
from mpl_toolkits.mplot3d import Axes3D
from scipy.special import sph_harm
#plt.rc('text', usetex=True)

# Grids of polar and azimuthal angles
theta = np.linspace(0, np.pi, 100)
phi = np.linspace(0, 2*np.pi, 100)
# Create a 2-D meshgrid of (theta, phi) angles.
theta, phi = np.meshgrid(theta, phi)
# Calculate the Cartesian coordinates of each point in the mesh.
xyz = np.array([np.sin(theta) * np.sin(phi),
                np.sin(theta) * np.cos(phi),
                np.cos(theta)])

def plot_Y(ax, el, m):
    """Plot the spherical harmonic of degree el and order m on Axes ax."""

    # NB In SciPy's sph_harm function the azimuthal coordinate, theta,
    # comes before the polar coordinate, phi.
    Y = sph_harm(abs(m), el, phi, theta)

    # Linear combination of Y_l,m and Y_l,-m to create the real form.
    if m < 0:
        Y = np.sqrt(2) * (-1)**m * Y.imag
    elif m > 0:
        Y = np.sqrt(2) * (-1)**m * Y.real
    Yx, Yy, Yz = np.abs(Y) * xyz

    ax.scatter(Yx, xyz[0], s=0.1)
    # Colour the plotted surface according to the sign of Y.
#    cmap = plt.cm.ScalarMappable(cmap=plt.get_cmap('PRGn'))
#    cmap.set_clim(-0.5, 0.5)
#
#    ax.plot_surface(Yx, Yy, Yz,
#                    facecolors=cmap.to_rgba(Y.real),
#                    rstride=2, cstride=2)
#
#    # Draw a set of x, y, z axes for reference.
    ax_lim = 1.0
    ax.plot([-ax_lim, ax_lim], [0,0], c='0.5', lw=1, zorder=10)
    ax.plot([0,0], [-ax_lim, ax_lim], c='0.5', lw=1, zorder=10)
    ax.text(ax_lim, 0, "x", c='0.5')
    ax.text(0, ax_lim, "z", c='0.5')
#    ax.plot([0,0], [0,0], [-ax_lim, ax_lim], c='0.5', lw=1, zorder=10)
#    # Set the Axes limits and title, turn off the Axes frame.
#    ax.set_title(r'$Y_{{{},{}}}$'.format(el, m))
#    ax_lim = 0.5
    ax.set_xlim(-ax_lim, ax_lim)
    ax.set_ylim(-ax_lim, ax_lim)
#    ax.set_zlim(-ax_lim, ax_lim)
    ax.axis('off')

fig = plt.figure(figsize=plt.figaspect(1.))
#ax = fig.add_subplot(projection='3d')
ax = fig.add_subplot(111)
l, m = 3, 0
#l, m = 1, 0 #Px
#l, m = 0, 0 #spherical 1s
plot_Y(ax, l, m)
#plt.savefig('Y{}_{}.png'.format(l, m))
plt.show()


