#!/bin/bash
i=1
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
while [ $i -lt 11 ]
do
mkdir ./part_a ./part_a/jobs ./part_a/outputs
cat <<EOF > ./part_a/jobs/job$i.txt
includeFile = ./base_a.txt 
i:Ts/Seed = $i
s:Sc/DoseScorer/OutputFile = "./part_a/outputs/job$i"
EOF
/Applications/topas/bin/topas ./part_a/jobs/job$i.txt
((i ++))
done