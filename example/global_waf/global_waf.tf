module "global_waf" {
  source = "../../global/."
  waf_prefix = "${var.waf_prefix}"
}
