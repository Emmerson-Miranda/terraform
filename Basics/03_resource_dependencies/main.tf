resource "time_static" "current_time" {
}

resource "local_file" "time" {
  filename = "tmp/time.txt"
  content = "Current Time stamp is ${time_static.current_time.id}"
}