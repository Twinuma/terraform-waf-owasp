variable "waf_prefix" {
  type = list(string)
}

variable "blacklisted_ips" {
  type = "list"
}

variable "admin_remote_ipset" {
  type = "list"
}


variable "log_firehose_arn" {
  default = ""
}

variable "log_firehose_redacted_fields" {
  type = list(object({
    data = string
    type = string
  }))
}
