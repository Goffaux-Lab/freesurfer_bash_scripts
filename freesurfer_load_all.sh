freeview -f $FREESURFER_HOME/subjects/fsaverage/surf/rh.inflated\
overlay=rh.duration_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=rh.duration_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=rh.sf_F.mgh:overlay_smooth=2:overlay_threshold=0,50\
overlay=rh.sf_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=rh.stimtype_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=rh.stimtype_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=rh.duration_sf_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=rh.duration_sf_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=rh.duration_stimtype_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=rh.duration_stimtype_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=rh.sf_stimtype_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=rh.sf_stimtype_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=rh.duration_sf_stimtype_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=rh.duration_sf_stimtype_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=rh.HSF_neg_slope.mgh:overlay_smooth=2\
overlay=rh.HSF_pos_slope.mgh:overlay_smooth=2\
overlay=rh.LSF_neg_slope.mgh:overlay_smooth=2\
overlay=rh.LSF_pos_slope.mgh:overlay_smooth=2\
overlay=rh.HSF_neg_minus_LSF_neg.mgh:overlay_smooth=2\
overlay=rh.HSF_pos_minus_LSF_pos.mgh:overlay_smooth=2 \
-f $FREESURFER_HOME/subjects/fsaverage/surf/lh.inflated\
overlay=lh.duration_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=lh.duration_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=lh.sf_F.mgh:overlay_smooth=2:overlay_threshold=0,50\
overlay=lh.sf_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=lh.stimtype_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=lh.stimtype_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=lh.duration_sf_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=lh.duration_sf_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=lh.duration_stimtype_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=lh.duration_stimtype_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=lh.sf_stimtype_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=lh.sf_stimtype_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=lh.duration_sf_stimtype_F.mgh:overlay_smooth=2:overlay_threshold=0,10\
overlay=lh.duration_sf_stimtype_pval.mgh:overlay_smooth=2:overlay_threshold=0.99,1\
overlay=lh.HSF_neg_slope.mgh:overlay_smooth=2\
overlay=lh.HSF_pos_slope.mgh:overlay_smooth=2\
overlay=lh.LSF_neg_slope.mgh:overlay_smooth=2\
overlay=lh.LSF_pos_slope.mgh:overlay_smooth=2\
overlay=lh.HSF_neg_minus_LSF_neg.mgh:overlay_smooth=2\
overlay=lh.HSF_pos_minus_LSF_pos.mgh:overlay_smooth=2 \
--camera Azimuth 90 Zoom 1.2 Elevation 300 & 

freeview -f $FREESURFER_HOME/subjects/fsaverage/surf/rh.inflated\
overlay=rh.duration_pval_N16_fdr.mgh:overlay_smooth=2:overlay_threshold=0.95,1\
overlay=rh.duration_sf_pval_N16_fdr.mgh:overlay_smooth=2:overlay_threshold=0.95,1\
overlay=rh.HSF_slope_N16_fdr_smooth8.mgh:overlay_smooth=2\
overlay=rh.LSF_slope_N16_fdr_smooth8.mgh:overlay_smooth=2\
overlay=rh.HSF_minus_LSF_N16_sigthresh_fdr_smooth8.mgh:overlay_smooth=2 \
-f $FREESURFER_HOME/subjects/fsaverage/surf/lh.inflated\
overlay=lh.duration_pval_N16_fdr.mgh:overlay_smooth=2:overlay_threshold=0.95,1\
overlay=lh.duration_sf_pval_N16_fdr.mgh:overlay_smooth=2:overlay_threshold=0.95,1\
overlay=lh.HSF_slope_N16_fdr_smooth8.mgh:overlay_smooth=2\
overlay=lh.LSF_slope_N16_fdr_smooth8.mgh:overlay_smooth=2\
overlay=lh.HSF_minus_LSF_N16_sigthresh_fdr_smooth8.mgh:overlay_smooth=2 \
--camera Azimuth 90 Zoom 1.2 Elevation 300 & 

freeview -f $FREESURFER_HOME/subjects/fsaverage/surf/rh.inflated\
overlay=rh.duration_pval_N16_fdr_smooth8.mgh:overlay_threshold=0.95,1\
overlay=rh.duration_sf_pval_N16_fdr_smooth8.mgh:overlay_threshold=0.95,1\
overlay=rh.HSF_slope_N16_fdr_smooth8.mgh\
overlay=rh.LSF_slope_N16_fdr_smooth8.mgh\
overlay=rh.HSF_minus_LSF_N16_sigthresh_fdr_smooth8.mgh \
-f $FREESURFER_HOME/subjects/fsaverage/surf/lh.inflated\
overlay=lh.duration_pval_N16_fdr_smooth8.mgh:overlay_threshold=0.95,1\
overlay=lh.duration_sf_pval_N16_fdr_smooth8.mgh:overlay_threshold=0.95,1\
overlay=lh.HSF_slope_N16_fdr_smooth8.mgh\
overlay=lh.LSF_slope_N16_fdr_smooth8.mgh\
overlay=lh.HSF_minus_LSF_N16_sigthresh_fdr_smooth8.mgh \
--camera Azimuth 90 Zoom 1.2 Elevation 300 & 

