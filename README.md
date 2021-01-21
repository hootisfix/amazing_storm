# Amazing Storm - Terraform

This project can bze used to deploy:
 - web application 
 - backend with a database
 - infrastructure as a code
 
 Both frontend and backend are build with nodeJS, AWS architecture is deployed with terraform.
 
 
## AWS Architecture

 ![serverless-archi](images/serverless_architecture.png)
 
 
## Continuous deployment

CD is done using Github actions.

Workflows are defined in .github/workflow/ :
- Node workflow to build & deploy frontend (S3)
- Terraform workflow to deploy AWS architecture

Workflows are triggered when a push occurs on master branch.

TODO:
- Workflow to ZIP backend and copy to S3
- Add test + validation in workflows
- PR analysis + build
- Create other env. ex: develop (git) => staging (AWS)
