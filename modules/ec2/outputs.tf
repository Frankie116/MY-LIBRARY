


# output "this_public_ip" {
#   description = "The public ip of myec2 instance"
#   value       = aws_instance.myec2.public_ip
# }


# output "this_private_ip" {
#   description = "The private ip on myec2 network interface"
#   value       = aws_eip.myeip.associate_with_private_ip
# }

output "this_id" {
  description = "The id of myec2 instance"
  value       = aws_instance.myec2.id
}


# output "this_dns" {
#   description = "The dns of eip"
#   value       = aws_eip.myeip.public_dns
# }


# output "this_availability_zone" {
#   description = "The AZ name of myec2 instance"
#   value       = aws_instance.myec2.availability_zone
# }
