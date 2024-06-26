#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
thickness=5
t=$(echo "scale=2; $thickness / 100" | bc)
"./part_b/outputs_pos$pos/job$i"
while [ $thickness -lt 35 ]
do
mkdir ./part_a ./part_a/jobs_thick$thickness ./part_a/outputs_thick$thickness
i=1

while [ $i -lt 4 ]
do
cat <<EOF > ./part_a/jobs_thick$thickness/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i

#=== Lead plate ===#
s:Ge/Plate/Type="TsCylinder"
s:Ge/Plate/Parent="Phantom"
s:Ge/Plate/Material="Lead"
d:Ge/Plate/HL = $t cm
d:Ge/Plate/RMin = 0. cm
d:Ge/Plate/RMax = 15. cm
d:Ge/Plate/SPhi = 0. deg
d:Ge/Plate/DPhi = 360. deg
d:Ge/Plate/TransZ = 19 cm
s:Ge/Plate/Color="magenta"

#======================Scorer================#
s:Sc/DoseScorer/Quantity="DoseToMedium" # Quantity to score
s:Sc/DoseScorer/Component = "Phantom" # Where to score
b:Sc/DoseScorer/OutputToConsole = "TRUE" # Output
s:Sc/DoseScorer/IfOutputFileAlreadyExists = "Overwrite"
i:Sc/DoseScorer/ZBins = 1000
s:Sc/DoseScorer/OutputFile = "./part_a/outputs_thick$thickness/job$i"
EOF
/Applications/topas/bin/topas ./part_a/jobs_thick$thickness/job$i.txt
((i ++))
done
((thickness+=5))
t=$(echo "scale=2; $thickness / 100" | bc)
done