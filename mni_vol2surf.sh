base_path='/home/joliens/Documents/02_recurrentSF_3T/data-bids/derivatives/whole_brain_second_level_group/'
volumes_upsampled_path="${base_path}volumes_upsampled_1mm/"
volume_path="${base_path}volumes/"
surface_path="${base_path}surfaces/"

# for map in duration_F_N16_fdr duration_pval_N16_fdr duration_sf_F_N16_fdr duration_sf_pval_N16_fdr duration_sf_stimtype_F_N16_fdr duration_sf_stimtype_pval_N16_fdr duration_stimtype_F_N16_fdr duration_stimtype_pval_N16_fdr HSF_neg_slope_N16_fdr HSF_pos_slope_N16_fdr LSF_neg_slope_N16_fdr LSF_pos_slope_N16_fdr sf_F_N16_fdr sf_pval_N16_fdr sf_stimtype_F_N16_fdr sf_stimtype_pval_N16_fdr stimtype_F_N16_fdr stimtype_pval_N16_fdr HSF_neg_minus_LSF_neg_N16_fdr HSF_pos_minus_LSF_pos_N16_fdr HSF_pos_minus_LSF_pos_MINUS_HSF_neg_minus_LSF_neg_N16_fdr
# for map in duration_F_N16 sf_F_N16 stimtype_F_N16 duration_sf_F_N16 duration_stimtype_F_N16 sf_stimtype_F_N16 duration_sf_stimtype_F_N16 duration_pval_N16 sf_pval_N16 stimtype_pval_N16 duration_sf_pval_N16 duration_stimtype_pval_N16 sf_stimtype_pval_N16 duration_sf_stimtype_pval_N16 HSF_slope_N16 LSF_slope_N16 HSF_neg_slope_N16 LSF_neg_slope_N16 HSF_pos_slope_N16 LSF_pos_slope_N16  HSF_minus_LSF_N16 HSF_neg_minus_LSF_neg_N16 HSF_pos_minus_LSF_pos_N16 HSF_minus_LSF_N16_sigthresh
# for map in HSF_slope_N16_fdr_smooth8 LSF_slope_N16_fdr_smooth8 HSF_minus_LSF_N16_sigthresh_fdr_smooth8
# for map in HSF_minus_LSF_N16_sigthresh_fdr_smooth8
# for map in empty

for map in duration_F_N16_fdr_smooth8_ppi duration_pval_N16_fdr_smooth8_ppi duration_sf_F_N16_fdr_smooth8_ppi duration_sf_pval_N16_fdr_smooth8_ppi duration_sf_stimtype_F_N16_fdr_smooth8_ppi duration_sf_stimtype_pval_N16_fdr_smooth8_ppi duration_stimtype_F_N16_fdr_smooth8_ppi duration_stimtype_pval_N16_fdr_smooth8_ppi HSF_minus_LSF_N16_fdr_smooth8_ppi HSF_minus_LSF_N16_sigthresh_fdr_smooth8 HSF_minus_LSF_N16_sigthresh_fdr_smooth8_ppi HSF_neg_minus_LSF_neg_N16_fdr_smooth8_ppi HSF_neg_slope_N16_fdr_smooth8_ppi HSF_pos_minus_LSF_pos_N16_fdr_smooth8_ppi HSF_pos_slope_N16_fdr_smooth8_ppi HSF_slope_N16_fdr_smooth8_ppi LSF_neg_slope_N16_fdr_smooth8_ppi LSF_pos_slope_N16_fdr_smooth8_ppi LSF_slope_N16_fdr_smooth8_ppi sf_F_N16_fdr_smooth8_ppi sf_pval_N16_fdr_smooth8_ppi sf_stimtype_F_N16_fdr_smooth8_ppi sf_stimtype_pval_N16_fdr_smooth8_ppi stimtype_F_N16_fdr_smooth8_ppi stimtype_pval_N16_fdr_smooth8_ppi
do
    mri_vol2vol --mov "${volume_path}${map}.nii.gz" --targ "${FSLDIR}/data/standard/MNI152_T1_1mm_brain.nii.gz" --regheader --o "${volumes_upsampled_path}${map}_1mm.nii.gz"  --interp trilin
    for hemi in rh lh
    do
        mri_vol2surf --mov "${volumes_upsampled_path}${map}_1mm.nii.gz" --mni152reg --hemi "${hemi}" --surf white --o "${surface_path}${hemi}.${map}.mgh"
    done
done

