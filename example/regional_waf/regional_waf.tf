module "regional_waf" {
  source = "../../regional/."
  waf_prefix = "${var.waf_prefix}"
}

# Use module.regional_waf.web_acl_id variable to create aws_wafregional_web_acl_association
# https://www.terraform.io/docs/providers/aws/r/wafregional_web_acl_association.html
