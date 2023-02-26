# Spotkanie 6

### [4. UsingModules](./4.UsingModules)
```bash
SUB_ID="748173f1-20c4-4e68-ac58-641f67a83501"
az ad sp create-for-rbac -n "tf-labs-spn-01" --role Contributor --scopes /subscriptions/$SUB_ID
az role assignment list --assignee $APP_ID --all

az ad app list -o table
az ad sp list --all -o table

export TF_VAR_client_secret="000000000000000000000000000000"
# unset TF_VAR_client_secret
```