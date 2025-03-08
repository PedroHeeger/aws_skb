# Lab - Manage NoSQL Databases with Amazon DocumentDB   <img src="./0-aux/logo_course.png" alt="curso_spl_034" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_034 (Lab - Manage NoSQL Databases with Amazon DocumentDB)   <img src="./0-aux/logo_course.png" alt="curso_spl_034" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Cloud Computing
- Data

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon DocumentDB   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_documentdb.svg" alt="aws_documentdb" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
  - Python   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="python" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Code-Server   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/code-server.png" alt="code-server" width="auto" height="25">
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Command Line Interpreter (CLI):
  - Mongo Shell (Mongosh)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/mongodb.svg" alt="mongosh" width="auto" height="25">
- Server and Databases:
  - MongoDB   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/mongodb.svg" alt="mongodb" width="auto" height="25">
- Tools:
  - Yellowdog Updater Modified (YUM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/yum.jpg" alt="yum" width="auto" height="25">
- Library:
  - PyMongo   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/frame_library/pymongo.png" alt="pymongo" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Manage NoSQL Databases with Amazon DocumentDB<br>
1.1 <a href="#item01.1">Tarefa 1: Criar um cluster do Amazon DocumentDB</a><br>
1.2 <a href="#item01.2">Tarefa 2: Executar operações de banco de dados usando o shell Mongo</a><br>
1.3 <a href="#item01.3">Tarefa 3: Executar operações de banco de dados usando o SDK</a><br>

---

### Objective:
Este laboratório teve como objetivo configurar um cluster no **Amazon DocumentDB**, conectar-se a ele, e executar operações CRUD básicas usando o **Mongo Shell** e um script **Python** com a biblioteca **PyMongo**.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README.
- A pasta `resource` com os arquivos utilizados.

### Development:
Este curso foi um laboratório prático realizado na plataforma **AWS Skill Builder**, cuja subscrição foi devida a uma parceria entre a **AWS** e a **Escola da Nuvem**. A infraestrutura de cloud utilizada foi fornecida através de um sandbox do **AWS Skill Builder** que possibilitava acesso ao console da **AWS**. Contudo foi necessário seguir estritamente as orientações determinadas no laboratório. Dessa maneira, a forma de interação com os recursos da cloud foram sempre através do console fornecido pelo sandbox, a não ser em casos em que o próprio laboratório instruiu para utilização de outras ferramentas de interação como **AWS CLI** ou **AWS SDK**.

O laboratório do **AWS Skill Builder** tem o foco em executar apenas o que é orientado no escopo, todos os recursos ou serviços que podem ser requisitados adicionalmente já vêm provisionados por padrão pelo laboratório. Ao iniciar o laboratório, o sandbox do **AWS Skill Builder** provisiona diversos recursos e serviços para o funcionamento através de uma ou mais pilhas do **AWS CloudFormation** de forma automática. 

O acesso ao console no sandbox do **AWS Skill Builder** é realizado por meio de uma identidade federada. O Skill Builder funciona como um provedor de identidade (IdP), autenticando o usuário e vinculando-o a uma role do **AWS IAM** provisionada automaticamente por uma das pilhas do CloudFormation. Essa role concede permissões temporárias e mínimas necessárias para a execução do laboratório, garantindo segurança e controle sobre os recursos utilizados. O laboratório, por padrão, determina a região a ser utilizada e ela não deve ser alterada, somente se o próprio laboratório indicar. As configurações não informadas no laboratório devem ser sempre mantidas como padrão que estão.

<a name="item01.1"><h4>Tarefa 1: Criar um cluster do Amazon DocumentDB</h4></a>[Back to summary](#item0)

A tarefa inicial deste laboratório consistiu em provisionar um cluster no **Amazon DocumentDB** com o nome `mydocdb` e uma segunda instância para redundância em uma zona de disponibilidade adicional. Assim como em outros serviços de bancos da **AWS**, antes provisionar o cluster ou instância, é ideal criar logo o o grupo de sub-rede com as sub-redes que serão utilizadas por esses elementos. Dessa forma, no próprio console do DocumentDB foi construído o grupo de sub-redes com as seguintes configurações:
- `Name` (Nome): `labdbsubnetgroup`.
- `Description` (Descrição): `Subnet group for mydocdb`.
- `VPC`: `Lab VPC`.
- `Subnetes` (Sub-redes): foi selecionado `Add all the subnets related to this VPC` (Adicionar todas as sub-redes relacionadas a esta VPC). Esta VPC possuía apenas duas sub-redes (uma pública e uma privada).

A imagem 01 exibe o subnet group criado com as sub-redes privadas da `Lab VPC`.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

Após a criação do grupo de sub-redes, o cluster do DocumentDB foi provisionado da seguinte forma:
- `Cluster identifier` (Identificador de cluster): `mydocdb`.
- `Instance configuration` (Configuração de instância):
    - `Number of instances` (Número de instâncias): `1`.
- `Autentication` (Autenticação): 
    - `Username` (Nome de usuário): foi utilizado o valor do parâmetro `DocDbUsername` nas instruções do lab (`dbadmin`).
    - `Self managed` (Autogerenciado):
        - `Password` (Senha): foi utilizado o valor do parâmetro `MasterPassword` nas instruções do lab (`fj6QlO8fYtGL`).
        - `Confirm password` (Confirmar Senha): foi utilizado o valor do parâmetro `MasterPassword` nas instruções do lab (`fj6QlO8fYtGL`). Uma senha simples foi usada aqui para simplificar este laboratório. Em um cenário do mundo real, a recomendação é usar o serviço **AWS Secrets Manager**.
- `Show advanced settings` (Mostrar configurações avançadas):
    - `Network settings` (Configurações de rede):
        - `Virtual Private Cloud (VPC)` (Nuvem Privada Virtual (VPC)): `Lab VPC`.
        - `Subnet group` (Grupo de sub-rede): `labdbsubnetgroup`.
        - `VPC security groups` (grupos de segurança VPC): foi selecionado `Lab Workspace SG (VPC)` e desmarcado o grupo de segurança padrão.

A criação do cluster levou alguns minutos para ser concluída. A imagem 02 mostra o status da criação do cluster no console do **Amazon DocumentDB** como `Available` (Disponível).

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

O cluster existente continha apenas uma única instância. Para redundância e desempenho, mais instâncias podiam ser adicionadas. Para simplificar, apenas uma segunda instância foi adicionada neste laboratório. Para isso, o cluster `mydocdb` foi selecionado e em `Actions` (Ações) foi escolhida a opção `Add instance` (Adicionar instâncias) e configurada da seguinte forma:
- `Instance class` (Classe de instância): `db.t3.medium`.
- Todas as outras configurações foram mantidas com seus valores padrão.

A imagem 03 evidencia o provisionamento da segunda instância. Note que ela tinha a mesma região da primeira instância, mas a zona de dispobilidade era diferente. Cada instância foi provisionada em uma sub-rede do subnet group, onde cada sub-rede estava em uma AZ diferente.

<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

Nas duas próximas tarefas foi necessário se conectar ao banco de dados do DocumentDB através do **Mongo Shell** e do **PyMongo**. Em ambos os casos foi preciso obter os comandos de conexão. Isso foi feito acessando o cluster `mydocdb`, localizando a seção `Connect` (Conectar) e copiando os três comandos longos listados, conforme mostrado na imagem 04. Também foi necessário baixar o certificado da Autoridade de Certificação (CA) do **Amazon DocumentDB** para poder autenticar o cluster. No segundo e terceiro comando, o password definido pelo parâmetro do lab `MasterPassword` foi passado (`fj6QlO8fYtGL`). O nome de usuário já vinha definido nos comandos. Abaixo são listados os três comandos:
- `wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem`: Download the Amazon DocumentDB Certificate Authority (CA) certificate required to authenticate to your cluster (Baixe o certificado da Autoridade de Certificação (CA) do Amazon DocumentDB necessário para autenticação no seu cluster).
- `mongosh mydocdb.cluster-cqw3on8gcnoh.us-west-2.docdb.amazonaws.com:27017 --tls --tlsCAFile global-bundle.pem --retryWrites=false --username dbadmin --password fj6QlO8fYtGL`: Connect to this cluster with the mongo shell (Conecte-se a este cluster com o shell mongo)
- `mongodb://dbadmin:fj6QlO8fYtGL@mydocdb.cluster-cqw3on8gcnoh.us-west-2.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false`: Connect to this cluster with an application (Conecte-se a este cluster com um aplicativo).

<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

Ambas as conexões seriam feitas a partir de uma instância do **Amazon EC2** que já tinha sido provisionada pelas pilhas do CloudFormation ao iniciar o laboratório. Portanto, o grupo de segurança vinculado ao cluster do DocumentDB deveria permitir o tráfego na porta `27017` (porta em que o DocumentDB opera) para o grupo de segurança da instância EC2, cujo nome era `Lab Workspace SG`, elaborando uma regra de entrada. A imagem 05 exibe a regra criada no security group do cluster. Pode ser um pouco confuso, mais ambos tinha o mesmo grupo de segurança, e mesmo assim a regra precisou ser criada, no qual o próprio security group permitia acessado na porta `27017` para o mesmo security group.

<div align="Center"><figure>
    <img src="./0-aux/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: Executar operações de banco de dados usando o shell Mongo</h4></a>[Back to summary](#item0)

Na segunda tarefa, o objetivo foi conectar-se ao banco de dados no **Amazon DocumentDB** utilizando o **Mongo Shell** e executar operações básicas de CRUD. A instância EC2 provisionada já possuía instalada uma IDE configurada com os pacotes necessários para usar o shell do **MongoDB**. Essa IDE era **Code-Server**, uma versão do **VS Code** para servidores, e ela era apontada em uma distribuição do **Amazon CloudFront**. O laboratório forneceu a URL dessa distribuição do CloudFront já com a pasta `environment` aberta no **Code-Server** através do parâmetro `LabWorkspaceURL` nas instruções (`https://d3aayywxp6yb02.cloudfront.net/?folder=/home/ec2-user/environment`). Ao acessar, era necessário informar uma senha que tinha sido a mesma utilizada no banco de dados, cujo valor era informado no parâmetro `MasterPassword` (`fj6QlO8fYtGL`). 

No terminal da IDE, o primeiro comando de conexão copiado foi executado (`wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem`) para baixar o CA do **Amazon DocumentDB** necessário para autenticação no cluster. Esse arquivo (`global-bundle.pem`) era baixado e armazenado no diretório `environment` aberto na IDE. Em seguida, o segundo comando copiado e editado com o password foi executado (`mongosh mydocdb.cluster-cqw3on8gcnoh.us-west-2.docdb.amazonaws.com:27017 --tls --tlsCAFile global-bundle.pem --retryWrites=false --username dbadmin --password fj6QlO8fYtGL`). Esse comando utilizava o **Mongo Shell (Mongosh)** para fazer a conexão. Entretanto, esse software não estava instalado na instância como informava o laboratório. Dessa forma, antes de executar o comando de conexão foi necessário baixar e instalar o Mongosh. Para isso, primeiro foi executado o comando abaixo que adicionava o repositório oficial do **MongoDB** para o **Mongo Shell**. Em seguida, com o comando `sudo yum install -y mongodb-shell` o shell do **Mongo** era instalado. Foi utilizado o gerenciador de pacotes **Yum**, pois a instância era um **Amazon Linux**. Para confirmar se tinha sido instalado, foi executado o comando `mongo --version`. Após confirmação, o comando de conexão foi executado.

```bash
echo "[mongodb-shell-org]
name=MongoDB Shell
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-shell/5.0/x86_64/
gpgcheck=1
enabled=1" | sudo tee /etc/yum.repos.d/mongodb-shell.repo
```

A imagem 06 comprava que a conexão com o banco de dados do DocumentDB foi estabelecida. 

<div align="Center"><figure>
    <img src="./0-aux/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>

A etapa seguinte foi executar comandos de banco de dados para realizar as operações de CRUD (Create, Read, Update, Delete). A lista a seguir mostra os comandos executados na ordem:
- Create: Acessava um banco de dados existente de nome determinado. Caso não encontrasse esse banco de dados, ele criava o banco. -> `use mydb`.
- Create: Inseria um único elemento no banco de dados -> `db.collection.insert({"hello":"DocumentDB"})`
- Read: Lia apenas um único documento no banco de dados -> `db.collection.findOne()`
- Create: Inseria uma lista de documentos na coleçao criada de nome `profiles` ->
```javascript
db.profiles.insertMany([
                    { "_id" : 1, "name" : "Matt", "status": "active", "level": 12, "score":202},
                    { "_id" : 2, "name" : "Frank", "status": "inactive", "level": 2, "score":9},
                    { "_id" : 3, "name" : "Karen", "status": "active", "level": 7, "score":87},
                    { "_id" : 4, "name" : "Katie", "status": "active", "level": 3, "score":27}
                    ])
```
- Read: Lia apenas um único documento no banco de dados utilizando um filtro -> `db.profiles.find({name: "Katie"})`
- Update: Localizava e modificava o valor de um atributo de um documento de uma coleção ->
```javascript
db.profiles.findAndModify({
                query: { name: "Matt", status: "active"},
                update: { $inc: { score: 10 } }
            })
```
- Read: Lia apenas um único documento no banco de dados utilizando um filtro para ver se o dado tinha sido alterado -> `db.profiles.find({name: "Matt"})`
- Para sair do shell do Mongo -> `exit`

A imagem 07 exibe os comandos executados no banco de dados DocumentDB através do **Mongo Shell (Mongosh)**.

<div align="Center"><figure>
    <img src="./0-aux/img07.png" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>

<a name="item01.3"><h4>Tarefa 3: Executar operações de banco de dados usando o SDK</h4></a>[Back to summary](#item0)

Na última tarefa, foi utilizado a biblioteca do **Python**, **PyMongo**, para criar um script que se conectava ao cluster `mydocdb` do **Amazon DocumentDB** e executava algumas das operações de CRUD realizadas na tarefa 2. Dessa forma, no **Code-Server** disponibilizada pela instância do **Amazon EC2**, um novo arquivo foi elaborado cujo nome era [DocDBCRUD.py](./resource/DocDBCRUD.py). Neste arquivo, na variável `client` foi necessário passar o caminho de conexão com a senha para o banco de dados. Esse caminho foi o terceido comando copiado no console do DocumentDB (`mongodb://dbadmin:fj6QlO8fYtGL@mydocdb.cluster-cqw3on8gcnoh.us-west-2.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false`). Em seguida, com o comando `python3 DocDBCRUD.py` inserido no terminal, o código foi executado com sucesso.

Sobre o script, basicamente ele estabelecia uma conexão e, em seguida, anexava ao banco de dados e à coleção existentes que foram criados usando o shell na tarefa anterior (`mydb` e `profiles`). Depois disso, ele adicionava um novo player e, em seguida, listava todos os players na coleção `profiles`. Como desafio foi solicitado que um registro dessa mesma coleção fosse removido. Para isso, no mesmo arquivo de script, após a listagem de todos os players já com o novo player, o seguinte trecho de código foi adicionado. Este trecho removia o exatamente o mesmo player adicionado e imprimia a lista atualizada. A imagem 08 ilustra a execução do código, mostrando os dois momentos, pós adição do player e pós remoção do player.

```python
##Remove an additional player record
col.delete_one({ "_id" : 5, "name" : "Ahmed", "status": "active", "level": 8, "score": 93})
time.sleep(2)

##Print the new full list 2
print("The full list of post-removal players is now")
for player in col.find():
    print(player)
```

<div align="Center"><figure>
    <img src="./0-aux/img08.png" alt="img08"><br>
    <figcaption>Imagem 08.</figcaption>
</figure></div><br>