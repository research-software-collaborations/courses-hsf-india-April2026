Access the binder using
https://binderhub.ssl-hep.org/v2/gh/research-software-collaborations/courses-hsf-india-April2026/dune?gpuModel=&gpuCount=1&cudaMajor=undefined&cudaMinor=undefined&site=nrp&memory=4.0&cpu=1&qos=Guaranteed

# Setting up Geant4 
Sourcing dune framework to install essential libraries geant4, cmake, ninja.

`source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh`
Setup geant4 : 
```
setup geant4 v4_11_2_p02 -q e26:prof
setup cmake v3_27_4
setup ninja v1_11_1
```

Check the path for G4 `echo "$GEANT4_ROOT" `

To check if everything is installed correctly 
```
echo $Geant4_DIR"
echo "$Geant4_DIR"
cmake --version
```     
# Download Celeritas using Github

In your directory : `cd /data/YourName/`

```
git clone https://github.com/celeritas-project/celeritas.git
```
Setting flags
```
cmake -S . -B build -G Ninja   -DCMAKE_INSTALL_PREFIX=/data/rashika/opt/celeritas   -DGeant4_DIR="$Geant4_DIR"   -DCELERITAS_USE_Geant4=ON   -DCELERITAS_USE_VecGeom=OFF   -DCELERITAS_USE_ROOT=OFF   -DCELERITAS_USE_HepMC3=OFF   -DCELERITAS_USE_MPI=OFF   -DCELERITAS_BUILD_TESTS=OFF   -DCELERITAS_BUILD_DOCS=OFF   -DCELERITAS_BUILTIN_CLI11=ON   -DCELERITAS_BUILTIN_nlohmann_json=ON
```

Build the files 
```
cmake --build build -j
```
If everything worked successfully then go to `/build/bin`

```
./celer-g4 --help
```
