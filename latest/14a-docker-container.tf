# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates a docker container
# ---------------------------------------------------------------------------------------------------

# req:
# 14a-docker-image.tf - docker_image.nginx.latest


resource "docker_container" "nginx" {
  image               = docker_image.nginx.latest
  name                = "tutorial"
  ports {
    internal          = 80
    external          = 8000
  }
}