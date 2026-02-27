# 🌍 Terraform Command Guide

This guide provides a brief overview of the essential Terraform commands used to manage Infrastructure as Code (IaC).

## 🛠️ Core Workflow Commands

### 1. `terraform init`

**What it does:** Initializes a working directory containing Terraform configuration files.

* **Key Actions:** Downloads the necessary provider plugins (like AWS, Azure, or Google Cloud) and sets up the backend for storing your state file.
* **When to use:** Run this first, and every time you add a new provider or module.

### 2. `terraform plan`

**What it does:** Creates an execution plan.

* **Key Actions:** It compares your code against the real-world infrastructure and lists exactly what will be **Created (+)**, **Updated (~)**, or **Destroyed (-)**.
* **When to use:** Run this before every change to avoid unexpected surprises.

### 3. `terraform apply`

**What it does:** Executes the actions proposed in a Terraform plan.

* **Key Actions:** It reaches out to the cloud provider's API to build or change your infrastructure. By default, it asks for a manual "yes" confirmation.
* **When to use:** When you are ready to deploy your changes.

### 4. `terraform destroy`

**What it does:** Terminate all resources managed by your infrastructure project.

* **Key Actions:** It looks at your state file and deletes everything it previously created.
* **When to use:** When you want to clean up your environment or stop incurring costs for a project.

---

## 🔍 Inspection & Maintenance

### 5. `terraform validate`

**What it does:** Checks whether your configuration is syntactically valid and internally consistent.

* **When to use:** Run this to catch typos or logic errors without needing to connect to the cloud.

### 6. `terraform fmt`

**What it does:** Automatically rewrites Terraform configuration files to a canonical format and style.

* **When to use:** Use this to keep your code clean and readable (Standardizes spacing and alignment).

### 7. `terraform show`

**What it does:** Provides human-readable output from a state or plan file.

* **When to use:** Use this to see the actual current attributes of your deployed resources (like IP addresses or IDs).

### 8. `terraform state list`

**What it does:** Lists all resources currently tracked in the Terraform state file.

* **When to use:** Useful for identifying exactly which "pieces" of infrastructure Terraform thinks it is managing.

---

## ⚡ Advanced Utility Commands

| Command | Brief Description |
| --- | --- |
| `terraform output` | Displays the values of output variables defined in your code. |
| `terraform refresh` | Updates the local state file against real-world resources (deprecated in favor of `plan`). |
| `terraform import` | Associates existing "manually created" cloud resources with a Terraform address. |
| `terraform workspace` | Manages multiple distinct states (e.g., Dev vs. Prod) within the same configuration. |
| `terraform console` | Opens an interactive shell to test expressions and interpolations. |

---
## 🎯 Targeted Operations

### `terraform apply -target=RESOURCE_ADDRESS`

**What it does:** Instructs Terraform to only apply changes to a specific resource (and its dependencies).

* **Key Actions:** It bypasses the rest of your configuration and focuses only on the item you named (e.g., `aws_instance.db-server`).
* **When to use:** Use this in emergencies when you need to fix one broken resource quickly without triggering a 30-minute update on the rest of your infrastructure.

---

## 🚀 Advanced Utility Commands

### `terraform output`

**What it does:** Extracts and displays the values of "output" variables from your state file.

* **Key Actions:** It reads the state file to show you information you specifically asked for, like a Load Balancer's DNS name or an Instance's Public IP.
* **When to use:** Use this after an `apply` to get the connection strings or IDs needed for the next step of your deployment.

### `terraform import RESOURCE_ADDRESS ID`

**What it does:** Brings existing, manually created infrastructure under Terraform management.

* **Key Actions:** It maps a real-world cloud resource (like an S3 bucket created in the AWS Console) to a resource block you wrote in your `.tf` file.
* **When to use:** Use this when you are migrating "legacy" infrastructure into Terraform without wanting to delete and recreate it.

### `terraform state rm RESOURCE_ADDRESS`

**What it does:** Removes a resource from the Terraform state file without deleting it in the real world.

* **Key Actions:** It tells Terraform to "forget" about a specific resource. The resource stays alive in AWS/Azure/GCP, but Terraform will no longer try to manage or delete it.
* **When to use:** Use this if you want to stop managing a resource via code but need to keep it running.

### `terraform taint RESOURCE_ADDRESS`

**What it does:** Marks a resource for recreation during the next `apply`.

* **Key Actions:** It flags a specific resource as "degraded" or "dirty." In the next plan, Terraform will propose to destroy and recreate it from scratch.
* **When to use:** Use this when a resource is physically "unhealthy" (like a corrupted EC2 instance) but Terraform thinks the configuration is still valid.

### `terraform workspace`

**What it does:** Manages multiple distinct state files for the same configuration code.

* **Key Actions:** It allows you to switch between different "environments" (like `dev`, `staging`, and `prod`) using the exact same code but separate state files.
* **When to use:** Use this to test your infrastructure changes in a "dev" workspace before switching to "prod" to deploy them.

### `terraform console`

**What it does:** Opens an interactive command-line interface for evaluating expressions.

* **Key Actions:** Allows you to test functions (like `join`, `lookup`, or `split`) or see what a specific variable's value looks like before running an actual plan.
* **When to use:** Use this for debugging complex logic or string manipulations in your `.tf` files.

---