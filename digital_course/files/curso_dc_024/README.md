# AWS for Media & Entertainment Content Production Security Essentials   <img src="./0-aux/logo_course.png" alt="curso_dc_024" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_024 (AWS for Media & Entertainment Content Production Security Essentials)   <img src="./0-aux/logo_course.png" alt="curso_dc_024" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/261009_dc_024_en.pdf">Certificate</a>

---

### Theme:
- Cloud Computing

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon WorkSpaces   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_workspaces.svg" alt="aws_workspaces" width="auto" height="25">
  - AWS Directory Service; AWS Managed Microsoft AD   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_directory_service.svg" alt="aws_directory_service" width="auto" height="25">
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
- Faltando:
  - AWS for Media & Entertainment
  - Amazon DCV

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Introduction</a><br>
  1.1 <a href="#item01.01">Introduction</a><br>
2. <a href="#item02">Security Essentials</a><br>
  2.1 <a href="#item02.01">Trusted Partner Network</a><br>
  2.2 <a href="#item02.02">Remote Workstations</a><br>
  2.3 <a href="#item02.03">Directory Services</a><br>
3. <a href="#item03">Conclusion</a><br>
  3.1 <a href="#item03.01">Summary</a><br>

---

### Objective:
O objetivo do curso foi orientar a proteção de dados e ativos intelectuais na produção de conteúdo audiovisual na AWS. Foram abordados o alinhamento com as normas de cibersegurança da TPN (Trusted Partner Network), o monitoramento e automação de ameaças (GuardDuty, Security Hub e CloudTrail), o streaming seguro de telas remotas sem vazamento de dados via Amazon DCV, e a gestão centralizada de permissões e identidades com o AWS Directory Service.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introduction</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Introduction</h4></a>[Back to summary](#item01)

🛡️ Fundamentos e Considerações de Segurança na Nuvem   
A proteção de ativos intelectuais em fluxos de trabalho de mídia e entretenimento fundamenta-se no alinhamento entre a infraestrutura global da AWS e as diretrizes de governança exigidas pela indústria audiovisual.

🤝 Modelo de Responsabilidade Compartilhada   
O ecossistema de segurança na nuvem distribui os papéis operacionais entre o provedor e a organização cliente:
- Responsabilidade da AWS (Segurança DA Nuvem): Abrange a proteção física das instalações dos data centers, manutenção dos equipamentos corporativos, suporte ao hardware e isolamento da camada de virtualização do sistema operacional host.
- Responsabilidade do Cliente (Segurança NA Nuvem): Envolve a configuração das regras de firewall virtuais (como Grupos de Segurança e NACLs), atualização e controle do sistema operacional convidado, gestão do software de aplicação e criptografia dos dados armazenados.

📽️ Pilares Principais de Segurança para Mídia   
A preservação do conteúdo digital — do desenvolvimento do roteiro até a exibição final — exige a atenção a três vertentes principais:

1. Conformidade e Padrões da Indústria (TPN)   
Iniciativa liderada pela Motion Picture Association (MPA) e pela Content Delivery & Security Association (CDSA) através da Trusted Partner Network (TPN).
  - Controles de Acesso: Define estruturas e benchmarks formais de cibersegurança para mitigar riscos de vazamento de propriedade intelectual.
  - Validação Operacional: Empresas do setor utilizam as diretrizes e certificações da TPN para auditarem e atestarem a maturidade de suas infraestruturas na nuvem.
2. Proteção de Estações de Trabalho Remotas:
A entrega remota de desktops para artistas e editores exige protocolos resilientes de transmissão e controle de acesso.
  - Criptografia de Pixels: Utilização do protocolo Amazon DCV para realizar o streaming seguro de sessões gráficas sem a necessidade de transferir arquivos brutos para as máquinas locais.
  - Governança via Agentes de Conexão: Integração com softwares de gerenciamento de sessão (connection brokers) para validar a autenticação, isolar recursos e gerenciar permissões de forma centralizada.
3. Serviços de Diretório e Controle de Acesso:
A administração rigorosa das credenciais dos profissionais garante a aplicação do princípio do menor privilégio (least privilege).
  - Integração com Active Directory: Utilização do AWS Directory Service e utilitários de conexão para centralizar o gerenciamento de identidades, contas e Objetos de Política de Grupo (GPOs).
  - Regulamentação de Recursos: Definição clara de acessos aos diretórios de rede, repositórios de armazenamento e instâncias computacionais por projeto e função do usuário.

<a name="item02"><h4>Security Essentials</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Trusted Partner Network</h4></a>[Back to summary](#item02)

🛡️ Benefícios da Associação e Certificação TPN   
A adesão às diretrizes da Trusted Partner Network (TPN) estabelece um padrão unificado de cibersegurança para a proteção de ativos intelectuais, integrando os parâmetros do National Institute of Standards and Technology (NIST) e das normas ISO com as melhores práticas da Motion Picture Association (MPA).

🎖️ Níveis de Qualificação da Plataforma TPN+   
A plataforma TPN+ centraliza a gestão dos status de conformidade das empresas prestadoras de serviço no setor audiovisual:
- Selo Blue Shield: Concedido à organização que conclui o processo de autoavaliação e declaração detalhada de seus controles internos de cibersegurança na plataforma.
- Selo Gold Shield: Nível mais elevado de verificação, obtido após a aprovação em auditoria presencial ou remota conduzida por avaliadores credenciados e independentes. O relatório completo de auditoria fica visível para os grandes estúdios e proprietários de conteúdo membros da rede. A infraestrutura da AWS possui a qualificação Gold Shield.

🚀 Vantagens Estratégicas para Prestadores de Serviço   
- Visibilidade no Diretório Global: Inclusão no cadastro de parceiros homologados, funcionando como um diferencial competitivo e facilitando a contratação por grandes estúdios.
- Mitigação Sistemática de Riscos: A adequação aos benchmarks e frameworks da MPA reduz a vulnerabilidade contra incidentes de segurança e vazamentos em todas as etapas da cadeia de produção.
- Simplificação de Auditorias: Padroniza as exigências de segurança do mercado, evitando a necessidade de realizar múltiplas avaliações individuais para cada cliente.

<a name="item02.02"><h4>2.2 Remote Workstations</h4></a>[Back to summary](#item02)

🔒 Desafios de Segurança e Soluções AWS para Estações Remotas   
A proteção de fluxos de trabalho visuais em ambientes remotos exige superar gargalos operacionais decorrentes de falhas de visibilidade e excesso de rotinas manuais, adotando monitoramento automatizado e protocolos seguros de transmissão.

⚠️ Desafios de Governança na Produção Visual   
- Processos Manuais e Baixa Automação: A dependência de atualizações manuais, aplicação de rotinas de correção (patching) não automatizadas e a troca manual de dados entre softwares aumentam a suscetibilidade a falhas humanas e atrasam o tempo de resposta a incidentes.
- Falta de Visibilidade e Rastreabilidade: A dificuldade em monitorar a movimentação exata dos arquivos de mídia, identificar quem acessa os projetos e rastrear alterações de configuração compromete a conformidade com as exigências dos estúdios e da indústria.

🛠️ Ecossistema AWS de Monitoramento e Auditoria   
A AWS fornece uma suite integrada para garantir visibilidade contínua, governança e detecção ativa de ameaças:
- AWS Identity and Access Management (IAM): Gerenciamento centralizado de identidades para conceder acessos granulares baseados no princípio do menor privilégio.
- Amazon CloudWatch: Coleta de métricas e registros operacionais para observabilidade em tempo real das instâncias e serviços.
- AWS CloudTrail: Registro contínuo de chamadas de API e ações de usuários para fins de auditoria, governança e conformidade.
- Amazon GuardDuty: Serviço automatizado de detecção de ameaças que analisa eventos em busca de atividades suspeitas e não autorizadas.
- Amazon Detective: Ferramenta para investigação rápida da causa raiz de potenciais incidentes de segurança identificados no ambiente.
- AWS Security Hub: Painel centralizador que consolida, prioriza e organiza alertas de segurança gerados por múltiplos serviços (como GuardDuty, Macie e Inspector).
- AWS Artifact: Portal com relatórios oficiais de auditoria e conformidade da AWS e de parceiros, essencial para comprovações de segurança no processo de certificação TPN.

📡 Transmissão Segura de Pixels com Amazon DCV   
O uso de transmissão de tela impede a proliferação de cópias locais dos arquivos originais, mantendo o acervo protegido nos repositórios da nuvem.
- Proteção do Conteúdo (Pixel Streaming): O Amazon DCV transmite apenas os pixels renderizados e não as geometrias ou os arquivos fonte, garantindo que os dados originais permaneçam isolados no ambiente Amazon EC2.
- Criptografia de Ponta a Ponta: Todo o fluxo de dados (pixels e comandos de entrada do usuário) é protegido nativamente por criptografia TLS.
- Compatibilidade Multiplataforma: Suporte a clientes Windows, Linux, macOS e navegadores via cliente HTML5, além de integração com o DCV Web Client SDK para desenvolvimento de portais de acesso customizados.
- Gerenciamento Programático: O Amazon DCV Session Manager permite a criação, distribuição e controle de sessões ativas em escala entre múltiplos servidores EC2.

🚥 O Papel dos Agentes de Conexão (Connection Brokers)   
Integrados via AWS Marketplace, os agentes de conexão complementam a infraestrutura ao intermediar o acesso dos usuários finais às instâncias virtuais:
- Autenticação e Sessões: Validação de credenciais e gerenciamento de estado das conexões, permitindo a desconexão e reconexão sem perda do progresso de trabalho.
- Aplicação de Políticas: Implementação centralizada de regras de segurança, cotas de tempo e alocação dinâmica de instâncias de acordo com as permissões do perfil do usuário.

<a name="item02.03"><h4>2.3 Directory Services</h4></a>[Back to summary](#item02)

🗂️ Gestão de Serviços de Diretório e Controle de Acesso   
A governança centralizada de identidades através de serviços de diretório é um pilar indispensável para garantir que apenas profissionais autorizados acessem os recursos de produção de conteúdo, protegendo a propriedade intelectual contra acessos indevidos.

🔑 O Papel dos Serviços de Diretório na Produção de Mídia   
Os serviços de diretório fornecem a infraestrutura base para autenticação e autorização em ambientes de pós-produção e edição remota:
- Gestão Unificada de Identidades: Centraliza o gerenciamento de usuários, grupos e permissões em um único repositório, simplificando o controle de quem pode acessar projetos ativos e estações de trabalho.
- Integração com Mecanismos de Acesso: Atua como fonte de verdade para soluções de Gestão de Identidade e Acesso (IAM), Autenticação Única (SSO) e Autenticação Multifator (MFA).
- Aplicação de Diretivas de Grupo (GPOs): Permite impor configurações padronizadas de segurança, restrições de sistema e políticas de acesso uniforme em instâncias virtuais atreladas ao domínio.

☁️ Suporte da AWS via AWS Directory Service   
O AWS Directory Service simplifica a implantação, administração e integração de diretórios na nuvem com estruturas corporativas pré-existentes.
- AWS Managed Microsoft AD: Oferece um ambiente Microsoft Active Directory nativo e totalmente gerenciado pela AWS na nuvem, eliminando a sobrecarga de manutenção física de controladores de domínio.
- Relações de Confiança (Trust Relationships): Permite estabelecer conexões de confiança bidirecionais ou unidirecionais entre o Active Directory local da empresa e o diretório na AWS. Isso viabiliza o login único (SSO) com as mesmas credenciais corporativas tanto para recursos locais quanto na nuvem.
- Reforço de Segurança com MFA: Suporta integração nativa com infraestruturas de autenticação multifator baseadas em RADIUS, adicionando uma camada extra de proteção no acesso a estações de trabalho Amazon EC2 (Windows e Linux).
- Gestão de Cargas de Trabalho: Facilita a entrada de instâncias no domínio (domain join) e simplifica o gerenciamento de permissões para aplicações baseadas em ecossistemas Microsoft ou Linux.

<a name="item03"><h4>Conclusion</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Summary</h4></a>[Back to summary](#item03)

📑 Síntese Consolidada: Fundamentos de Segurança na Produção de Conteúdo   
A proteção de ativos audiovisuais na Nuvem AWS fundamenta-se no alinhamento entre diretrizes internacionais do setor de mídia, visibilidade operacional contínua e governança rígida de identidades.

📽️ Governança e Certificação na Indústria (TPN)   
- Proteção do Roteiro à Tela: A Trusted Partner Network (TPN) estabelece benchmarks de cibersegurança baseados nas diretrizes da MPA, alinhados às normas ISO e ao framework NIST.
- Níveis de Qualificação (TPN+):
  - Selo Blue Shield: Obtido por meio da autoavaliação declaratória dos controles de segurança do prestador de serviço na plataforma.
  - Selo Gold Shield: Concedido após auditoria formal conduzida por avaliadores credenciados e independentes. A infraestrutura global da AWS possui essa certificação, facilitando a validação por proprietários de conteúdo.

📡 Transmissão e Monitoramento de Estações Remotas   
- Isolamento de Dados com Amazon DCV: Transmite unicamente os pixels renderizados por meio de conexões criptografadas por TLS, impedindo o download ou o acesso aos arquivos brutos nas máquinas dos usuários finais.
- Automação e Visibilidade: O uso de serviços integrados (como AWS CloudTrail, Amazon GuardDuty, Amazon CloudWatch e AWS Security Hub) elimina processos manuais e provê rastreabilidade completa sobre alterações de infraestrutura e acessos.
- Orquestração de Sessões: A integração de agentes de conexão (connection brokers) via AWS Marketplace garante a aplicação centralizada de políticas de segurança, autenticação e controle de acesso a desktops virtuais.

🗂️ Gestão de Identidades com AWS Directory Service   
- Active Directory Gerenciado: O AWS Managed Microsoft AD fornece um ambiente corporativo nativo na nuvem para controle centralizado de credenciais, permissões e diretivas de grupo (GPOs).
- Integração Híbrida: Permite configurar relações de confiança (trust relationships) com estruturas locais do Active Directory, viabilizando o login único (SSO) com credenciais unificadas.
- Camadas de Proteção Extra: Suporta autenticação multifator (MFA) via RADIUS para assegurar conexões controladas a instâncias Amazon EC2 (Windows e Linux).