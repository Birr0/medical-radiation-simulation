#!/bin/bash
pos=1
while [ $pos -lt 20 ]
do
i=1
mkdir ./part_b/jobs_pos$pos
mkdir ./part_b/outputs_pos$pos
while [ $i -lt 10 ]
do
cat <<EOF > ./part_b/jobs_pos$pos/job$i.txt
includeFile = ./base_b.txt 
i:Ts/Seed = $i
d:Ge/Plate/TransZ=$pos cm
s:Sc/DoseScorer/OutputFile = "./part_b/outputs_pos$pos/job$i"
EOF
/Applications/topas/bin/topas ./part_b/jobs_pos$pos/job$i.txt
((i++))
done
((pos+=2))
done