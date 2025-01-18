# Lab - Introduction to Amazon Redshift   <img src="./0-aux/logo_course.png" alt="curso_spl_010" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_010 (Lab - Introduction to Amazon Redshift)   <img src="./0-aux/logo_course.png" alt="curso_spl_010" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Big Data
- Cloud Computing

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Redshift   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_redshift.svg" alt="aws_redshift" width="auto" height="25">
  - Amazon Simple Storage Service (S3)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_s3.svg" alt="aws_s3" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Introduction to Amazon Redshift<br>
1.1 <a href="#item01.1">Tarefa 1: iniciar um cluster do Amazon Redshift</a><br>
1.2 <a href="#item01.2">Tarefa 2: Use o Redshift Query Editor para se comunicar com seu Redshift Cluster</a><br>
1.3 <a href="#item01.3">Tarefa 3: Criar uma tabela</a><br>
1.4 <a href="#item01.4">Tarefa 4: Carregar dados de amostra do Amazon S3</a><br>
1.5 <a href="#item01.5">Tarefa 5: Consultar dados</a><br>

---

### Objective:
O objetivo deste laboratório prático foi implementar um cluster do **Amazon Redshift**, carregar os dados de um bucket do **Amazon S3** no cluster, e então efetuar consultas nos dados armazenados no cluster.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README. 

### Development:
Este curso foi um laboratório prático realizado na plataforma **AWS Skill Builder**, cuja subscrição foi devida a uma parceria entre a **AWS** e a **Escola da Nuvem**. A infraestrutura de cloud utilizada foi fornecida através de um sandbox do **AWS Skill Builder** que possibilitava acesso ao console da **AWS**. Contudo foi necessário seguir estritamente as orientações determinadas no laboratório. Dessa maneira, a forma de interação com os recursos da cloud foram sempre através do console fornecido pelo sandbox, a não ser em casos em que o próprio laboratório instruiu para utilização de outras ferramentas de interação como **AWS CLI** ou **AWS SDK**.

O laboratório do **AWS Skill Builder** tem o foco em executar apenas o que é orientado no escopo, todos os recursos ou serviços que podem ser requisitados adicionalmente já vêm provisionados por padrão pelo laboratório. Ao iniciar o laboratório, o sandbox do **AWS Skill Builder** provisiona diversos recursos e serviços para o funcionamento através de uma ou mais pilhas do **AWS CloudFormation** de forma automática. 

O acesso ao console no sandbox do **AWS Skill Builder** é realizado por meio de uma identidade federada. O Skill Builder funciona como um provedor de identidade (IdP), autenticando o usuário e vinculando-o a uma role do **AWS IAM** provisionada automaticamente por uma das pilhas do CloudFormation. Essa role concede permissões temporárias e mínimas necessárias para a execução do laboratório, garantindo segurança e controle sobre os recursos utilizados. O laboratório, por padrão, determina a região a ser utilizada e ela não deve ser alterada, somente se o próprio laboratório indicar. As configurações não informadas no laboratório devem ser sempre mantidas como padrão que estão.

<a name="item01.1"><h4>Tarefa 1: iniciar um cluster do Amazon Redshift</h4></a>[Back to summary](#item0)

O **Amazon Redshift** é um serviço de data warehouse da cloud **AWS**. Ele é rápido e totalmente gerenciado que torna simples e econômico analisar todos os dados usando SQL padrão e ferramentas de Business Intelligence (BI) existentes. Nesta primeira tarefa do laboratório, foi provisionado um cluster que consiste em um conjunto de nós de computação, que juntos executavam um mecanismo do Redshift e continham um banco de dados. Ao iniciar um cluster, uma das opções que era especificada era o tipo de nó. O tipo de nó determina a CPU, a RAM, a capacidade de armazenamento e o tipo de unidade de armazenamento para cada nó. Os tipos de nó estão disponíveis em tamanhos diferentes. O tamanho do nó e o número de nós determinam o armazenamento total para um cluster. O cluster do Redshift provisionado ficou com a seguinte configuração:
- Identificador de cluster: `lab`.
- Tipo de nó: `dc2.large`.
- Número de nós: `2`.
- Na seção Configurações do banco de dados, foi configurado:
- Nome de usuário do administrador: `master`
- Para Senha do administrador, foi selecionado `Adicionar manualmente a senha do administrador e configurar a senha do usuário administrador`: nele foi colado o valor do item `DBPassword`, fornecido pelo próprio laboratório, sendo neste caso `SZ51Hmo4jYNm`.
- Foi selecionado `Desativar criptografia de cluster`.
- Para funções IAM associadas, foi escolhida a IAM Role `Redshift-Role`, que já tinha sido provisionada pela pilha do **AWS CloudFormation** ao iniciar o laboratório. Essa função concedia permissões para o **Amazon Redshift** ler dados do **Amazon S3** já que ele precisaria importar dados do bucket.
- Na seção Configurações adicionais foi desmarcado a opção `Usar padrões`.
  - Em Rede e segurança, foi configurado:
    - Virtual private cloud: `Lab VPC`.
    - Em `VPC security groups` foi deselecionado o default e escolhido o grupo de segurança `Redshift Security Group`.
  - Em `Configurações do banco de dados` foi configurado:
    - Nome do banco de dados: `labdb`.

A imagem 01 ilustra o cluster do Redshift criado com sucesso e com status de disponível. Esse provisionamento poderia levar alguns minutos para ser concluído.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: Use o Redshift Query Editor para se comunicar com seu Redshift Cluster</h4></a>[Back to summary](#item0)



<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<a name="item01.3"><h4>Tarefa 3: Criar uma tabela</h4></a>[Back to summary](#item0)


<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<a name="item01.4"><h4>Tarefa 4: Carregar dados de amostra do Amazon S3</h4></a>[Back to summary](#item0)






<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

<a name="item01.5"><h4>Tarefa 5: Consultar dados</h4></a>[Back to summary](#item0)

