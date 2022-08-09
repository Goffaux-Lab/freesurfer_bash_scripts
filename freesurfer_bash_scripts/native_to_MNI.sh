#!/bin/bash 
base_path="/home/joliens/Documents/02_recurrentSF_3T/data-bids/derivatives/"
# func_path="${base_path}firstlevel-main/"
func_path="${base_path}ppi/firstlevel/"
trans_path="${base_path}fmriprep/"
# mask_path="${base_path}masks/mni_masks_per_roi/bV1/"
# mask="${mask_path}sub-01_label-bV1MNI_roi.nii.gz"
# mask_out="${mask_path}sub-01_label-bV1MNI_roi_resampled.nii.gz"

# sub-01, run 13 doesn't exist...

switch='TRUE'
for sub in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 18
do
    echo $(date +"%H:%M:%S")  subject ${sub}
    for run in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
    do
        sub_anat_path="${trans_path}sub-${sub}/anat/"
        sub_trans_path="${sub_anat_path}transfiles/"
        sub_stats_path="${func_path}sub-${sub}/run-${run}.feat/stats/"
        for condition in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
        do
            func_data="${sub_stats_path}cope${condition}.nii.gz"
            out_data="${sub_stats_path}cope${condition}_MNI.nii.gz"
            if [ $switch ]
            then
                ref="${func_path}sub-03/run-01.feat/stats/cope1.nii.gz"
                switch=''
                # flirt -in "${mask}" -ref "${ref}" -applyxfm -out "${mask_out}" 
            fi
            # warp the map from subject native space to MNI space
            antsApplyTransforms \
                -i "${func_data}" \
                -o "${out_data}" \
                -r "${ref}" \
                -n BSpline \
                -t "${sub_anat_path}sub-${sub}_from-T1w_to-MNI152NLin2009cAsym_mode-image_xfm.h5"
        done
    done
done
