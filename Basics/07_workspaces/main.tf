resource "local_file" "hello-world" {
  filename = join("-", [terraform.workspace, var.filename])
  content  = lookup(var.content, terraform.workspace, "No content specified for ${terraform.workspace} project.")
}
