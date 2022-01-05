#####################
### Hetzner Cloud ###
#####################

# Documentation:
#   https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs

resource "hcloud_server" "teamspeak" {
  name        = "teamspeak"
  image       = var.hetzner_default_image
  location    = var.hetzner_default_location
  server_type = var.hetzner_default_server_type
  ssh_keys    = data.hcloud_ssh_keys.all_keys.ssh_keys.*.name
  labels      = {
    "runtime" = "docker"
    "service" = "teamspeak"
  }
}

resource "hcloud_volume" "teamspeak_data" {
  name              = "teamspeak_data"
  location          = var.hetzner_default_location
  size              = var.volume_teamspeak_data_size
  format            = "ext4"
  delete_protection = true
  labels            = {
    "service"       = "teamspeak"
  }
}

resource "hcloud_volume_attachment" "teamspeak_data_mount" {
  volume_id = hcloud_volume.teamspeak_data.id
  server_id = hcloud_server.teamspeak.id
  automount = true
}

###########
### DNS ###
###########

## The domain
#data "gandi_livedns_domain" "tora" {
#  name          = "tora.games"
#}
#
#### DNS records ###
#
## teamspeak
#resource "gandi_livedns_record" "ts_ipv4" {
#  zone          = data.gandi_livedns_domain.tora.id
#  name          = "ts"
#  type          = "A"
#  value         = hcloud_server.teamspeak.ipv4_address
#  ttl           = var.dns_default_ttl
#}
#
#resource "gandi_livedns_record" "ts_ipv6" {
#  zone          = data.gandi_livedns_domain.tora.id
#  name          = "ts"
#  type          = "AAAA"
#  value         = hcloud_server.teamspeak.ipv6_address
#  ttl           = var.dns_default_ttl
#}

