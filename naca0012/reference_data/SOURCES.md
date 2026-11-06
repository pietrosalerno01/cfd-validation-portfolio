# Reference data sources
Downloaded: 2026-11-06
Site: NASA Turbulence Modeling Resource, https://tmbwg.github.io/turbmodels/
(formerly turbmodels.larc.nasa.gov)

## Web pages
- Validation case: https://tmbwg.github.io/turbmodels/naca0012_val.html
- SA results (CFL3D): https://tmbwg.github.io/turbmodels/naca0012_val_sa.html
- SST results (CFL3D): https://tmbwg.github.io/turbmodels/naca0012_val_sst.html
- Grid verification (SA): https://tmbwg.github.io/turbmodels/naca0012numerics_val_sa.html
  (+ _withoutpv.html and _withpv.html; values transcribed in tmr_sa_alpha10.md)
- Grids (Family II, 3-D PLOT3D): https://www.nasa.gov/wp-content/uploads/2026/02/naca0012numerics-grids.zip

## Files
| File | Content | Conditions |                                                                 
|---|---|---|
| CLCD_Ladson_expdata.dat | experimental CL, CD (Ladson) | M = 0.15, Re = 6e6, forced transition |             
| CP_Gregory_expdata.dat | experimental Cp (Gregory & O'Reilly) | Re = 2.88e6, digitized, upper surface only |  
| CP_Ladson.dat | experimental Cp (Ladson, Hill & Johnson) | M = 0.3, low-aspect-ratio test |                
| 0012.mccroskeydata.cl.dat | CL-alpha best fit (McCroskey) | compilation of several experiments |          
| n0012{clcd,cp,cf}_cfl3d_sa.dat | CFL3D SA results | 897x257 grid, point vortex on |
| n0012{clcd,cp,cf}_cfl3d_sst.dat | CFL3D SST results | 897x257 grid, point vortex on |
| tmr_sa_alpha10.md | TMR grid-verification values, SA, alpha = 10 deg | Family II, 3 finest grids |       

## Primary references
- Ladson, C. L., NASA TM-4074, 1988
- Ladson, C. L., Hill, A. S., Johnson, W. G., NASA TM-100526, 1987
- Gregory, N., O'Reilly, C. L., ARC R&M 3726, 1970
- McCroskey, W. J., AGARD CP-429, 1988
- Diskin, B., Thomas, J. L., Rumsey, C. L., Schwöppe, A., AIAA Journal 54(9), 2016, pp. 2563-2588, doi:10.2514/1.J054555
