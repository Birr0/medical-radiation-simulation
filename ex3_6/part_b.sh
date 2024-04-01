#!/bin/bash
i=1
while [ $i -lt 11 ]
do
mkdir ./part_b ./part_b/jobs ./part_b/outputs
cat <<EOF > ./part_b/jobs/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i

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
d:Ge/Plate/TransZ=-5.0 cm

#====Scorer====#

s:Sc/DoseScorer/Quantity="EnergyDeposit" # Quantity to score
s:Sc/DoseScorer/Component = "Detector" # Where to score
b:Sc/DoseScorer/OutputToConsole = "TRUE" # Output
s:Sc/DoseScorer/IfOutputFileAlreadyExists = "Overwrite"
i:Sc/DoseScorer/RBins = 100

s:Sc/DoseScorer/OutputFile = "./part_b/outputs/job$i"
EOF

((i ++))
/usr/local/topas/topas/bin/topas ./part_b/jobs/job$i.txt
done