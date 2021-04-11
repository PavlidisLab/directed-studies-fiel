!#/bin/bash

# Run blastp of gold standard FDSI sequences against all known peptides of all family 
# members, then deposit in alignment folder

bash protblast.sh human_AR_query.fa human_AR_sequences.txt human_AR_alignment
wait

bash protblast.sh human_BCAR1_query.fa human_BCAR1_sequences.txt human_BCAR1_alignment
wait

bash protblast.sh human_BIRC5_query.fa human_BIRC5_sequences.txt human_BIRC5_alignment
wait

bash protblast.sh human_BOK_query.fa human_BOK_sequences.txt human_BOK_alignment
wait

bash protblast.sh human_CD44_query.fa human_CD44_sequences.txt human_CD44_alignment
wait

bash protblast.sh human_CFLAR_query.fa human_CFLAR_sequences.fa human_CFLAR_alignment
wait

bash protblast.sh human_DPF3_query.fa human_DPF3_sequences.fa human_DPF3_alignment
wait

bash protblast.sh human_EIF4G1_query.fa human_EIF4G1_sequences.fa human_EIF4G1_alignment
wait

bash protblast.sh human_EIF4G2_query.fa human_EIF4G2_sequences.fa human_EIF4G2_alignment
wait

bash protblast.sh human_HBS1L_query.fa human_HBS1L_sequences.fa human_HBS1L_alignment
wait

bash protblast.sh human_KLF6_query.fa human_KLF6_sequences.fa human_KLF6_alignment
wait

bash protblast.sh human_MST1R_query.fa human_MST1R_sequences.fa human_MST1R_alignment
wait

bash protblast.sh human_PGAM5_query.fa human_PGAM5_sequences.fa human_PGAM5_alignment
wait

bash protblast.sh human_PML_query.fa human_PML_sequences.fa human_PML_alignment
wait

bash protblast.sh human_PRMT5_query.fa human_PRMT5_sequences.fa human_PRMT5_alignment
wait

bash protblast.sh human_STIM2_query.fa human_STIM2_sequences.fa human_STIM2_alignment
wait

bash protblast.sh human_SUN1_query.fa human_SUN1_sequences.fa human_SUN1_alignment
wait

bash protblast.sh human_TICAM1_query.fa human_TICAM1_sequences.fa human_TICAM1_alignment
wait

bash protblast.sh human_TICAM2_query.fa human_TICAM2_sequences.fa human_TICAM2_alignment
wait

bash protblast.sh human_tp63_query.fa human_tp63_sequences.txt human_tp63_alignment
wait

bash protblast.sh mouse_cacna1_query.fa mouse_cacna1_sequences.txt mouse_cacna1_alignment
wait

bash protblast.sh mouse_cacnb4_query.fa mouse_cacnb4_sequences.fa mouse_cacnb4_alignment
wait

bash protblast.sh mouse_calca_query.fa mouse_calca_sequences.fa mouse_calca_alignment
wait

bash protblast.sh mouse_cdc42_query.fa mouse_cdc42_sequences.txt mouse_cdc42_alignment
wait

bash protblast.sh mouse_homer1_query.fa mouse_homer1_sequences.txt mouse_homer1_alignment
wait

bash protblast.sh mouse_il1rap_query.fa mouse_il1rap_sequences.fa mouse_il1rap_alignment
wait

bash protblast.sh mouse_lpin1_query.fa mouse_lpin1_sequences.fa mouse_lpin1_alignment
wait

bash protblast.sh mouse_mecp2_query.fa mouse_mecp2_sequences.txt mouse_mecp2_alignment
wait

bash protblast.sh mouse_myh10_query.fa mouse_myh10_sequences.fa mouse_myh10_alignment
wait

bash protblast.sh mouse_opn4_query.fa mouse_opn4_sequences.fa mouse_opn4_alignment
wait

bash protblast.sh mouse_oprm1_query.fa mouse_oprm1_sequences.fa mouse_oprm1_alignment
wait

bash protblast.sh mouse_rbfox1_query.fa mouse_rbfox1_sequences.fa mouse_rbfox1_alignment
wait

bash protblast.sh mouse_robo3_query.fa mouse_robo3_sequences.fa mouse_robo3_alignment
wait

bash protblast.sh mouse_rock2_query.fa mouse_rock2_sequences.fa mouse_rock2_alignment
wait

bash protblast.sh mouse_ryr3_query.fa mouse_ryr3_sequences.fa mouse_ryr3_alignment
wait

bash protblast.sh mouse_sirt3_query.fa mouse_sirt3_sequences.fa mouse_sirt3_alignment
wait

bash protblast.sh mouse_snap25_query.fa mouse_snap25_sequences.fa mouse_snap25_alignment
wait

bash protblast.sh mouse_tp63_query.fa mouse_tp63_sequences.fa mouse_tp63_alignment
wait

echo Done

