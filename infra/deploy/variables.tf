variable "prefix" {
  description = "prefix for resources in aws"
  default     = "faa"
}

variable "project" {
  description = "project name for tagging resources "
  default     = "farmacy-app-api"
}

variable "contact" {
  description = "contact email for tagging reosurces"
  default     = "kacdevtest@gmail.com"
}

variable "db_username" {
  description = "username for farmacy app api database"
  default     = "farmacyapp"
}
# this var will be injected from git secrets - added in compose 
variable "db_password" {
  description = "password for terraform db "

}
# like above
variable "ecr_proxy_image" {
  description = "path to ecr repo with the proxy image"
}

variable "ecr_app_image" {
  description = "path to ecr repo with the api image "
}

variable "django_secret_key" {
  description = "secret key for django"
}

variable "dns_zone_name" {
  description = "Domain name"
  default     = "londonappdev.net"
}

variable "subdomain" {
  description = "Subdomain for each environment"
  type        = map(string)

  default = {
    prod    = "api"
    staging = "api.staging"
    dev     = "api.dev"
  }
}