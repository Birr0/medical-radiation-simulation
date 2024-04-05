#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
i=1
mkdir ./jobs ./outputs
while [ $i -lt 11 ]
do
cat <<EOF > ./jobs/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i
s:Sc/DoseScorer/OutputFile = "./outputs/job$i"
EOF
/Applications/topas/bin/topas ./jobs/job$i.txt
((i ++))
done