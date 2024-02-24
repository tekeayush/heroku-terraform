terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "5.2.8"
    }
  }
}

provider "heroku" {
  api_key = var.heroku_api_key
}

resource "heroku_app" "app" {
  count  = var.app_count
  name   = "terraform-v${count.index + 1}"
  region = "us"

  buildpacks = [
    "heroku/Docker",
  ]

  config_vars = {
    EXAMPLE_VAR = "example_value",
  }
}

/// To Add Database Saprate heroku_addon
# resource "heroku_addon" "database_0" {
#   app_id = heroku_app.app[0].id
#   plan   = "heroku-postgresql:mini"
# }

# resource "heroku_addon" "database_1" {
#   app_id = heroku_app.app[1].id
#   plan   = "heroku-postgresql:mini"
# }

/// To Add Database Using one heroku_addon
# resource "heroku_addon" "database" {
#   count = var.app_count
#   app_id = heroku_app.app[count.index].id
#   plan   = "heroku-postgresql:mini"
# }

/// Getting UUID
# output "UUID" {
#   value = heroku_app.app[0].uuid
# }