# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Purpose:    Create a new route53 record in an existing route53 hosted zone
#             DNS record is loadbalanced.
# ---------------------------------------------------------------------------------------------------

# req:
# 05a-alb.tf                  - aws_lb.my-alb.dns_name
# 06a-dns-zone.tf             - data.aws_route53_zone.my-dns-zone.zone_id
# variables.tf                - var.my-lb-hosted-zone 



resource "aws_route53_record" "my-dns-record-lb" {
  zone_id                     = data.aws_route53_zone.my-dns-zone.zone_id
  name                        = "${var.my-servername}.${data.aws_route53_zone.my-dns-zone.name}"
  type                        = "A"
  alias {
      zone_id                 = var.my-lb-hosted-zone        
      name                    = aws_lb.my-alb.dns_name
      evaluate_target_health  = false
    }
}




