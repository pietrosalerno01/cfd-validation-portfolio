# Open-source CFD validation portfolio

RANS validation and aerodynamic-loads studies with open-source tools
(OpenFOAM v2312 ESI, ParaView, Gmsh, CalculiX, Python), following
verification & validation practice: residual and force convergence,
grid-convergence studies (GCI), y+ checks, comparison with cited reference data.

## Modules
| # | Case | Status |
|---|---|---|
| 1 | NACA 0012, 2D RANS (SA, k-omega SST) vs NASA TMR | in progress |
| 2 | ONERA M6 transonic wing vs AGARD AR 138 | planned |
| 3 | Spanwise loads vs vortex-lattice method | planned |
| 4 | Python aerodynamic database and surrogate model | planned |

## Repository layout
- `naca0012/` – Module 1 (cases, reference data; grids are downloaded, see `reference_data/SOURCES.md`)
- `postproc/` – shared Python post-processing
- `docs/` – technical report and figures

## Author
Pietro Salerno – MSc Aerospace Engineering, Politecnico di Torino