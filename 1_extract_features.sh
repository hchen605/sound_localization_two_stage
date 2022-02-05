#!/bin/bash
# Data directory
DATASET_DIR='/home/hchen605/dcase2019/dataset/'
# Feature directory
FEATURE_DIR='/home/hchen605/dcase2019/dataset/feature/'
# feature types: 'logmelgcc' | 'logmel'
FEATURE_TYPE='logmel'

# audio types: 'mic' | 'foa'
AUDIO_TYPE='foa'

# Extract Features
python utils/feature_extractor.py --dataset_dir=$DATASET_DIR --feature_dir=$FEATURE_DIR --feature_type=$FEATURE_TYPE --data_type='dev' --audio_type=$AUDIO_TYPE
