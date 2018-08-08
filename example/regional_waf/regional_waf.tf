module "regional_waf" {
  source = "../../regional/."
  waf_prefix = "${var.waf_prefix}"
}
