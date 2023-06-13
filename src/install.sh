#!/bin/bash

#SBATCH --mail-user=y53kang@uwaterloo.ca
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name="skyformer"
#SBATCH --partition=gpu_a100
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=32G
#SBATCH --gres=gpu:a100_80G:1
#SBATCH --output=%x_%j.out


nvidia-smi
module load anaconda3
module load cuda

conda create -n skyformer python=3.6
conda activate skyformer
pip install -r requirements.txt
pip install torch==1.7.1