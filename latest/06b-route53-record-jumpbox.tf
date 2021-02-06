# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Purpose: Create a new route53 record in an existing route53 hosted zone
#          DNS record is NOT loadbalnced.  Use 06a-route53.tf if loadbalancing required.    
# ---------------------------------------------------------------------------------------------------

# req:
# 02b-ec2-jumpbox.tf   - local.jumpbox-count
# 06a-route53-zone.tf: - data.aws_route53_zone.my-r53zone.zone_id
# variables.tf         - var.my-lb-hosted-zone


resource "aws_route53_record" "my-r53-record-jumpbox" {
  count                = local.jumpbox-count
  zone_id              = data.aws_route53_zone.my-r53zone.zone_id
  name                 = "my-jumpbox-0${count.index+1}.${data.aws_route53_zone.my-r53zone.name}"
  type                 = "A"
  ttl                  = "300"
  records              = [aws_instance.my-jumpbox[count.index].public_ip]
}








# ----------------------------------------------------------------------------------------------------
# use config below to point to an eip ----------------------------------------------------------------
# resource "aws_route53_record" "my-r53-record" {
#   zone_id            = data.aws_route53_zone.my-r53zone.zone_id
#   name               = "${var.my-application}.${data.aws_route53_zone.my-r53zone.name}"
#   type               = "A"
#   ttl                = "300"
#   records            = [data.aws_eip.my-eip.public_ip]
# }



