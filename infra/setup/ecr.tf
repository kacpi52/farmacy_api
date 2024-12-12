# create ecr repo for storing docker images 
resource "aws_ecr_repository" "app" {
  name = "farmacy-app-api-app"
  #   you can override for example tag latest
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    #  should be scanned always - change it later after update packages   
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "proxy" {
  name                 = "farmacy-app-api-proxy"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    #  should be scanned always - change it later after update packages   
    scan_on_push = false
  }
}