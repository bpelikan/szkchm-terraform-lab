# Spotkanie 1


# [Zadanie 1.1](./zadanie1)

1. Rejestracja providerów `Azure` oraz `Azure Active Directory`
    * https://registry.terraform.io/browse/providers
2. Utworzenie `Storage Account` oraz wyświetlnie informacji o użytkowniku
    * https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
    * https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user


# [Zadanie 1.2](./zadanie1)
1. Przegląd stanu `terraform.tfstate`
2. Porównanie skutków ręcznych zmian w pliku stanu `terraform.tfstate`


# [Zadanie 1.3](./zadanie3)
1. Utworzenie `Storage Account` w Azure oraz utworzenie jego reprezentacji w Terraform
2. Import istniejącego `Storage Account` do pliku stanu za pomocą polecania:

    ```
    terraform import azurerm_storage_account.st44sademoimport /subscriptions/24eafb4c-3855-419f-adbb-cc08869b1754/resourceGroups/tf-rg/providers/Microsoft.Storage/storageAccounts/st44sademoimport
    ```
3. Weryfikacja poprawnego zaimportowania zasobu do stanu - `terraform plan`


# [Zadanie 1.4](./zadanie4)
1. Utworzenie zasobu VM
    * https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
2. Utworzenie pliku z definicjami zmiennych `variables.tf`
3. Utworzenie pliku z wartościami zmiennych `terraform.tfvars`
3. Ustawienie zmiennych środowiskowych `TF_VAR_username`/`TF_VAR_password` w celu pobrania ich wartości do zmiennych `username`/`password`:
    * [Difference between SET and SETX in PowerShell](https://coderjony.com/blogs/difference-between-set-and-setx-in-powershell/)
    * [What is the difference between SETX and SET in environment variables in Windows](https://superuser.com/questions/916649/what-is-the-difference-between-setx-and-set-in-environment-variables-in-windows)
    
    ```bash
    export TF_VAR_username='admuserenv'
    export TF_VAR_password='envsecurepass!123'
    echo $TF_VAR_username
    echo $TF_VAR_password

    # wszystkie zmienne
    # env
    # export -p

    # usunięcie zmiennej
    # unset TF_VAR_username
    ```


# [Zadanie 1.5](./zadanie5)
1. Utworzenie App Service Plan
2. Utworzenie 3 aplikacji, których nazwy pobierane będą ze zmiennej - wykorzystanie instrukcji `for_each`.


# [Zadanie 1.6](./zadanie6)
1. Utworzenie providera z backendem do Storage Account
2. Wykorzystanie zmiennej środowiskowej `ARM_ACCESS_KEY` do przechowania klucza do Storage Account

    ```bash
    RESOURCE_GROUP_NAME='szkchm-tf-state'
    STORAGE_ACCOUNT_NAME='szkchmtfstatebp'
    ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
    export ARM_ACCESS_KEY=$ACCOUNT_KEY
    ```
