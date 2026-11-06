# TMR grid-verification values, SA model, alpha = 10 deg

Source: https://tmbwg.github.io/turbmodels/naca0012numerics_val_sa.html
Conditions: M = 0.15, Re = 6e6 (chord), fully turbulent, Family II grids.
Ranges span the three finest grid levels across the participating codes.

| Quantity | Without point vortex | With point vortex |
|---|---|---|
| CL  | 1.0909 - 1.0911     | 1.0912 - 1.0913   |
| CD  | 0.012270 - 0.012275 | 0.01221 - 0.01222 |
| CDp | 0.006060 - 0.006070 | 0.00601 - 0.00602 |
| CDv | 0.006205 - 0.006206 | 0.006204 - 0.006205 |

Target for this project: "without point vortex" (OpenFOAM farfield BCs have no PV correction).
