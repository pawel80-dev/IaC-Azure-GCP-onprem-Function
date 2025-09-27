resource "azurerm_resource_group" "rg_func_v2" {
    name = var.azure_rg_name
    location = var.azure_region
}
