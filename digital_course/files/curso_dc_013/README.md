# Introduction to Amazon VPC Lattice   <img src="./0-aux/logo_course.png" alt="curso_dc_013" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_013 (Introduction to Amazon VPC Lattice)   <img src="./0-aux/logo_course.png" alt="curso_dc_013" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260820_dc_013_en.pdf">Certificate</a>

---

### Theme:
- Cloud Computing
- Network

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - AWS Identity and Access Management (IAM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_iam.svg" alt="aws_iam" width="auto" height="25">
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
- Faltantes:
  - Amazon VPC Lattice

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Módulo Único</a><br>

---

### Objective:
O curso teve como objetivo apresentar o Amazon VPC Lattice como uma solução gerenciada para simplificar a conectividade, a segurança e o monitoramento da comunicação entre microsserviços. Foram abordados os componentes do serviço (Service Network, Service Directory e Services), a aplicação de políticas de autenticação via IAM e a eliminação de proxies ou sidecars, demonstrando como conectar de forma transparente diferentes plataformas de computação (EC2, ECS, EKS, Lambda) em múltiplas VPCs e contas.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Módulo Único</h4></a>[Back to summary](#item01)

🌐 Introdução ao Amazon VPC Lattice   
O Amazon VPC Lattice é um serviço de rede da camada de aplicação totalmente gerenciado que simplifica a conexão, a proteção e o monitoramento da comunicação entre microsserviços e aplicações distribuídas, independentemente dos tipos de computação ou VPCs em que estejam sendo executados.

🏛️ Evolução Arquitetural e Complexidade de Rede   
A transição de arquiteturas legadas para microsserviços modernos transforma o perfil de comunicação dos sistemas, migrando chamadas internas de memória para requisições de rede.
- Aplicações Monolíticas: Apresentam baixa complexidade de rede. Utilizam chamadas internas no próprio código e recebem tráfego de clientes externos via balanceadores de carga básicos.
- Aplicações em Contêineres: Possuem complexidade de rede média. Exigem o gerenciamento de interfaces CNI (Container Network Interface) e controladores de Ingress.
- Microsserviços Distribuídos: Apresentam alta complexidade de rede devido à intensa comunicação serviço a serviço (East-West traffic). Requerem soluções avançadas de roteamento, autenticação e descobertas de serviços entre diferentes contas e VPCs.

🔗 Opções Tradicionais de Conectividade entre VPCs   
Para conectar redes corporativas antes do uso de redes de aplicação, a AWS disponibiliza recursos de infraestrutura como Internet Gateway, AWS Cloud WAN, AWS Transit Gateway, VPC Peering e AWS PrivateLink. O VPC Lattice abstrai essa camada de rede para focar diretamente na camada de aplicação.

🧩 Componentes Fundamentais do VPC Lattice   
O Amazon VPC Lattice estrutura-se em quatro pilares para organizar o tráfego de aplicação:
- Serviço (Service): Representa uma unidade lógica de aplicação (uma função, contêiner ou instância). Pode se estender por múltiplos ambientes de computação e é composto por escutadores (listeners), regras de roteamento e grupos de destino (target groups).
- Rede de Serviços (Service Network): Mecanismo de agrupamento lógico que simplifica como os usuários habilitam a conectividade e aplicam políticas de acesso comuns entre VPCs e contas.
- Diretório de Serviços (Service Directory): Registro centralizado que cataloga todos os serviços associados e disponíveis na rede do VPC Lattice.
- Políticas de Autenticação (Auth Policies): Políticas de recurso integradas ao AWS IAM que podem ser aplicadas tanto no nível da Rede de Serviços quanto no nível individual de cada Serviço.

💡 Benefícios Estratégicos do VPC Lattice   
- Sem Necessidade de Sidecars ou Proxies: Plano de controle e dados totalmente gerenciados pela AWS, eliminando a complexidade de implantar, atualizar e manter proxies de terceiros na infraestrutura.
- Suporte Multi-Computação NATIVO: Conecta perfeitamente cargas de trabalho executadas em Amazon EC2, Amazon EKS, Amazon ECS e AWS Lambda.
- Controle de Tráfego e Acesso: Melhora a postura de segurança permitindo controle granular, segmentação rigorosa e criptografia em trânsito.
- Independência de Especialidade em Redes: Simplifica drasticamente a conectividade entre VPCs e contas sem a necessidade de gerenciar roteamento IP, tabelas de rotas complexas ou sobreposição de blocos CIDR.

⚙️ Fluxo de Funcionamento: Como Configurar o VPC Lattice   
A implementação do VPC Lattice envolve a configuração da rede de serviços e a definição das aplicações:

🌐 Configuração da Rede de Serviços (Visão Administrador)   
- Criar a Rede de Serviços (Service Network).
- Compartilhar a Rede de Serviços entre contas via AWS RAM.
- Associar as VPCs desejadas à Rede de Serviços.
- Definir as Políticas de Autenticação da Rede de Serviços.
- Habilitar o Monitoramento centralizado da rede.

📦 Configuração dos Serviços (Visão Desenvolvedor)   
- Definir os Serviços e seus grupos de destino (target groups).
- Configurar as Regras de Roteamento (com base em caminhos HTTP, cabeçalhos, etc.).
- Aplicar Políticas de Autenticação de nível de serviço (IAM).
- Associar os Serviços à Rede de Serviços correspondente.
- Habilitar o Monitoramento detalhado para cada serviço.

📊 Monitoramento e Observabilidade   
O VPC Lattice fornece visibilidade ponta a ponta sobre o tráfego e as interações de aplicação:
- Métricas Disponíveis: Coleta contínua de métricas de grupos de destino e métricas individuais de serviços.
- Logs de Acesso: Geração de logs detalhados de acesso aos serviços e registros de tráfego na rede de serviços.
- Integração com Ecossistema AWS: Envio nativo de dados de observabilidade para ferramentas como Amazon CloudWatch, Amazon S3, Amazon Kinesis Data Firehose e auditoria de ações pelo AWS CloudTrail.