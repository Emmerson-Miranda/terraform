resource "local_file" "hello-world" {
  filename = var.filename
  content  = var.content
  file_permission = var.permission
}

