#!/bin/bash
pos=1
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
while [ $pos -lt 20 ]
do
i=1
mkdir ./part_b
mkdir ./part_b/jobs_pos$pos
mkdir ./part_b/outputs_pos$pos
while [ $i -lt 10 ]
do
cat <<EOF > ./part_b/jobs_pos$pos/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i

#=== Metal plate ===#
s:Ge/Plate/Type="TsCylinder"
s:Ge/Plate/Parent="Phantom"
s:Ge/Plate/Material="G4_Al"
d:Ge/Plate/HL = 1. cm
d:Ge/Plate/RMin = 0. cm
d:Ge/Plate/RMax = 15. cm
d:Ge/Plate/SPhi = 0. deg
d:Ge/Plate/DPhi = 360. deg
d:Ge/Plate/TransZ=$pos cm
s:Ge/Plate/Color="magenta"

s:Sc/DoseScorer/OutputFile = "./part_b/outputs_pos$pos/job$i"
EOF

/Applications/topas/bin/topas ./part_b/jobs_pos$pos/job$i.txt
((i++))
done
((pos+=2))
done