#!/bin/bash

base_path="/home/joliens/Documents/02_recurrentSF_3T/data-bids/derivatives/"
# func_path="${base_path}firstlevel-main/"
func_path="${base_path}ppi/firstlevel/"

# sub-01, run 13 doesn't exist...
# skip subject 16

for sub in {01..17} 18
do
    echo $(date +"%H:%M:%S")  subject ${sub}
    for run in {01..20}
    do
        sub_stats_path="${func_path}sub-${sub}/run-${run}.feat/stats/"
        for condition in {01..16}
        do
            func_data="${sub_stats_path}cope${condition}_MNI.nii.gz"
            out_data="${sub_stats_path}cope${condition}_MNI_smooth8.nii.gz"

            fslmaths ${func_data} -kernel gauss 3.39731612026 -fmean ${out_data}
                                                 
        done
    done
done
