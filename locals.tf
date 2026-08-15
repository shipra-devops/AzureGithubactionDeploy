locals {
  # Standardized Cloud Adoption Framework (CAF) Resource Prefix
  # Pattern: <project_name>-<environment>-<location_short>
  name_prefix = "${var.project_name}-${var.environment}-${var.location_short}"

  # Core infrastructure naming conventions
  resource_group_name = "rg-${local.name_prefix}-001"
  vnet_name           = "vnet-${local.name_prefix}-001"
  subnet_name         = "snet-${local.name_prefix}-001"
  nsg_name            = "nsg-${local.name_prefix}-001"

  tags = merge(
    {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "Terraform"
    },
    var.extra_tags
  )
}
