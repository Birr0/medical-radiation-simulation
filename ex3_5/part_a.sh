#!/bin/bash
i=1
while [ $i -lt 11 ]
do
mkdir ./part_a ./part_a/jobs ./part_a/outputs
cat <<EOF > ./part_a/jobs/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i
s:Sc/DoseScorer/OutputFile = "./part_a/outputs/job$i"
EOF
((i ++))
/usr/local/topas/topas/bin/topas ./part_a/jobs/job$i.txt
done