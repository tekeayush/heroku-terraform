variable "heroku_api_key" {
  type      = string
  default = "286bf13a-a7f1-4b7e-8251-e1710d2f77e2"
}

variable "app_count" {
  type    = number
  default = 2 # Number of apps to create
}
