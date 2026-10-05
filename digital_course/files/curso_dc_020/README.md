# Amazon Virtual Private Cloud (Amazon VPC) - Troubleshooting   <img src="./0-aux/logo_course.png" alt="curso_dc_020" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_020 (Amazon Virtual Private Cloud (Amazon VPC) - Troubleshooting)   <img src="./0-aux/logo_course.png" alt="curso_dc_020" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260911_dc_020_en.pdf">Certificate</a>

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
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon Virtual Private Cloud (VPC)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_vpc.svg" alt="aws_vpc" width="auto" height="25">
  - AWS Command Line Interface (CLI)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_cli.svg" alt="aws_cli" width="auto" height="25">
  - AWS Management Console   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_management_console.svg" alt="aws_management_console" width="auto" height="25">
  - AWS Site-to-Site VPN   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_site-to-site_vpn.jpg" alt="aws_site-to-site_vpn" width="auto" height="25">
  - AWS Support   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_support.png" alt="aws_support" width="auto" height="25">
  - AWS Transit Gateway   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_transit_gateway.png" alt="aws_transit_gateway" width="auto" height="25">
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
1. <a href="#item01">Introduction</a><br>
  1.1 <a href="#item01.01">Overview of Amazon VPC</a><br>
  1.2 <a href="#item01.02">Gathering Information with the AWS Management Console</a><br>
  1.3 <a href="#item01.03">Gathering Information Using the CLI</a><br>
2. <a href="#item02">Troubleshooting</a><br>
  2.1 <a href="#item02.01">General Problem Determination</a><br>
  2.2 <a href="#item02.02">Amazon VPC Troubleshooting Tools</a><br>
  2.3 <a href="#item02.03">Troubleshooting Communication Issues</a><br>
  2.4 <a href="#item02.04">Troubleshooting Issues with AWS Interface Endpoints</a><br>
  2.5 <a href="#item02.05">Troubleshooting Unable to Delete VPC Resources</a><br>
3. <a href="#item03">Getting Help</a><br>
  3.1 <a href="#item03.01">Support</a><br>

---

