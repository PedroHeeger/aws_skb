# Amazon RDS Service Primer   <img src="./0-aux/logo_course.png" alt="curso_dc_016" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_016 (Amazon RDS Service Primer)   <img src="./0-aux/logo_course.png" alt="curso_dc_016" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260901_dc_016_en.pdf">Certificate</a>
#### <a href="">Prática</a>

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

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Módulo Único</a><br>
  1.1 <a href="#item01.01">Service Introduction</a><br>
  1.2 <a href="#item01.02">Service Technical Overview</a><br>
  1.3 <a href="#item01.03">Service Demonstration</a><br>

---

### Objective:
O curso teve como objetivo apresentar o Amazon Relational Database Service (Amazon RDS) como um serviço gerenciado para a criação, operação e escalonamento de bancos de dados relacionais na nuvem. Foram abordados o funcionamento do serviço, suas opções de mecanismos de banco de dados (Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle e SQL Server), as implantações em Múltiplas Zonas de Disponibilidade (Multi-AZ) para alta disponibilidade, além dos modelos de precificação, estratégias de segurança e integração com outros serviços da AWS.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Módulo Único</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Service Introduction</h4></a>[Back to summary](#item01)

🗄️ Visão Geral do Amazon RDS   
O Amazon Relational Database Service (Amazon RDS) é um serviço totalmente gerenciado projetado para simplificar a configuração, a operação e o dimensionamento de bancos de dados relacionais na nuvem. A plataforma automatiza tarefas administrativas complexas — como provisionamento de hardware, aplicação de patches no sistema operacional e no motor de banco de dados, além de rotinas de backup —, permitindo o foco no desenvolvimento de aplicações e em iniciativas de análise de dados.

O serviço opera sob o modelo de normalização de dados através de esquemas e suporte a consultas via linguagem SQL (Structured Query Language), utilizando estruturas organizadas em tabelas, registros e campos com chaves primárias e relacionamentos.

⚙️ Mecanismos e Opções de Implantação   
Ao criar uma instância de banco de dados no Amazon RDS, é necessário selecionar a capacidade computacional adequada e o mecanismo de banco de dados desejado. A plataforma oferece suporte a seis motores relacionais:
- Motores de Código Aberto e Compatíveis: Amazon Aurora, PostgreSQL, MySQL e MariaDB.
- Motores Comerciais: Oracle Database e Microsoft SQL Server.

🛡️ Alta Disponibilidade e Resiliência (Multi-AZ)   
Para garantir a continuidade dos negócios e mitigar falhas de infraestrutura, o Amazon RDS disponibiliza arquiteturas em Multi-AZ (Multi-Availability Zone):
- Replicação Síncrona: O serviço mantém uma instância mestre em uma Zona de Disponibilidade e replica os dados continuamente para uma instância secundária em espera (standby) em outra AZ.
- Failover Automático: Em caso de degradação da instância principal ou indisponibilidade da AZ, o tráfego é redirecionado automaticamente para a nó de reserva.
- Transparência via DNS: O failover altera internamente o registro DNS que aponta para o nó primário. Dessa forma, as aplicações cliente não exigem alterações em suas cadeias de conexão (connection strings).

🎯 Casos de Uso Práticos   
A estabilidade e as garantias ACID dos bancos de dados relacionais viabilizados pelo Amazon RDS atendem a dois cenários operacionais principais:
- Sistemas Transacionais (OLTP): Processamento de transações em tempo real com alta consistência, como plataformas de e-commerce, sistemas de gestão de clientes e registros operacionais.
- Cargas de Trabalho Analíticas (OLAP): Armazenamento de conjuntos de dados normalizados ou enriquecidos para consultas complexas, como relatórios de vendas e processamento de dados científicos ou genômicos.

💰 Modelo de Precificação e Faturamento   
A cobrança do Amazon RDS baseia-se no modelo sob demanda e é estruturada em três componentes de custo:
- Capacidade Computacional (Instâncias):
  - Sob Demanda: Cobrança por hora de uso da instância, indicada para cargas de trabalho imprevisíveis ou temporárias.
  - Instâncias Reservadas: Contratação por termos de 1 ou 3 anos em troca de descontos em relação ao preço sob demanda.
- Armazenamento e Operações de E/S: Custo calculado em gigabytes por mês para o volume de disco alocado, somado à taxa por milhões de requisições de E/S (Input/Output).
- Transferência de Dados: Cobrança sobre o tráfego de saída para a internet ou entre diferentes regiões da AWS. O tráfego de dados entre serviços da AWS dentro da mesma região não gera custos de transferência.

<a name="item01.02"><h4>1.2 Service Technical Overview</h4></a>[Back to summary](#item01)

🏗️ Conceitos Fundamentais e Gerenciamento do Amazon RDS   
O Amazon Relational Database Service (Amazon RDS) automatiza tarefas administrativas essenciais — como aplicação de atualizações, rotinas de backup e suporte à recuperação em ponto no tempo (Point-in-Time Recovery). O serviço estrutura-se a partir de componentes técnicos centrais para alocação de capacidade e movimentação de dados:
- Classe da Instância de Banco de Dados: Define os recursos de computação (vCPU, memória RAM) e a capacidade de E/S (taxa de transferência de rede e armazenamento) alocados para o mecanismo escolhido (ex: PostgreSQL ou Amazon Aurora).
- Interfaces de Gerenciamento: A criação e modificação de instâncias ocorrem via AWS Management Console, AWS CLI ou APIs dedicadas, viabilizando a automação de rotinas operacionais por scripts.
- Ferramental de Migração: O AWS Database Migration Service (AWS DMS) realiza a replicação e migração contínua de bases de dados locais ou em nuvem para o Amazon RDS. Caso ocorra alteração no mecanismo de banco de dados, o AWS Schema Conversion Tool (AWS SCT) automatiza a conversão de esquemas entre motores distintos (ex: de Oracle para MySQL).

🛡️ Camadas de Segurança e Proteção de Dados   
A arquitetura de segurança do Amazon RDS baseia-se em princípios de isolamento de rede, controle de acesso e criptografia em múltiplas camadas:
- Isolamento de Rede: Posicionamento de instâncias dentro de sub-redes privadas de uma Amazon VPC, restringindo a exposição pública. A comunicação externa exige a associação de um Internet Gateway à VPC.
- Controle de Acesso e Permissões: Utilização de Grupos de Segurança (Security Groups) para controle de tráfego na camada de rede, combinada com políticas do AWS Identity and Access Management (IAM) para atribuir permissões granulares de acesso e gerenciamento dos recursos.
- Proteção de Dados em Trânsito: Criptografia das conexões de rede utilizando túneis HTTPS com protocolo SSL/TLS.
- Proteção de Dados em Repouso: Criptografia do volume de armazenamento, backups e snapshots utilizando o algoritmo padrão de mercado AES-256.

🔄 Arquiteturas de Solução e Integração   
O Amazon RDS conecta-se nativamente a outros serviços da AWS para atender a cenários avançados de resiliência e processamento analítico:

🚑 Estratégia Cross-Region para Recuperação de Desastres (DR)   
Automação do envio de cópias de segurança para regiões geográficas distintas:
- Geração do Snapshot: Uma função do AWS Lambda é acionada por agendamento para gerar snapshots da instância do Amazon RDS for Oracle e gravá-los no primeiro bucket do Amazon S3.
- Notificação do Evento: A criação do novo arquivo no Amazon S3 publica uma notificação via Amazon SNS.
- Replicação Regiões Cruzadas: A notificação do SNS dispara uma segunda função AWS Lambda, que copia o snapshot do bucket de origem para um segundo bucket Amazon S3 localizado em outra região ou Zona de Disponibilidade, garantindo a cópia de recuperação de desastres.

📊 Ingestão e Análise em Tempo Quase Real   
Desacoplamento de cargas analíticas complexas para evitar impacto no desempenho de escrita e leitura do banco de dados relacional:
- Gatilho por Inserção: Procedimentos armazenados (stored procedures) na tabela do Amazon RDS disparam uma função AWS Lambda a cada novo registro inserido.
- Transmissão de Dados: O AWS Lambda envia os dados extraídos para o Amazon Kinesis Data Firehose, que formata e carrega o fluxo diretamente no repositório Amazon S3.
- Consulta e Visualização: O Amazon Athena executa consultas SQL diretamente nos arquivos armazenados no bucket Amazon S3, enquanto o Amazon QuickSight consome os resultados gerados para atualizar painéis de Business Intelligence em tempo quase real.

🏢 Casos de Uso Corporativos   
A facilidade de gerenciamento via API e a flexibilidade de ajuste de capacidade viabilizam casos práticos de migração em grande escala:
- Migração sem Parada Prolongada: Migração de bases MySQL locais para o Amazon RDS com tempo de inatividade mínimo, aproveitando chamadas de API e mecanismos de replicação em ambientes Multi-AZ para garantir durabilidade e rápida transição.
- Otimização de Desempenho e Custos: Transferência de cargas de trabalho de instâncias gerenciadas manualmente no Amazon EC2 para o Amazon RDS for MySQL, eliminando o esforço técnico de otimização (tuning) de IOPS de disco e a sobrecarga de gerenciamento de infraestrutura subjacente.

<a name="item01.03"><h4>1.3 Service Demonstration</h4></a>[Back to summary](#item01)

🏗️ Preparação do Ambiente de Rede e Segurança   
A implantação de um banco de dados relacional via Amazon RDS exige uma infraestrutura de rede segmentada na Amazon VPC para isolar a instância de banco de dados do acesso público direto, utilizando uma instância Amazon EC2 na sub-rede pública como ponto de salto (bastion host).

⚙️ Procedimento de Implantação e Configuração   
O fluxo técnico para criação do ambiente, alocação do banco de dados e manipulação de dados é realizado nas seguintes etapas:
- Estruturação de Rede (VPC e Sub-redes):
  - Criação de uma VPC com o bloco CIDR 10.30.0.0/16.
  - Configuração de duas sub-redes privadas em Zonas de Disponibilidade (AZs) distintas para os nós de banco de dados (10.30.101.0/24 e 10.30.102.0/24).
  - Configuração de uma sub-rede pública (10.30.201.0/24) para hospedagem da instância Amazon EC2.
- Regras de Firewalls Virtuais (Security Groups):
  - Grupo da Instância EC2: Liberação da porta 22 (SSH) restrita ao IP do administrador (My IP).
  - Grupo do Banco de Dados RDS: Liberação da porta 3306 (MySQL/Aurora) referenciando exclusivamente o Grupo de Segurança da instância EC2 como origem do tráfego.
- Provisionamento da Instância RDS MySQL:
  - No console do RDS, selecione o motor MySQL com o perfil de uso de Produção.
  - Defina a classe da instância como db.t3.small (2 vCPUs, 2 GiB de RAM) com armazenamento SSD de uso geral.
  - Configure o identificador do banco, usuário mestre e credenciais de acesso.
  - Em rede e segurança, associe a VPC criada, desative a acessibilidade pública (Public accessibility: No) e vincule o Grupo de Segurança com acesso liberado a partir da instância EC2.
  - Defina o nome inicial do banco de dados lógico e mantenha a autenticação IAM desativada.

🔌 Conexão e Operações no Banco de Dados   
Após a inicialização da instância, o acesso e a manipulação dos dados ocorrem via linha de comando a partir da instância EC2:
- Conexão via Cliente MySQL: Estabeleça a sessão informando o endpoint público/privado gerado pelo RDS, o usuário mestre e a senha: `mysql -h <endpoint-da-instancia-rds> --user <usuario-mestre> --password`.
- Seleção e Carga de Dados: Após autenticar, selecione o banco de dados criado, execute os DDLs de criação de tabelas e insira os registros iniciais via instrução INSERT.
- Consulta e Validação: Execute comandos SELECT para validar a persistência, integridade e retorno dos dados inseridos na tabela.