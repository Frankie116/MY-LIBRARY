# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Uses an existing script to configure the container definition. 
# ---------------------------------------------------------------------------------------------------

# req:
# A script named in the template variable needs to exist.
# Any variables named under vars (left) need to exist within the script file
# Any variables named under vars (right) need to exist in variables.tf


data "template_file" "my-template-file" {
  template                   = file("./templates/ecs/${var.my-ecs-cd-file}")
  vars                       = {
    my-cd-application        = var.my-application
    my-cd-image              = var.my-docker-image
    my-cd-port               = var.my-docker-port
    my-cd-fargate-cpu        = var.my-desired-fargate-cpu
    my-cd-fargate-memory     = var.my-desired-fargate-memory
    my-cd-aws-region         = var.my-aws-region
    my-cd-log-group          = local.my-cw-log-group
  }
}