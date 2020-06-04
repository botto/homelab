data_dir  = "/mnt/pool/appdata/nomad"

bind_addr = "0.0.0.0" # the default

datacenter="strato"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled = true
  host_volume "influx_data" {
    path = "/mnt/pool/appdata/influxdb"
    read_only = false
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

consul {
  address = "1.2.3.4:8500"
}