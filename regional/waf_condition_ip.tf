resource "aws_wafregional_ipset" "admin_remote_ipset" {
  name = "${var.waf_prefix}-generic-match-admin-remote-ip"

  dynamic "ip_set_descriptor" {
    for_each = [for ip_set in var.admin_remote_ipset : {
      type  = ip_set.type
      value = ip_set.value
    }]
    content {
      type  = ip_set_descriptor.value.type
      value = ip_set_descriptor.value.value
    }
  }
}

resource "aws_wafregional_ipset" "blacklisted_ips" {
  name = "${var.waf_prefix}-generic-match-blacklisted-ips"
  dynamic "ip_set_descriptor" {
    for_each = [for ip_set in var.blacklisted_ips : {
      type  = ip_set.type
      value = ip_set.value
    }]
    content {
      type  = ip_set_descriptor.value.type
      value = ip_set_descriptor.value.value
    }
  }
}

