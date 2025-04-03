# conda activate tracktacular_rep

prefix=WorldTrack

# python $prefix/world_track.py fit \
#     -c $prefix/configs/t_fit.yml \
#     -c $prefix/configs/d_{multiviewx,wildtrack,synthehicle}.yml \
#     -c $prefix/configs/m_{mvdet,segnet,liftnet,bevformer}.yml

# python $prefix/world_track.py fit \
#     -c $prefix/configs/t_fit.yml \
#     -c $prefix/configs/d_wildtrack.yml \
#     -c $prefix/configs/m_liftnet.yml

# python $prefix/world_track.py fit \
#     -c $prefix/configs/t_fit.yml \
#     -c $prefix/configs/d_wildtrack.yml \
#     -c $prefix/configs/m_mvdet.yml

python $prefix/world_track.py fit \
    -c $prefix/configs/t_fit.yml \
    -c $prefix/configs/d_wildtrack.yml \
    -c $prefix/configs/m_bevformer.yml