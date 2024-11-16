resource "local_file" "hello-world" {
  filename     = "tmp/hello-world.txt"
  content  = "This is the content of the filename."
}

resource "local_sensitive_file" "hello-world-sensitive" {
  filename     = "tmp/hello-world-sensitive.txt"
  content  = "FIFA 21"
}
