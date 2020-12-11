# ---------------------------------------------------------------------------------------------------
# version  1.2
# Library: https://github.com/Frankie116/my-library.git
# Output values
# ---------------------------------------------------------------------------------------------------


# 1a-vpc.tf -------------------------------------------------------------
output this-vpc-arn {
  description          = "ARN of the vpc"
  value                = module.my-vpc.vpc_arn
}


# 2a-ec2-choose-ami -----------------------------------------------------
output these-instance-ids {
  description          = "IDs of EC2 instances"
  value                = [aws_instance.my-server.*.id]
}


# 4a-lb-alb.tf ----------------------------------------------------------
output this-original-dns-name {
  description          = "Original Public DNS name of load balancer"
  value                = aws_lb.my-alb.dns_name
}


# 6a-route53.tf ----------------------------------------------------------
output this-new-dns-name {
  description          = "New Public DNS name of loadbalancer's route53 A record"
  value                = aws_route53_record.my-r53-record.fqdn
}



