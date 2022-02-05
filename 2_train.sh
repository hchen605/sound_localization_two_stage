#!/bin/bash
# Data directory
DATASET_DIR='/home/hchen605/dcase2019/dataset/'
# Feature directory
FEATURE_DIR='/home/hchen605/dcase2019/dataset/feature/'
# Workspace
WORKSPACE='/home/hchen605/dcase2019/Two-Stage-Polyphonic-Sound-Event-Detection-and-Localization-master/'
FEATURE_TYPE='logmelgcc'
AUDIO_TYPE='mic'
SEED=10

# GPU number
GPU_ID=0

# Train SED
# TASK_TYPE: 'sed_only' | 'doa_only' | 'two_staged_eval' | 'seld'
TASK_TYPE='sed_only'
#TASK_TYPE='two_staged_eval'
for FOLD in {1..4}
    do
    echo $'\nFold: '$FOLD
    CUDA_VISIBLE_DEVICES=$GPU_ID python ${WORKSPACE}main.py train --workspace=$WORKSPACE --feature_dir=$FEATURE_DIR --feature_type=$FEATURE_TYPE --audio_type=$AUDIO_TYPE --task_type=$TASK_TYPE --fold=$FOLD --seed=$SEED
done

# Train DOA
# TASK_TYPE: 'sed_only' | 'doa_only' | 'two_staged_eval' | 'seld'
TASK_TYPE='doa_only'
#TASK_TYPE='two_staged_eval'
for FOLD in {1..4}
    do
    echo $'\nFold: '$FOLD
    CUDA_VISIBLE_DEVICES=$GPU_ID python ${WORKSPACE}main.py train --workspace=$WORKSPACE --feature_dir=$FEATURE_DIR --feature_type=$FEATURE_TYPE --audio_type=$AUDIO_TYPE --task_type=$TASK_TYPE --fold=$FOLD --seed=$SEED
done





