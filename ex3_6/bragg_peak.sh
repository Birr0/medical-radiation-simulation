#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
mkdir ./bragg_peak ./bragg_peak/jobs ./bragg_peak/outputs
i=1
``
while [ $i -lt 11 ]
do
cat <<EOF > ./bragg_peak/jobs/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i

#=== Lead plate ===#
s:Ge/Plate/Type="TsCylinder"
s:Ge/Plate/Parent="Phantom"
s:Ge/Plate/Material="Lead"
d:Ge/Plate/HL = 0.23 cm
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
s:Sc/DoseScorer/OutputFile = "./bragg_peak/outputs/job$i"
EOF
/Applications/topas/bin/topas ./bragg_peak/jobs/job$i.txt
((i ++))
done