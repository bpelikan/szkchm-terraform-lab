resource "azurerm_policy_assignment" "polasg-chm-allowedlocations" {
    name                 = "polasg-chm-allowedlocations"
    #TODO
    scope                = "/subscriptions/${var.sub-id}/resourceGroups/rg_test_01/"
    policy_definition_id = azurerm_policy_definition.chm-allowedlocations .id
    description          = "Przypisanie polityki chm-allowedlocations do rg_test_01"
    display_name         = "polasg-chm-allowedlocations"
    enforcement_mode     = "true"

    metadata = <<METADATA
        {
            "version":  "1.0.0",
            "category": "General"
        }
    METADATA
    
    parameters = <<PARAMETERS
        {
            "listOfAllowedLocations": {
                "value": [ 
                    "westeurope",
                    "northeurope"
                ]
            }
        }
    PARAMETERS
}
