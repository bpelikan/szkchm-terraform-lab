defaultlocation = "westeurope"
hub-env-sub = "616bb79e-73be-40ca-bea5-219c413d4771"
dev-env-sub = "748173f1-20c4-4e68-ac58-641f67a83501"
envprefix = "bp"

# HUB
resource_group_object_rg_hub = {
        name                = "rg-hub-bp"
        location            = "westeurope"
        lock_level          = "CanNotDelete"
}

resource_group_tags_rg_hub = {
        app                 = "app01"
        businessowner       = "bpelikan"
        env                 = "prd"
        description         = "RG for HUB"
}

# DEV
resource_group_object_rg_dev = {
        name                = "rg-dev-bp"
        location            = "westeurope"
        lock_level          = "CanNotDelete"
}

resource_group_tags_rg_dev = {
        app                 = "app01"
        businessowner       = "bpelikan"
        env                 = "dev"
        description         = "RG for APP01"
}

# DEV
resource_group_object_rg_mon = {
        name                = "rg-mon-bp"
        location            = "westeurope"
        lock_level          = "CanNotDelete"
}

resource_group_tags_rg_mon = {
        app                 = "app01"
        businessowner       = "bpelikan"
        env                 = "mon"
        description         = "RG for APP01"
}


