#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
i=1
while [ $i -lt 11 ]
do
mkdir ./part_b ./part_b/jobs ./part_b/outputs
cat <<EOF > ./part_b/jobs/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i

#=== Lead plate ===#
s:Ge/Plate/Type="TsCylinder"
s:Ge/Plate/Parent="Phantom"
s:Ge/Plate/Material="Lead"
d:Ge/Plate/HL = 2.3 mm
d:Ge/Plate/RMin = 0. cm
d:Ge/Plate/RMax = 15. cm
d:Ge/Plate/SPhi = 0. deg
d:Ge/Plate/DPhi = 360. deg
d:Ge/Plate/TransZ = 19 cm
s:Ge/Plate/Color="magenta"

#=== Scoring for radial scattering ===#
# Scoring for radial scattering
s:Ge/Detector/Type="TsCylinder"
s:Ge/Detector/Parent="Phantom"
b:Ge/Detector/IsParallel="True"
d:Ge/Detector/RMin = 0.0 cm
d:Ge/Detector/RMax = 15.0 cm
d:Ge/Detector/HL=0.2 cm
d:Ge/Detector/SPhi=0.0 deg
d:Ge/Detector/DPhi=360.0 deg
d:Ge/Detector/TransZ=-5.0 cm # Place detector 25 cm from beam entrance.

#====Scorer====#

s:Sc/DoseScorer/Quantity="EnergyDeposit" # Quantity to score
s:Sc/DoseScorer/Component = "Detector" # Where to score
b:Sc/DoseScorer/OutputToConsole = "TRUE" # Output
s:Sc/DoseScorer/IfOutputFileAlreadyExists = "Overwrite"
i:Sc/DoseScorer/RBins = 1000

s:Sc/DoseScorer/OutputFile = "./part_b/outputs/job$i"
EOF
/Applications/topas/bin/topas ./part_b/jobs/job$i.txt
((i ++))
done