# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Purpose: Create a new route53 record in an existing route53 hosted zone
#          DNS record is NOT loadbalnced.  Use 06a-route53.tf if loadbalancing required.    
# ---------------------------------------------------------------------------------------------------

# req:
# 06a-dns-zone.tf         - data.aws_route53_zone.my-dns-zone.zone_id
# 33a-eip.tf              - [data.aws_eip.my-eip.public_ip]
# variables.tf            - var.my-servername
# variables.tf            - var.my-appliocation


resource "aws_route53_record" "my-dns-record" {
  zone_id                 = data.aws_route53_zone.my-dns-zone.zone_id
  name                    = "${var.my-application}.${data.aws_route53_zone.my-dns-zone.name}"
  type                    = "A"
  ttl                     = "300"
  records                 = [data.aws_eip.my-eip.public_ip]
}
