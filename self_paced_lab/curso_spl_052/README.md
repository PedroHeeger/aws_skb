# Lab - Working with AWS CodeCommit   <img src="./0-aux/logo_course.png" alt="curso_spl_052" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_052 (Lab - Working with AWS CodeCommit)   <img src="./0-aux/logo_course.png" alt="curso_spl_052" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Cloud Computing
- Developer

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Linux Distribution:
  - Amazon Linux   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/amazon_linux.png" alt="amazon_linux" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - AWS CodeCommit  <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_codecommit.svg" alt="aws_codecommit" width="auto" height="25">
  - AWS Systems Manager (SSM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ssm.png" alt="aws_ssm" width="auto" height="25">
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
- Command Line Interpreter (CLI):
  - Bash e Sh   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="bash_sh" width="auto" height="25">
  - Git Bash   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/git_bash.svg" alt="git_bash" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Working with AWS CodeCommit<br>
1.1 <a href="#item01.1">Tarefa 1: Criar um repositório do AWS CodeCommit</a><br>
1.2 <a href="#item01.2">Tarefa 2: conectar-se à instância do Amazon EC2</a><br>
1.3 <a href="#item01.3">Tarefa 3: Criar um repositório local usando Git</a><br>
1.4 <a href="#item01.4">Tarefa 4: Fazendo uma alteração no código e primeiro confirmando no repositório</a><br>
1.5 <a href="#item01.5">Tarefa 5: Envie seu primeiro commit</a><br>

---

### Objective:
Este laboratório teve como objetivo provisionar um repositório de código no **AWS CodeCommit**, criar um repositório local com **Git** em uma instância **Linux** do **Amazon EC2** acessada remotamente com o **AWS Systems Manger**, elaborar dois arquivos de texto nesse repositório local e enviá-los para o repositório remoto, mantendo ambos sincronizados.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README.

### Development:
<a name="item01.1"><h4>Tarefa 1: Criar um repositório do AWS CodeCommit</h4></a>[Back to summary](#item0)

Na primeira tarefa do laboratório foi construído um repositório de código no serviço **AWS CodeCommit**, configurando da seguinte maneira:
- `Repository name` (Nome do repositório): `My-Repo`.
- `Description` (Descrição): `My first repository`.

A imagem 01 mostra o repositório remoto no **AWS CodeCommit**.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: conectar-se à instância do Amazon EC2</h4></a>[Back to summary](#item0)

Uma instância do **Amazon EC2** já tinha sido provisionada pelas pilhas do **AWS CloudFormation** ao iniciar o lab. Essa instância foi utilizada para estabelecer uma conexão remota utilizando o recurso *Session Manager* do **AWS Systems Manager (SSM)**. O laboratório facilitou o trabalho fornecendo a URL desse acesso remoto no parâmetro `Ec2InstanceSessionUrl` nas instruções (`https://us-east-1.console.aws.amazon.com/systems-manager/session-manager/i-0e33fd01271127160`). Uma nova aba foi aberta com terminal com uma sessão **Bash** iniciada no usuário `ec2-user`, conforme exibido na imagem 02.

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<a name="item01.3"><h4>Tarefa 3: Criar um repositório local usando Git</h4></a>[Back to summary](#item0)

Na sessão do terminal, o comando `sudo yum install -y git` foi executado para instalar o **Git**. Em seguida, com os comandos `git config --global credential.helper '!aws codecommit credential-helper $@'` e `git config --global credential.UseHttpPath true` foi configurado o auxiliar de credenciais do **Git** com o perfil de credenciais da **AWS** e permitido que o auxiliar de credenciais do **Git** enviasse o caminho para os repositórios. Para clonar o repositório remoto localmente foi utilizado o comando `git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/My-Repo`, passando a URL do repositório remoto obtido no console do CodeCommit. A imagem 03 evidencia que o clone do repositório remoto foi realizado para o repositório local na instância do **Amazon EC2**.

<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<a name="item01.4"><h4>Tarefa 4: Fazendo uma alteração no código e primeiro confirmando no repositório</h4></a>[Back to summary](#item0)

A tarefa 4 consistiu em fazer alterações no repositório local para que ele estivesse a frente do repositório remoto. Primeiro, foi executado o comando `cd ~/My-Repo` para entrar na pasta do repositório local. Depois, esses dois comandos foram executados para criar dois arquivos de texto no repositório local (`echo "The domestic cat (Felis catus or Felis silvestris catus) is a small, usually furry, domesticated, and carnivorous mammal." >cat.txt` e `echo "The domestic dog (Canis lupus familiaris) is a canid that is known as man's best friend." >dog.txt`). Com o comando `ls` os arquivos foram listados dentro do repositório local. Para adicionar os arquivos criados a área de staging (ou índice) do **Git** foi executado o comando `git add cat.txt dog.txt`. Com o comando `git status` foi mostrado o estado atual do repositório local, listando os arquivos adicionados ao índice e que precisavam ser commitados. Com o comando `git commit -m "Added cat.txt and dog.txt"` foi criado um novo commit do que estava na área de staging, determinando a seguinte mensagem para identificação do commit `Added cat.txt and dog.txt`. Por fim, com o comando `git log` foram visualizados os detalhes sobre o commit que acabou de ser feito. A imagem 04 apresenta o output de todos esses comandos **Git** executados na sessão **Bash** da instância EC2.

<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

<a name="item01.5"><h4>Tarefa 5: Envie seu primeiro commit</h4></a>[Back to summary](#item0)

Na última tarefa foi realizado o envio do commit do repositório local para o repositório remoto com o comando `git push -u origin master`, conforme imagem 05. Ao acessar o repositório remoto pelo console do **AWS CodeCommit**, os arquivos criados no repositório local foram visualizados, conforme exibido na imagem 06.

<div align="Center"><figure>
    <img src="./0-aux/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="./0-aux/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>