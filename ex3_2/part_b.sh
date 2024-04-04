#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"

mkdir ./part_b
mkdir ./part_b/jobs
mkdir ./part_b/outputs
for i in 1 2 3 4 5 6 7 8 9 10
do
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
cat <<EOF > ./part_b/jobs/job$i.txt
includeFile = ./base_b.txt 
i:Ts/Seed = $i 
s:Sc/DoseScorer/OutputFile = "./part_b/outputs/job$i"
EOF

/Applications/topas/bin/topas ./part_b/jobs/job$i.txt
done