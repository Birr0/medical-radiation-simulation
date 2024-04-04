#!/bin/bash
i=1
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
while [ $i -lt 11 ]
do
mkdir ./part_c ./part_c/jobs ./part_c/outputs
cat <<EOF > ./part_c/jobs/job$i.txt
includeFile = ./base_a.txt

i:Ts/Seed = $i
s:Sc/DoseScorer/OutputFile = "./part_c/outputs/job$i"
EOF
/Applications/topas/bin/topas ./part_c/jobs/job$i.txt
((i ++))
done