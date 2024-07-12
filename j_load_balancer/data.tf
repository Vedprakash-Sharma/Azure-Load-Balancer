# data "azurerm_virtual_network" "lbvnet" {
#   for_each = var.load_balancer
#   name                = "tcs_network"
#   resource_group_name = "Home_office"
# }