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