#!/bin/bash

cd /home/fieldima/blastplus/blastp/blastPotentialFDSIs

bash blastpPotentialFDSIs.bash human_EIF4G1_query.fa human_EIF4G1_alignment
wait
bash blastpPotentialFDSIs.bash human_tp63_query.fa human_tp63_alignment
wait
bash blastpPotentialFDSIs.bash mouse_cacnb4_query.fa mouse_cacnb4_alignment
wait
bash blastpPotentialFDSIs.bash mouse_cdc42_query.fa mouse_cdc42_alignment
wait
bash blastpPotentialFDSIs.bash mouse_lpin1_query.fa mouse_lpin1_alignment
wait
bash blastpPotentialFDSIs.bash mouse_myh10_query.fa mouse_myh10_alignment
wait
bash blastpPotentialFDSIs.bash mouse_rock2_query.fa mouse_rock2_alignment
wait
bash blastpPotentialFDSIs.bash mouse_ryr3_query.fa mouse_ryr3_alignment
wait
bash blastpPotentialFDSIs.bash mouse_snap25_query.fa mouse_snap25_alignment
wait
bash blastpPotentialFDSIs.bash human_BCAR1_query.fa human_BCAR1_alignment
wait

echo All Done!


