export WANDB_MODE=online
# deepspeed --num_gpus 4 run_pretraining.py \
deepspeed --num_gpus 4 run_pretraining.py \
  --model_type bert-mlm --tokenizer_name google/bert_uncased_L-4_H-256_A-4 \
  --hidden_act gelu \
  --hidden_size 256 \
  --num_hidden_layers 4 \
  --num_attention_heads 4 \
  --intermediate_size 1024 \
  --hidden_dropout_prob 0.1 \
  --attention_probs_dropout_prob 0.1 \
  --encoder_ln_mode pre-ln \
  --lr 1e-4 \
  --train_batch_size 4096 \
  --train_micro_batch_size_per_gpu 32 \
  --lr_schedule time \
  --curve linear \
  --warmup_proportion 0.06 \
  --gradient_clipping 0.0 \
  --optimizer_type adamw \
  --weight_decay 0.01 \
  --adam_beta1 0.9 \
  --adam_beta2 0.98 \
  --adam_eps 1e-6 \
  --total_training_time 6.0 \
  --early_exit_time_marker 6.0 \
  --dataset_path /n/tata_ddos_ceph/woojeong/data/enwiki_books_128_20/ \
  --output_dir ./saved_models/training-out \
  --print_steps 100 \
  --num_epochs_between_checkpoints 10000 \
  --job_name pretraining_experiment \
  --project_name budget-bert-pretraining-mini \
  --current_run_id 1 \
  --validation_epochs 3 \
  --validation_epochs_begin 1 \
  --validation_epochs_end 1 \
  --validation_begin_proportion 0.05 \
  --validation_end_proportion 0.01 \
  --validation_micro_batch 16 \
  --deepspeed \
  --data_loader_type dist \
  --do_validation \
  --use_early_stopping \
  --early_stop_time 180 \
  --early_stop_eval_loss 6 \
  --seed 42 \
  --fp16 \
  --max_steps_per_epoch 1100