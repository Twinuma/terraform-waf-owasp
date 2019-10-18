module "global_waf" {
  source             = "../../global/."
  waf_prefix         = var.waf_prefix
  blacklisted_ips    = var.blacklisted_ips
  admin_remote_ipset = var.admin_remote_ipset

  log_firehose_arn             = var.log_firehose_arn
  log_firehose_redacted_fields = var.log_firehose_redacted_fields
}

# Use module.global_waf.web_acl_id variable to attach it to aws_cloudfront_distribution
# https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#web_acl_id
