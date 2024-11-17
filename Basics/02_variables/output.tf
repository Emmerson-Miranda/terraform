output "myuuid"{
    value = random_uuid.myuuid.result
    description = "This is a random UUID"
}

output "mynumber"{
    value = random_integer.mynumber.result
    description = "This is a random Integer"
}
