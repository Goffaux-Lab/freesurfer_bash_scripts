# base_path='/home/jschuurmans/Documents/02_recurrentSF_3T/'
base_path='/home/joliens/Documents/02_recurrentSF_3T/'

mask_path="${base_path}data-bids/derivatives/masks/mni_masks_per_roi/"
declare -a maps=(HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1_sigthresh 0.001   0.2
)                # duration_sf_pval_N16_fdr_smooth8_noart_8_smooth1x1         0.95  1
                 # HSF_minus_LSF_N16_sigthresh_fdr_smooth8_noart_8_smooth1x1  0.1   0.2
                 # HSF_slope_N16_fdr_smooth8_noart_8_sigthresh_smooth1x1      0   0.3
                 # LSF_slope_N16_fdr_smooth8_noart_8_sigthresh_smooth1x1      0   0.3)
V1_color='0,0,0'
FFA_color='0,0,0'

V1_label='V1_smooth5x1_thresh3.label'
FFA_label='FFA_smooth5x1_thresh3.label'
                    
## 191 302 102 

declare -a cam=(posterior_left   44   1.2  15   0    -180
                posterior_right  136  1.2  15   0    -180
                ventral_right    162  1.2  303  107  -73
                ventral_left     196  1.2  238  255  75
                frontal_left     310  1.2  -15  0    -180
                frontal_right    230  1.2  -15  0    -180)

nmaps=${#maps[*]}
nmap_cols=3
let "nmaps=nmaps-1"
nviews=${#cam[*]}
nview_cols=6
let "nviews=nviews-1"
for c in $(seq 0 $nview_cols $nviews)
do
    view="${cam[$c]}"
    az=${cam[$c+1]}
    zo=${cam[$c+2]}
    el=${cam[$c+3]}
    ro=${cam[$c+4]}
    antiro=${cam[$c+5]}

    for i in $(seq 0 $nmap_cols $nmaps)
    do
        map="${maps[$i]}"
        let "a=i+1"
        let "b=i+2"

        for hemi in "rh" "lh"
        do
            out_name="${base_path}analysis/analysis_MB/figures/all_views2/${map}_${hemi}_${view}"

            echo ---------------------- $map \($hemi\) ----------------------
            echo $view $az $zo $el $ro $antiro
freeview -f $FREESURFER_HOME/subjects/fsaverage/surf/${hemi}.inflated_pre\
overlay=${hemi}.${map}.mgh:color=160,160,164:overlay_threshold="${maps[$a]}","${maps[$b]}":\
label=${mask_path}${hemi}.${hemi:0:1}${V1_label}:label_outline=1:label_color=${V1_color}:\
label=${mask_path}${hemi}.${hemi:0:1}${FFA_label}:label_outline=1:label_color=${FFA_color} \
--camera Azimuth "$az" Zoom "$zo" Elevation "$el" Roll "$ro" \
--screenshot $out_name 3 & 

freeview -f $FREESURFER_HOME/subjects/fsaverage/surf/${hemi}.inflated_pre\
overlay=${hemi}.${map}.mgh:color=160,160,164:overlay_threshold="${maps[$a]}","${maps[$b]}":\
label=${mask_path}${hemi}.${hemi:0:1}${V1_label}:label_outline=1:label_color=${V1_color}:\
label=${mask_path}${hemi}.${hemi:0:1}${FFA_label}:label_outline=1:label_color=${FFA_color} \
--camera Azimuth "$az" Zoom "$zo" Elevation "$el" Roll "$antiro" \
--screenshot ${out_name}_flip 3 & 


            # turn the upside down image the right way up
            sleep 40
            convert ${out_name}_flip.png -rotate 180 ${out_name}_tmp.png && \
            # average it with the original to create a two sources of light
            convert ${out_name}.png ${out_name}.png ${out_name}_tmp.png -average ${out_name}_lit.png && \
            # change the map color (by changing the red RGB channel to 78% in
            # hue, color, luminance space [HCL])
            convert ${out_name}_lit.png -colorspace HCL -channel R -evaluate set 78% +channel -colorspace sRGB ${out_name}_lit_purple.png && \
            # brighten the image a bit after the previous command
            convert ${out_name}_lit_purple.png -fill white -colorize 15% ${out_name}_lit_purple.png && \
            # make the background transparent
            convert ${out_name}_lit_purple.png -transparent white ${out_name}_lit_purple_trans.png && \
            # # add custom colorbar
            # convert ${out_name}_lit_trans.png test.png -layers merge ${out_name}_lit_trans_colorbar.png && \
            rm ${out_name}_tmp.png
            
            pkill freeview
        done
    done
done
