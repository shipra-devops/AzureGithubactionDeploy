# Azure 2-VM Terraform Deployment with Proper Naming Conventions & Backend State

This project deploys **2 Linux Virtual Machines** in Azure using **Microsoft Cloud Adoption Framework (CAF) naming conventions** and an **Azure Storage Account remote state backend**.

## Naming Conventions Summary

| Resource | Pattern | Example Name |
| :--- | :--- | :--- |
| **Resource Group** | `rg-<project>-<env>-<location>-<instance>` | `rg-demo-dev-eastus-001` |
| **Virtual Network** | `vnet-<project>-<env>-<location>-<instance>` | `vnet-demo-dev-eastus-001` |
| **Subnet** | `snet-<project>-<env>-<location>-<instance>` | `snet-demo-dev-eastus-001` |
| **Network Security Group** | `nsg-<project>-<env>-<location>-<instance>` | `nsg-demo-dev-eastus-001` |
| **Public IPs** | `pip-<project>-<env>-<location>-<index>` | `pip-demo-dev-eastus-01`, `pip-demo-dev-eastus-02` |
| **Network Interfaces** | `nic-<project>-<env>-<location>-<index>` | `nic-demo-dev-eastus-01`, `nic-demo-dev-eastus-02` |
| **Virtual Machines** | `vm-<project>-<env>-<location>-<index>` | `vm-demo-dev-eastus-01`, `vm-demo-dev-eastus-02` |
| **OS Disks** | `osdisk-vm-<project>-<env>-<location>-<index>` | `osdisk-vm-demo-dev-eastus-01`, `osdisk-vm-demo-dev-eastus-02` |

## Directory Structure

```text
├── backend.tf         # Remote Azure Storage Account backend state configuration
├── locals.tf          # Local variables for CAF naming & tag assembly
├── main.tf            # Azure Infrastructure resources (RG, VNet, Subnet, NSG, NICs, Public IPs, Linux VMs)
├── outputs.tf         # Outputs for VM IPs, connection commands, and generated SSH key
├── providers.tf       # Terraform required providers configuration
├── terraform.tfvars   # Default configuration values
├── variables.tf       # Input variable definitions
└── README.md          # Usage documentation
```

## Quick Start Commands

1. **Initialize Terraform & Backend**:
   ```bash
   terraform init
   ```
   *(Or override backend details dynamically)*:
   ```bash
   terraform init \
     -backend-config="resource_group_name=<your-rg>" \
     -backend-config="storage_account_name=<your-storage-account>" \
     -backend-config="container_name=<your-container>" \
     -backend-config="key=vms-deployment.tfstate"
   ```

2. **Validate Syntax**:
   ```bash
   terraform validate
   ```

3. **Preview Plan**:
   ```bash
   terraform plan
   ```

4. **Deploy Resources**:
   ```bash
   terraform apply
   ```
