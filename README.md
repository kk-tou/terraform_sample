# Project Title

A terraform sample project.

## source code structure

```
.
├── README.md
├── envs
│   ├── dev
│   │   ├── README.md
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── sample.tfvars
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── prd
└── modules
    ├── compute
    │   └── aws
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    └── network
        └── aws
            ├── main.tf
            ├── outputs.tf
            └── variables.tf
```

## Installation

```bash
git clone https://github.com/kk-tou/terraform_sample.git

cd terraform_sample/envs/dev

terraform init

terraform plan

terraform apply


