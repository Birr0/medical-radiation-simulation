#!/bin/bash
i=1
while [ $i -lt 11 ]
do
cat <<EOF > ./part_a/jobs/job$i.txt
includeFile = ./base.txt 
i:Ts/Seed = $i
s:Sc/DoseScorer/OutputFile = "./part_a/part_a_outputs/job$i"
EOF
((i ++))
/usr/local/topas/topas/bin/topas ./part_a/jobs/job$i.txt
done