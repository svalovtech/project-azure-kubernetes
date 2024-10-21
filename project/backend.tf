  terraform { 
    backend "azurerm" {
    resource_group_name = "tfstate"
    storage_account_name = "tfstate103023"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
} 

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = var.location
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate103023"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier            = "Standard"
  account_replication_type = "LRS"
}
