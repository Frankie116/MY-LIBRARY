# ---------------------------------------------------------------------------------------------------
# version  1.11
# Library: https://github.com/Frankie116/my-library.git
# Generates a random word which is stored in a variable.
# ---------------------------------------------------------------------------------------------------

# req:
# none

provider "random" {
  version = "2.2"
}

resource "random_pet" "table_name" {}




# use as below:
# ${random_pet.table_name.id}