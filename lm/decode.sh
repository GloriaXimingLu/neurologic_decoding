#!/usr/bin/env bash

DATA_DIR='../dataset'
SPLIT=$1
MODEL_RECOVER_PATH=$2
OUTPUT_FILE=$3

# run decoding
CUDA_VISIBLE_DEVICES=5 python decode.py --model_name ${MODEL_RECOVER_PATH} \
  --input_path ${DATA_DIR}/lm/${SPLIT}.txt --output_file ${OUTPUT_FILE} \
  --constraint_file ${DATA_DIR}/clean/constraint/${SPLIT}.constraint.json \
  --batch_size 32 --beam_size 20 --max_tgt_length 64 --min_tgt_length 5 \
  --ngram_size 3 --length_penalty 0.2 \
  --prune_factor 50 --sat_tolerance 2

