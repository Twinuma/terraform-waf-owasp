module "regional_waf" {
  source             = "../../regional/."
  waf_prefix         = var.waf_prefix
  blacklisted_ips    = var.blacklisted_ips
  admin_remote_ipset = var.admin_remote_ipset
}

# Use module.regional_waf.web_acl_id variable to create aws_wafregional_web_acl_association
# https://www.terraform.io/docs/providers/aws/r/wafregional_web_acl_association.html
