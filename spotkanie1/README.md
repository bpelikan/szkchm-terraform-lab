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
2. Utworzenie pliku ze zmiennymi `variables.tf`