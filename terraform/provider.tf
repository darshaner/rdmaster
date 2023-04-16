terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = ">= 2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url  = "https://192.168.0.13:8006/api2/json"
  pm_user = "root@pam"
  pm_password = "05Darsh@ne"
}