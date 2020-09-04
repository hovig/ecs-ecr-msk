deploy_project: deploy_vpc deploy_msk deploy_ecs
destroy_project: destroy_ecs destroy_msk destroy_vpc

deploy_vpc:
	@echo Initializing VPC
	rm -rf deployment/eem-vpc/.terraform
	(cd deployment/eem-vpc; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd deployment/eem-vpc; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars")
	rm -rf deployment/eem-vpc/.terraform

deploy_msk:
	@echo Initializing MSK
	rm -rf deployment/eem-msk/.terraform
	(cd deployment/eem-msk; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd deployment/eem-msk; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/msk-config.tfvars")
	rm -rf deployment/eem-msk/.terraform

deploy_ecs:
	@echo Initializing ECS
	rm -rf deployment/eem-ecs/.terraform
	(cd deployment/eem-ecs; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd deployment/eem-ecs; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/ecs-config.tfvars")
	rm -rf deployment/eem-ecs/.terraform

destroy_vpc:
	@echo Destroying VPC
	(cd deployment/eem-vpc; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd deployment/eem-vpc; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars")
	rm -rf deployment/eem-vpc/.terraform

destroy_msk:
	@echo Destroying MSK
	(cd deployment/eem-msk; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd deployment/eem-msk; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/msk-config.tfvars")
	rm -rf deployment/eem-msk/.terraform

destroy_ecs:
	@echo Destroying ECS
	(cd deployment/eem-ecs; terraform init -backend-config="../../configuration/terraform-backend.tfvars")
	(cd deployment/eem-ecs; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/ecs-config.tfvars")
	rm -rf deployment/eem-ecs/.terraform

