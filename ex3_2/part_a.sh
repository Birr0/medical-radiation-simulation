#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"

energy=70 # GeV
while [ $energy -lt 100 ]
do
mkdir ./jobs
mkdir ./outputs
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
cat <<EOF > ./jobs/job$energy.txt
includeFile = ./base.txt 
i:Ts/Seed = 0
d:So/Demo/BeamEnergy = $energy MeV
s:Sc/DoseScorer/OutputFile = "./outputs/job$energy"
EOF
/Applications/topas/bin/topas ./jobs/job$energy.txt
((energy+=5))
done