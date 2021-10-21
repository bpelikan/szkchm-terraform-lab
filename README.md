# szkchm-terraform-lab


```bash
terraform init
terraform plan
terraform apply
terraform apply -auto-approve

# formatowanie
terraform fmt

# state
terraform state show
terraform state list
terraform rm
terraform state import
```


```
az upgrade

az login

az account list --output table
az account set --subscription "SUB_ID"

az account list \
   --refresh \
   --query "[?contains(name, 'SUB_NAME')].id" \
   --output table

az configure --defaults group=RG_NAME
```