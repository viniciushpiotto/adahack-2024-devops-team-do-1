![Gif AdaTech](/repo/ada.gif)

# Hackathon AdaTech - Vem ser Tech (trilha DevOps)

## Case: Aplicação de Zoológico com Inclusão visual

**💪 Desafio:**

Vocês fazem parte de um time de consultoria da corpsolution, que foi alocado em um projeto em um zoológico. Vocês terão acesso a um projeto e o desafio é criar pipelines de CI/CD relacionados ao tema de Diversidade e Inclusão e configurar a infraestrutura necessária para hospedar e escalar a aplicação API em Python. Eles devem garantir a automação dos processos de construção, teste e implantação da aplicação, seguindo as melhores práticas de DevOps.

**📦Entregáveis:**
* Documentação detalhada dos pipelines e infraestrutura criados, incluindo instruções de configuração e operação.

* Apresentação final do projeto, demonstrando os pipelines e infraestrutura implementados e explicando as decisões tomadas durante o processo de desenvolvimento.

## Resolução do time DO-1

Essa aplicação tem como objetivo, criar uma infraestrutura para uma API de Zoológico, utilizando funções que faça a inclusão de pessoas com deficiencia visual, com o objetivo de aumentar a diversidade e inclusão desse grupo na empresa Corp Solutions.

Para criar uma inclusão dentro do código, pensamos em definir documentações iniciais em todos os arquivos necessários para a configuração de CI/CD da aplicação. Um fato importante é que pessoas com deficiência visual utilizam programadas que fazem a leitura de arquivos, utilizando ferramentas como o <a href="https://www.nvaccess.org/">NVDA</a>, incluindo arquivos de ambiente de programação. E muitas vezes, para o entendimento daquele arquivo é necessário que eles tenham que passar linha a linha para ver as configurações que estão sendo aplicadas no arquivo em questão. Então, para resolver esse problema, se tivermos descrições detalhadas das configurações que estão sendo contempladas naquele arquivo, o membro com defiência visual poderia facilmente entender as funcionalidades de todas as partes da aplicação e, consequentemente, ter maior inclusão e produtividade no ambiente de trabalho.

### Colaboradores:

- Vinícius Piotto ([@viniciushpiotto](https://github.com/viniciushpiotto))
- Andrei Ferreira Lançanova ([@andreiflancanova](https://github.com/andreiflancanova))

### Tecnologias:

![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

### Pipeline - DevOps

![Pipeline](images/pipeline.png)

## Continuous Integration:



## Continuous Delivery:

Na busca pela otimização da abordagem adequada ao projeto, optamos por implementar o **Elastic Beanstalk**, levando em consideração a simplicidade da estrutura da aplicação, desprovida de um banco de dados ou outras camadas que demandem configurações específicas. A escolha se fundamentou na **facilidade de uso**, na **gestão automática de carga** e no **monitoramento de recursos oferecidos pelo serviço**. Todavia, é importante ressaltar algumas desvantagens inerentes a essa implementação, tais como a **limitação no controle total da infraestrutura** e a necessidade de garantir a reprodutibilidade e consistência ao criar ambientes semelhantes, como os de desenvolvimento e produção.

Para armazenar as imagens dos contêineres, estabelecemos a criação de um repositório no **Elastic Container Registry (ECR)**, visando a velocidade no momento da atualização por estar no mesmo serviço da aplicação.Entretanto, outra abordagem bastante recorrente seria utilizar o serviço do Docker Hub para armazenar as nossas imagens por meio de um repositório privado.

Além disso, utilizamos o **Simple Storage Service (S3)** para guardar o arquivo de configuração **Dockerrun**, compactado em formato zip. Esse arquivo contém o nome do repositório no ECR, juntamente com sua última versão atualizada, permitindo assim a **atualização automática da aplicação** no Elastic Beanstalk sempre que houver uma nova versão na branch de produção.

Por fim, empregamos um arquivo **deploy.yml** que automatiza todas as ações requeridas após o recebimento de um novo push no repositório de infraestrutura. Isso inclui a atualização do arquivo Dockerrun.aws.json, a inicialização do Terraform, a passagem de **variáveis sensíveis** por meio dos GitHub Actions Secrets, a aplicação de todas as atualizações via terraform apply e a finalização das configurações do ambiente do Elastic Beanstalk.

Apesar da estrutura já estabelecida, há aspectos que viso aprimorar progressivamente:

-  Um desses pontos é a adoção do **Kubernetes** para orquestração de contêineres, visando uma **escalabilidade** e *resiliência superiores*, pois a robustez do monitoramento fornecido pelo Kubernetes é crucial nesse contexto. 

- Além disso, pretendo fortalecer as práticas de **segurança**, explorando maneiras de ocultar informações sensíveis que possam representar obstáculos futuros para a aplicação.

- Por fim, a integração de **ferramentas de monitoramento** de logging surge como uma boa escolha para a estratégica de identificar e resolver problemas de forma ágil e concisa.