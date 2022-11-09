VM_IMAGE=scl3/devops


build:
	docker build -t $(VM_IMAGE) .


### SCL3 ###

shell_scl3:
	docker run -w /app --env-file=.env_scl3 -v `pwd`:/app --rm -it --entrypoint bash $(VM_IMAGE)

scl3_deploy_pubsub_function:
	@docker run -w /app -v `pwd`:/app --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/deploy_function.sh $(VM_IMAGE)

scl3_deploy_pubsub:
	@docker run -w /app -v `pwd`:/app --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/deploy_pubsub.sh $(VM_IMAGE)

scl3_delete_pubsub:
	@docker run -w /app -v `pwd`:/app  --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/delete_pubsub.sh $(VM_IMAGE)

scl3_delete_pubsub_function:
	@docker run -w /app -v `pwd`:/app  --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/delete_function.sh $(VM_IMAGE)

scl3_deploy:
	@make scl3_deploy_pubsub
	@make scl3_deploy_pubsub_function

scl3_delete:
	@make scl3_delete_pubsub
	@make scl3_delete_pubsub_function

scl3_publish_sample:
	@docker run -w /app -v `pwd`:/app  --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/publish_sample_msg.sh $(VM_IMAGE)

scl3_publish_fullyear:
	@docker run -w /app -v `pwd`:/app  --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/publish_scl3_fulldate.sh $(VM_IMAGE)


tcl_report_data:
	@docker run -w /app -v `pwd`:/app  --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/publish_tcl_report_data.sh $(VM_IMAGE)

### HII ###

shell_hii:
	docker run -w /app --env-file=.env_hii -v `pwd`:/app --rm -it --entrypoint bash $(VM_IMAGE)

hii_deploy_pubsub_function:
	@docker run -w /app -v `pwd`:/app --env-file=.env_hii --rm -it --entrypoint /app/scripts/deploy_function.sh $(VM_IMAGE)

hii_deploy_pubsub:
	@docker run -w /app -v `pwd`:/app --env-file=.env_hii --rm -it --entrypoint /app/scripts/deploy_pubsub.sh $(VM_IMAGE)

hii_delete_pubsub:
	@docker run -w /app -v `pwd`:/app  --env-file=.env_hii --rm -it --entrypoint /app/scripts/delete_pubsub.sh $(VM_IMAGE)

hii_delete_pubsub_function:
	@docker run -w /app -v `pwd`:/app  --env-file=.env_hii --rm -it --entrypoint /app/scripts/delete_function.sh $(VM_IMAGE)

hii_deploy:
	@make hii_deploy_pubsub
	@make hii_deploy_pubsub_function

hii_delete:
	@make hii_delete_pubsub
	@make hii_delete_pubsub_function

hii_publish_sample:
	@docker run -w /app -v `pwd`:/app  --env-file=.env_hii --rm -it --entrypoint /app/scripts/publish_sample_msg.sh $(VM_IMAGE)

cleanup:
	isort `pwd`/src/*.py
	black `pwd`/src/*.py
	flake8 `pwd`/src/*.py
	mypy `pwd`/src/*.py