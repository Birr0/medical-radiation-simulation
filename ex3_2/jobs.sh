#!/bin/bash
i=300
while [ $i -lt 301 ]
do
mkdir ./jobs
mkdir ./outputs
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
cat <<EOF > ./jobs/job$i.txt
includeFile = base.txt 
i:Ts/Seed = 1
d:So/Demo/BeamEnergy = $i MeV
s:Sc/DoseScorer/OutputFile = "./outputs/job$i"
EOF
((count ++))
/usr/local/topas/topas/bin/topas ./jobs/job$i.txt
done