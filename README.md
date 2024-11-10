# terraform

Terraform examples.

## Terraform state

Maps the desired state defined in configuration files to the actual state of resources in your infrastructure.

```mermaid
graph TD
    A[Terraform Configuration .tf files] -->|terraform init| B[Initialize Backend]
    B --> C[State File terraform.tfstate]
    C -->|terraform plan| D[ Execution Plan - show deltas]
    D -->|terraform apply | E[Apply Changes]
    E --> C 

    C -->|terraform import| F[Import Existing Resource]
    F --> C

    C -->|terraform refresh| G[Refresh State]
    
    subgraph Remote Backend [Remote Backend]
        C
        H[State Locking]
    end
```


# PoC List
* [GCP](./GCP/README.md)
* [AWS](./AWS/README.md)