#!/bin/bash
# sh scripts/c_ood/8_cifar_train_sem.sh

GPU=1
CPU=1
node=73
jobname=openood

PYTHONPATH='.':$PYTHONPATH \
srun -p dsta --mpi=pmi2 --gres=gpu:${GPU} -n1 \
--cpus-per-task=${CPU} --ntasks-per-node=${GPU} \
--kill-on-bad-exit=1 --job-name=${jobname} -w SG-IDC1-10-51-2-${node} \
python main.py \
--config configs/datasets/objects/cifar10.yml \
configs/networks/resnet18_32x32.yml \
configs/pipelines/train/train_sem.yml \
--network.checkpoint ./results/cifar10_resnet18_32x32_base_e100_lr0.1/best_epoch97_acc0.946.ckpt \
--num_workers 8