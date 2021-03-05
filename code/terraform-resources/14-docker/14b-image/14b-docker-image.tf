# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates a docker image
# ---------------------------------------------------------------------------------------------------

# req:
# None


resource "docker_image" "nginx" {
  name            = "nginx:latest"
  keep_locally    = false
}