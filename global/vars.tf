variable "waf_prefix" {
  type = list(string)
}

variable "blacklisted_ips" {
  type = "list"
}

variable "admin_remote_ipset" {
  type = "list"
}

