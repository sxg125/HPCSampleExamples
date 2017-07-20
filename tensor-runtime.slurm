#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH -p gpuk40 --gres=gpu:1 --mem=4gb


module load singularity/2.3.1
module load cuda/8.0

echo "Run Tensorflow Job at run time:"
singularity exec --nv docker://tensorflow/tensorflow:latest-gpu python ./models/tutorials/image/mnist/convolutional.py

