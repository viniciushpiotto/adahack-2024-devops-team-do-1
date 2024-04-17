/**
* Esse arquivo configura as variaveis para o ambiente de homologação
*/
module "Approval" {
  source = "../../infra"
  name = "approval"
  description = "application-for-approval"
  enviroment_beanstalk_name = "environment-for-approval"
  type_instance = "t2.micro"
  max_size = 2
}