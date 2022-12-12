python run_glue.py \
  --model_name_or_path ./saved_models/training-out/pretraining_experiment-/latest_checkpoint \
  --task_name MNLI \
  --max_seq_length 128 \
  --output_dir ./finetuning \
  --overwrite_output_dir \
  --do_train --do_eval \
  --evaluation_strategy steps \
  --per_device_train_batch_size 32 --gradient_accumulation_steps 1 \
  --per_device_eval_batch_size 32 \
  --learning_rate 5e-5 \
  --weight_decay 0.01 \
  --eval_steps 50 --evaluation_strategy steps \
  --max_grad_norm 1.0 \
  --num_train_epochs 5 \
  --lr_scheduler_type polynomial \
  --warmup_steps 50