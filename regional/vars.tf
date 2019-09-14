variable "waf_prefix" {}

variable "blacklisted_ips" {
  type = "list"
}

variable "admin_remote_ipset" {
  type = "list"
}
