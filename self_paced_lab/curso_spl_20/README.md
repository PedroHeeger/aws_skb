# Lab - Introduction to Amazon Aurora   <img src="./0-aux/logo_course.png" alt="curso_spl_020" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_020 (Lab - Introduction to Amazon Aurora)   <img src="./0-aux/logo_course.png" alt="curso_spl_020" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Cloud Computing
- Data

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
  - Windows Server   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows_server.png" alt="windows_server" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Aurora   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_aurora.png" alt="aws_aurora" width="auto" height="25">
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon Relational Database Service (RDS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_rds.svg" alt="aws_rds" width="auto" height="25">
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
  - Windows PowerShell   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows_power_shell.png" alt="windows_power_shell" width="auto" height="25">
- Server and Databases:
  - MySQL Server   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg" alt="mysql_server" width="auto" height="25">
- Database Administration Tool:
  - MySQL Workbench   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/mysql_workbench.png" alt="mysql_workbench" width="auto" height="25">
- Remote Desktop Software:
  - Remote Desktop Connection (RDC)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/rdc.png" alt="rdc" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Introduction to Amazon Aurora<br>
1.1 <a href="#item01.1">Tarefa 1: Criar uma instância do Amazon Aurora</a><br>
1.2 <a href="#item01.2">Tarefa 2: Efetue login na sua instância do Amazon EC2</a><br>
1.3 <a href="#item01.3">Tarefa 3: Conecte-se à sua instância do Amazon RDS</a><br>
1.4 <a href="#item01.4">Tarefa 4: Importe um arquivo de despejo SQL para seus bancos de dados</a><br>
1.5 <a href="#item01.5">Tarefa 5: Consultar os bancos de dados</a><br>

---

### Objective:
Este laboratório teve como objetivo proporcionar uma compreensão básica sobre o uso dos serviços gerenciados de bancos de dados da **AWS**, especificamente o **Amazon Relational Database Service (RDS)** e o **Amazon Aurora**. No RDS, a instância de banco de dados já estava provisionada pelo ambiente do laboratório, enquanto no Aurora, foi necessário configurá-la e provisioná-la manualmente.  

Para a conexão com os bancos de dados, foi utilizada uma instância **Amazon EC2** executando **Windows Server**, com o **MySQL Workbench** instalado. O acesso à instância do EC2 foi feito via protocolo RDP a partir de uma máquina física.  

O arquivo para a criação do banco de dados foi disponibilizado pelo laboratório em um bucket do **Amazon S3**. Ele foi importado para a instância EC2 por meio do **Windows PowerShell** e executado no **MySQL Workbench**.  

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README.
- A pasta `resource` com os arquivos utilizados.

### Development:
Este curso foi um laboratório prático realizado na plataforma **AWS Skill Builder**, cuja subscrição foi devida a uma parceria entre a **AWS** e a **Escola da Nuvem**. A infraestrutura de cloud utilizada foi fornecida através de um sandbox do **AWS Skill Builder** que possibilitava acesso ao console da **AWS**. Contudo foi necessário seguir estritamente as orientações determinadas no laboratório. Dessa maneira, a forma de interação com os recursos da cloud foram sempre através do console fornecido pelo sandbox, a não ser em casos em que o próprio laboratório instruiu para utilização de outras ferramentas de interação como **AWS CLI** ou **AWS SDK**.

O laboratório do **AWS Skill Builder** tem o foco em executar apenas o que é orientado no escopo, todos os recursos ou serviços que podem ser requisitados adicionalmente já vêm provisionados por padrão pelo laboratório. Ao iniciar o laboratório, o sandbox do **AWS Skill Builder** provisiona diversos recursos e serviços para o funcionamento através de uma ou mais pilhas do **AWS CloudFormation** de forma automática. 

O acesso ao console no sandbox do **AWS Skill Builder** é realizado por meio de uma identidade federada. O Skill Builder funciona como um provedor de identidade (IdP), autenticando o usuário e vinculando-o a uma role do **AWS IAM** provisionada automaticamente por uma das pilhas do CloudFormation. Essa role concede permissões temporárias e mínimas necessárias para a execução do laboratório, garantindo segurança e controle sobre os recursos utilizados. O laboratório, por padrão, determina a região a ser utilizada e ela não deve ser alterada, somente se o próprio laboratório indicar. As configurações não informadas no laboratório devem ser sempre mantidas como padrão que estão.

<a name="item01.1"><h4>Tarefa 1: Criar uma instância do Amazon Aurora</h4></a>[Back to summary](#item0)

Na primeira tarefa desse laboratório, o objetivo consistiu em provisionar uma instância do **Amazon Aurora** no serviços **Amazon Relational Database Service (RDS)**. O **Amazon Aurora** é um mecanismo de banco de dados relacional totalmente gerenciado e compatível com **MySQL** que combina o desempenho e a confiabilidade de bancos de dados comerciais de ponta com a simplicidade e a relação custo-benefício de bancos de dados de código aberto. Ele oferece até cinco vezes o desempenho do **MySQL** sem exigir alterações na maioria dos aplicativos existentes que usam bancos de dados **MySQL**. O **Amazon RDS** facilita a configuração, operação e dimensionamento de um banco de dados relacional na nuvem. Ele fornece capacidade redimensionável e com boa relação custo-benefício, ao mesmo tempo em que gerencia tarefas demoradas de administração de banco de dados, liberando o usuário para se concentrar em seus aplicativos e negócios. O **Amazon RDS** fornece seis mecanismos de banco de dados para escolher, incluindo **Amazon Aurora**, **Oracle**, **Microsoft SQL Server**, **PostgreSQL**, **MySQL** e **MariaDB**. O banco de dados Aurora foi provisionado no RDS com as seguintes configurações:
- Escolha um método de criação de banco de dados: `Criação Padrão`.
- Opções de mecanismo: `Aurora (compatível com MySQL)`.
- Versão do motor: `Aurora 3.05.X`.
- Modelos: `Dev/Teste`.
- Na seção Configurações foi definido o seguinte:
    - Identificador de cluster do BD: `aurora`.
    - Nome de usuário mestre: `admin`.
    - Gerenciamento de credenciais: `autogerenciado`.
    - Senha mestra: `admin123`.
    - Confirme sua senha: `admin123`.
- Na seção Configuração da instância foi definido:
    - Classe de instância de BD: classes Burstable (inclui classes t), `db.t3.medium`.
- Na seção Disponibilidade e durabilidade, para Implantação Multi-AZ, foi selecione `Não criar uma réplica do Aurora`. As implantações Multi-AZ do **Amazon RDS** fornecem disponibilidade e durabilidade aprimoradas para instâncias de banco de dados (DB), tornando-as um ajuste natural para cargas de trabalho de banco de dados de produção. Quando uma instância de banco de dados Multi-AZ é provisionada, o **Amazon RDS** cria automaticamente uma instância de banco de dados primária e replica os dados de forma síncrona para uma instância de espera em uma zona de disponibilidade (AZ) diferente.
- Na seção Conectividade foi configurado:
    - Nuvem Privada Virtual (VPC): `Lab VPC`. O **Amazon Virtual Private Cloud (VPC)** permite que sejam iniciados recursos da **AWS** em uma rede virtual que foi definida pelo usuário. Essa rede virtual se assemelha muito a uma rede tradicional que seria operada em um próprio data center, com os benefícios de usar a infraestrutura escalável da **AWS**.
    - Grupo de sub-rede do banco de dados: `aurora`. Sub-redes são segmentos do intervalo de endereços IP de uma VPC que é designada para agrupar os recursos com base em necessidades operacionais e de segurança. Um grupo de sub-redes de banco de dados (BD) é uma coleção de sub-redes (normalmente privadas) que é criada em uma VPC e designada para as instâncias de banco de dados. Um grupo de sub-redes de BD permite que seja definida uma VPC específica ao criar instâncias de BD usando a CLI ou API; se for utilizado o console, é possível simplesmente selecionar a VPC e as sub-redes que deseja-se usar. O grupo de sub-rede `aurora` tinha sido provisionado pelas pilhas do **AWS CloudFormation** quando foi iniciado o laboratório.
    - Acesso público: `Não`.
    - Grupo de segurança VPC (firewall): foi escolhido o security group `DBSecurityGroup`.
- Na seção Monitoramento: foi desmarcado `Habilitar monitoramento aprimorado`.
- A seção de Configuração adicional foi expandida para seguinte configuração:
    - Nome inicial do banco de dados: `mydb`.
- Na seção Criptografia: foi desmarcada a opção `Habilitar criptografia`. É possível criptografar as instâncias e snapshots do **Amazon RDS** em repouso habilitando a opção de criptografia para a instância de banco de dados do **Amazon RDS**. Os dados criptografados em repouso incluem o armazenamento subjacente para uma instância de banco de dados, seus backups automatizados, réplicas de leitura e snapshots.
- Na seção Manutenção: foi desmarcada a opção `Habilitar atualização automática de versão secundária`.

Se uma janela de pop-up sugerisse complementos para o Aurora, esta podia ser fechada. A instância do RDS poderia levar até 5 minutos para ser inicializada. A imagem 01 evidencia o provisionamento da instância de banco de dados **Amazon RDS** cujo mecanismo era o **Amazon Aurora** para **MySQL**.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: Efetue login na sua instância do Amazon EC2</h4></a>[Back to summary](#item0)

Na segunda tarefa, o objetivo foi se conectar remotamente a uma instância do **Amazon EC2** cujo sistema operacional era **Windows Server** e possuía o software **MySQL Workbench** instalado. Essa instância, que tinha sido provisionada pelo próprio laboratório ao iniciá-lo, também pela pilha do CloudFormation, era gerenciada pelo recurso *Fleet Manager* do **AWS System Manager (SSM)**. O **MySQL Workbench** é a ferramenta gráfica oficial do **MySQL** usada para modelagem de dados, administração de bancos e execução de consultas SQL. Após executar o login na instância, o **MySQL Workbench** foi utilizado para se conectar aos bancos de dados.

Como a conexão seria via protocolo `RDP`, já que o ambiente gráfico dessa instância **Windows Server** seria acessado remotamente, foi importante utilizar como navegador da máquina física **Windows** o **Google Chrome**, pois o Chrome suportava cópia e colagem bidirecional entre sessões RDP e a máquina local. O grupo de segurança vinculado a instância já possuía uma regra de entrada liberando a porta `3389`, que é onde o protocolo `RDP` atua. Para autenticação do usuário que faria login na instância foi necessário baixar o arquivo de chave privada no formato `.pem` do par de chaves criado e vinculado a essa instância, que era o `keypair`. O recurso `EC2 Instance Connect` do **Amazon EC2** foi utilizado para conectar-se a instância pelo próprio console. Na configuração da sessão remota, o usuário que acessaria foi mantido o padrão do SO da instância, que era `administrator`, e o arquivo de chave privada baixado foi informado. Após conectar, uma janela de pop-up perguntando se desejava permitir que o PC fosse descoberto por outros PCs e dispositivos nesta rede aparecia e a opção `Não` foi a escolhida. A imagem 02 confirma o acesso remoto gráfico executado pelo console. O mesmo acesso poderia ter sido executado direto pela máquina física **Windows** utilizando o software **Remote Desktop Connection (RDC)**, também chamado de **Conexão de Área de Trabalho Remota**.

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<a name="item01.3"><h4>Tarefa 3: Conecte-se à sua instância do Amazon RDS</h4></a>[Back to summary](#item0)

De dentro da instância **Windows Server**, o Workbench foi utilizado para se conectar ao banco de dados **Amazon Aurora** dentro do RDS, e também para se conectar ao banco de dados **MySQL** no **Amazon RDS**. Esse segundo banco de dados foi provisionado automaticamente pelas pilhas do CloudFormation ao iniciar o laboratório. Para isso, foi necessário copiar os endpoits desses dois bancos de dados (`aurora` e `mysql`). 

Um endpoint é representado como uma URL específica do Aurora que contém um endereço de host e uma porta. Os seguintes tipos de endpoints estão disponíveis em um cluster de Aurora DB:
- Cluster endpoint: 
    - O Cluster Endpoint de um **Amazon Aurora DB Cluster** sempre se conecta à instância primária do banco de dados. Esse endpoint é o único que pode executar operações de gravação, como instruções DDL. Por isso, ele é utilizado ao configurar um cluster pela primeira vez ou quando o cluster possui apenas uma única instância de banco de dados.
    - Cada cluster do **Aurora DB** possui um Cluster Endpoint e uma instância primária. Esse endpoint é responsável por todas as operações de gravação no banco de dados, incluindo inserções, atualizações, exclusões e alterações de DDL. Também pode ser utilizado para operações de leitura, como consultas SQL.
    - O Cluster Endpoint oferece suporte a failover para conexões de leitura e gravação. Caso a instância primária falhe, o Aurora realiza o failover automaticamente para uma nova instância primária. Durante esse processo, o Cluster Endpoint continua a direcionar as conexões para a nova instância, minimizando interrupções no serviço.
    - O exemplo a seguir ilustra um ponto de extremidade de cluster para um cluster de banco de dados Aurora MySQL: `mydbcluster.cluster-123456789012.us-east-1.rds.amazonaws.com:3306`
- Reader endpoint:
    - O Reader Endpoint de um **Amazon Aurora DB Cluster** conecta-se a uma das réplicas Aurora disponíveis no cluster. Cada cluster do Aurora possui um Reader Endpoint. Se houver múltiplas réplicas, esse endpoint distribui as conexões entre elas de forma automática.
    - O Reader Endpoint oferece suporte a balanceamento de carga para conexões somente leitura. Ele deve ser utilizado para operações de consulta (SELECT), mas não suporta gravação.
    - O cluster distribui as solicitações de conexão feitas ao Reader Endpoint entre as réplicas Aurora disponíveis.
        - Se o cluster possuir apenas uma instância primária e nenhuma réplica, o Reader Endpoint encaminhará as conexões para a instância primária.
        - Caso existam múltiplas réplicas, as conexões serão balanceadas entre elas para otimizar o desempenho.
    - O exemplo a seguir ilustra um ponto de extremidade do leitor para um cluster de banco de dados Aurora MySQ: `mydbcluster.cluster-ro-123456789012.us-east-1.rds.amazonaws.com:3306`

Ao abrir o Workbench, uma mensagem avisando "Sistema operacional não suportado" aparecia. Nessa mensagem, foi marcada `Don't show this message again` e confirmada com `OK`. Isso não afetaria o uso do Workbench. Dentro dele, na opção `MySQL Connections`, uma nova conexão de banco de dados foi criada com a seguinte configuração:
- Nome da conexão: `aurora`.
- Nome do host: foi utilizado o endpoint copiado do **Amazon Aurora**.
- Nome de usuário: `admin`.
- Foi selecionado `Armazenar no Vault` e informado:
    - Senha: `admin123`.

Em seguida, também foi criada uma conexão com o banco de dados **MySQL** no **Amazon RDS**. As configurações foram as seguintes:
- Nome da conexão: `MySQL`.
- Nome do host: foi utilizado o endpoint copiado do **Amazon RDS**.
- Nome de usuário: `admin`.
- Foi selecionado `Armazenar no Vault` e informado:
    - Senha: `admin123`. Essa senha foi fornecida pelo parâmetro `DBUserPasswd` nas instruções desse lab, já que esse tinha sido um banco de dados provisionado pelo próprio laboratório.

A imagem 03 ilustra as duas conexões em cada banco de dados realizadas com sucesso. Uma observação importante era que para que essa conexão fosse efetuada, o grupo de segurança vinculado as instâncias dos dois bancos de dados **Amazon Aurora** e **Amazon RDS**, ambos com sistema de gerenciamento **MySQL**, precisva ter uma regra de entrada liberando a porta `3306` (porta padrão do **MySQL**) para todos os usuários (IP `0.0.0.0/0`) ou para o IP público da minha máquina física **Windows**.

<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<a name="item01.4"><h4>Tarefa 4: Importe um arquivo de despejo SQL para seus bancos de dados</h4></a>[Back to summary](#item0)

Nesta tarefa, o arquivo SQL [sql.sql](./) foi importado para os dois bancos de dados. Para isso, na instância do **Amazon EC2** acessada remotamente foi aberto o **Windows PowerShell** e executado o seguinte comando `Invoke-WebRequest https://s3-us-west-2.amazonaws.com/aws-tc-largeobjects/SPLs/sharedDatabases/world.sql -OutFile c:\\Users\\Administrator\\Desktop\\world.sql`. Esse comando enviava o arquivo SQL de um bucket do **Amazon S3** para a instância **Windows Server**, armazenando o arquivo na área de trabalho, conforme imagem 04.

<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

De volta ao Workbench aberto nessa instância, a janela de consulta para o banco de dados foi exibida. Na opção `Gerenciamento` foi escolhido `Importação/Restauração de Dados`. Em seguida, em `Opções de importação` foi selecionado `Importar de arquivo independente`, o botão de reticências foi clicado e o arquivo SQL na área de trabalho foi selecionado. Após término da importação, no painel esquerdo do Workbench a aba `Esquemas` foi escolhida e realizada uma atualização. A imagem 05 mostra que agora existia um banco de dados de nome `world`.

<div align="Center"><figure>
    <img src="./0-aux/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

Isso tinha sido feito para a conexão com o banco de dados **Amazon RDS**. Agora, o mesmo processo foi realizado, utilizando o mesmo arquivo, para o **Amazon Aurora**. A imagem 06 evidencia a existência do banco de nome `world` no Aurora.

<div align="Center"><figure>
    <img src="./0-aux/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>

<a name="item01.5"><h4>Tarefa 5: Consultar os bancos de dados</h4></a>[Back to summary](#item0)

Em cada um dos serviços de bancos de dados **Amazon RDS** e **Amazon Aurora**, a mesma abaixo foi criada e executada para exibir da tabela `city` todas as cidades com população maior que 10 mil ordenado por código do país. A imagem 07 e 08 mostra o resultado desse comando nos dois serviços da **AWS**.

```sql
select * from world.city where Population > 10000
Order by CountryCode;
```
<div align="Center"><figure>
    <img src="./0-aux/img07.png" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="./0-aux/img08.png" alt="img08"><br>
    <figcaption>Imagem 08.</figcaption>
</figure></div><br>