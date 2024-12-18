# farmacy Api is automation project based on Terraform, github actions, docker and aws 
This project leverages automation for CI/CD processes and Infrastructure as Code (IaC) to ensure seamless deployment and infrastructure management. Upon changes to the main or prod branches, the following actions are triggered:

Testing and building container images pushed to Amazon ECR.
AWS infrastructure provisioning, including permissions, network configurations, and policies.
Deployment of the latest version of the application to Amazon ECS, resources are isolated via Virtual Private Cloud.
Additionally, CloudWatch is integrated for monitoring and logging.

The Terraform setup consists of two key parts:

Setup Folder: Creates a dedicated AWS user for CI/CD operations on GitHub Actions and assigns specific permissions and policies. This infrastructure must be initialized locally from the developer’s machine.
Deploy Folder: Handles the automated provisioning of the rest of the infrastructure via CI/CD pipelines.
As a result, most processes—such as resource creation, configuration, and deployment—are fully automated through the CI/CD pipeline.

> Note: My cloud infrastructure is shutted down to not generate costs.

### technologies and services used in this project

- Terraform - Infrastructure as Code (IaC) automation.
- GitHub Actions - CI/CD pipeline for deployment automation.
- Docker - Application containerization.
- Docker Compose - Orchestration of containers in local development environments.

### AWS Services

- DynamoDB - NoSQL database.
- S3 - Object storage service.
- ECR - Container registry for Docker images.
- ECS - Managed container orchestration service.
- CloudWatch - Monitoring and logging for applications and infrastructure.
- Route 53 - DNS management service.
- VPC - Virtual Private Cloud for resource isolation.
- RDS - Managed SQL database service
- Load Balancer - traffic managment

### Running Project Locally

This project runs using Docker. 

```sh
docker compose up
```

 Browse the project at [http://127.0.0.1:8000/api/health-check/](http://127.0.0.1:8000/api/health-check/)



### Running Project

#### Create admin user via  IAM Center
Log as root user and create user via IAM Center , then use credentials for aws cli authentication, you also have to manually create hosted zone in Route53. 

#### AWS CLI Authentication

 Use [aws-vault](https://github.com/99designs/aws-vault) to authenticate with the AWS CLI in the terminal.

To authenticate:

```
aws-vault exec <your_profile_name> --duration=8h
```

Replace `<your_profile_name>` with the name of the profile.

To list profiles, run:

```
aws-vault list
```


### Run Terraform Commands To Create CI/CD user

Below is a list of how to run the common commands via Docker Compose.

> Note: The below commands should be run from ther `infra/` directory of the project, and after authenticating with `aws-vault`.


```
docker compose run --rm terraform -chdir=setup apply

```

### GitHub Actions Variables

This section lists the GitHub Actions variables which need to be configured on the GitHub project.

Variables:

- `AWS_ACCESS_KEY_ID`: Access key for the CD AWS IAM user that is created by Terraform and output as `cd_user_access_key_id`.
- `AWS_ACCOUNT_ID`: AWS Account ID taken from AWS directly.
- `DOCKERHUB_USER`: Username for [Docker Hub](https://hub.docker.com/) for avoiding Docker Pull rate limit issues.
- `ECR_REPO_APP`: URL for the Docker repo containing the app image output by Terraform as `ecr_repo_app`.
- `ECR_REPO_PROXY`: URL for the Docker repo containing the proxy image output by Terraform as `ecr_repo_proxy`.

Secrets:

- `AWS_SECRET_ACCESS_KEY`: Secret key for `AWS_ACCESS_KEY_ID` set in variables, output by Terraform as `cd_user_access_key_secret`.
- `DOCKERHUB_TOKEN`: Token created in `DOCKERHUB_USER` in [Docker Hub](https://hub.docker.com/).
- `TF_VAR_DB_PASSWORD`: Password for the RDS database (make something up).
- `TF_VAR_DJANGO_SECRET_KEY`: Secret key for the Django app (make something up).


# To trigger the CI/CD process, you simply need to merge a Pull Request into the main or prod branch, or commit directly to main/prod.

## To destroy AWS infrastructure run "destroy terraform infra" action 

#### Section Notes and Resources
This project contains the starter django app  from  (https://londonapp.dev).