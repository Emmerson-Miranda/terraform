resource "local_file" "foreach_files" {
  filename = each.value
  content = "This is a simple file."
  for_each = toset(var.files_for_each)
}