
commands

        cd non-prod
        terraform --version
        terraform init
        terraform plan -var-file=non-prod-config.tfvars
        terraform apply -var-file=non-prod-config.tfvars