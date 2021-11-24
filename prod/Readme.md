commands
    
    cd prod
    terraform --version
    terraform init
    terraform plan -var-file=prod-config.tfvars
    terraform apply -var-file=prod-config.tfvars