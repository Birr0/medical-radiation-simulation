#!/bin/bash
i=1
thickness=0.01

while [ $i -lt 11 ]
do
mkdir ./part_a ./part_a/jobs ./part_a/outputs
cat <<EOF > ./part_a/jobs/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i

#=== Lead plate ===#
s:Ge/Plate/Type="TsCylinder"
s:Ge/Plate/Parent="Phantom"
s:Ge/Plate/Material="Lead"
d:Ge/Plate/HL = $thickness cm
d:Ge/Plate/RMin = 0. cm
d:Ge/Plate/RMax = 15. cm
d:Ge/Plate/SPhi = 0. deg
d:Ge/Plate/DPhi = 360. deg
d:Ge/Plate/TransZ=14.0 cm
s:Ge/Plate/Color="magenta"

#======================Scorer================#
s:Sc/DoseScorer/Quantity="DoseToMedium" # Quantity to score
s:Sc/DoseScorer/Component = "Phantom" # Where to score
b:Sc/DoseScorer/OutputToConsole = "TRUE" # Output
s:Sc/DoseScorer/IfOutputFileAlreadyExists = "Overwrite"
i:Sc/DoseScorer/ZBins = 100

s:Sc/DoseScorer/OutputFile = "./part_a/outputs/job$i"
EOF
((i ++))
/usr/local/topas/topas/bin/topas ./part_a/jobs/job$i.txt
done