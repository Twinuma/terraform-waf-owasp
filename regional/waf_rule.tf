resource "aws_wafregional_rule" "detect_admin_access" {
  name        = "${var.waf_prefix}-generic-detect-admin-access"
  metric_name = "${var.waf_prefix}genericdetectadminaccess"

  predicate {
    data_id = "${aws_wafregional_ipset.admin_remote_ipset.id}"
    negated = true
    type    = "IPMatch"
  }

  predicate {
    data_id = "${aws_wafregional_byte_match_set.match_admin_url.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_wafregional_rule" "detect_bad_auth_tokens" {
  name        = "${var.waf_prefix}-generic-detect-bad-auth-tokens"
  metric_name = "${var.waf_prefix}genericdetectbadauthtokens"

  predicate {
    data_id = "${aws_wafregional_byte_match_set.match_auth_tokens.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_wafregional_rule" "detect_blacklisted_ips" {
  name        = "${var.waf_prefix}-generic-detect-blacklisted-ips"
  metric_name = "${var.waf_prefix}genericdetectblacklistedips"

  predicate {
    data_id = "${aws_wafregional_ipset.blacklisted_ips.id}"
    negated = false
    type    = "IPMatch"
  }
}

resource "aws_wafregional_rule" "detect_php_insecure" {
  name        = "${var.waf_prefix}-generic-detect-php-insecure"
  metric_name = "${var.waf_prefix}genericdetectphpinsecure"

  predicate {
    data_id = "${aws_wafregional_byte_match_set.match_php_insecure_uri.id}"
    negated = false
    type    = "ByteMatch"
  }

  predicate {
    data_id = "${aws_wafregional_byte_match_set.match_php_insecure_var_refs.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_wafregional_rule" "detect_rfi_lfi_traversal" {
  name        = "${var.waf_prefix}-generic-detect-rfi-lfi-traversal"
  metric_name = "${var.waf_prefix}genericdetectrfilfitraversal"

  predicate {
    data_id = "${aws_wafregional_byte_match_set.match_rfi_lfi_traversal.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_wafregional_rule" "detect_ssi" {
  name        = "${var.waf_prefix}-generic-detect-ssi"
  metric_name = "${var.waf_prefix}genericdetectssi"

  predicate {
    data_id = "${aws_wafregional_byte_match_set.match_ssi.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_wafregional_rule" "enforce_csrf" {
  name        = "${var.waf_prefix}-generic-enforce-csrf"
  metric_name = "${var.waf_prefix}genericenforcecsrf"

  predicate {
    data_id = "${aws_wafregional_byte_match_set.match_csrf_method.id}"
    negated = false
    type    = "ByteMatch"
  }

  predicate {
    data_id = "${aws_wafregional_size_constraint_set.csrf_token_set.id}"
    negated = true
    type    = "SizeConstraint"
  }
}

resource "aws_wafregional_rule" "mitigate_sqli" {
  name        = "${var.waf_prefix}-generic-mitigate-sqli"
  metric_name = "${var.waf_prefix}genericmitigatesqli"

  predicate {
    data_id = "${aws_wafregional_sql_injection_match_set.sql_injection_match_set.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}

resource "aws_wafregional_rule" "mitigate_xss" {
  name        = "${var.waf_prefix}-generic-mitigate-xss"
  metric_name = "${var.waf_prefix}genericmitigatexss"

  predicate {
    data_id = "${aws_wafregional_xss_match_set.xss_match_set.id}"
    negated = false
    type    = "XssMatch"
  }
}

resource "aws_wafregional_rule" "restrict_sizes" {
  name        = "${var.waf_prefix}-generic-restrict-sizes"
  metric_name = "${var.waf_prefix}genericrestrictsizes"

  predicate {
    data_id = "${aws_wafregional_size_constraint_set.size_restrictions.id}"
    negated = false
    type    = "SizeConstraint"
  }
}
