# BOLD-Simulation

The simulation does reverse engineering to show that behavior of average BOLD signal extracted from a VOI can not neccessarily be attributed to a singel voxel in the VOI.

Taken approach:
A VOI contains 14 voxels (divided to 2 types of structure: SCN and non-SCN voxels) is considered. The aim is to show when the average BOLD signal shows deactiivation in response to light, either non-SCN voxels are deriving the effect and the SCN voxel can even get activetaed in response to light or the singel SCN voxel is showing deactivation  in response to light and as a result driving the effect. In the latter, the SCN signal should be way stronger than surrounding voxels which is a bit unlikely!

In summary, following stepes are taken the simulation: 
1) Simulation of the Light stimuli
2) Convolution of the light stimuli with a hemodynamic response
3) Consideration of 2 different betas for the single SCN voxel and all other non-SCN voxels
4) Applying the inherent smmothness of BOLD signal on the betas
4) Multiplication of the output of convolution by the smoothed betas
5) Adding white noise to each voxel to make it more realistic.
6) Averaging all voxels
7) Calculation of t-value for the average BOLD signal
