.PHONY   : svc-build svc-deploy svc-delete infra-init infra-deploy infra-delete
.ONESHELL: $(.PHONY)
.SILENT  : $(.PHONY)

svc-build:
	cd docker/my-nginx/ && ./build.sh
	cd ../tomcat-sample/ && ./build.sh

svc-deploy:
	cd k8s/ && ./deploy.sh

svc-delete:
	cd k8s/ && ./delete.sh

infra-init:
	cd tf/ && terraform init

infra-deploy:
	cd tf/ && terraform apply

infra-delete:
	cd tf/ && terraform destroy
