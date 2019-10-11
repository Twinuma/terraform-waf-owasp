resource "aws_wafregional_web_acl" "wafregional_acl" {
  name        = "${var.waf_prefix}-generic-owasp-acl"
  metric_name = "${var.waf_prefix}genericowaspacl"

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 1
    rule_id  = aws_wafregional_rule.restrict_sizes.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 2
    rule_id  = aws_wafregional_rule.detect_blacklisted_ips.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 3
    rule_id  = aws_wafregional_rule.detect_bad_auth_tokens.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 4
    rule_id  = aws_wafregional_rule.mitigate_sqli.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 5
    rule_id  = aws_wafregional_rule.mitigate_xss.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 6
    rule_id  = aws_wafregional_rule.detect_rfi_lfi_traversal.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 7
    rule_id  = aws_wafregional_rule.detect_php_insecure.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 8
    rule_id  = aws_wafregional_rule.enforce_csrf.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 9
    rule_id  = aws_wafregional_rule.detect_ssi.id
    type     = "REGULAR"
  }

  rule {
    action {
      type = var.rule_action
    }

    priority = 10
    rule_id  = aws_wafregional_rule.detect_admin_access.id
    type     = "REGULAR"
  }
}

