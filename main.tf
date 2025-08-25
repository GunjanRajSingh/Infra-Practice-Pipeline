resource "azurerm_resource_group" "rgblock" {
    name     = "example-resources-block"
    location = "West Europe"
}

resource "azurerm_storage_account" "stg" {
  name                     = "merabagbond007"
  resource_group_name      = azurerm_resource_group.rgblock.name
  location                 = azurerm_resource_group.rgblock.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "practice-Virtual-Network"
  location            = azurerm_resource_group.rgblock.location
  resource_group_name = azurerm_resource_group.rgblock.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "practice-subnet"
  resource_group_name  = azurerm_resource_group.rgblock.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
 }