### Objective:
O curso teve como objetivo capacitar na identificação, diagnóstico e resolução de problemas comuns de conectividade, desempenho e estabilidade na Amazon VPC. A formação abordou a coleta de dados de diagnóstico via Console da AWS e AWS CLI, a interpretação de tabelas de rotas, grupos de segurança e NACLs, e o uso de ferramentas avançadas como VPC Reachability Analyzer, VPC Flow Logs e Traffic Mirroring. Além disso, detalhou a resolução de falhas em conexões VPN, Peering, NAT Gateways, Endpoints (Interface e Gateway) e Transit Gateway, instruindo também sobre a exclusão de dependências de recursos (ENIs gerenciadas) e os requisitos para a abertura eficiente de chamados junto ao Suporte da AWS.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introduction</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Overview of Amazon VPC</h4></a>[Back to summary](#item01)

🌐 Visão Geral do Amazon VPC   
O Amazon Virtual Private Cloud (Amazon VPC) provê uma estrutura de rede privada e isolada dentro da nuvem da AWS, simulando o comportamento de um data center tradicional. O serviço garante total controle operacional sobre a topologia de rede, incluindo o endereçamento IP, a criação de sub-redes e o roteamento.

🚀 Recursos e Funcionalidades   
- Registros de Fluxo (Flow Logs): Capturam metadados do tráfego de rede das interfaces ENI, fornecendo visibilidade da Camada 3 (L3), como endereços IP de origem e destino, para análise e auditoria.
- Gerenciador de Endereços IP (IPAM): Automatiza o planejamento, a alocação e o monitoramento da faixa de IPs corporativa nas cargas de trabalho.
- Roteamento de Entrada (Ingress Routing): Permite redirecionar o tráfego recebido por um Internet Gateway ou Virtual Private Gateway (VGW) para instâncias EC2, firewalls ou endpoints específicos antes do destino final.
- Espelhamento de Tráfego: Copia os pacotes de uma ENI e os encaminha para ferramentas de segurança externas para inspeção profunda (Deep Packet Inspection).

🛡️ Camadas de Segurança   
- Grupos de Segurança (Security Groups)
  - Atuam como firewalls virtuais no nível da interface de rede (ENI).
  - Comportamento Stateful: O tráfego de retorno é liberado automaticamente, pois a conexão ativa é registrada na tabela de estado.
  - Regras de Permissão: Suportam apenas regras de liberação (Allow), não sendo possível configurar bloqueios explícitos (Deny).
  - Avaliação Global: Todas as regras cadastradas são processadas em conjunto para determinar a liberação da conexão.
- Listas de Controle de Acesso à Rede (Network ACLs)
  - Atuam como uma camada adicional de proteção operando diretamente no nível da sub-rede.
  - Comportamento Stateless: Não armazenam o estado das conexões. Requisições e respostas exigem regras explícitas tanto na entrada quanto na saída.
  - Regras Ordenadas: Aceitam bloqueios explícitos (Deny) e liberações (Allow). O processamento ocorre em ordem numérica crescente, encerrando a verificação na primeira correspondência encontrada.

🛣️ Roteamento e Resolução de Nomes   
- Tabelas de Rotas:
  - Conjuntos de regras que definem os caminhos para o encaminhamento de pacotes dentro e fora da VPC.
  - Precedência do Prefixo Mais Específico: O roteador da VPC prioriza a rota que apresentar a máscara de rede mais restrita.
  - Prioridade Local: Rotas dentro do bloco CIDR interno da VPC possuem precedência padrão sobre outros alvos, garantindo a comunicação interna.
  - Status "Buraco Negro" (Blackhole): Indica que o componente configurado como alvo foi removido ou não está mais acessível.
  - Diagnóstico de Hosts: Problemas de conectividade em instâncias exigem a validação das tabelas de rotas do próprio sistema operacional (`route -n` no Linux ou `route print` no Windows).

🔌 Conectividade e Integrações   
- Gateway de Tradução de Endereço de Rede (NAT Gateway)
  - Dispositivo gerenciado que permite às instâncias em sub-redes privadas iniciarem conexões de saída com a internet ou outros serviços da AWS, impedindo que a internet inicie conexões diretas de entrada com essas instâncias. Disponível em modelos públicos, privados e com suporte a tradução IPv6/IPv4 (NAT64/DNS64).
- Endpoints de VPC (AWS PrivateLink)
  - Estabelecem comunicação privada entre a VPC e os serviços suportados sem utilizar gateways de internet, VPNs ou conexões diretas.
  - Endpoint de Interface: Cria uma ENI com IP privado na sub-rede para intermediar o tráfego para serviços AWS ou de terceiros.
  - Endpoint de Gateway: Funciona como um alvo na tabela de rotas, exclusivo para direcionar o tráfego de serviços como Amazon S3 e Amazon DynamoDB.
  - Endpoint de Balanceador de Carga de Gateway: Utiliza uma ENI privada para interceptar o tráfego e redirecioná-lo para appliances de rede e inspeção de segurança.
- Emparelhamento de VPC (VPC Peering)
  - Conexão de rede entre duas VPCs que permite a troca de tráfego de forma privada através da infraestrutura da AWS.
  - Sem Overlap de IP: Não permite a conexão de VPCs que possuam blocos CIDR sobrepostos.
  - Ausência de Roteamento Transitivo: A comunicação ocorre exclusivamente entre os dois pontos da relação. Um host na VPC A não alcança a VPC C passando pela VPC B.
  - Resolução DNS: Exige configurações explícitas no serviço para que nomes públicos e privados sejam traduzidos corretamente para os IPs internos no ambiente emparelhado.
- Interface de Rede Elástica (ENI)
  - Componente lógico que representa uma placa de rede virtual vinculada a uma instância ou serviço na VPC, responsável por associar IPs privados, IPs públicos e grupos de segurança.

<a name="item01.02"><h4>1.2 Gathering Information with the AWS Management Console</h4></a>[Back to summary](#item01)

📐 Modelagem Arquitetural e Boas Práticas   
A representação gráfica da topologia de uma Amazon VPC possibilita a visualização do fluxo de dados e dos componentes interconectados, facilitando a identificação de gargalos e a resolução de falhas estruturais.
- Amazon VPC: Ambiente virtualizado e isolado para execução de recursos na nuvem.
- Virtual Private Gateway (VGW): Ponto de terminação no lado da AWS para conexões VPN Site-to-Site vinculadas a uma única VPC. Para topologias multi-VPC, o AWS Transit Gateway é a solução indicada.
- Internet Gateway (IGW): Componente de borda de alta disponibilidade que provê comunicação bidirecional entre recursos em sub-redes públicas e a rede externa via endereçamento IPv4 público ou IPv6.
- Sub-rede: Divisão logica de um bloco CIDR da VPC. Segmenta-se em pública (com rota para a internet) ou privada (isolada de acesso externo direto).
- Instância Amazon EC2: Capacidade computacional dimensionável alocada dentro das sub-redes para execução das aplicações.

🎛️ Navegação no Console VPC   
A interface administrativa do serviço é estruturada em três áreas primárias para gestão operacional:
- Painel de Navegação Lateral: Menu de acesso direto aos objetos de rede, como Sub-redes, Tabelas de Roteamento, Gateways, Endpoints e elementos de segurança.
- Seletor de Recursos (Painel Superior): Lista os recursos cadastrados da categoria selecionada (como as VPCs ativas), permitindo ordenação por colunas e filtragem.
- Visualizador de Detalhes (Painel Inferior): Exibe as propriedades específicas do item selecionado no painel superior, como opções DHCP, associações de tabela de roteamento e Network ACLs.

🔍 Inspeção de Componentes e Diagnóstico   
Resolução de Segurança e Roteamento   
Para examinar a política de acesso e as rotas aplicadas a um host específico:
- Acesse o console do Amazon EC2 e selecione a instância alvo.
- Na guia de detalhes do host, identifique o ID da Sub-rede associado.
- Navegue até os detalhes da sub-rede para inspecionar a Tabela de Rotas vinculada e o ID da Network ACL (NACL) com suas respectivas regras de entrada e saída.
- Para interfaces genéricas sem vínculo direto com o EC2, utilize o menu Interfaces de Rede (ENI) para localizar a sub-rede e a VPC correspondentes.

Localização de Grupos de Segurança   
Como os grupos de segurança operam na camada da ENI, sua verificação ocorre acessando a aba de Segurança nos detalhes da instância EC2. As regras ativas de entrada e saída são exibidas nesta seção, disponibilizando links diretos para a interface de edição das políticas de tráfego.

🔗 Inspeção de Conectividade Avançada   
Interconexão VPC (VPC Peering)   
A verificação de enlaces entre VPCs no console exige a validação de parâmetros críticos para o estabelecimento de tráfego:
- Contas e Regiões: Identificação dos IDs de proprietário, VPCs de origem (solicitante) e destino (aceitante), além de suas respectivas regiões.
- Conflitos de IP: Validação das faixas CIDR registradas para garantir que não exista sobreposição de endereços entre as redes interconectadas.
- Configuração DNS: Verificação das opções de resolução de nomes para permitir que nomes de hosts públicos e privados sejam traduzidos para IPs internos da rede remota.
- Tabelas de Rotas: Validação manual de que os caminhos para o CIDR remoto estão apontando explicitamente para o ID da conexão de peering.

Endpoints de VPC   
No menu de Endpoints, é possível inspecionar os pontos de conexão privada baseados no AWS PrivateLink:
- Detalhamento Geral: Apresenta o ID do endpoint, estado operacional, nomes de domínio zonais/regionais e o status do DNS privado.
- Interfaces e Sub-redes: Identifica a sub-rede vinculada, o endereço IP privado atribuído e a ENI correspondente.
- Segurança: Permite acessar e modificar os grupos de segurança associados aos endpoints de interface.

Gateways NAT   
A verificação de dispositivos NAT é feita pela seleção do recurso no painel dedicado, fornecendo dados operacionais como:
- ID do Gateway NAT e estado atual.
- Endereço IP privado alocado e mapeamento de IP elástico.
- ID da ENI associada e máscara da sub-rede de implantação.

💡 Recursos Operacionais e Dicas de Gerenciamento   
- Identificadores de Zona de Disponibilidade (AZ ID): Os nomes das zonas (ex: us-east-1a) possuem mapeamentos físicos diferentes para cada conta AWS. O código único e absoluto da zona deve ser verificado no bloco de integridade do painel do EC2.
- Navegação Cruzada via Hyperlinks: O console fornece links diretos entre recursos encadeados (como do IP da ENI para a sub-rede e para o Security Group), reduzindo erros de contexto durante a alteração de parâmetros.
- Filtros Estruturados: A barra de busca aceita IDs específicos (ex: vpc-xxxxxxxx) para restringir a exibição apenas aos objetos associados àquela infraestrutura em particular.

<a name="item01.03"><h4>1.3 Gathering Information Using the CLI</h4></a>[Back to summary](#item01)

💻 Gestão de Redes via AWS CLI   
O gerenciamento e a coleta de dados de infraestrutura da Amazon VPC por meio da linha de comando são realizados pelo utilitário aws cli. Como os recursos de rede pertencem ao ecossistema de computação, todas as chamadas de API relacionadas à VPC utilizam o serviço ec2 como prefixo nos comandos.

🛠️ Comandos de Inspeção e Diagnóstico   
- Coleta de Dados de Instâncias e Interfaces:
  - `aws ec2 describe-instances`: Obtém o estado e os parâmetros de rede das instâncias, incluindo a identificação da VPC, sub-redes associadas, grupos de segurança vinculados a cada interface e a configuração da checagem de origem/destino (Source/Destination Check).
  - `aws ec2 describe-network-interfaces`: Retorna dados detalhados das placas virtuais (ENI). É essencial para diagnosticar a conectividade de serviços gerenciados que não possuem instâncias EC2 visíveis diretamente, como bancos de dados Amazon RDS e instâncias de gateways. Exibe endereçamento IP público/privado, sub-rede e grupos de segurança.
- Auditoria de Tráfego e Endpoints:
  - `aws ec2 describe-flow-logs`: Consulta as configurações dos registros de tráfego de rede habilitados. Para a leitura do conteúdo dos logs gravados, utiliza-se a API do Amazon CloudWatch Logs ou a consulta direta aos buckets no Amazon S3, dependendo do destino configurado.
  - `aws ec2 describe-vpc-endpoints`: Exibe as propriedades dos endpoints de interface e gateway (tecnologia PrivateLink), incluindo sub-redes vinculadas, estado do DNS privado, políticas de acesso anexadas e grupos de segurança aplicados.
  - `aws ec2 describe-nat-gateways`: Lista os gateways de tradução de endereços presentes na VPC. Permite validar a sub-rede de implantação e a presença de mapeamento de IP público; a ausência deste último indica que a estrutura opera como um NAT estritamente privado.
- Controle de Acesso e Roteamento:
  - `aws ec2 describe-route-tables`: Detalha as rotas cadastradas, indicando blocos CIDR de destino, alvos (targets), estados da conexão e associações explícitas com sub-redes ou gateways. Sub-redes sem vinculação direta utilizam a tabela de rotas principal de forma implícita.
  - `aws ec2 describe-network-acls`: Lista as regras de segurança sem estado (stateless) configuradas no nível de sub-rede, exibindo a ordem numérica de avaliação das liberações e bloqueios.
  - `aws ec2 describe-security-group-rules`: Retorna as regras individuais de entrada e saída associadas aos grupos de segurança stateful, incluindo portas, protocolos e origens/destinos permitidos.
- Mapeamento de Infraestrutura: 
  - `aws ec2 describe-availability-zones`: Fornece o status operacional e as mensagens de integridade das Zonas de Disponibilidade, Zonas Locais e regiões Wavelength. Utilizado para mapear os identificadores físicos únicos das zonas (AZ ID) associados à conta.

<a name="item02"><h4>Troubleshooting</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 General Problem Determination</h4></a>[Back to summary](#item02)

🔍 Metodologia de Diagnóstico e Resolução de Falhas   
A determinação da causa raiz de incidentes operacionais exige uma abordagem estruturada. Seguir um fluxo lógico de investigação acelera a restauração dos serviços e reduz o impacto na infraestrutura.
- Classificar o Problema: Categorize a falha com base nos sintomas apresentados. Avalie códigos de erro retornados em APIs, mensagens exibidas nos consoles de administração, falhas reportadas por usuários em navegadores e exceções gravadas nos arquivos de log.
- Coletar Dados de Diagnóstico: Reúna evidências operacionais a partir das ferramentas de monitoramento e rastreamento ativas. Caso o incidente não possua registros suficientes, configure os coletores de telemetria necessários e reproduza o comportamento anômalo.
- Analisar Informações: Inspecione os arquivos de log e métricas. Em ambientes conteinerizados como o Amazon ECS, utilize drivers de log para centralizar a saída dos contêineres no Amazon CloudWatch Logs. Para grande volume de dados, empregue ferramentas analíticas como Amazon Athena, CloudWatch Logs Insights, Splunk ou Sumo Logic.
- Consultar Documentação Técnica: Pesquise na documentação oficial dos serviços e bases de conhecimento por problemas conhecidos, limitações operacionais e padrões de arquitetura recomendados.
- Aplicar e Validar Soluções: Implemente as correções propostas de forma incremental. Aplique uma alteração por vez e execute testes de validação após cada mudança para isolar o fator que efetivamente resolveu a falha.

🆘 Escalamento e Suporte Especializado   
Caso os procedimentos padrão de solução de problemas não identifiquem a origem do incidente, recorra aos canais de assistência técnica da AWS:
- AWS re:Post: Fórum comunitário gerenciado para publicação de dúvidas técnicas e busca de soluções validadas por outros profissionais da nuvem.
- AWS IQ: Plataforma para contratação direta de especialistas e consultores certificados pela AWS para demandas pontuais, com faturamento integrado à conta da AWS.
- AWS Support: Abertura de chamados de suporte técnico diretamente com os engenheiros da AWS. Para otimizar o atendimento, envie todo o histórico de diagnóstico compilado, como os dados obtidos por meio de scripts automatizados de coleta de logs do Amazon ECS.

<a name="item02.02"><h4>2.2 Amazon VPC Troubleshooting Tools</h4></a>[Back to summary](#item02)

🕵️ Diagnóstico de Conectividade e Ferramentas de Análise   
A identificação de falhas de comunicação entre recursos na nuvem e redes locais exige ferramentas específicas para isolar se a origem do problema está em componentes da AWS ou em dispositivos da infraestrutura física.

🧭 Analisador de Acessibilidade (VPC Reachability Analyzer)   
Ferramenta de análise estática que verifica a viabilidade de caminhos de rede entre um recurso de origem e um de destino dentro da infraestrutura virtual.
- Avaliação Baseada em Modelos: Não realiza o envio real de pacotes pela rede. Em vez disso, constrói um modelo lógico a partir das configurações ativas no ambiente.
- Componentes Auditados: Valida automaticamente as regras de grupos de segurança, ACLs de rede, tabelas de rotas e elementos intermediários como NAT Gateways e conexões de VPC Peering.
- Escopo de Atuação: Opera estritamente no âmbito de uma única conta e região, identificando pontos exatos de bloqueio ou rotas ausentes na topologia.
- Fluxo de Operação: A análise é configurada especificando a origem, o destino, o protocolo e a porta de comunicação, gerando um relatório detalhado com o estado de acessibilidade e a causa de eventuais interrupções.

📊 Registros de Fluxo (VPC Flow Logs)   
Mecanismo de telemetria para captura de metadados do tráfego IP de entrada e saída nos níveis de ENI, sub-rede ou VPC inteira.
- Escopo e Granularidade: O acionamento em níveis superiores (sub-rede ou VPC) aplica a coleta a todas as interfaces de rede vinculadas àquele escopo.
- Limitações Operacionais: Não provê monitoramento em tempo real nem inspeção do conteúdo de pacotes individuais. Registra exclusivamente dados das Camadas 3 e 4 (L3/L4), omitindo requisições ao serviço de DNS nativo da AWS.
- Estrutura de Dados: Coleta informações como identificador da interface, endereços e portas de origem/destino, protocolo transportado, volume de pacotes e bytes, janelas temporais e o status final da conexão (ACCEPT ou REJECT).

🪞 Espelhamento de Tráfego (Traffic Mirroring)   
Funcionalidade destinada à inspeção profunda de pacotes (Deep Packet Inspection) e ao monitoramento de ameaças.
- Cópia de Tráfego: Replica o fluxo de dados bruto de uma interface de rede de origem do tipo EC2 e o encaminha para um destino especificado para análise de segurança fora de banda.
- Encapsulamento de Pacotes: O tráfego espelhado é empacotado via protocolo VXLAN, utilizando a porta UDP 4789, exigindo que os sistemas de captura no destino estejam preparados para escutar nesta porta específica.

📈 Métricas de Desempenho do Adaptador ENA (Elastic Network Adapter)   
O driver de rede ENA disponibiliza métricas de hardware e driver para identificar gargalos de capacidade e saturação de recursos na instância EC2.
- Estouro de Largura de Banda (bw_in_allowance_exceeded / bw_out_allowance_exceeded): Contadores de pacotes descartados ou enfileirados devido ao tráfego de entrada ou saída ter ultrapassado o limite máximo suportado pelo porte da instância.
- Excesso de Rastreamento de Conexões (conntrack_allowance_exceeded): Pacotes rejeitados por o número de conexões ativas ter atingido a capacidade máxima da tabela de estado da instância, impedindo novos fluxos.
- Limite de Serviços Locais (linklocal_allowance_exceeded): Descartes ocorridos por exceder a taxa de pacotes por segundo destinada aos proxies locais da AWS, afetando serviços como DNS interno, metadados da instância (IMDS) e sincronização de tempo (NTP).
- Limite Bidirecional de Pacotes (pps_allowance_exceeded): Indica o esgotamento da taxa total de pacotes por segundo (PPS) suportada pela interface.

<a name="item02.03"><h4>2.3 Troubleshooting Communication Issues</h4></a>[Back to summary](#item02)

🛠️ Diagnóstico Passo a Passo de Conectividade em VPC   
A identificação manual de falhas de comunicação de instâncias com a internet pública exige a verificação sequencial de cada componente presente no caminho do tráfego.
- Identificação dos Sintomas: Validação do comportamento anômalo a partir da instância, como a incapacidade de carregar páginas externas via navegador ou falha no estabelecimento de conexões HTTP/HTTPS.
- Coleta de Informações Operacionais: Execução de testes de conectividade via linha de comando no host (como a ferramenta ping). O teste em direção a um IP público válido avalia a conectividade direta de rede, enquanto o teste via nome de domínio valida se o serviço de resolução de DNS interno está operacional.
- Validação do Host e da Interface: Inspeção da instância EC2 no console para confirmar a presença de uma interface ENI ativa com um endereço IP público IPv4 ou IP Elástico alocado.
- Checagem de Borda (Internet Gateway): Confirmação de que a VPC possui um Internet Gateway (IGW) criado e devidamente associado ao identificador da VPC.
- Auditoria de Grupos de Segurança: Inspeção das regras de saída (outbound) vinculadas à ENI da instância para garantir a permissão do tráfego destinado à porta/protocolo desejado ou para a faixa 0.0.0.0/0.
- Auditoria de NACLs: Verificação das regras de entrada e saída na Network ACL da sub-rede. Como as NACLs operam de forma stateless, a liberação para a faixa de IPs externos e para as portas efêmeras de retorno deve ser configurada em ambas as direções.
- Tabela de Rotas da Sub-rede: Confirmação de que a tabela de rotas associada à sub-rede possui uma rota padrão 0.0.0.0/0 tendo como alvo o ID do Internet Gateway.
- Tabela de Rotas do Sistema Operacional: Validação interna na instância via comandos nativos (`netstat -rn` no Linux ou `route print` no Windows) para garantir que a rota padrão local aponta corretamente para a ENI principal da sub-rede.

🔀 Resolução de Problemas por Cenário de Arquitetura   
1. Conectividade via Gateway NAT (Sub-redes Privadas)   
Instâncias em sub-redes privadas que dependem de um NAT Gateway para acesso externo exigem a verificação de duas tabelas de roteamento distintas:
- Tabela Privada: Deve conter uma rota de saída (0.0.0.0/0) cujo destino (target) seja o ID do NAT Gateway.
- Tabela Pública: A sub-rede pública onde o NAT Gateway está alocado deve conter uma rota de saída (0.0.0.0/0) direcionada ao Internet Gateway.
- Segurança Intermediária: As NACLs de ambas as sub-redes (pública e privada) precisam autorizar explicitamente o fluxo de requisição e de resposta entre os blocos CIDRs internos e a rede externa.

2. Comunicação Intra-VPC e Resolução de Nomes   
Erros de comunicação entre sub-redes da mesma VPC frequentemente envolvem falhas de DNS ou de roteamento interno:
- Resolução para IPs Públicos: Se nomes de hosts internos resolvem para IPs públicos em vez de IPs privados, a consulta deve ser redirecionada para o DNS nativo da AWS (AmazonProvidedDNS).
- Zonas Hospedadas Privadas no Route 53: Para que os registros de uma zona privada sejam resolvidos, a zona precisa estar associada explicitamente à VPC de origem. Caso exista um servidor DNS customizado no ambiente, ele deve possuir um encaminhador condicional para o IP reservado da VPC.
- Atributos de DNS da VPC: As opções de VPC enableDnsHostnames e enableDnsSupport devem estar definidas como true.
- Rotas de Sistema Operacional (L2/L3): Para comunicação entre hosts na mesma sub-rede, a tabela do SO deve manter a rota de Camada 2 (L2) vinculada à interface física. Para sub-redes distintas, o gateway padrão da sub-rede deve estar configurado no SO.

3. Comunicação via VPC Peering   
Falhas de tráfego entre VPCs distintas interconectadas via enlace de Peering exigem a validação dos seguintes pontos:
- Roteamento Bidirecional: A tabela de rotas da VPC de origem deve apontar o CIDR de destino para o ID da conexão de peering. Da mesma forma, a tabela da VPC de destino precisa conter a rota de retorno apontando para a VPC de origem.
- Resolução de Nomes entre VPCs: Para resolver nomes DNS públicos para IPs privados através do peering, a opção de resolução de DNS na conexão de peering deve ser habilitada, juntamente com os atributos globais de DNS em ambas as VPCs.
- Segurança Cruzada: Os grupos de segurança e as NACLs nas duas pontas devem autorizar o tráfego de origem e os blocos CIDR remotos em ambos os sentidos.

<a name="item02.04"><h4>2.4 Troubleshooting Issues with AWS Interface Endpoints</h4></a>[Back to summary](#item02)

🔌 Troubleshooting de VPC Endpoints (AWS PrivateLink)   
A falha na comunicação privada via Endpoints entre instâncias EC2 e serviços da AWS (ou parceiros) exige a análise de resolução DNS, políticas de acesso e tabelas de roteamento.
- Resolução de Nomes Padrão: As APIs da AWS utilizam domínios públicos padrão. Para que essas URLs resolvam diretamente para os IPs privados da ENI do endpoint, a opção Private DNS deve estar habilitada no endpoint e os atributos de DNS da VPC (enableDnsHostnames e enableDnsSupport) devem estar ativos no resolvedor interno da AWS.
- Encaminhamento em DNS Customizado: Ambientes que utilizam servidores DNS próprios (como Active Directory ou servidores externos) precisam de regras de encaminhamento condicional apontando para o servidor DNS nativo da VPC ou para um endpoint do Amazon Route 53 Resolver.
- Portas e Regras de Segurança: Os endpoints de interface operam na porta TCP 443. O Grupo de Segurança da instância de origem deve autorizar a saída TCP 443 para a ENI do endpoint. Por sua vez, o Grupo de Segurança anexado ao endpoint precisa permitir a entrada TCP 443 proveniente da origem. As NACLs de ambas as sub-redes também devem liberar esse tráfego bidirecionalmente.
- Roteamento Multi-VPC: Quando o endpoint reside em uma VPC diferente da instância de origem, a tabela de rotas da sub-rede local precisa conter o caminho direcionado ao enlace correspondente (VPC Peering ou Transit Gateway).

🚫 Conflitos de Domínio e DNS Privado   
O erro que impede a ativação do Private DNS ao criar um endpoint ocorre quando já existe uma zona hospedada privada registrada para o mesmo nome de serviço na VPC.
- Causa Raiz: A ativação do Private DNS instrui a AWS a criar automaticamente uma zona hospedada privada invisível vinculada à VPC. Se a VPC já possuir uma zona com essa mesma nomenclatura (criada na própria conta ou associada por uma conta centralizadora de organização), a criação falha por duplicidade.
- Validação: Verifique a existência de zonas privadas no Route 53 cobrindo o nome do serviço ou utilize o utilitário nslookup dentro de uma instância para checar se o domínio já é resolvido para um IP privado.
- Resolução: Desative a opção Private DNS durante a criação do endpoint e utilize a URL regional explícita do endpoint, ou utilize uma arquitetura centralizada com rotas direcionadas à VPC hub onde o endpoint principal está implantado.

🚦 Troubleshooting de Conectividade no AWS Transit Gateway   
O diagnósticos de comunicação entre VPCs interconectadas via AWS Transit Gateway (TGW) exige a validação da tabela de rotas centralizada e dos caminhos de rede em cada VPC conectada.
- Associações e Propagação no TGW: No painel do Transit Gateway, confirme se os anexos (attachments) das VPCs estão devidamente associados à tabela de rotas do TGW. Em seguida, verifique na guia de rotas do TGW se os blocos CIDR de ambas as VPCs foram aprendidos via propagação automática ou cadastrados manualmente.
- Tabelas de Rotas das VPCs: A rota aprendida pelo TGW não é repassada automaticamente para as VPCs. A tabela de rotas da sub-rede na VPC A precisa ter uma rota explícita para o CIDR da VPC B apontando para o ID do TGW. Da mesma forma, a VPC B deve possuir a rota de retorno apontando o CIDR da VPC A para o TGW.
- Inspeção nos Hosts EC2: Confirme se os Grupos de Segurança e as NACLs das instâncias de origem e destino autorizam a entrada e saída do tráfego vindo da faixa IP da rede remota.
- NACLs da Interface do TGW: O Transit Gateway cria interfaces de rede (ENIs) nas sub-redes associadas das VPCs. Como essas interfaces não utilizam Grupos de Segurança, a validação deve ocorrer exclusivamente na NACL da sub-rede onde a ENI do TGW reside, garantindo a liberação das regras de entrada e saída para os CIDRs envolvidos.

<a name="item02.05"><h4>2.5 Troubleshooting Unable to Delete VPC Resources</h4></a>[Back to summary](#item02)

🧹 Resolução de Bloqueios na Exclusão de uma VPC   
A remoção de uma Amazon VPC exige o encerramento prévio de todos os componentes associados. A AWS impede a exclusão do ambiente virtual caso ainda existam dependências ativas vinculadas às sub-redes ou à VPC.

🔗 Gestão de Dependências e Tipos de Interfaces de Rede   
Para liberar a VPC para exclusão, é necessário entender como os recursos e suas interfaces virtuais (ENIs) são gerenciados. Recursos externos que operam fora da VPC, como buckets no Amazon S3, não interferem nesse processo.
- Interfaces Gerenciadas pelo Cliente: Criadas diretamente pelo usuário ou associadas a instâncias Amazon EC2. A remoção ocorre automaticamente com o término da instância ou através do desvinculação e exclusão manual da placa virtual.
- Interfaces Gerenciadas pelo Solicitante (Requester-Managed): Alocadas automaticamente por serviços gerenciados da AWS (como NAT Gateways, Endpoints de VPC ou Elastic Load Balancers). Essas interfaces não podem ser excluídas nem modificadas diretamente pelo usuário.
- Procedimento de Remoção: A exclusão de uma interface gerenciada pelo solicitante exige a localização e o encerramento do serviço pai que a criou. Ao excluir o NAT Gateway ou o balanceador de carga no seu console correspondente, a ENI associada é removida automaticamente pela plataforma.

🔎 Metodologia para Identificação de Bloqueios   
- Análise da Mensagem de Erro: O console da VPC apresenta uma lista dos recursos que ainda possuem dependências ativas no momento da tentativa de exclusão.
- Inspeção no Console EC2: Acesse a seção de Interfaces de Rede e utilize a descrição do recurso ou o campo de gerenciamento por solicitante para mapear qual serviço AWS é o proprietário da ENI.
- Uso de Filtros de Busca: Em infraestruturas com alto volume de componentes, utilize o campo de pesquisa nos consoles para filtrar a lista de interfaces pelo ID da VPC, ID da Instância ou pelo status de alocação.
- Ordem de Limpeza: Exclua primeiro os serviços de aplicação e conectividade (como gateways e endpoints) para que as interfaces de rede vinculadas sejam liberadas, permitindo a exclusão subsequente das sub-redes e da VPC.

<a name="item03"><h4>Getting Help</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Support</h4></a>[Back to summary](#item03)

📋 Coleta de Dados Prévia ao Suporte   
O levantamento detalhado de informações técnicas antes da abertura de chamados acelera a análise pela equipe de suporte da AWS, evitando trocas de mensagens desnecessárias e reduzindo o tempo total de resolução do incidente.
- Identificação do Ambiente: Número da conta AWS, região onde os recursos estão implantados e os nomes/IDs exatos dos componentes da Amazon VPC envolvidos.
- Contexto do Incidente: Descrição precisa da falha, momento exato (timestamp) do início da ocorrência e o comportamento esperado após a normalização do serviço.
- Reprodutibilidade: Sequência de passos necessários para simular o erro, quando aplicável.
- Evidências Técnicas: Saídas completas de comandos executados via AWS CLI, capturas de tela das mensagens de erro no console, logs operacionais (VPC Flow Logs, AWS CloudTrail ou logs de aplicação) e diagramas da topologia da rede.
- Histórico de Diagnóstico: Detalhamento das tentativas de resolução já executadas e os respectivos resultados obtidos.

🎫 Boas Práticas na Criação de Chamados Técnicos   
A abertura de tickets no painel da AWS deve seguir uma estrutura objetiva para garantir a correta triagem e o roteamento imediato para os especialistas adequados.
- Parâmetros de Classificação e Gravidade:
  - Serviço e Categoria: Seleção do serviço principal impactado e da categoria correspondente ao sintoma para acionar os fluxos de suporte específicos.
  - Nível de Impacto (SLA): Definição da severidade com base no plano de suporte contratado, variando de orientações gerais até paralisações de sistemas críticos com tempos de resposta acordados.
  - Localização e Título: Especificação da região geográfica afetada e criação de um assunto conciso que sintetize o problema.
- Detalhamento e Métodos de Contato:
  - Descrição e Anexos: Inclusão de mensagens de erro na íntegra e inclusão de arquivos anexos para comprovação visual das falhas.
  - Canais de Atendimento: Escolha do meio de comunicação (web, chat ou telefone) de acordo com o nível do plano de suporte, além de definir o idioma preferencial de contato.
  - Notificações: Cadastro de e-mails adicionais de membros da equipe que devem acompanhar as atualizações de status do chamado.