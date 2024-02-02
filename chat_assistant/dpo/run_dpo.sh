CUDA_VISIBLE_DEVICES=0 WANDB_PROJECT=rlhf python train.py \
--seed 100 \
--model_name_or_path "smangrul/mistral-sft" \
--dataset_name "smangrul/ultrachat-feedback-10k-chatml" \
--chat_template_format "chatml" \
--beta 0.1 \
--loss_type "sigmoid" \
--add_special_tokens False \
--append_concat_token False \
--splits "train,test" \
--max_seq_len 1024 \
--max_prompt_length 512 \
--num_train_epochs 1 \
--logging_steps 5 \
--log_level "info" \
--logging_strategy "steps" \
--evaluation_strategy "epoch" \
--save_strategy "epoch" \
--push_to_hub \
--hub_private_repo True \
--hub_strategy "every_save" \
--bf16 True \
--packing True \
--learning_rate 5e-6 \
--lr_scheduler_type "cosine" \
--optim "paged_adamw_32bit" \
--weight_decay 1e-4 \
--warmup_ratio 0.0 \
--max_grad_norm 1.0 \
--output_dir "mistral-dpo" \
--per_device_train_batch_size 2 \
--per_device_eval_batch_size 4 \
--gradient_accumulation_steps 8 \
--gradient_checkpointing True \
--use_reentrant True \
--dataset_text_field "content" \
--use_peft_lora True \
--lora_r 8 \
--lora_alpha 16 \
--lora_dropout 0.1 \
--lora_target_modules "all-linear" \
--use_4bit_quantization True \
--use_nested_quant True \
--bnb_4bit_compute_dtype "bfloat16" \
--use_flash_attn True
