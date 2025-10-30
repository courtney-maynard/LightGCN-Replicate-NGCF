#!/bin/bash
source ~/.bashrc
conda activate ngcf_replicate

DATASET="gowalla"
mkdir -p logs

echo "=== Starting NGCF ablation on $DATASET with 2 GPUs ==="

# Run 2 jobs at once — one per GPU
# GPU 0
CUDA_VISIBLE_DEVICES=0 python NGCF.py --dataset $DATASET > logs/ngcf_full.log 2>&1 &
CUDA_VISIBLE_DEVICES=0 python NGCF.py --dataset $DATASET --no_nonlinearity > logs/ngcf_no_nonlinearity.log 2>&1 &

# GPU 1
CUDA_VISIBLE_DEVICES=1 python NGCF.py --dataset $DATASET --no_features > logs/ngcf_no_features.log 2>&1 &
CUDA_VISIBLE_DEVICES=1 python NGCF.py --dataset $DATASET --no_features --no_nonlinearity > logs/ngcf_no_feat_no_nonlin.log 2>&1 &

# Wait for all to finish
wait

echo "✅ All NGCF ablation runs completed!"
