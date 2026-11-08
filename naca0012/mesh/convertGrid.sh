#!/usr/bin/env bash
# Convert a NASA TMR NACA 0012 Family II PLOT3D grid to an OpenFOAM polyMesh.
# Usage: ./convertGrid.sh <level>     e.g. ./convertGrid.sh 6

set -euo pipefail   # stop at the first error, on undefined variables, and on failures inside pipes

# ---- 1. Input and paths ------------------------------------------------------
level="${1:?Usage: $0 <level>}"            # first argument; abort with a message if missing
scriptDir="$(cd "$(dirname "$0")" && pwd)"  # absolute path of this script (naca0012/mesh)
gridDir="$scriptDir/../grids"
grid="$gridDir/n0012familyII.${level}.p3dfmt"
nmf="$gridDir/n0012familyII.${level}.nmf"
caseDir="$scriptDir/../cases/mesh_L${level}"

[ -f "$grid" ] || { echo "Grid not found: $grid"; exit 1; }   # check the file exists

# ---- 2. Expected face counts from the grid header and the .nmf ---------------
# Line 2 of the PLOT3D file: IDIM JDIM KDIM -> cells Nj = JDIM-1, Nk = KDIM-1
read -r _ jdim kdim < <(sed -n '2p' "$grid")
Nj=$((jdim - 1)); Nk=$((kdim - 1))
# viscous_solid line of the .nmf: fields 6 and 7 are the j range on the wall
read -r js je < <(awk '/viscous_solid/ {print $6, $7}' "$nmf")
expAirfoil=$((je - js))
expFarfield=$((Nj + 2*Nk))
expEmpty=$((2*Nj*Nk))
echo "Level $level: ${Nj}x${Nk} cells; expected airfoil=$expAirfoil farfield=$expFarfield frontAndBack=$expEmpty"

# ---- 3. Case setup -----------------------------------------------------------
mkdir -p "$caseDir/system"
cp "$scriptDir"/{controlDict,topoSetDict,createPatchDict,fvSchemes,fvSolution} "$caseDir/system/"
cd "$caseDir"

# ---- 4. Conversion and patching ----------------------------------------------
rm -rf "$caseDir/constant"
plot3dToFoam -noBlank "$grid" > log.plot3dToFoam 2>&1
echo "Converted $grid to OpenFOAM format"
topoSet > log.topoSet 2>&1
echo "Created faceSets airfoilFaces, farfieldFaces, frontAndBackFaces"
createPatch -overwrite > log.createPatch 2>&1
echo "Created patches airfoil, farfield, frontAndBack"
checkMesh > log.checkMesh 2>&1
echo "checkMesh done (see log.checkMesh)"

# ---- 5. Automatic verification -----------------------------------------------
check () {                       # define a function named "check"
    local n                      # variable visible only inside the function
    n=$(awk -v p="$1" '$1==p {found=1} found && $1=="nFaces" {sub(";","",$2); print $2; exit}' \
          constant/polyMesh/boundary)
    if [ "$n" -eq "$2" ]; then   # -eq: numeric equality
        echo "  OK   $1: $n faces"
    else
        echo "  FAIL $1: $n faces (expected $2)"
        exit 1                   # stop the script with an error code
    fi
}

check airfoil      "$expAirfoil"
check farfield     "$expFarfield"
check frontAndBack "$expEmpty"

echo "Mesh level $level done: $caseDir"