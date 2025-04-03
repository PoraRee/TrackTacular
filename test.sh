# conda activate tracktacular_rep

prefix=WorldTrack

python $prefix/world_track.py test \
    -c $prefix/model_weights/config.yaml \
    --ckpt $prefix/model_weights/model-epoch=35-val_loss=6.50.ckpt
