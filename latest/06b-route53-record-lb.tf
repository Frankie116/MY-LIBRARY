# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Purpose:    Create a new route53 record in an existing route53 hosted zone
#             DNS record is loadbalanced.
# ---------------------------------------------------------------------------------------------------

# req:
# 06a-route53-zone.tf:       - data.aws_route53_zone.my-r53zone.zone_id
# 05a-lb-alb.tf              - aws_lb.my-alb.dns_name
# variables.tf               - var.my-lb-hosted-zone 


resource "aws_route53_record" "my-r53-record-lb" {
  zone_id                    = data.aws_route53_zone.my-r53zone.zone_id
  name                       = "${var.my-servername}.${data.aws_route53_zone.my-r53zone.name}"
  type                       = "A"
  alias {
      zone_id                = var.my-lb-hosted-zone        
      name                   = aws_lb.my-alb.dns_name
      evaluate_target_health = false
    }
}




