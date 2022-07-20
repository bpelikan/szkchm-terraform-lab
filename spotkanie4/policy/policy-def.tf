resource "azurerm_policy_definition" "chm-allowedlocations" {
  name = "chm-allowedlocations"
  display_name = "chm-allowedlocations"
  policy_type = "Custom"
  mode = "Indexed"
  description = "Polityka wymuszająca tworzenie zasobów w określonym regionie."

  # management_group_name = data.azurerm_subscriptions.SUB-GLOBAL.subscriptions[0].tenant_id
  
  
  metadata = <<METADATA
  {
    "version":  "1.0.0",
    "category": "General"
  }
  METADATA


  policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [
            {
                "field": "location",
                "notIn": "[parameters('listOfAllowedLocations')]"
            },
            {
                "field": "location",
                "notEquals": "global"
            },
            {
                "field": "type",
                "notEquals": "Microsoft.AzureActiveDirectory/b2cDirectories"
            }
            ]
        },
        "then": {
            "effect": "deny"
        }
    }
POLICY_RULE


  parameters = <<PARAMETERS
    {
        "listOfAllowedLocations": {
            "type": "Array",
            "metadata": {
                "description": "The list of locations that can be specified when deploying resources.",
                "strongType": "location",
                "displayName": "Allowed locations"
            }
        }
    }
PARAMETERS

}

