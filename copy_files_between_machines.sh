#!/bin/bash

pony_path="/home/joliens/Documents/02_recurrentSF_3T/data-bids/derivatives/secondlevel-main/"
jolien_path="/home/jschuurmans/Documents/02_recurrentSF_3T/data-bids/derivatives/secondlevel-main/"

switch='TRUE'
for sub in {01..18}
do
    echo $(date +"%H:%M:%S")  subject ${sub}
    for condition in {1..16}
    do
        jolien_stats_path="${jolien_path}sub-${sub}/secondlevel.gfeat/cope${condition}.feat/stats/"
        jolien_data="${jolien_stats_path}cope1.nii.gz"

        pony_stats_path="${pony_path}sub-${sub}/secondlevel.gfeat/cope${condition}.feat/stats/"
        pony_data="${pony_stats_path}cope1.nii.gz"

        echo scp ${jolien_data} joliens@$pony:${pony_data}
    done
done
