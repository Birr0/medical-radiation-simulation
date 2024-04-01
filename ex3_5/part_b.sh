#!/bin/bash
i=1
while [ $i -lt 11 ]
do
mkdir ./part_b ./part_b/jobs ./part_b/outputs
cat <<EOF > ./part_b/jobs/job$i.txt
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
d:Ge/Plate/TransZ=14.0 cm
s:Ge/Plate/Color="magenta"

s:Sc/DoseScorer/OutputFile = "./part_b/outputs/job$i"
EOF

((i ++))
/usr/local/topas/topas/bin/topas ./part_b/jobs/job$i.txt
done