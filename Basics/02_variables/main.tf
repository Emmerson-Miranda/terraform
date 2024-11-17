resource "local_file" "hello-world" {
  filename = var.filename
  content  = var.content
  file_permission = var.permission
}

resource "random_uuid" "myuuid" {
}

resource "random_integer" "mynumber" {
  min     = 1
  max     = 99999
}