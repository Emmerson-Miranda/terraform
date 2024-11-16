# Basic examples
Simple tf examples

Terraform version
```bash
docker compose run --rm terraform version   
```
## 01 resource_local

01 Creating local file
```bash
docker compose run --rm terraform  -chdir=./01_local_file init
docker compose run --rm terraform  -chdir=./01_local_file apply 
ls ./01_local_file/tmp
docker compose run --rm terraform  -chdir=./01_local_file destroy 
```

## 02 Variables

Variable definition precedence

 1) variables.tf file
 2) TF_ENV_<name> environment variable
 3) terraform.tfvars file
 4) variable.auto.tfvars file
 5) terraform apply -var "key=value"

02 Variables - from variables.tf
```bash
docker compose run --rm terraform  -chdir=./02_variables init
docker compose run --rm terraform  -chdir=./02_variables apply 
docker compose run --rm terraform  -chdir=./02_variables destroy 
```

02 Variables - from TF_VAR_<name> environment variable
```bash
docker compose run --rm terraform  -chdir=./02_variables init
docker compose run -e TF_VAR_permission=0600 --rm terraform  -chdir=./02_variables apply 
cat ./02_variables/tmp/default.txt
docker compose run --rm terraform  -chdir=./02_variables destroy 
```

02 Variables - terraform.tfvars file
```bash
echo "content=\"overrided by terraform.tfvars\"\n" > 02_variables/terraform.tfvars   

docker compose run --rm terraform  -chdir=./02_variables init
docker compose run -e TF_VAR_content="overrided by TF_VAR" --rm terraform  -chdir=./02_variables apply 

rm  02_variables/terraform.tfvars   
docker compose run --rm terraform  -chdir=./02_variables destroy 
```

02 Variables - variable.auto.tfvars file
```bash
echo "content=\"overrided by terraform.tfvars\"\n" > 02_variables/terraform.tfvars   

echo "content=\"overrided by myvariable.auto.tfvars\"\n" > 02_variables/myvariable.auto.tfvars 

docker compose run --rm terraform  -chdir=./02_variables init
docker compose run -e TF_VAR_content="overrided by TF_VAR" --rm terraform  -chdir=./02_variables apply 

rm  02_variables/terraform.tfvars   
rm  02_variables/myvariable.auto.tfvars
docker compose run --rm terraform  -chdir=./02_variables destroy 
```


02 Variables - -var
```bash
echo "content=\"overrided by terraform.tfvars\"\n" > 02_variables/terraform.tfvars   

echo "content=\"overrided by myvariable.auto.tfvars\"\n" > 02_variables/myvariable.auto.tfvars 

docker compose run --rm terraform  -chdir=./02_variables init
docker compose run -e TF_VAR_content="overrided by TF_VAR" --rm terraform  -chdir=./02_variables apply -var "content=overrided by -var"

rm  02_variables/terraform.tfvars   
rm  02_variables/myvariable.auto.tfvars
docker compose run --rm terraform  -chdir=./02_variables destroy 
```

## Documentation

* [local_file (Resource)](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)

* [Switching working directory with -chdir](https://developer.hashicorp.com/terraform/cli/commands#switching-working-directory-with-chdir)

* [Input variables](https://developer.hashicorp.com/terraform/language/values/variables)

