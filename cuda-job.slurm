#!/bin/bash
#SBATCH -o GPUTorchJob.o%j
#SBATCH --time=1:00:00
#SBATCH -N 1 -n 1 
#SBATCH -p gpufermi --gres=gpu:1
 

cp simple.lua $PFSDIR

# cd to temporary direcotry
cd $PFSDIR

# Load the Torch7 module
module load torch

# Run torch
th simple.lua

# Copy everything back to the working directory
cp -r * $SLURM_SUBMIT_DIR

