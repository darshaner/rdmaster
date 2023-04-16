resource "proxmox_vm_qemu" "rdmgmt" {
  vmid = "100"
  name       = "rdmgmt.local"
  target_node = "rdmaster"
  iso  = "local:iso/debian-11.6.0-amd64-DVD-1.iso"
  cores      = 2
  memory     = 2048
  qemu_os = "l26"
  bios = "seabios"
  boot = "order=scsi0;ide2"
  disk {
    type = "scsi"
    storage = "VM-Drive"
    slot = 0
    iothread = "1"
    size = "64G"
    format = "raw"
    file = "vm-100-disk-0"
  } 
  network {
    bridge  = "vmbr0"
    firewall  = false
    link_down = false
    mtu = 0
    queues = 0
    rate = 0
    model = "virtio"
    macaddr = "BE:B1:94:25:BC:13"
  }
}

resource "proxmox_vm_qemu" "rdprod1" {
  #vmid = "101"
  name       = "rdprod01.local"
  target_node = "rdmaster"
  #iso  = "local:iso/debian-11.6.0-amd64-DVD-1.iso"
  cores      = 2
  memory     = 2048
  balloon = 2048
  numa = true
  qemu_os = "l26"
  bios = "seabios"
  full_clone = false
  define_connection_info = false
  boot = "order=scsi0;ide2;net0"
  scsihw = "virtio-scsi-single"
  disk {
    type = "scsi"
    storage = "VM-Drive"
    iothread = "1"
    size = "64G"
    format = "raw"
    file = "vm-101-disk-0"
  } 
  #disk {
  #  type = "scsi"
  #  volume = "/dev/nvme1n1p4"
  #  storage = "/dev/nvme1n1p4"
  #  size = "631.5G"
  #}
  network {
    bridge  = "vmbr0"
    firewall  = true
    mtu = 0
    queues = 0
    rate = 0
    link_down = false
    model = "virtio"
    macaddr = "C6:5C:CD:AD:ED:C1"
  }
}

resource "proxmox_vm_qemu" "rdlab2" {
  name       = "rdlab2"
  target_node = "rdmaster"
  iso  = "local:iso/debian-11.6.0-amd64-DVD-1.iso"
  cores      = 2
  memory     = 2048
  numa = true
  qemu_os = "l26"
  bios = "seabios"
  boot = "order=scsi0;ide2"
  disk {
    type = "scsi"
    storage = "VM-Drive"
    iothread = "1"
    size = "32G"
    format = "raw"
    file = "vm-101-disk-0"
  } 
  network {
    bridge  = "vmbr0"
    firewall  = false
    link_down = false
    model = "virtio"
    macaddr = "D6:02:B6:7A:AC:1E"
  }
}
