# numbers for dapony (ssh'ed from matt's laptop) minus 200 and 400 from y for
# row 2 and 3 of the figure to squeeze it together a bit for the poster
convert 
-page +804+0 HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_rh_frontal_right_lit_purple_trans.png         
-page +1832+0     HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_lh_frontal_left_lit_purple_trans.png         
-page +0+893     HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_rh_posterior_right_lit_purple_trans.png         
-page +2571+893  HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_lh_posterior_left_lit_purple_trans.png         
-page +1157+2107  HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_rh_ventral_right_lit_purple_trans.png         
-page +1414+2107  HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_lh_ventral_left_lit_purple_trans.png         
-background none -layers merge -trim +repage combined2.png

convert 
-page +1250+0      HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_rh_frontal_right_lit_purple_trans.png         
-page +2850+0      HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_lh_frontal_left_lit_purple_trans.png         
-page +0+1500      HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_rh_posterior_right_lit_purple_trans.png         
-page +4000+1500   HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_lh_posterior_left_lit_purple_trans.png         
-page +1800+3500   HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_rh_ventral_right_lit_purple_trans.png         
-page +2200+3500   HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh_lh_ventral_left_lit_purple_trans.png         
-background none -layers merge -trim +repage combined2.png



# add this line 2nd to last to add a colour scale
-page +250+2500 test.png

# original numbers for pc in matt's office
poss = [[1250,  0],
[2850,  0],
[0,  1700],
[4000,  1700],
[1800,  3900],
[2200,  3900]]

# python code to adust the numbers
for pos in poss:
    i = [x - round(x/2.8) for x in pos]
    print(f'+{i[0]}+{i[1]}')
    
     

