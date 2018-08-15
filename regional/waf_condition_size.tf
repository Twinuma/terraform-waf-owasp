resource "aws_wafregional_size_constraint_set" "size_restrictions" {
  name = "${var.waf_prefix}-generic-size-restrictions"

  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "4096"

    field_to_match {
      type = "BODY"
    }
  }

  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "4093"

    field_to_match {
      type = "HEADER"
      data = "cookie"
    }
  }

  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "1024"

    field_to_match {
      type = "QUERY_STRING"
    }
  }

  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "512"

    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_wafregional_size_constraint_set" "csrf_token_set" {
  name = "${var.waf_prefix}-generic-match-csrf-token"

  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "EQ"
    size                = "36"

    field_to_match {
      type = "HEADER"
      data = "x-csrf-token"
    }
  }
}
