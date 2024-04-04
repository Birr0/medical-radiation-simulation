#!/bin/bash
i=1
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
mkdir ./bragg_peak ./bragg_peak/jobs ./bragg_peak/outputs
while [ $i -lt 11 ]
do
cat <<EOF > ./bragg_peak/jobs/job$i.txt
includeFile = ./bragg_peak.txt 
i:Ts/Seed = $i
s:Sc/DoseScorer/OutputFile = "./bragg_peak/outputs/job$i"
EOF
/Applications/topas/bin/topas ./bragg_peak/jobs/job$i.txt
((i ++))
done