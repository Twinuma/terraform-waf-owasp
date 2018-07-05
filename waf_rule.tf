resource "aws_waf_rule" "detect_admin_access" {
  name        = "${var.env}-generic-detect-admin-access"
  metric_name = "${var.env}genericdetectadminaccess"

  predicates {
    data_id = "${aws_waf_ipset.admin_remote_ipset.id}"
    negated = true
    type    = "IPMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.match_admin_url.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_rule" "detect_bad_auth_tokens" {
  name        = "${var.env}-generic-detect-bad-auth-tokens"
  metric_name = "${var.env}genericdetectbadauthtokens"

  predicates {
    data_id = "${aws_waf_byte_match_set.match_auth_tokens.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_rule" "detect_blacklisted_ips" {
  name        = "${var.env}-generic-detect-blacklisted-ips"
  metric_name = "${var.env}genericdetectblacklistedips"

  predicates {
    data_id = "${aws_waf_ipset.blacklisted_ips.id}"
    negated = false
    type    = "IPMatch"
  }
}

resource "aws_waf_rule" "detect_php_insecure" {
  name        = "${var.env}-generic-detect-php-insecure"
  metric_name = "${var.env}genericdetectphpinsecure"

  predicates {
    data_id = "${aws_waf_byte_match_set.match_php_insecure_uri.id}"
    negated = false
    type    = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.match_php_insecure_var_refs.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_rule" "detect_rfi_lfi_traversal" {
  name        = "${var.env}-generic-detect-rfi-lfi-traversal"
  metric_name = "${var.env}genericdetectrfilfitraversal"

  predicates {
    data_id = "${aws_waf_byte_match_set.match_rfi_lfi_traversal.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_rule" "detect_ssi" {
  name        = "${var.env}-generic-detect-ssi"
  metric_name = "${var.env}genericdetectssi"

  predicates {
    data_id = "${aws_waf_byte_match_set.match_ssi.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_rule" "enforce_csrf" {
  name        = "${var.env}-generic-enforce-csrf"
  metric_name = "${var.env}genericenforcecsrf"

  predicates {
    data_id = "${aws_waf_byte_match_set.match_csrf_method.id}"
    negated = false
    type    = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_size_constraint_set.csrf_token_set.id}"
    negated = true
    type    = "SizeConstraint"
  }
}

resource "aws_waf_rule" "mitigate_sqli" {
  name        = "${var.env}-generic-mitigate-sqli"
  metric_name = "${var.env}genericmitigatesqli"

  predicates {
    data_id = "${aws_waf_sql_injection_match_set.sql_injection_match_set.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}

resource "aws_waf_rule" "mitigate_xss" {
  name        = "${var.env}-generic-mitigate-xss"
  metric_name = "${var.env}genericmitigatexss"

  predicates {
    data_id = "${aws_waf_xss_match_set.xss_match_set.id}"
    negated = false
    type    = "XssMatch"
  }
}

resource "aws_waf_rule" "restrict_sizes" {
  name        = "${var.env}-generic-restrict-sizes"
  metric_name = "${var.env}genericrestrictsizes"

  predicates {
    data_id = "${aws_waf_size_constraint_set.size_restrictions.id}"
    negated = false
    type    = "SizeConstraint"
  }
}
