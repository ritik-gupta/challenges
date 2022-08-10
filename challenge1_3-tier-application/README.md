# 3-tier architecture on azure using terraform

## What is three-tier architecture?
Three-tier architecture is a well-established software application architecture.
It consists of three layers:
- Presentation Layer (Front-end)
- Application Layer (Back-end)
- Processing Layer (Database)

## Architecture
    Internet -> First Virtual Machine -> Second virtual machine (can take traffic from first virtual machine only) -> database 

To run the code you need to append the variables in the terraform.tfvars

Each module consists minimum two files: main.tf, vars.tf

resourcegroup and networking modules consists of one extra file named output.tf

## Future Plans:
- Introduce load balancers as well
- Write proper documentation and steps