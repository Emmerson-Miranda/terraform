resource "local_file" "car" {
    filename = "tmp/car"
    content = "car"
    depends_on = [ local_file.petrol ]
}

resource "local_file" "petrol" {
    filename = "tmp/petrol"
    content = "petrol"
}
