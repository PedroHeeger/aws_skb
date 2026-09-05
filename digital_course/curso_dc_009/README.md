# Configuring and Deploying VPCs with Multiple Subnets   <img src="./0-aux/logo_course.png" alt="curso_dc_009" width="auto" height="45">

### AWS <a href="../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../aws_partner/">aws_partner</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_009 (Configuring and Deploying VPCs with Multiple Subnets)   <img src="./0-aux/logo_course.png" alt="curso_dc_009" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260817_dc_009_en.pdf">Certificate</a>

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
  - Amazon Application Load Balancer (ALB)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_alb.svg" alt="aws_alb" width="auto" height="25">
  - Amazon Elastic Load Balancing (ELB)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_elb.svg" alt="aws_elb" width="auto" height="25">
  - Amazon Network Load Balancer (NLB)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_nlb.svg" alt="aws_nlb" width="auto" height="25">
  - Amazon Virtual Private Cloud (VPC)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_vpc.svg" alt="aws_vpc" width="auto" height="25">
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
  - Amazon Gateway Load Balancer (GWLB)

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Amazon VPC Deployment</a><br>
  1.1 <a href="#item01.01">Introduction - Amazon VPC Deployment</a><br>
  1.2 <a href="#item01.02">Virtual Private Cloud</a><br>
  1.3 <a href="#item01.03">Deploying a Basic Amazon VPC</a><br>
2. <a href="#item02">Securing and Configuring High Availability</a><br>
  2.1 <a href="#item02.01">Introduction - Securing and Configuring High Availability</a><br>
  2.2 <a href="#item02.02">AWS Identity and Access Management (IAM)</a><br>
  2.3 <a href="#item02.03">Security Features</a><br>
  2.4 <a href="#item02.04">Adding High Availability</a><br>
  2.5 <a href="#item02.05">Security Compliance Resources</a><br>
3. <a href="#item03">Multi-Tier Architecture</a><br>
  3.1 <a href="#item03.01">Introduction - Multi-Tier Architecture</a><br>
  3.2 <a href="#item03.02">Production-Ready: Multi-Tier Architecture for an Amazon VPC</a><br>

---

