#!/bin/bash
#SBATCH --job-name=multihead
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --partition=gpu_shared
#SBATCH --gres=gpu:1

module load cuDNN/7.0.5-CUDA-9.0.176
module purge
module load NCCL/2.0.5-CUDA-9.0.176
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:/hpc/eb/Debian9/cuDNN/7.1-CUDA-8.0.44-GCCcore-5.4.0/lib64:$LD_LIBRARY_PATH


BASE=~/IR2/results/exp_mh
mkdir -p $BASE
python2 ~/IR2/main.py --batch_size 16 --n_heads 4 --result_path $BASE