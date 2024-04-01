#!/bin/bash
for i in 1 2 3 4 5 6 7 8 9 10
do
mkdir ./jobs
mkdir ./outputs
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
cat <<EOF > ./jobs/job$i.txt
includeFile = base.txt 
i:Ts/Seed = $i 
s:Sc/DoseScorer/OutputFile = "./outputs/job$i"
EOF

/Applications/topas/bin/topas ./jobs/job$i.txt
done