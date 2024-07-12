# resource "azurerm_public_ip" "tcsLB" {
#   for_each = var.load_balancer
#   name                = "tcs_pip"
#   location            = "westus"
#   resource_group_name = "Home_office"
#   allocation_method   = "Static"
#   sku = "Standard"
# }

# resource "azurerm_lb" "tcsloadbalancer" {
#   for_each = var.load_balancer
#   name                = "hclLoadBalancer"
#   location            = "westus"
#   resource_group_name = "Home_office"
#   sku = "Standard"

#   frontend_ip_configuration {
#     name                 = "lbipcon"
#     public_ip_address_id = azurerm_public_ip.tcsLB[each.key].id
    
#   }
# }

# resource "azurerm_lb_backend_address_pool" "lbbackend" {
#   for_each = var.load_balancer
#   loadbalancer_id = azurerm_lb.tcsloadbalancer[each.key].id
#   name            = "Backpool66"
#   virtual_network_id = data.azurerm_virtual_network.lbvnet[each.key].id
  
# }

# resource "azurerm_lb_backend_address_pool_address" "pool01" {
#   for_each = var.load_balancer
#   name                    = "vnet_pool_06"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.lbbackend[each.key].id
#   virtual_network_id      = data.azurerm_virtual_network.lbvnet[each.key].id
#   ip_address              = "10.0.1.5"

# }
# resource "azurerm_lb_backend_address_pool_address" "pool02" {
#   for_each = var.load_balancer
#   name                    = "vnet_pool_04"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.lbbackend[each.key].id
#   virtual_network_id      = data.azurerm_virtual_network.lbvnet[each.key].id
#   ip_address              = "10.0.1.4"
# }



# # resource "azurerm_network_interface_backend_address_pool_association" "pool01" {
# #   network_interface_id    = data.azurerm_network_interface.lbnic.id
# #   ip_configuration_name   = "ip_con_internal"
# #   backend_address_pool_id = azurerm_lb_backend_address_pool.lbbackend.id
# # }

# # resource "azurerm_network_interface_backend_address_pool_association" "pool02" {
# #   network_interface_id    = data.azurerm_network_interface.lbnic01.id
# #   ip_configuration_name   = "ip_con"
# #   backend_address_pool_id = azurerm_lb_backend_address_pool.lbbackend.id
# # }

# resource "azurerm_lb_rule" "load_balancer_rule_22" {
#   for_each = var.load_balancer
#   loadbalancer_id                = azurerm_lb.tcsloadbalancer[each.key].id
#   name                           = "lbruletcsoffice"
#   protocol                       = "Tcp"
#   frontend_port                  = 80
#   backend_port                   = 80
#   frontend_ip_configuration_name = "lbipcon"
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lbbackend[each.key].id]
#   probe_id                       = azurerm_lb_probe.lbprobe[each.key].id
# }

# resource "azurerm_lb_probe" "lbprobe" {
#   for_each = var.load_balancer
#   loadbalancer_id = azurerm_lb.tcsloadbalancer[each.key].id
#   name            = "ssh-running-probe"
#   port            = 22

# }