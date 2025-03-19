# Lab - Introduction to Amazon Relational Database Service (RDS) - SQL Server   <img src="./0-aux/logo_course.png" alt="curso_spl_036" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_036 (Lab - Introduction to Amazon Relational Database Service (RDS) - SQL Server)   <img src="./0-aux/logo_course.png" alt="curso_spl_036" width="auto" height="25"></a>

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
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon Relational Database Service (RDS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_rds.svg" alt="aws_rds" width="auto" height="25">
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
  - Microsoft SQL Server Command Line (sqlcmd)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/microsoft_sql_server.svg" alt="sqlcmd" width="auto" height="25">
- Server and Databases:
  - Microsoft SQL Server   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/microsoft_sql_server.svg" alt="microsoft_sql_server" width="auto" height="25">
- Database Administration Tool:
  - Microsoft SQL Server Management Studio (SSMS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/microsoft_ssms.png" alt="microsoft_ssms" width="auto" height="25">
- Remote Desktop Software:
  - Remote Desktop Connection (RDC)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/rdc.png" alt="rdc" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Introduction to Amazon Relational Database Service (RDS) - SQL Server<br>
1.1 <a href="#item01.1">Tarefa 1: iniciar uma instância do Amazon RDS</a><br>
1.2 <a href="#item01.2">Tarefa 2: Efetue login na sua instância do Amazon EC2</a><br>
1.3 <a href="#item01.3">Tarefa 3: Acesse seu banco de dados local via Microsoft SQL Server Management Studio</a><br>
1.4 <a href="#item01.4">Tarefa 4: Acessar a instância do RDS via Microsoft SQL Server Management Studio</a><br>
1.5 <a href="#item01.5">Tarefa 5: Exportar AdventureWorks do SQL Server no Amazon EC2 para o Amazon RDS</a><br>

---

### Objective:
Este laboratório teve como objetivo provisionar uma instância do **Microsoft SQL Server** no **Amazon Relational Database Service (RDS)**, acessar remotamente de forma gráfica uma instância **Windows Server** no **Amazon EC2** e utilizar o **Microsoft SQL Server Management Studio (SSMS)** para se conectar tanto a um banco de dados local quanto ao banco provisionado na **AWS**. Por fim, realizar a migração dos dados do banco local para o banco na nuvem.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README.

### Development:
Este curso foi um laboratório prático realizado na plataforma **AWS Skill Builder**, cuja subscrição foi devida a uma parceria entre a **AWS** e a **Escola da Nuvem**. A infraestrutura de cloud utilizada foi fornecida através de um sandbox do **AWS Skill Builder** que possibilitava acesso ao console da **AWS**. Contudo foi necessário seguir estritamente as orientações determinadas no laboratório. Dessa maneira, a forma de interação com os recursos da cloud foram sempre através do console fornecido pelo sandbox, a não ser em casos em que o próprio laboratório instruiu para utilização de outras ferramentas de interação como **AWS CLI** ou **AWS SDK**.

O laboratório do **AWS Skill Builder** tem o foco em executar apenas o que é orientado no escopo, todos os recursos ou serviços que podem ser requisitados adicionalmente já vêm provisionados por padrão pelo laboratório. Ao iniciar o laboratório, o sandbox do **AWS Skill Builder** provisiona diversos recursos e serviços para o funcionamento através de uma ou mais pilhas do **AWS CloudFormation** de forma automática. 

O acesso ao console no sandbox do **AWS Skill Builder** é realizado por meio de uma identidade federada. O Skill Builder funciona como um provedor de identidade (IdP), autenticando o usuário e vinculando-o a uma role do **AWS IAM** provisionada automaticamente por uma das pilhas do CloudFormation. Essa role concede permissões temporárias e mínimas necessárias para a execução do laboratório, garantindo segurança e controle sobre os recursos utilizados. O laboratório, por padrão, determina a região a ser utilizada e ela não deve ser alterada, somente se o próprio laboratório indicar. As configurações não informadas no laboratório devem ser sempre mantidas como padrão que estão.

<a name="item01.1"><h4>Tarefa 1: iniciar uma instância do Amazon RDS</h4></a>[Back to summary](#item0)

Na primeira tarefa do laboratório, o objetivo foi provisionar a instância RDS com banco de dados **Microsoft SQL Server**. As configurações foram definidas da seguinte forma:
- `Engine type` (Tipo de mecanismo): **Microsoft SQL Server**. Uma seleção de mecanismos de banco de dados foi apresentada. O **Amazon RDS** suporta muitos bancos de dados diferentes e várias versões de cada banco de dados. Neste lab, foi utilizado a versão *Express Edition* do SQL Server. Esta edição tem a License Included, o que significa que o custo da licença do banco de dados do SQL Server está incluído na taxa horária do banco de dados do **Amazon RDS**. Também é possível Bring Your Own License (BYOL) para o **Amazon RDS**.
- `Settings` (Configurações):
    - `DB cluster identifier` (Identificador do cluster do BD): `my-rds`.
    - `Credentials Settings` (Configurações de credenciais):
        - `Master username` (Nome de usuário Master): `student` (estudante).
        - `Credentials management` (Gerenciamento de credenciais): `Self managed` (Autogerenciado):
            - `Master Password` (Senha mestra): foi utilizado o valor do parâmetro `RDSPassword` fornecido nas instruções deste lab (`oRgm9RSUp89G`).
            - `Confirm master password` (Confirmar senha mestra): foi utilizado o valor do parâmetro `RDSPassword` fornecido nas instruções deste lab (`oRgm9RSUp89G`).
- `Instance configuration` (Configuração da instância):
    - `DB instance class` (Classe da instância de BD): `Burstable classes (includes t classes)` (Classes Burstable (inclui classes t)):
        - `Class type` (Tipo de classe): `db.t3.medium`. 
- `Connectivity` (Conectividade):
    - `Virtual private cloud (VPC)` (Nuvem privada virtual (VPC)): `Lab VPC`.
    - `Public access` (Acesso público): `Yes` (Sim).
    - `VPC security group (firewall)` (Grupo de segurança VPC (firewall)): `Choose existing` (Escolher existente):
        - Foi selecionado o security group: `RDS Security Group` (Grupo de Segurança RDS).
        - Foi removido o security group: `default`. 
- `Monitoring` (Monitoramento):
    - `Additional monitoring settings` (Configurações adicionais de monitoramento):
        - Foi desmarcado `Enable Enhanced monitoring` (Habilitar monitoramento avançado).
- `Additional configuration` (Configuração adicional):
    - Foi desmarcado `Enable automated backups` (Habilitar backups automatizados). Aqui o backup de banco de dados estava sendo desabilitado neste laboratório para que fosse possível progredir no laboratório sem ter que esperar a conclusão de um backup. No mundo real, nunca deve ser desabilitado backups de banco de dados. Essa opção, na realidade, não foi encontrada, portanto o backup foi mantido com a configuração padrão cujo período de retenção (`Backup retention period`) é de 7 dias.

O provisionamento demorava cerca de 20 minutos para ser efetuado. No entanto, o próprio laboratório já tinha provisionado uma instância igualzinha a essa ao iniciá-lo, cujo nome era `lab`. Dessa forma, não foi preciso executar de fato o provisionamento. A imagem 01 exibe a instância já provisionada com exatamente essas configurações acima.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: Efetue login na sua instância do Amazon EC2</h4></a>[Back to summary](#item0)

Para simular um ambiente local foi utilizado uma instância do **Amazon Elastic Compute Cloud (EC2)** **Windows Server** com o software **Microsoft SQL Server Management Studio (SSMS)** instalado na máquina. Esse software é o administrador de banco de dados padrão para **Microsoft SQL Server** e **Azure SQL Database**. Ele possuí uma interface gráfica do usuário (GUI) para interagir com os bancos de dados, exatamente por isso que o sistema operacional escolhido da instância foi um **Windows Server**, para conseguir fazer um acesso remoto gráfico e utilizar o software. Entretanto, existe a ferramenta de linha de comando **Microsoft SQL Server Command Line (sqlcmd)**, caso a interação com o banco de dados não necessite de uma interface gráfica.

Sendo assim, nesta tarefa 2, o objetivo consistiu em acessar remotamente de forma gráfica a instância do **Amazon EC2** **Windows Server** utilizando o recurso *Fleet Manager* do **AWS Systems Manager (SSM)**. O laboratório facilitou o trabalho fornecendo a URL para conexão remota no valor do seu parâmetro `Ec2InstanceSessionRDP` (`https://us-east-1.console.aws.amazon.com/systems-manager/managed-instances/rdp-connect?region=us-east-1&instances=i-0fb14426d28e8f31d`). O navegador utilizado para acesso ao console **AWS** foi **Google Chrome**, pois ele era o único que oferece suporte à cópia e colagem biderecional entre sessões RDP e a máquina física local **Windows**. Caso, não queira se conectar utilizando o *Fleet Manager*, também era possível utilizar o software na máquina física, **Remote Desktop Connection (RDC)**, conhecido também como Conexão de Área de Trabalho Remota. 

Em ambos os casos, seria necessário o arquivo de chave privada, no formato `.pem`, do par de chaves vinculado a instância EC2, para autenticar o usuário que faria acesso na instância. Esse arquivo, fornecido nas instruções do lab, foi baixado na máquina física. Em seguida, o console do **AWS SSM** foi aberto e o recurso *Fleet Manager* acessado. A instância **Windows Server** fazia parte dessa frota de instância que era gerenciada pelo SSM. Ao selecionar a instância e escolher conectar, a configuração para sessão RDP era solicitada:
- `Authentication type` (Tipo de autenticação): `Key pair` (Par de chaves).
- `Administrator account name` (Nome do administrador da conta): `Administrator` (Administrador).
- `Key pair content` (Conteúdo do par de chaves): o arquivo de chave privada baixado na máquina local foi selecionado para ser enviado (`Ec2KeyPair-PEM`).

Assim a conexão remota de forma gráfica era estabelecida com a instância EC2, conforme evidenciado na imagem 02. Na área de trabalho dessa instância, uma mensagem era exibida questionando se deveria ser permitido que o PC fosse descoberto por outros PCs e dispositivos nesta rede, mas foi negada essa permissão.

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<a name="item01.3"><h4>Tarefa 3: Acesse seu banco de dados local via Microsoft SQL Server Management Studio</h4></a>[Back to summary](#item0)

Como informado na tarfa anterior, essa instância **Windows Server** possuía instalado o software administrador de banco de dados **Microsoft SQL Server Management Studio (SSMS)**. Além desse software, o **Microsoft SQL Server** também estava instalado na máquina e possuía uma cópia do banco de dados que seria implantado no RDS, ou seja, o banco de dados era executado localmente. Então nessa tarefa 3, o objetivo foi conectar o administrador de banco de dados ao banco de dados que rodava localmente nessa instância. 

Dessa forma, o SSMS foi aberto no **Windows Server** e levou alguns minutos para iniciar. Após a inicialização, foi verificada que a conexão com o banco de dados local estava praticamente definida. Foi necessário apenas confirmar se o nome do servidor era o mesmo nome da instância, e depois, selecionar os seguintes botões `Opções >>` e `Parâmetros de Conexão Adicionais`, e no painel `Inserir parâmetros de string de conexão adicionais` inserir `TrustServerCertificate=true`. Ao selecionar `Conectar`, a conexão com o banco de dados local era estabelecida, sendo possível acessar o banco de dados de nome `AdventureWorks` e verificar as tabelas e os dados, conforme mostrado na imagem 03. O banco de dados `AdventureWorks` era um banco de amostra que foi carregado no banco de dados local como parte da configuração do laboratório. 

<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<a name="item01.4"><h4>Tarefa 4: Acessar a instância do RDS via Microsoft SQL Server Management Studio</h4></a>[Back to summary](#item0)

Após executar a conexão com banco de dados local, nesta tarefa uma nova conexão foi configurada no SSMS para acessar o banco de dados SQL Server na instância do **Amazon RDS**. Portanto, foi necessário copiar o endpoint da instância RDS, pois ela seria utilizada na configuração da conexão. No SSMS, a opção `Connect` (Conectar) foi escolhida e a opção `Database Engine...` (Mecanismo de Banco de Dados) foi selecionado. A nova conexão foi configurada da seguinte forma:
- `Server type` (Tipo do servidor): `Database Engine` (Mecanismo de Banco de Dados).
- `Server name` (Nome do servidor): aqui foi onde o endpoint copiado do RDS foi colado (`lab.c3cwswkay0pz.us-east-1.rds.amazonaws.com`).
- `Authentication` (Autenticação): `SQL Server Authentication` (Autenticação do SQL Server).
    - `Login`: `student` (estudante). Esse tinha sido o usuário definido ao provisionar a instância.
    - `Password` (Senha): foi utilizado o valor do parâmetro `RDSPassword` fornecido nas instruções deste lab (`oRgm9RSUp89G`), que tinha sido o configurado ao provisionar a instância.
- A opção `TrustServerCertificate` foi marcada.

O **Amazon RDS for SQL Server** oferece suporte à Autenticação do **Windows**, e a **AWS** fornece várias opções para usar o **Active Directory** na nuvem. Por exemplo, é possível implantar um controlador de domínio do **Windows** no **Amazon EC2**; pode ser utilizado o *AWS Directory Service Simple AD* para fazer proxy de solicitações para o controlador de domínio local; ou também é possível criar um domínio do **Active Directory** no **AWS Directory Services (AD)**. Neste laboratório, foi utilizado a `SQL Server Authentication` (Autenticação do SQL Server). Após conectar, no painel `Object Explorer` foi exibido a conexão construída. Essa instância de banco de dados do RDS ainda não tinha nenhum banco de dados armazenado, apenas o banco de dados padrão do RDS (`rdsadmin`). Portanto, um novo banco de dados foi elaborado, cujo nome foi `Adventure`. A imagem 04 comprova a conexão realizada com a instância **Amazon RDS** e a criação do primeiro banco de dados nessa instância.

<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

<a name="item01.5"><h4>Tarefa 5: Exportar AdventureWorks do SQL Server no Amazon EC2 para o Amazon RDS</h4></a>[Back to summary](#item0)

A última tarefa dessa laboratório foi exportar os dados do bancos de dados local `AdventureWorks` para o banco de dados na instância do **Amazon RDS**. Para isso, no SSMS, na conexão com o banco de dados local, no banco de nome `AdventureWorks` foi selecionada a opção `Tasks` (Tarefas) e depois `Export Data...` (Exportar dados). O assistente de importação e exportação do SQL Server (`SQL Server Import and Export Wizard`) era aberto e foi configurado da seguinte forma:
- `Source` (Fonte):
    - `Data source` (Fonte de dados): `SQL Server Native Client 11.0`.
    - `Authentication` (Autenticação): `Use Windows Authentication` (Usar Autenticação do Windows) .
    - `Database` (Banco de dados): `AdventureWorks`.
- `Destination` (Destino):
    - `Destination` (Destino): `SQL Server Native Client 11.0`.
    - `Server name` (Nome do servidor): foi inserido o endpoint da instância RDS (`lab.c3cwswkay0pz.us-east-1.rds.amazonaws.com`).
    - `Authentication` (Autenticação): `SQL Server Authentication` (Autenticação do SQL Server).
        - `User name` (Nome de usuário): `student` (estudante). Esse tinha sido o usuário definido ao provisionar a instância.
        - `Password` (Senha): foi utilizado o valor do parâmetro `RDSPassword` fornecido nas instruções deste lab (`oRgm9RSUp89G`), que tinha sido o configurado ao provisionar a instância.
    - `Database` (Banco de dados): `Adventure`.
- `Specify Table Copy or Query` (Especificar cópia ou consulta da tabela):
    - Foi verificado se `Copy data from one or more tables or views` (Copiar dados de uma ou mais tabelas ou exibições) estava selecionada.
- `Select Source Tables and Views` (Selecionar tabelas e visualizações de origem):
    - Foi selecionada a caixa de seleção no topo da grade. Isso selecionava todas as caixas de seleção abaixo dela. Aqui era onde as tabelas do banco local que desejava-se transferir eram selecionada. Como todo banco seriam transferidos, todas as tabelas foram selecionadas.
- `Save and Run Package` (Salvar e Executar Pacote):
    - Foi verificado se a caixa de seleção `Run immediately` (Executar imediatamente) estava marcada.
    - Foi selecionado `Finish` (Concluir) duas vezes.

A operação de cópia começava e, em alguns instantes, movia todas as tabelas e dados para o banco de dados na instância do **Amazon RDS**. Foi necessário aguardar até que uma mensagem de operação bem-sucedida fosse exibida, conforme imagem 05.

<div align="Center"><figure>
    <img src="./0-aux/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

Após transferência, o banco de dados `Adveture` do RDS foi selecionado no SSMS da instância **Windows Server** e uma nova query foi aberta para criar uma consulta. O comando `SELECT * FROM SalesLT.Address` foi inserido na query e executado para confirmar se as tabelas e os dados tinham sidos migrados com sucesso. A imagem 06 mostra que a query retornou os dados da tabela `SalesLT.Address`, o que significava que os dados tinha sidos transferidos corretamente. No `Object Explorer` foi visualizado que o banco `Adventure` tinha, agora, todas as tabelas.

<div align="Center"><figure>
    <img src="./0-aux/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>