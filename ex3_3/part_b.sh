#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
pos=1
while [ $pos -lt 20 ]
do
i=1
mkdir ./part_b
mkdir ./part_b/jobs_pos_neg$pos
mkdir ./part_b/outputs_pos_neg$pos
while [ $i -lt 4 ]
do
cat <<EOF > ./part_b/jobs_pos_neg$pos/job$i.txt
includeFile = ./base_b.txt 
i:Ts/Seed = $i
d:Ge/Plate/TransZ=-$pos cm
s:Sc/DoseScorer/OutputFile = "./part_b/outputs_pos_neg$pos/job$i"
EOF
/Applications/topas/bin/topas ./part_b/jobs_pos_neg$pos/job$i.txt
((i++))
done
((pos+=2))
done