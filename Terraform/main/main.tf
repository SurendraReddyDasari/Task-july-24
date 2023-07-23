data "azurerm_client_config" "current" {}

module "resource_group" {    
  source    = "../modules/resource_group"
  rg_name   = var.rg_name
  location  = var.location  
  tags      = var.tags
}
module "kubernetes_cluster" {    
  source    = "../modules/kubernetes_cluster"
  depends_on = [ module.resource_group ]
  rg_name   = var.rg_name
  location  = var.location  
}