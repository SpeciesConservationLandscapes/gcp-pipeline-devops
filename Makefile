VM_IMAGE=scl3/devops


build:
	docker build -t $(VM_IMAGE) .

shell:
	docker run -w /app --env-file=.env -v `pwd`:/app --rm -it --entrypoint bash $(VM_IMAGE)

deploy_pubsub_function:
	docker run -w /app -v `pwd`:/app --env-file=.env --rm -it --entrypoint /app/scripts/deploy_function.sh $(VM_IMAGE)

deploy_pubsub:
	docker run -w /app -v `pwd`/templates:/app/templates -v `pwd`/scripts:/app/scripts --env-file=.env --rm -it --entrypoint /app/scripts/deploy_pubsub.sh $(VM_IMAGE)

delete_pubsub:
	docker run -w /app -v `pwd`/templates:/app/templates -v `pwd`/scripts:/app/scripts  --env-file=.env --rm -it --entrypoint /scripts/delete_pubsub.sh $(VM_IMAGE)

delete_pubsub_function:
	docker run -w /app -v `pwd`/templates:/app/templates -v `pwd`/scripts:/app/scripts  --env-file=.env --rm -it --entrypoint /scripts/delete_function.sh $(VM_IMAGE)

cleanup:
	isort `pwd`/src/*.py
	black `pwd`/src/*.py
	flake8 `pwd`/src/*.py
	mypy `pwd`/src/*.py