### Objective:
O curso teve como objetivo capacitar na configuração, implantação e segurança de redes virtuais com o Amazon VPC. Foi abordado o planejamento de sub-redes em múltiplas Zonas de Disponibilidade, a implementação de arquiteturas multicamadas (multi-tier), o controle de tráfego por tabelas de roteamento e gateways, além do uso de mecanismos de defesa em profundidade com Security Groups e Network ACLs (NACLs) e a integração de balanceadores de carga (ELB) para alta disponibilidade.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Amazon VPC Deployment</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Introduction - Amazon VPC Deployment</h4></a>[Back to summary](#item01)

🎯 Objetivos do Módulo   
Neste módulo, o aprendizado é estruturado para consolidar a compreensão teórica e prática sobre o provisionamento de redes virtuais na nuvem AWS, cobrindo os seguintes tópicos:
- Conceituação da Amazon VPC: Compreensão das características da nuvem privada virtual e sua atuação na definição de fronteiras de rede, segurança e isolamento para recursos na nuvem.
- Diferenciação entre VPC Padrão e Personalizada: Análise comparativa entre o ambiente de rede gerado automaticamente na criação da conta e a construção sob medida de topologias personalizadas.
- Implantação Prática via Console AWS: Demonstração guiada para criação e configuração de uma infraestrutura de VPC utilizando a interface gráfica do Console de Gerenciamento da AWS.
- Automação e Implantação via AWS CLI: Demonstração prática para criação e gerenciamento dos componentes da VPC por meio da Interface de Linha de Comando (AWS CLI), focando em automação e operações via terminal.

<a name="item01.02"><h4>1.2 Virtual Private Cloud</h4></a>[Back to summary](#item01)

🌐 Visão Geral da Amazon VPC (Virtual Private Cloud)   
A Amazon Virtual Private Cloud (Amazon VPC) atua como um data center virtual logicamente isolado na Nuvem AWS, operando em escopo regional. O serviço estabelece as fronteiras de rede em torno dos recursos implantados, controlando os fluxos de comunicação internos e a conectividade com redes externas, como a internet ou ambientes locais (on-premises).

O suporte a arquiteturas híbridas é viabilizado por soluções de conectividade dedicadas e seguras, tais como AWS Direct Connect, AWS Site-to-Site VPN e AWS Client VPN.

🔄 Tipos de VPC: Padrão vs. Personalizada   
Cada conta AWS disponibiliza dois tipos de VPC, com níveis de automação e controle distintos:
- Amazon VPC Padrão (Default VPC): Provisionada automaticamente pela AWS em todas as regiões ativas ao criar a conta. É projetada para rápida inicialização de recursos, dispensando configurações prévias de rede. Permite apenas uma unidade por região e vem pré-configurada para permitir a exposição direta e o tráfego público por padrão.
- Amazon VPC Personalizada (Custom VPC): Rede virtual construída sob demanda, onde o usuário define explicitamente todos os componentes, regras de roteamento e limites de segurança. Segue o princípio de isolamento absoluto: nenhum tráfego entra ou sai sem regras de permissão configuradas explicitamente.

🛠️ Componentes e Configurações da VPC Padrão   
A VPC padrão disponibiliza uma estrutura uniforme e pronta para uso com as seguintes especificações nativas:
- Endereçamento de Rede: Bloco CIDR IPv4 fixo em 172.31.0.0/16 (65.536 endereços privados disponíveis).
- Sub-redes Públicas: Criação automática de uma sub-rede pública com máscara /20 (4.096 endereços IP) em cada Zona de Disponibilidade (AZ) da região, garantindo resiliência contra falhas isoladas de AZ.
- Internet Gateway (IGW) e Roteamento: Gateway de internet anexado e configurado na tabela de rotas principal para direcionar todo o tráfego de saída (0.0.0.0/0) à internet.
- Atribuição de IPs: Instâncias Amazon EC2 inicializadas nesta VPC recebem automaticamente um endereço IP privado e um endereço IP público.
- Segurança e Serviços Nativos: Acompanha Security Group padrão, ACL de rede (NACL) padrão e conjunto de opções DHCP pré-configurado.

⚙️ Características e Opções da VPC Personalizada   
A VPC personalizada concede autonomia completa sobre a arquitetura de rede, permitindo adaptar a infraestrutura aos requisitos de segurança e conformidade do negócio:
- Dimensionamento de CIDR IPv4: Definição do bloco principal de endereçamento IPv4 variando entre as máscaras /16 (máximo de 65.536 IPs) e /28 (mínimo de 16 IPs), com suporte à adição de blocos IPv4 secundários.
- Suporte a IPv6: Opção de associação de um bloco CIDR IPv6 /56 gerado e atribuído automaticamente pela AWS.
- Resolução DNS: Integração com DNS gerenciado nativo, cujo servidor de nomes fica localizado no segundo endereço IP reservado do bloco da VPC (endereço da rede +2).
- Modos de Locação de Hardware (Tenancy): Escolha entre locação padrão (recursos executados em hardware compartilhado multitenant) e locação dedicada (instâncias executadas em servidores físicos exclusivos do cliente). A escolha da locação dedicada no momento da criação é irreversível e exige a recriação da VPC caso se deseje retornar ao modelo padrão.

<a name="item01.03"><h4>1.3 Deploying a Basic Amazon VPC</h4></a>[Back to summary](#item01)

🏗️ Considerações e Componentes da Arquitetura Básica de VPC   
A construção de uma arquitetura de rede na Amazon VPC exige a compreensão de princípios fundamentais sobre abrangência, isolamento e roteamento de dados na infraestrutura da AWS.
- Escopo Regional: A VPC é um serviço regional e não pode se estender por múltiplas regiões. A escolha da região impacta diretamente os custos, a latência para os usuários finais e a disponibilidade de serviços específicos da AWS.
- Aresta de Sub-rede e Zona de Disponibilidade: Embora a VPC possa abranger diversas Zonas de Disponibilidade (AZs) em uma mesma região, uma sub-rede individual é estritamente vinculada a uma única AZ.
- Dependência de Recursos: A maioria dos serviços gerenciados e instâncias computacionais precisa ser iniciada dentro de uma VPC, ficando subordinada à disponibilidade da rede correspondente.

🌐 Conectividade Externa e o Internet Gateway (IGW)   
O acesso e a comunicação com a internet pública dependem da associação de um Internet Gateway à VPC:
- Características Nativas: O gateway de internet é redundante, altamente disponível e escala horizontalmente de forma automática. Embora cada VPC utilize um único gateway de internet lógico, o componente não representa gargalo de desempenho ou ponto único de falha.
- Definição de Sub-rede Pública: A inclusão de uma rota direcionando o tráfego externo para o Internet Gateway converte uma sub-rede comum em uma sub-rede pública. A ausência desta rota mantém a sub-rede como privada.

🛣️ Tabelas de Roteamento e Regra do Prefixo Mais Específico   
As tabelas de roteamento determinam o destino de todo o tráfego gerado dentro das sub-redes com base nos endereços IP solicitados:
- Tabela Principal vs. Personalizada: Toda VPC é criada com uma tabela de roteamento principal. Para necessidades específicas, cria-se tabelas personalizadas associadas a sub-redes individuais.
- Rota Local (Local Route): Tráfego destinado ao bloco de endereços da própria VPC (ex: 10.0.0.0/16) é roteado internamente por padrão, permitindo a comunicação nativa entre todas as sub-redes.
- Prioridade do Prefixo Mais Específico (Longest Prefix Match): Se houver sobreposição de destinos na tabela de rotas — por exemplo, uma rota local 10.0.0.0/16 e uma rota pública 0.0.0.0/0 para a internet —, o roteador da VPC priorizará sempre a regra com o intervalo de IP mais restrito e específico.

🔐 Características de Tráfego e Resolução de Nomes   
- Resolução DNS Nativa: O gerenciamento do sistema de nomes ocorre nativamente na VPC, permitindo também a integração com o Amazon Route 53 por meio de zonas hospedadas privadas.
- Sem Suporte a Broadcast/Multicast: Todo o tráfego interno de rede é processado exclusivamente via unicast, dispensando o uso do protocolo ARP (Address Resolution Protocol).
- Controle com ACLs de Rede (NACL): O tráfego direto mantido entre sub-redes pode ser filtrado ou restrito por meio de regras de controle de acesso stateless aplicadas na borda das sub-redes.

<a name="item02"><h4>Securing and Configuring High Availability</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Introduction - Securing and Configuring High Availability</h4></a>[Back to summary](#item02)

🎯 Objetivos do Módulo   
Neste módulo, o aprendizado foca na consolidação dos mecanismos de governança de identidades, proteção em camadas para tráfego de rede e distribuição elástica de solicitações, cobrindo os seguintes tópicos:
- Fundamentos do AWS IAM: Definição da plataforma central de gestão de identidades, autenticação de operadores e autorização baseada no princípio do menor privilégio.
- Mecanismos de ACLs de Rede (NACLs): Identificação dos filtros de segurança operados na borda das sub-redes para controle de tráfego de entrada e saída.
- Funcionamento de Grupos de Segurança: Caracterização dos firewalls virtuais aplicados diretamente nas interfaces de rede dos recursos da AWS.
- Análise Comparativa Stateful vs. Stateless: Contraste entre controles com retenção de estado (Grupos de Segurança) e controles sem retenção de estado (NACLs) no processamento do fluxo de dados.
- Estratégias de Elastic Load Balancing (ELB): Reconhecimento do papel dos balanceadores de carga na alta disponibilidade e distinção das suas modalidades (Application, Network e Gateway Load Balancers).

<a name="item02.02"><h4>2.2 AWS Identity and Access Management (IAM)</h4></a>[Back to summary](#item02)

🛡️ Camadas de Segurança e Governança de Acesso na Amazon VPC   
A segurança em uma arquitetura de nuvem privada virtual é estruturada em múltiplas camadas defensivas. A primeira linha de defesa atua no plano de controle, determinando quais entidades possuem autorização para criar, alterar, gerenciar ou excluir componentes da VPC por meio do AWS Identity and Access Management (IAM).

Complementarmente, a proteção no plano de dados e no tráfego de rede é exercida por controles específicos como as Listas de Controle de Acesso à Rede (ACLs de rede) e os Grupos de Segurança (Security Groups).

🔑 Controle de Plano de Gestão via IAM   
O IAM gerencia as credenciais e os privilégios operacionais que determinam quem pode interagir com a infraestrutura da VPC:
- Princípio do Menor Privilégio (Least Privilege): Prática fundamental que consiste em conceder às identidades apenas as permissões estritamente necessárias para o desempenho de suas funções. A limitação de privilégios reduz a superfície de ataque e minimiza os riscos de alterações indevidas ou impactos não planejados no ambiente.
- Usuário Raiz (Root User): Conta primária criada no provisionamento da conta AWS com privilégios totais e irrestritos. Como suas permissões não podem ser limitadas, seu uso deve ser evitado na rotina diária em favor de identidades do IAM.
- Entidades do IAM: Estruturadas em Usuários (pessoas ou sistemas que exigem acesso contínuo), Grupos (conjuntos de usuários organizados por função operacional, como administradores de rede ou engenheiros) e Funções / Roles (identidades temporárias assumidas por serviços como instâncias EC2 para acessar outros recursos nativos).

📄 Políticas de Permissão no IAM   
A concessão de acesso aos recursos de rede ocorre pela associação de Políticas do IAM — documentos JSON que especificam instruções de permissão (Allow) ou negação (Deny) — às entidades do sistema.

As políticas podem ser Gerenciadas pela AWS (modelos pré-configurados mantidos pelo provedor) ou Personalizadas pelo Cliente (alinhadas a requisitos específicos da organização). Uma política isolada permanece inerte até ser explicitamente vinculada a um usuário, grupo ou função do IAM.

<a name="item02.03"><h4>2.3 Security Features</h4></a>[Back to summary](#item02)

🛡️ Controles de Segurança e Monitoramento na Amazon VPC   
A proteção do tráfego de rede na Amazon VPC é estruturada por dois componentes fundamentais de filtragem: as Listas de Controle de Acesso à Rede (ACLs de rede / NACLs) e os Grupos de Segurança (Security Groups). A atuação desses mecanismos diferencia-se pelo nível de aplicação, pela gestão de estado das conexões e pelo suporte a regras de bloqueio explícito.

⚖️ Comparativo entre NACLs e Grupos de Segurança   
- Ponto de Aplicação: As ACLs de rede atuam na borda das sub-redes, filtrando apenas o tráfego que cruza os limites da sub-rede. Já os grupos de segurança funcionam no nível das interfaces de rede elásticas (ENIs) vinculadas diretamente aos recursos (como instâncias EC2). Comunicações entre recursos na mesma sub-rede não são afetadas pelas NACLs, mas passam pela validação do grupo de segurança.
- Gerenciamento de Estado (Stateful vs. Stateless): Grupos de segurança são stateful (mantêm o estado da conexão); se a entrada é autorizada, o tráfego de saída correspondente é liberado automaticamente. As NACLs são stateless (sem estado), exigindo a criação de regras explícitas bidirecionais (uma para o fluxo de entrada e outra para o fluxo de saída).
- Processamento de Regras: A NACL aceita instruções de permissão (Allow) e negação explícita (Deny), tornando-a a ferramenta ideal para bloquear intervalos de IP específicos. O grupo de segurança aceita exclusivamente regras de permissão (Allow), adotando uma negação implícita para qualquer tráfego não especificado.
- Sensibilidade a Recursos AWS: Grupos de segurança conseguem referenciar outros grupos de segurança ou a si mesmos como origem/destino de tráfego. As NACLs trabalham estritamente com blocos de endereçamento IP (CIDR).
- Comportamento Padrão: A NACL padrão criada junto com a VPC permite todo o tráfego de entrada e saída. Um grupo de segurança recém-criado bloqueia todo o tráfego de entrada por padrão e permite todo o tráfego de saída.

🔗 Encadeamento de Grupos de Segurança (Security Group Chaining)   
O alinhamento de grupos de segurança em camadas cria uma arquitetura de proteção em profundidade (defense-in-depth) para aplicações multicamadas:
- Camada Web: Libera acesso público exclusivo nas portas padrão de tráfego web (HTTP 80 / HTTPS 443).
- Camada de Aplicação: Restringe a entrada de tráfego autorizando apenas pacotes originados diretamente do grupo de segurança da camada web.
- Camada de Banco de Dados: Permite conexões exclusivas vindas do grupo de segurança alocado na camada de aplicação.

Essa topologia impede acessos diretos e não autorizados aos sistemas de retaguarda, garantindo que as solicitações sigam estritamente o fluxo da aplicação.

👁️ Ferramentas de Observabilidade e Resiliência   
A governança de rede na VPC inclui estratégias complementares de monitoramento e alta disponibilidade:
- Registros de Fluxo da VPC (VPC Flow Logs): Capturam metadados sobre o tráfego IP (aceito e rejeitado) que passa pelas interfaces de rede da VPC. O processamento ocorre fora do caminho de dados, sem impactar a latência ou a taxa de transferência. Os registros podem ser exportados para um bucket do Amazon S3 para auditoria técnica ou identificação de falhas de segurança.
- Amazon CloudWatch: Monitora métricas de utilização de infraestrutura e componentes da VPC (como endpoints de VPN e NAT Gateways). Picos atípicos em consumo de CPU, memória ou tráfego de rede auxiliam no reconhecimento precoce de incidentes de segurança.
- Implantações Multi-AZ: Distribuição de recursos em múltiplas Zonas de Disponibilidade para assegurar alta disponibilidade, reduzindo o impacto de falhas isoladas e minimizando a superfície de ataque útil.

<a name="item02.04"><h4>2.4 Adding High Availability</h4></a>[Back to summary](#item02)

⚖️ Elastic Load Balancing (ELB) e Alta Disponibilidade na VPC   
A eliminação de pontos únicos de falha e o tratamento de interrupções de serviços exigem a distribuição elástica do tráfego entre múltiplos recursos de computação. O Elastic Load Balancing (ELB) atua como o ponto central de entrada de conexões, gerenciando a distribuição automatizada de solicitações entre instâncias Amazon EC2, contêineres, funções AWS Lambda e endereços IP distribuídos em arquiteturas Multi-AZ.

A composição de uma VPC altamente disponível combina o uso de sub-redes duplicadas em Zonas de Disponibilidade distintas, integração com o AWS Auto Scaling para elasticidade e verificações de integridade (health checks) executadas pelo balanceador para desviar o tráfego de nós degradados.

🔀 Tipos de Balanceadores de Carga no ELB   
A família ELB oferece quatro modalidades de balanceadores, cada uma especializada em uma camada do modelo OSI ou caso de uso específico:
- Application Load Balancer (ALB): Opera na camada 7 (Aplicação), compreendendo protocolos HTTP/HTTPS. Permite o roteamento avançado com base em cabeçalhos, rotas de URL e nomes de host. Pode ser público (voltado para a internet) ou interno (para comunicação entre microsserviços na VPC).
- Network Load Balancer (NLB): Opera na camada 4 (Transporte), processando tráfego TCP, UDP e TLS. Projetado para baixíssima latência e alto desempenho, é capaz de escalar para milhões de requisições por segundo e suporta a atribuição de endereços IP estáticos.
- Gateway Load Balancer (GWLB): Opera na camada 3 (Rede), atuando na inspeção e roteamento transparente de pacotes IP. É utilizado para implantar, escalar e gerenciar appliances virtuais de terceiros (como firewalls de última geração e sistemas de detecção de intrusão - IDS/IPS) via protocolo GENEVE na porta 6081.
- Classic Load Balancer (CLB): Solução legada de gerações anteriores que operava nas camadas 4 e 7. Seu uso é desaconsehado para novas implantações, devendo ser substituído pelo ALB ou NLB.

🏗️ Padrões de Arquitetura Multi-AZ com ELB   
A construção de topologias resilientes e tolerantes a falhas na VPC personalizada exige a aplicação dos seguintes princípios estruturais:
- Sub-redes em Zonas de Disponibilidade Distintas: Provisionamento de pelo menos duas sub-redes em AZs separadas. Caso ocorra uma falha física em uma das zonas, o tráfego é absorvido imediatamente pela infraestrutura situada na zona remanescente.
- Associação Reutilizável de Tabelas de Roteamento: Uma única tabela de rotas pode ser associada a múltiplas sub-redes para padronizar o comportamento do tráfego. No entanto, cada sub-rede individual pode estar vinculada a apenas uma tabela de roteamento por vez.
- Inspeção de Segurança Transparente via Endpoints de GWLB: O tráfego do consumidor atravessa endpoints de VPC dedicados para ser inspecionado na VPC do provedor de serviços antes de atingir os servidores de aplicação. A sub-rede do aplicativo e a sub-rede do endpoint devem ser mantidas separadas para permitir o direcionamento correto de próximo salto (next hop) na tabela de rotas.
- Estratégias de Implantação: O gerenciamento do tráfego via ALB viabiliza padrões avançados de engenharia, como testes A/B e implantações do tipo Azul/Verde (Blue/Green), minimizando o tempo de inatividade durante atualizações de sistemas.

<a name="item02.05"><h4>2.5 Security Compliance Resources</h4></a>[Back to summary](#item02)

📜 Conformidade e Recursos de Governança na Amazon VPC   
A definição das responsabilidades do cliente quanto à conformidade em um ambiente Amazon VPC depende da sensibilidade das informações manipuladas, dos requisitos regulatórios do setor e do framework legal aplicável. Dentro do Modelo de Responsabilidade Compartilhada, o cliente é o responsável por configurar a infraestrutura de rede e os controles de acesso em conformidade com as exigências específicas do seu negócio.

Para apoiar o desenvolvimento de arquiteturas auditáveis e alinhadas aos padrões de conformidade do mercado, a AWS disponibiliza um conjunto de recursos e ferramentas documentais:
- Documentação Técnica de Melhores Práticas de Segurança: Diretrizes e padrões arquiteturais para a configuração segura de VPCs, sub-redes, tabelas de rotas e filtragem de tráfego.
- Página Inicial de Conformidade da AWS: Portal centralizado com relatórios de auditoria, certificações de mercado (como ISO, SOC, PCI-DSS) e mapeamentos de conformidade regulatória.
- Central de Segurança da AWS: Repositório que reúne orientações, ferramentas e serviços nativos para a proteção da infraestrutura e mitigação de ameaças na nuvem.
- Guias de Início Rápido de Segurança e Conformidade: Modelos de implantação automatizada para estabelecer ambientes seguros e em conformidade de forma acelerada.
- Guia do Desenvolvedor do AWS Config: Documentação focada na avaliação, auditoria e monitoramento contínuo de recursos por meio de regras configuráveis para validação do estado da VPC.

<a name="item03"><h4>Multi-Tier Architecture</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Introduction - Multi-Tier Architecture</h4></a>[Back to summary](#item03)

🎯 Objetivos do Módulo   
Neste módulo, o conteúdo foca no projeto de redes virtuais sob medida, na estruturação de aplicações resilientes e na aplicação de estratégias avançadas de isolamento técnico, cobrindo os seguintes tópicos:
- Design de VPC Personalizada: Metodologia para dimensionar e configurar blocos de endereçamento IP, sub-redes e topologias de rede alinhadas aos requisitos do negócio.
- Arquiteturas de Aplicações em Múltiplas Camadas: Estruturação de projetos em camadas separadas (Web, Aplicação e Banco de Dados) para promover isolamento de funções, alta disponibilidade e escalabilidade.
- Endurecimento da Segurança na VPC: Técnicas para reforçar a proteção do ambiente por meio da customização de rotas, políticas de controle de acesso e inspeção de tráfego.
- Mitigação de Exposição de Recursos: Estratégias para restringir a superfície de ataque, isolando componentes críticos em sub-redes privadas e limitando a conectividade com a internet externa.

<a name="item03.02"><h4>3.2 Production-Ready: Multi-Tier Architecture for an Amazon VPC</h4></a>[Back to summary](#item03)

🏗️ Arquitetura de Múltiplas Camadas e Segurança em Nuvem   
A segurança e resiliência de ambientes em nuvem baseiam-se na responsabilidade compartilhada e no princípio da segurança em profundidade (defense-in-depth). O isolamento de recursos em arquiteturas de múltiplas camadas (n-tier) estabelece barreiras progressivas entre ameaças externas e componentes sensíveis da aplicação.

Conforme a perspectiva de segurança do AWS Cloud Adoption Framework (AWS CAF), a governança da infraestrutura apoia-se em cinco pilares fundamentais: AWS IAM (gestão de acessos), Controles Detectivos (visibilidade e auditoria), Segurança da Infraestrutura (redução da superfície de ataque), Proteção de Dados (criptografia em trânsito e em repouso) e Resposta a Incidentes (mecanismos estruturados de mitigação).

🛡️ Comparativo de Topologias: Camada Única vs. Múltiplas Camadas   
A escolha da estrutura de sub-redes dentro da VPC depende criticamente dos requisitos de disponibilidade, sensibilidade de dados e escopo do negócio:
- Camada Única (Single-Tier): Aloca todos os componentes da aplicação (web, processamento e banco de dados) em uma única sub-rede pública. Indicada exclusivamente para aplicações de baixo risco, ambientes de teste isolados, blogs pessoais ou sistemas sem dados sensíveis e sem exigência de alta disponibilidade. Expõe todos os recursos diretamente à rede externa.
- Múltiplas Camadas (N-Tier): Segrega componentes em sub-redes públicas e privadas encadeadas. A exposição externa é limitada a endpoints gerenciados, enquanto as camadas de negócio e persistência permanecem isoladas do tráfego direto da internet.

📐 Estrutura Padrão de Arquitetura em Três Camadas   
Uma topologia comum de alta disponibilidade e segurança para ambientes de produção organiza-se da seguinte forma:
- Camada 1 - Sub-rede Pública (Borda/Entrada): Dimensionada com um bloco IP menor (ex: /24), abriga exclusivamente recursos de borda. Utiliza Application Load Balancers (ALB) para distribuição de tráfego de entrada e Gateways NAT para prover saída segura à internet para as sub-redes privadas.
- Camada 2 - Sub-rede Privada de Aplicação (Processamento): Aloca as instâncias computacionais (Amazon EC2) e contêineres sem acesso direto da internet. Exige o maior dimensionamento de endereços IP (ex: /20 ou /22) para acomodar a elasticidade e escalabilidade horizontal das aplicações.
- Camada 3 - Sub-rede Privada de Dados (Persistência): Posicionada na retaguarda da camada de aplicação, abriga bancos de dados gerenciados (Amazon RDS ou Amazon DynamoDB). Utiliza configurações Multi-AZ com réplicas de leitura ou instâncias de standby em Zonas de Disponibilidade distintas. O dimensionamento de IPs é intermediário, suficiente para expansão de clusters de dados.

📐 Planejamento de Endereçamento IP e Dimensionamento de CIDR   
O projeto do bloco CIDR de uma VPC exige planejamento de longo prazo (mínimo de dois anos) devido à impossibilidade de alterar o intervalo principal após o provisionamento:
- Máscaras Permitidas: Variam do bloco máximo /16 (65.536 IPs) ao bloco mínimo /28 (16 IPs).
- IPs Reservados pela AWS: Em toda sub-rede criada, a AWS reserva automaticamente 5 endereços IP (os quatro primeiros e o último do bloco) para funções de rede como roteador, DNS e broadcasting.
- Sobreposição de Redes: Em ambientes híbridos, o CIDR da VPC jamais deve se sobrepor aos blocos de IP utilizados no data center local ou em outras VPCs interconectadas.
- Endereço Não Alocado: Sub-redes e VPCs não geram custos diretos adicionais; portanto, é recomendável alocar blocos maiores e manter intervalos de IP livres para futuras alterações arquiteturais.

🌐 Conectividade e Isolação Avançada   
Para cenários complexos ou corporativos, o isolamento e comunicação entre infraestruturas utilizam recursos dedicados:
- Isolamento de Ambientes: Recomendação de manter VPCs fisicamente separadas para os ambientes de Desenvolvimento, Teste e Produção.
- Emparelhamento de VPC (VPC Peering): Conexão privada direta entre duas VPCs (mesma conta ou contas distintas) roteando tráfego interno sem passar pela internet.
- Conexões Híbridas (VPN e AWS Direct Connect): Integração segura de redes locais (on-premises) com a VPC via túneis criptografados ou links físicos dedicados.
- VPC Endpoints (AWS PrivateLink): Permite que recursos da VPC acessem serviços da AWS (como Amazon S3 ou DynamoDB) utilizando exclusivamente a rede privada da AWS, sem necessidade de gateways de internet ou IPs públicos.