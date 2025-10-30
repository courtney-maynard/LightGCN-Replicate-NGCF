#!/bin/bash
source ~/.bashrc
conda activate ngcf_replicate

DATASET="gowalla"

mkdir -p logs

echo "=== Full NGCF ==="
python NGCF.py --dataset $DATASET > logs/ngcf_full.log 2>&1

echo "=== NGCF - no features ==="
python NGCF.py --dataset $DATASET --no_features > logs/ngcf_no_features.log 2>&1

echo "=== NGCF - no nonlinearity ==="
python NGCF.py --dataset $DATASET --no_nonlinearity > logs/ngcf_no_nonlinearity.log 2>&1

echo "=== NGCF - no features + no nonlinearity ==="
python NGCF.py --dataset $DATASET --no_features --no_nonlinearity > logs/ngcf_no_feat_no_nonlin.log 2>&1
