/**
* Esse arquivo configura as variaveis para o ambiente de produção
*/
module "Production" {
  source = "../../infra"
  region = "us-east-1"
  name = "production"
  description = "application-for-production"
  enviroment_beanstalk_name = "adahack-2024-devops-team-do-1-prod"
  type_instance = "t2.micro"
  max_size = 5
}