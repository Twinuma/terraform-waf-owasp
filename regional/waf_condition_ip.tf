resource "aws_wafregional_ipset" "admin_remote_ipset" {
  name               = "${var.waf_prefix}-generic-match-admin-remote-ip"
  ip_set_descriptor  = "${var.admin_remote_ipset}"
}

resource "aws_wafregional_ipset" "blacklisted_ips" {
  name               = "${var.waf_prefix}-generic-match-blacklisted-ips"
  ip_set_descriptor  = "${var.blacklisted_ips}"
}
