#!/bin/bash
#SBATCH -o TorchJob.o%j
#SBATCH --time=1:00:00
#SBATCH -N 1 -n 1

cp rand.lua $PFSDIR

# cd to temporary direcotry
cd $PFSDIR

# Load the Torch7 module
module load torch

# Run torch
th  rand.lua

# Copy everything back to the working directory
cp -r * $SLURM_SUBMIT_DIR 

