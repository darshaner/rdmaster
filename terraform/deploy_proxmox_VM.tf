provider "proxmox" {
  pm_api_url   = "https://<your-proxmox-host>:8006/api2/json"
  pm_user      = "<your-proxmox-username>"
  pm_password  = "<your-proxmox-password>"
}

resource "proxmox_vm_qemu" "example" {
  name       = "example"
  iso_image  = "local:iso/ubuntu-20.04.2-live-server-amd64.iso"
  boot       = "cdn"
  cores      = 2
  memory     = 4096
  network    = "vmbr0"
  storage    = "local-lvm"
}
