VM_IMAGE=scl3/devops


build:
	docker build -t $(VM_IMAGE) .

shell:
	docker run -w /app --env-file=.env_scl3 -v `pwd`:/app --rm -it --entrypoint bash $(VM_IMAGE)


### SCL3 ###

scl3_deploy_pubsub_function:
	docker run -w /app -v `pwd`:/app --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/deploy_function.sh $(VM_IMAGE)

scl3_deploy_pubsub:
	docker run -w /app -v `pwd`:/app --env-file=.env_scl3 --rm -it --entrypoint /app/scripts/deploy_pubsub.sh $(VM_IMAGE)

scl3_delete_pubsub:
	docker run -w /app -v `pwd`:/app  --env-file=.env_scl3 --rm -it --entrypoint /scripts/delete_pubsub.sh $(VM_IMAGE)

scl3_delete_pubsub_function:
	docker run -w /app -v `pwd`:/app  --env-file=.env_scl3 --rm -it --entrypoint /scripts/delete_function.sh $(VM_IMAGE)

scl3_deploy:
	make scl3_deploy_pubsub
	make scl3_deploy_pubsub_function


### HII ###

hii_deploy_pubsub_function:
	docker run -w /app -v `pwd`:/app --env-file=.env_hii --rm -it --entrypoint /app/scripts/deploy_function.sh $(VM_IMAGE)

hii_deploy_pubsub:
	docker run -w /app -v `pwd`:/app --env-file=.env_hii --rm -it --entrypoint /app/scripts/deploy_pubsub.sh $(VM_IMAGE)

hii_delete_pubsub:
	docker run -w /app -v `pwd`:/app  --env-file=.env_hii --rm -it --entrypoint /scripts/delete_pubsub.sh $(VM_IMAGE)

hii_delete_pubsub_function:
	docker run -w /app -v `pwd`:/app  --env-file=.env_hii --rm -it --entrypoint /scripts/delete_function.sh $(VM_IMAGE)

hii_deploy:
	make hii_deploy_pubsub
	make hii_deploy_pubsub_function

cleanup:
	isort `pwd`/src/*.py
	black `pwd`/src/*.py
	flake8 `pwd`/src/*.py
	mypy `pwd`/src/*.py