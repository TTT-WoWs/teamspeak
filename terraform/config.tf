# User configuration
variable "volume_teamspeak_data_size" {
  default   = 10 # GB, 10 is the minimum
}

# Some defaults
variable "hetzner_default_image" {
  default   = "ubuntu-20.04"
}
variable "hetzner_default_location" {
  default   = "hel1"
}
variable "hetzner_default_server_type" {
  default   = "cpx11"
}
variable "dns_default_ttl" {
  default   = 120
}

# Default SSH keys
data "hcloud_ssh_keys" "all_keys" {
}

# Configuration of the Hetzner Cloud terraform provider
terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.32.2"
    }
#    gandi = {
#      version = "2.0.0-rc3"
#      source = "github/go-gandi/gandi"
#    }
  }
}

provider "hcloud" {
  # Configuration options
}

#provider "gandi" {
#  key         = ""
#  sharing_id  = ""
#}

