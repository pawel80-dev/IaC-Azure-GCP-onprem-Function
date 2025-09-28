resource "azurerm_resource_group" "rg_func_v2" {
    name        = var.azure_rg_name
    location    = var.azure_region
    lifecycle {
        ignore_changes = [ tags ]
    }
}

resource "azurerm_service_plan" "sp_func_v2" {
    name                = var.azure_service_plan
    resource_group_name = azurerm_resource_group.rg_func_v2.name
    location            = azurerm_resource_group.rg_func_v2.location
    os_type             = "Linux"
    sku_name            = "FC1"

    lifecycle {
        ignore_changes = [ tags ]
    }
}

resource "azurerm_storage_account" "storage_func_v2" {
    name                     = var.azure_storage_account
    resource_group_name      = azurerm_resource_group.rg_func_v2.name
    location                 = azurerm_resource_group.rg_func_v2.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    min_tls_version          = "TLS1_2"

    lifecycle {
        ignore_changes = [ tags ]
    }
}

resource "azurerm_user_assigned_identity" "my_func_v2" {
    name                = var.azure_mi
    resource_group_name = azurerm_resource_group.rg_func_v2.name
    location            = azurerm_resource_group.rg_func_v2.location
}