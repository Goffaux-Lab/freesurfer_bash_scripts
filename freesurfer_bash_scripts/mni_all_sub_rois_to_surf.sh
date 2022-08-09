base_path="/home/jschuurmans/Documents/02_recurrentSF_3T/data-bids/derivatives/masks/mni_masks_per_roi/"
#out_path='/home/joliens/Documents/02_recurrentSF_3T/data-bids/derivatives/whole_brain_second_level_group/'
out_path='/home/jschuurmans/Documents/02_recurrentSF_3T/data-bids/derivatives/masks/mni_masks_per_roi/lSTS/'
#volumes_upsampled_path="${out_path}volumes_upsampled_1mm/"
#volume_path="${out_path}volumes/"
#surface_path="${out_path}surfaces/"

count=0
for roi in /home/jschuurmans/Documents/02_recurrentSF_3T/data-bids/derivatives/masks/mni_masks_per_roi/lSTS/*.nii.gz
do
    filename=${roi##*/}
    filename=${filename%.nii.gz}
    mri_vol2vol --mov "${roi}" --targ "${FSLDIR}/data/standard/MNI152_T1_1mm_brain.nii.gz" --regheader --o "${out_path}${filename}_1mm.nii.gz"  --interp nearest
    if [ "${count}" -eq "0" ]
    then
        to_add="fslmaths ${out_path}${filename}_1mm.nii.gz"
    else
        to_add="${to_add} -add ${out_path}${filename}_1mm.nii.gz"
    fi
    let "count = count + 1"
done

command="${to_add} ${out_path}lSTS.nii.gz"
$command

mri_vol2surf --mov "${out_path}lSTS.nii.gz" --mni152reg --hemi lh --surf white --o "${base_path}lh.lSTS.mgh"


mri_binarize --i "${base_path}rh.rSTS.mgh" --min 4 --o "${base_path}rh.rSTSbin.mgh"
mri_cor2label --i "${base_path}rh.rSTSbin.mgh" --surf fsaverage rh --id 1 --l "${base_path}rh.rSTS.label"
