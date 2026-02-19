resource "azurerm_kubernetes_cluster_extension" "this" {
  cluster_id                       = var.cluster_id
  extension_type                   = var.extension_type
  name                             = var.name
  configuration_protected_settings = var.configuration_protected_settings
  configuration_settings           = var.configuration_settings
  release_namespace                = var.release_namespace
  release_train                    = var.release_train
  target_namespace                 = var.target_namespace
  version                          = var.extension_version

  dynamic "plan" {
    for_each = var.plan == null ? [] : [var.plan]

    content {
      name           = plan.value.name
      product        = plan.value.product
      publisher      = plan.value.publisher
      promotion_code = plan.value.promotion_code
      version        = plan.value.version
    }
  }
  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]

    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}
