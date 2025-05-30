# Lab - Serverless Web Apps using Amazon DynamoDB - Part 2   <img src="./0-aux/logo_course.png" alt="curso_spl_047" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_047 (Lab - Serverless Web Apps using Amazon DynamoDB - Part 2)   <img src="./0-aux/logo_course.png" alt="curso_spl_047" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Cloud Computing
- Developement

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon API Gateway   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_api_gateway.svg" alt="aws_api_gateway" width="auto" height="25">
  - Amazon DynamoDB   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_dynamodb.svg" alt="aws_dynamodb" width="auto" height="25">
  - AWS Identity and Access Management (IAM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_iam.svg" alt="aws_iam" width="auto" height="25">
  - AWS Lambda   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_lambda.svg" alt="aws_lambda" width="auto" height="25">
  - AWS Software Development Kit (SDK) - Node.js   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_sdk_nodejs.svg" alt="aws_sdk" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - JavaScript   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" alt="javascript" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Runtime Environment:
  - Node.js   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" alt="nodejs" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Serverless Web Apps using Amazon DynamoDB - Part 2<br>
1.1 <a href="#item01.1">Tarefa 1: Verificar o status do CloudFormation</a><br>
1.2 <a href="#item01.2">Tarefa 2: Crie suas funções Lambda</a><br>

---

### Objective:
Este laboratório foi uma das partes de uma série de três laboratórios cujo objetivo foi criar um aplicativo de gerador de dossiê de missão de super-heróis, utilizando os serviços serverless da **AWS**. O objetivo de cada uma das três partes esta descrita abaixo:
- [Lab - Serverless Web Apps using Amazon DynamoDB - Part 1](../curso_spl_046/): No primeiro lab, foi provisionado uma tabela do **Amazon DynamoDB**, realizado o carregamento de dados, e revisando as roles e policies do **AWS IAM** necessárias para conceder acesso seguro a esses dados.
- [Lab - Serverless Web Apps using Amazon DynamoDB - Part 2](../curso_spl_047/): No laboratório 2, foi construída e testada uma função do **AWS Lambda** que interagia com a tabela do **Amazon DynamoDB** recuperando dados de duas maneiras diferentes.
- [Lab - Serverless Web Apps using Amazon DynamoDB - Part 3](../curso_spl_048/): No último lab, foi realizada a criação e configuração de uma API no **Amazon API Gateway**, seguida da geração do SDK correspondente. Em seguida, o front-end da aplicação foi integrado a esse SDK, publicado em um bucket do **Amazon S3** e testado tanto localmente quanto online.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README.
- A pasta `resource` com os arquivos utilizados.

### Development:
Este curso foi um laboratório prático realizado na plataforma **AWS Skill Builder**, cuja subscrição foi devida a uma parceria entre a **AWS** e a **Escola da Nuvem**. A infraestrutura de cloud utilizada foi fornecida através de um sandbox do **AWS Skill Builder** que possibilitava acesso ao console da **AWS**. Contudo foi necessário seguir estritamente as orientações determinadas no laboratório. Dessa maneira, a forma de interação com os recursos da cloud foram sempre através do console fornecido pelo sandbox, a não ser em casos em que o próprio laboratório instruiu para utilização de outras ferramentas de interação como **AWS CLI** ou **AWS SDK**.

O laboratório do **AWS Skill Builder** tem o foco em executar apenas o que é orientado no escopo, todos os recursos ou serviços que podem ser requisitados adicionalmente já vêm provisionados por padrão pelo laboratório. Ao iniciar o laboratório, o sandbox do **AWS Skill Builder** provisiona diversos recursos e serviços para o funcionamento através de uma ou mais pilhas do **AWS CloudFormation** de forma automática. 

O acesso ao console no sandbox do **AWS Skill Builder** é realizado por meio de uma identidade federada. O Skill Builder funciona como um provedor de identidade (IdP), autenticando o usuário e vinculando-o a uma role do **AWS IAM** provisionada automaticamente por uma das pilhas do CloudFormation. Essa role concede permissões temporárias e mínimas necessárias para a execução do laboratório, garantindo segurança e controle sobre os recursos utilizados. O laboratório, por padrão, determina a região a ser utilizada e ela não deve ser alterada, somente se o próprio laboratório indicar. As configurações não informadas no laboratório devem ser sempre mantidas como padrão que estão.

<a name="item01.1"><h4>Tarefa 1: Verificar o status do CloudFormation</h4></a>[Back to summary](#item0)

A primeira tarefa foi basicamente verificar as pilhas do **AWS CloudFormation** que provisionavam a infraestrutura necessária para este laboratório. A imagem 01 exibe que as stacks foram concluídas com sucesso e seus status estavam `CREATE_COMPLETE`, indicando que tudo foi construído.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: Crie suas funções Lambda</h4></a>[Back to summary](#item0)

A tarefa 2 teve como objetivo provisionar duas funções Lambda, uma para recuperar a lista de super-heróis na tabela `SuperMission` no **Amazon DynamoDB**, enquanto a outra para recuperar na mesma tabela os detalhes da missão. A primeira função foi configurada da seguinte forma:
- `Choose one of the following options to create your function` (Escolha uma das seguintes opções para criar sua função): `Author from scratch` (Autor do zero).
- `Basic information` (Informações básicas): 
    - `Function name` (Nome da função): `getheroeslist`.
    - `Runtime` (Tempo de execução): `Node.js 18.x`.
    - `Change default execution role` (Alterar função de execução padrão):
        - `Execution role` (Função de execução): `Use an existing role` (Usar uma função existente):
            - `Existing role` (Função existente): `SuperDynamoDBScanRole`. Essa role do **AWS IAM** tinha sido revisada no primeiro laboratório dessa série.
- `Code` (Código):
    - `Code source` (Código-fonte): foi criado o arquivo de script de nome [index.mjs](./resource/index.mjs). Esse arquivo em **JavaScript** utilizava o **AWS SDK** para JS para interagir com o serviço **Amazon DynamoDB** recuperando os itens da tabela `SuperMission`.

Após criar o arquivo, o mesmo foi implantado e um teste foi elaborado na aba `Test` (Teste) configurando o nome como `myTest`. No editor `Event JSON`, o comando foi substituído por `{}`. Não foi removido as chaves, pois poderia resultar em erro no evento JSON. O teste foi salvo e executado de forma bem sucedida, conforme mostrado na imagem 02. Observe que o conteúdo da tabela provisionada no **Amazon DynamoDB** no primeiro lab dessa série foi exibido.

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

A configuração da segunda função Lambda foi a seguinte:
- `Choose one of the following options to create your function` (Escolha uma das seguintes opções para criar sua função): `Author from scratch` (Autor do zero).
- `Basic information` (Informações básicas): 
    - `Function name` (Nome da função): `getmissiondetails`.
    - `Runtime` (Tempo de execução): `Node.js 18.x`.
    - `Change default execution role` (Alterar função de execução padrão):
        - `Execution role` (Função de execução): `Use an existing role` (Usar uma função existente):
            - `Existing role` (Função existente): `SuperDynamoDBQueryRole`. Essa role do **AWS IAM** tinha sido revisada no primeiro laboratório dessa série.
- `Code` (Código):
    - `Code source` (Código-fonte): foi criado o arquivo de script de nome [index2.mjs](./resource/index2.mjs), cujo nome foi alterado para `index.mjs`. Esse arquivo em **JavaScript** utilizava o **AWS SDK** para JS para interagir com o serviço **Amazon DynamoDB** consultando os itens da tabela `SuperMission` para recuperar os detalhes da missão do super-herói indicado no teste.

Após criar o arquivo, o mesmo foi implantado e um teste foi elaborado na aba `Test` (Teste) configurando o nome como `myTest2`. No editor `Event JSON`, o comando foi substituído pelo JSON abaixo. Esse comando procurava detalhes da missão do super-herói `Batman` na tabela do DynamoDB. O teste foi salvo e executado de forma bem sucedida, conforme mostrado na imagem 03.

```json
{
  "superhero": "Batman"
}
```

<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

Por fim, nesse mesmo teste, o super-herói informado no JSON foi alterado para `Iron Man` para verificar os detalhes da missão do homem de ferro. A imagem 04 exibe o resultado obtido.

<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>