#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH -p gpuk40 --gres=gpu:2


cp -r log-device-placement-multiple-gpu.py  helloTensor.py $TMPDIR
cd $TMPDIR

module load tensorflow

echo "You are:"
singularity exec $TENSORFLOW whoami
echo "get the sum from python script using tensor module"  
singularity exec $TENSORFLOW python helloTensor.py

echo "Run Tensorflow Job:"
singularity exec $TENSORFLOW python log-device-placement-multiple-gpu.py

cp -ru * $SLURM_SUBMIT_DIR
