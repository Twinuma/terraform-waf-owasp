resource "aws_waf_web_acl" "waf_acl" {
  name        = "${var.waf_prefix}-generic-owasp-acl"
  metric_name = "${var.waf_prefix}genericowaspacl"

  default_action {
    type = "ALLOW"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 1
    rule_id  = aws_waf_rule.restrict_sizes.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 2
    rule_id  = aws_waf_rule.detect_blacklisted_ips.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 3
    rule_id  = aws_waf_rule.detect_bad_auth_tokens.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 4
    rule_id  = aws_waf_rule.mitigate_sqli.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 5
    rule_id  = aws_waf_rule.mitigate_xss.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 6
    rule_id  = aws_waf_rule.detect_rfi_lfi_traversal.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 7
    rule_id  = aws_waf_rule.detect_php_insecure.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 8
    rule_id  = aws_waf_rule.enforce_csrf.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 9
    rule_id  = aws_waf_rule.detect_ssi.id
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 10
    rule_id  = aws_waf_rule.detect_admin_access.id
    type     = "REGULAR"
  }
}

