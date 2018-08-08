resource "aws_waf_ipset" "admin_remote_ipset" {
  name = "${var.waf_prefix}-generic-match-admin-remote-ip"

  ip_set_descriptors {
    type  = "IPV4"
    value = "127.0.0.1/32"
  }
}

resource "aws_waf_ipset" "blacklisted_ips" {
  name = "${var.waf_prefix}-generic-match-blacklisted-ips"

  ip_set_descriptors {
    type  = "IPV4"
    value = "172.16.0.0/16"
  }

  ip_set_descriptors {
    type  = "IPV4"
    value = "192.168.0.0/16"
  }

  ip_set_descriptors {
    type  = "IPV4"
    value = "169.254.0.0/16"
  }

  ip_set_descriptors {
    type  = "IPV4"
    value = "127.0.0.1/32"
  }

  ip_set_descriptors {
    type  = "IPV4"
    value = "10.0.0.0/8"
  }
}
