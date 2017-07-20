#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH -p gpuk40 --gres=gpu:1


cp -r mnist_softmax.py $TMPDIR
cd $TMPDIR

module load tensorflow

echo "Run Tensorflow Convolutional Neural Network (CNN) Job:"
singularity exec $TENSORFLOW python mnist_softmax.py

cp -ru * $SLURM_SUBMIT_DIR
