# freesurfer_bash_scripts
A set of bash scripts automating a few common freesurfer things on multiple
subjects/conditions.

**copy_files_between_machines.sh**:
Copy files from a location in one linux machine to a location in another linux
machine using `scp` (using `rsync` would be faster).

**freesurfer_load_all.sh**:
Open freesurfer surfaces and overlay all conditions with specified thresholds
(much faster than clicking all the files manually).

**make_combined_fig.sh**:
Take the output of the screenshots.sh and arrange them in a nice way as a
single figure.

**mni_all_sub_rois_to_surf.sh**:
Project a set of .nii ROIs onto cortical surface.

**mni_vol2surf.sh**:
Project a set of .nii maps onto cortical surface.

**native_to_MNI.sh**:
Transform set of maps into MNI space - a hack is to find and use a subjects
native map as `ref` that just so happens to encompass the MNI brain... There
must be a better way...

**screenshots.sh**:
Make high quality publication quality images of brain surface maps. For this to
work, you can't use the machine while it's doing the work (and each image takes
about 30 secs to make):

- Automatically open freesurfer, load the surfaces at in a variety of views/zooms
- Display each map, and any masks/ROIs/labels and save a high resolution
  screenshot
- Then process the screenshot to make it appear well lit from below (the
  default freesurfer is not so good), optionally change the map colour scheme,
  and make the background transparent.

**smooth_vols.sh**:
Smooth with a gaussian kernel (using fslmaths) in a loop to a set of volume
maps.

