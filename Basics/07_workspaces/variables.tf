variable "filename" {
  default = "myfile.txt"
}

variable "content" {
  type = map(string)
  default = {
    "projectA" = "This is the file content for project A"
    "projectB" = "This is the file content for project B"
  }
}