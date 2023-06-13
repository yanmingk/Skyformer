#!/bin/bash

#SBATCH --mail-user=y53kang@uwaterloo.ca
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name="skyformer"
#SBATCH --partition=gpu_p100
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=20:00:00
#SBATCH --mem-per-cpu=20G
#SBATCH --gres=gpu:p100:1
#SBATCH --output=%x_%j.out

echo lra-listops
echo linformer
nvidia-smi
module load anaconda3
conda activate skyformer
# pip install torch==1.8.0

python main.py --mode train --attn linformer --task lra-listops
