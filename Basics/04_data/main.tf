output "os-info" {
  value = data.local_file.os-release.content
}

data "local_file" "os-release" {
  filename = "/etc/os-release"
}