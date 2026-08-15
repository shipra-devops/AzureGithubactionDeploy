variable "project_name" {
  type        = string
  description = "Project name identifier used in resource naming."
  default     = "demo"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., dev, test, prod)."
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed."
  default     = "East US"
}

variable "location_short" {
  type        = string
  description = "Short code for Azure region used in resource names."
  default     = "eastus"
}

variable "vm_count" {
  type        = number
  description = "Number of Virtual Machines to deploy."
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "Size of the Azure Virtual Machine."
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Administrator username for the Linux VMs."
  default     = "azureuser"
}

variable "extra_tags" {
  type        = map(string)
  description = "Additional tags to apply to resources."
  default     = {}
}
