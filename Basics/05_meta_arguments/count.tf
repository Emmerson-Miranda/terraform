resource "local_file" "simple" {
  filename = "tmp/simple.txt"
  content = "This is a simple file."
}

# USE FOR EACH INSTEAD
# because when the list change, TF will destroy and recreate almost all the files
resource "local_file" "count_files" {
  filename = var.files_for_count[count.index]
  content = "This is a simple file."
  count = length(var.files_for_count)
}