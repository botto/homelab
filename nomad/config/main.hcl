data_dir  = "/mnt/user/homelab/nomad/data"

bind_addr = "0.0.0.0" # the default

datacenter="strato"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled = true
  host_volume "root" {
    path = "/mnt/user"
    read_only = true
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

plugin "docker" {
  config {
    endpoint = "unix:///var/run/docker.sock"
  }
}

