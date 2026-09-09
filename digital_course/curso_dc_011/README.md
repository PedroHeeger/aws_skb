# AWS IPv6 Fundamentals and VPC Connectivity   <img src="./0-aux/logo_course.png" alt="curso_dc_011" width="auto" height="45">

### AWS <a href="../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../aws_partner/">aws_partner</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_011 (AWS IPv6 Fundamentals and VPC Connectivity)   <img src="./0-aux/logo_course.png" alt="curso_dc_011" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260819_dc_011_en.pdf">Certificate</a>

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
  - Amazon Virtual Private Cloud (VPC)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_vpc.svg" alt="aws_vpc" width="auto" height="25">
  - AWS PrivateLink   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_private_link.svg" alt="aws_private_link" width="auto" height="25">
  - AWS Transit Gateway   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_transit_gateway.png" alt="aws_transit_gateway" width="auto" height="25">
  - AWS Virtual Private Network (VPN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_vpn.png" alt="aws_vpn" width="auto" height="25">
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

<a name="item00"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">IPv6 Overview</a><br>
  1.1 <a href="#item01.01">IPv6 Fundamentals</a><br>
  1.2 <a href="#item01.02">IPv6 Addressing</a><br>
  1.3 <a href="#item01.03">IPv6 Address Management on AWS</a><br>
  1.4 Knowledge Check: IPv6 Overview<br>
2. <a href="#item02">IPv6 Adoption Strategies and Mechanisms</a><br>
  2.1 <a href="#item02.01">IPv6 Adoption Drivers</a><br>
  2.2 <a href="#item02.02">IPv6 Adoption Strategies</a><br>
  2.3 Knowledge Check: IPv6 Adoption Strategies and Mechanisms<br>
3. <a href="#item03">Getting Started With IPv6 on AWS</a><br>
  3.1 <a href="#item03.01">IPv6-Enabled Amazon VPC</a><br>
  3.2 <a href="#item03.02">IPv6 Support for Amazon VPC Services</a><br>
  3.3 <a href="#item03.03">DNS for IPv6</a><br>
  3.4 <a href="#item03.04">IPv6 Backward Compatibility with IPv4</a><br>
  3.5 Knowledge Check: Getting Started with IPv6 on AWS<br>
4. <a href="#item04">Foundational Amazon VPC IPv6 Connectivity</a><br>
  4.1 <a href="#item04.01">Amazon VPC IPv6 Internet Connectivity</a><br>
  4.2 <a href="#item04.02">Amazon VPC IPv6 Private Connectivity</a><br>
  4.3 Knowledge Check: Foundational Amazon VPC IPv6 Connectivity<br>

---

### Objective:
O curso teve como objetivo apresentar os fundamentos, a arquitetura de endereçamento e o planejamento de redes com o protocolo IPv6 na AWS. Foram abordados o histórico de esgotamento do IPv4, as especificações do IPv6 e da pilha TCP/IP, as estratégias de adoção (outside-in e inside-out) e a implementação prática na Amazon VPC — incluindo sub-redes dual-stack e IPv6-only. Além disso, foi detalhado mecanismos de retrocompatibilidade como DNS64 e NAT64, recursos de segurança e a conectividade de internet e privada via Egress-Only Internet Gateway, VPC Peering, AWS Transit Gateway e AWS PrivateLink.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>IPv6 Overview</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 IPv6 Fundamentals</h4></a>[Back to summary](#item01)

🌐 Evolução do Endereçamento IP e a Estrutura da Pilha TCP/IP   
O Protocolo de Internet (IP) atua como o mecanismo universal de rotulagem e roteamento de pacotes na rede global. O crescimento exponencial do volume de dispositivos conectados impulsionou a transição do modelo original IPv4 para o padrão IPv6, transformando a arquitetura de endereçamento e o suporte a transmissões de dados.

📜 Linha do Tempo: Do Esgotamento do IPv4 ao Surgimento do IPv6   
A escassez de endereços na internet motivou a criação de soluções temporárias de contenção até a padronização definitiva do IPv6:
- 1980–1981 (RFC 760 / RFC 791): Lançamento formal do IPv4, utilizando estrutura de 32 bits (4 octetos) para gerar aproximadamente 4,3 bilhões de endereços únicos.
- 1993–1994 (RFC 1517 / RFC 1631 / RFC 1918): Implementação de técnicas para adiar o esgotamento do IPv4, incluindo Roteamento Interdomínio Sem Classes (CIDR), Tradução de Endereços de Rede (NAT) e a reserva de blocos privados para reutilização interna de IPs.
- 1995–1998 (RFC 1883 / RFC 2460): Publicação das especificações iniciais do IPv6 (o IPv5 foi um protocolo experimental não adotado).
- 2015: Esgotamento oficial do último bloco global de endereços IPv4 públicos não alocados, restringindo novas atribuições a transferências de blocos legados.
- 2017 (RFC 8200): O IPv6 é ratificado formalmente como o Padrão da Internet definitivo pelo IETF.

⚡ Principais Características e Vantagens do IPv6   
O IPv6 expande drasticamente a capacidade de conexão e otimiza o processamento de rede:
- Capacidade de Endereçamento Exponencial: Utiliza estrutura de 128 bits, gerando 2^128 (aproximadamente 340 undecilhões) de endereços possíveis. A porção de identificador do host é padronizada em 64 bits (/64).
- Eficiência de Roteamento: Alocação hierárquica baseada em prefixos que reduz o tamanho das tabelas de roteamento globais.
- Otimização de Hardware: Transfere a responsabilidade da fragmentação de pacotes para os pontos de extremidade (endpoints), aliviando a carga de processamento dos roteadores intermediários.
- Autoconfiguração Nativa: Mecanismos automáticos de atribuição de IP para interfaces de rede sem necessidade de intervenção manual estática.
- Modos de Transmissão: Suporte nativo a transmissões do tipo Unicast, Anycast e Multicast (eliminando a dependência do tráfego por Broadcast).
- Segurança e Suporte Extensível: Mecanismos de autenticação, criptografia e suporte a classes de serviço integrados à arquitetura.
- Interoperabilidade: Coexistência com a infraestrutura IPv4 legada por meio de técnicas de Pilha Dupla (Dual-Stack) e tradução de protocolos.

🥞 Estrutura e Encapsulamento na Pilha TCP/IP   
A comunicação entre dispositivos é regida pelo conjunto de protocolos TCP/IP, organizado em quatro camadas funcionais que processam os dados de forma sequencial:
- Camada de Aplicação: Interface direta com os serviços e usuários finais. Abriga protocolos como HTTP, HTTPS, DNS, DHCP, FTP, SMTP, POP3, TELNET e SSL.
- Camada de Transporte: Responsável pelo controle de fluxo, multiplexação e integridade da entrega. Opera via TCP (orientado à conexão e confiável) ou UDP (sem conexão e focado em velocidade).
- Camada de Rede (Internet): Endereça e roteia pacotes através de múltiplas redes. Inclui IP (IPv4/IPv6), ICMP, IGMP, ARP e RARP.
- Camada de Enlace (Acesso à Rede): Gerencia a transmissão física de quadros no meio de comunicação, utilizando padrões como Ethernet (IEEE 802.3).

Processo de Encapsulamento:   
Durante o envio, as solicitações percorrem a pilha do remetente no sentido descendente (da Aplicação ao Enlace). Cada camada insere cabeçalhos com informações de controle e endereçamento (como IP de origem e destino na camada de rede). Ao atingir o destinatário, os dados percorrem a pilha no sentido ascendente (do Enlace à Aplicação), onde cada camada lê e remove o cabeçalho correspondente para entregar a mensagem original ao sistema.

<a name="item01.02"><h4>1.2 IPv6 Addressing</h4></a>[Back to summary](#item01)

🧬 Anatomia, Notação e Tipologia do Endereçamento IPv6   
O IPv6 redefiniu a forma como os pacotes de dados são formatados, simplificados e endereçados na rede. Além da expansão do espaço para 128 bits, o protocolo otimizou o processamento de rede eliminando campos redundantes e aperfeiçoando os mecanismos de sinalização lógica.

⚙️ Componentes e Mecanismos da Arquitetura IPv6   
- Cabeçalho Principal (40 bytes): Tamanho fixo e otimizado para acelerar o roteamento. Contém os campos fundamentais: Versão, Classe de Tráfego, Rótulo do Fluxo (Flow Label), Comprimento da Carga Útil, Próximo Cabeçalho, Limite de Saltos (Hop Limit), Endereço de Origem e Endereço de Destino.
- Cabeçalhos de Extensão: Blocos opcionais encadeados após o cabeçalho principal via indicação do campo "Próximo Cabeçalho", utilizados para suportar funções específicas (como criptografia e fragmentação de origem) sem poluir a estrutura base.
- Rotulagem de Fluxo (Flow Label): Identificador utilizado para agrupar pacotes pertencentes ao mesmo fluxo de tráfego, permitindo tratamento diferenciado e dinâmico (stateful ou stateless) nos nós da rede.
- Atribuição Automática e Dinâmica: Os endereços podem ser atribuídos estaticamente, via DHCPv6 ou por meio de Autoconfiguração Sem Estado (SLAAC), que pode utilizar o endereço MAC da interface física para gerar a identificação do nó.
- Supressão de Checksum: O IPv6 elimina a verificação de integridade no cabeçalho IP por ser um processo redundante já realizado pelas camadas de Enlace (Ethernet) e Transporte (TCP/UDP).
- Protocolo de Descoberta de Vizinhos (NDP): Opera sobre mensagens ICMPv6 para substituir o antigo ARP do IPv4, agregando funções avançadas como a Detecção de Inacessibilidade de Vizinhos (NUD).

✍️ Notação Hexadecimal e Regras de Abreviação   
Um endereço IPv6 possui 128 bits representados por 32 dígitos hexadecimais agrupados em 8 blocos de 4 dígitos (hextetos) separados por dois pontos. Cada dígito hexadecimal equivale a 4 bits no formato binário.

Para simplificar a leitura humana (como em 2001:0db8:0000:0000:0000:0000:0000:0001), aplicam-se duas regras de compressão:
- Omissão de Zeros à Esquerda: Em qualquer hexteto, os zeros iniciais podem ser descartados (ex.: 0db8 vira db8 e 0000 vira 0).
- Abreviação por Dois Pontos Duplos (::): Uma sequência contínua de hextetos compostos apenas por zeros pode ser substituída por ::. Essa regra só pode ser utilizada uma única vez por endereço para evitar ambiguidades de decodificação.
- Endereço final simplificado: 2001:db8::1.

🏷️ Tipos de Endereços IPv6 e Prefixos   
A alocação de endereços IPv6 é dividida em blocos funcionais (prefixos CIDR) gerenciados pela IANA:
- Unicast Global (GUA) — 2000::/3: Endereços públicos e roteáveis globalmente na internet, equivalentes aos IPs públicos do IPv4.
- Unicast Local Exclusivo (ULA) — fc00::/7: Endereços privados destinados exclusivamente a redes internas, sem Roteamento na internet global (equivalentes ao padrão RFC 1918 do IPv4). Utilizam identificadores pseudoaleatórios para evitar conflitos de sobreposição entre redes organizacionais.
- Unicast Local de Link (Link-Local) — fe80::/10: Atribuído obrigatoriamente a cada interface ativa com IPv6 habilitado. Comunica-se apenas dentro da mesma sub-rede física (os roteadores não encaminham esse tráfego para outros segmentos).
- Multicast — ff00::/8: Utilizado para comunicação de um nó com grupos dinâmicos de dispositivos (distribuição um-para-muitos). Substitui o tráfego por broadcast tradicional e viabiliza as consultas do protocolo NDP.

<a name="item01.03"><h4>1.3 IPv6 Address Management on AWS</h4></a>[Back to summary](#item01)

☁️ Planejamento, Alocação e Configuração de IPv6 na AWS   
A transição para o IPv6 na AWS permite criar arquiteturas de rede extensíveis sem as limitações de escassez de endereços da TI legada. A criação de um plano estruturado substitui técnicas antigas de economia de IP, como o mascaramento de comprimento variável (VLSM), por alocações padronizadas e limpas para cada Nuvem Privada Virtual (VPC).

📐 Estrutura de Blocos CIDR para VPCs e Sub-redes   
O endereçamento IPv6 na AWS baseia-se exclusivamente no espaço de endereços unicast globais (GUA). O uso de blocos privados ULA não é suportado no ambiente gerenciado de VPCs.
- Capacidade da VPC: Cada VPC pode associar até cinco blocos CIDR IPv6 simultaneamente, sem interferir nas configurações IPv4 existentes.
- Dimensões da VPC: Por padrão, o bloco associado à VPC é um /56, mas pode variar de /44 a /60.
- Dimensões da Sub-rede: O tamanho padrão de uma sub-rede IPv6 é /64, podendo variar de /44 a /64 (em incrementos de 4 bits).

🗂️ Modelos de Atribuição de Prefixos IPv6 na AWS   
A definição do plano de endereçamento varia de acordo com o nível de controle operacional, escala corporativa e requisitos de roteamento:
- Pools Aleatórios Fornecidos pela AWS: A AWS atribui prefixos /56 aleatórios provenientes de seu pool regional. Indicado para ambientes pequenos, pois a dispersão dos blocos impede a sumarização de rotas.
- Blocos Contíguos via Amazon VPC IPAM: O IP Address Manager aloca blocos contíguos GUA para a organização em múltiplas regiões. Permite realizar a sumarização (agregação) de prefixos, reduzindo o tamanho das tabelas de roteamento e simplificando políticas de segurança.
- Traga seu próprio IPv6 (BYOIPv6) Direto no EC2: Permite importar faixas de IP de propriedade da empresa para uso regional, mantendo o controle total sobre os anúncios de rotas para a internet pública.
- BYOIPv6 Gerenciado via VPC IPAM: Centraliza a gestão dos blocos próprios importados, viabilizando arquiteturas hierárquicas e agregação de rotas em escala multirregional e multiconta.

Regra de Acessibilidade: Ter um endereço IPv6 GUA não torna o recurso exposto à internet automaticamente. A acessibilidade depende da tabela de roteamento, da presença de um Internet Gateway (ou Egress-Only Internet Gateway para conexões de saída), de Listas de Controle de Acesso (ACLs) e dos Grupos de Segurança (Security Groups).

🛠️ Configuração Prática de Sub-redes na VPC   
A associação de um bloco IPv6 à VPC estabelece a base de rede, mas a ativação nos recursos exige a atribuição explícita nas sub-redes:
- Sub-redes de Pilha Dupla (Dual-Stack): Adição de um prefixo IPv6 a sub-redes IPv4 existentes ou criação de novas sub-redes para suportar ambos os protocolos de forma independente.
- Sub-redes Exclusivamente IPv6 (IPv6-only): Sub-redes dedicadas para recursos modernos que operam sem dependência do protocolo IPv4.
- Atribuição Automática de IP: A conversão de uma sub-rede para Dual-Stack não distribui IPs automaticamente para os recursos existentes ou novos. É necessário habilitar explicitamente a alocação automática de IPv6 nas configurações da sub-rede ou ajustar a interface de rede das instâncias.

<a name="item02"><h4>IPv6 Adoption Strategies and Mechanisms</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 IPv6 Adoption Drivers</h4></a>[Back to summary](#item02)

🚀 Principais Fatores Impulsionadores da Adoção do IPv6   
A transição global do IPv4 para o IPv6 deixou de ser uma decisão meramente técnica para se tornar uma necessidade de negócios. A AWS identifica três grandes vetores de pressão operacional, comercial e regulatória que motivam as organizações a acelerar a implementação do IPv6 em suas arquiteturas.

🛑 1. Limitações Críticas do NAT e Esgotamento de Endereços   
As soluções temporárias criadas para conter a escassez do IPv4 atingiram seu limite operacional, gerando custos elevados e gargalos de arquitetura:
- Esgotamento do IPv4 Público: A escassez de blocos contíguos no mercado global tornou a aquisição de endereços públicos extremamente cara e complexa.
- Esgotamento do IPv4 Privado (RFC 1918): O crescimento de arquiteturas de microsserviços, contêineres e expansões multirregionais causou a saturação das faixas privadas tradicionais (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16), resultando em sobreposição de IPs (overlapping) e tabelas de roteamento altamente fragmentadas.
- Sustentabilidade e Redução de Custos: O uso de endereços unicast globais (GUA) do IPv6 elimina a necessidade de gateways NAT e dispositivos intermediários de tradução. Isso simplifica a arquitetura, reduz a latência no processamento de pacotes e diminui os custos operacionais de infraestrutura de rede.

📱 2. Interoperabilidade e Alcance de Usuários IPv6-Only   
A mudança no perfil dos consumidores de tecnologia exige que as aplicações estejam preparadas para clientes que navegam exclusivamente via IPv6:
- Expansão do Mercado Móvel: Operadoras móveis e provedores de acesso ao redor do mundo operam cada vez mais em redes estritamente IPv6.
- Atendimento a Bases Nativas: Organizações que não disponibilizam suporte ao IPv6 correm o risco de degradar a experiência do usuário final ou perder o alcance de uma fatia expressiva de clientes conectados a redes exclusivamente IPv6.
- Piha Dupla (Dual-Stack) de Transição: A implementação de ambientes de pilha dupla atua como um elemento intermediário fundamental para garantir compatibilidade retroativa com acessos IPv4 enquanto absorve o tráfego IPv6 nativo.

🏛️ 3. Conformidade Regulatória e Exigências Governamentais   
A adoção do IPv6 tornou-se um requisito obrigatório para atuação em diversos mercados e setores do setor público:
- Diretrizes Governamentais: Mandatos estipulados por órgãos reguladores internacionais (como o Office of Management and Budget nos EUA e diretivas de infraestrutura na China) exigem que serviços digitais e sistemas corporativos ofereçam pontos de extremidade (endpoints) habilitados para IPv6.
- Atendimento a Políticas de Conformidade: A disponibilização de endpoints IPv6 garante o cumprimento das normas legais e regulatórias do setor sem interromper o suporte aos sistemas legados.

🎯 Abordagem de Implementação Pragmatica   
A transição para o IPv6 não exige uma substituição imediata de toda a infraestrutura. As organizações podem adotar uma estratégia em etapas: resolver demandas imediatas (como contornar a escassez de IPs privados ou disponibilizar endpoints para conformidade) enquanto estruturam o roadmap de longo prazo para uma arquitetura estritamente IPv6 (IPv6-only).

<a name="item02.02"><h4>2.2 IPv6 Adoption Strategies</h4></a>[Back to summary](#item02)

🗺️ Estratégias Principais para Adoção do IPv6   
A implementação do IPv6 pode seguir diferentes rotas arquiteturais a depender dos objetivos prioritários da organização — desde atender a públicos externos conectados a redes modernas até resolver limitações severas de endereçamento interno. As duas abordagens centrais — e a possibilidade de unificá-las — definem o roteiro de migração:

🌐 1. Estratégia de Fora para Dentro (Outside-In)   
Focada em disponibilizar pontos de extremidade (endpoints) públicos compatíveis com IPv6 para usuários finais, dispositivos remotos (como IoT) e sistemas conectados à internet.
- Ponto de Partida: Habilitação do modo de pilha dupla (dual-stack) nos serviços voltados à internet, tais como balanceadores de carga, redes de distribuição de conteúdo (CDN) e registros DNS na AWS.
- Caso de Uso Típico: Dispositivos IoT operando em redes puramente IPv6 que precisam enviar dados para APIs hospedadas na nuvem, sem depender de camadas intermediárias de tradução para IPv4.
- Benefícios: 
  - Expansão de Alcance Global: Conexão direta com a crescente base de usuários e dispositivos operando em redes estritamente IPv6.
  - Visibilidade de Origem: Captura de endereços IPv6 reais dos clientes para análises e relatórios de auditoria mais precisos.
  - Conformidade Regulatória: Atendimento a mandatos governamentais que exigem a presença de pontos de acesso IPv6.
  - Independência de IPv4 Público: Expansão de serviços externos sem o custo e a escassez associados a blocos IPv4 públicos.
- Considerações Importantes:
  - Exige a atualização e validação de todas as camadas de segurança de borda (como AWS WAF, AWS Shield, Grupos de Segurança e ACLs de rede) para inspecionar tráfego IPv6.
  - O ambiente de borda precisará manter suporte a dual-stack por tempo indeterminado até que a transição global para IPv6 seja concluída.

🏢 2. Estratégia de Dentro para Fora (Inside-Out)   
Focada em resolver o esgotamento do espaço de endereçamento IPv4 privado (RFC 1918) e eliminar gargalos de sobreposição de IPs (overlapping) na infraestrutura interna da organização.
- Ponto de Partida: Configuração de suporte a IPv6 nas sub-redes das VPCs internas e em componentes de processamento, adotando sub-redes exclusivamente IPv6 (IPv6-only) para novas cargas de trabalho e serviços de tradução nativos (NAT64/DNS64) para comunicação retroativa.
- Caso de Uso Típico: Implantação de grandes clusters de contêineres (como Amazon EKS) e microsserviços que demandam milhares de endereços IP sem esgotar as sub-redes internas da empresa.
- Benefícios: 
  - Escalabilidade Interna Ilimitada: Fim da disputa por blocos contíguos de IPs privados e eliminação de conflitos de roteamento em redes híbridas.
  - Otimização em Contêineres: Melhoria no desempenho e consumo de APIs do Amazon EKS devido ao uso eficiente de delegação de prefixos no IPv6.
  - Recuperação de Ativos: Oportunidade de desativar e reaproveitar grandes blocos de IPv4 privado anteriormente retidos por microsserviços ao migrá-los para IPv6.
- Considerações Importantes:
  - A infraestrutura de rede corporativa interna (roteadores, links dedicados e firewalls) deve suportar tráfego IPv6 nativo.
  - Serviços internos que ainda atendam clientes estritamente IPv4 precisarão operar em modo dual-stack ou utilizar mecanismos de tradução (NAT64/DNS64).

🔀 3. Abordagem Híbrida (Combinada)   
A combinação de ambas as estratégias permite que a empresa resolva simultaneamente os gargalos das duas frentes:
- Serviços de borda e APIs públicas operam em pilha dupla para garantir conectividade universal.
- Ambientes de processamento interno e plataformas de microsserviços migram para sub-redes exclusivamente IPv6, utilizando pontes de interoperabilidade apenas onde houver dependências do protocolo legado.

<a name="item03"><h4>Getting Started With IPv6 on AWS</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 IPv6-Enabled Amazon VPC</h4></a>[Back to summary](#item03)

🛠️ Melhores Práticas de Design para IPv6 na Amazon VPC   
A Amazon VPC permite estruturar redes modernas combinando retrocompatibilidade e suporte a arquiteturas nativas. Entender a convivência entre IPv4 e IPv6 nas sub-redes, interfaces de rede e mecanismos de atribuição (DHCP/DHCPv6) é fundamental para construir arquiteturas escaláveis na AWS.

🏗️ Design de Pilha Dupla e Segmentação de Sub-redes   
Na AWS, uma VPC é criada originalmente com um bloco CIDR IPv4 obrigatório, podendo receber blocos CIDR IPv6 a qualquer momento para operar em pilha dupla (dual-stack).
- Independência de Pilhas: As pilhas TCP/IPv4 e TCP/IPv6 operam de forma autônoma dentro do ambiente.
- Flexibilidade por Sub-rede: Em uma mesma VPC de pilha dupla, é possível coexistir sub-redes exclusivamente IPv4, sub-redes de pilha dupla e sub-redes exclusivamente IPv6 (IPv6-only).
- Controle de Atribuição: A associação de um endereço IPv6 aos recursos pode ser configurada no nível da sub-rede (atribuição automática), na Interface de Rede Elástica (ENI) ou no próprio sistema operacional.
- Compartilhamento de Sub-redes: Sub-redes de pilha dupla ou IPv6-only podem ser compartilhadas entre diferentes contas da organização via AWS RAM, operando com o mesmo comportamento de sub-redes privadas tradicionais.

🎛️ Endereçamento em Interfaces de Rede Elásticas (ENIs)   
A Interface de Rede Elástica (ENI) representa a construção lógica do adaptador de rede de instâncias EC2, bancos de dados RDS e endpoints de serviço:
- Adaptador Único: Não é necessário criar ENIs adicionais para adicionar suporte a IPv6. Uma mesma interface aceita múltiplos endereços IPv4 e IPv6 simultaneamente.
- Modificação Dinâmica: Interfaces com apenas IPv4 podem receber endereços IPv6 (atribuídos de forma automática pela AWS ou definidos manualmente pelo usuário) sem interrupção de tráfego.
- Persistência: O endereço IPv6 associado à ENI permanece fixo durante todo o ciclo de vida da interface, a menos que seja removido manualmente.

🔄 Atribuição de Endereços via DHCP e DHCPv6   
A atribuição de endereços e parâmetros de rede difere entre as duas versões do protocolo devido às peculiaridades da infraestrutura da VPC:

Atribuição em IPv4 (Processo DORA)   
Utiliza mensagens de broadcast para descoberta e concessão de IPs:
  - Discover: O recurso busca servidores DHCP na rede.
  - Offer: O servidor responde com uma oferta de IP.
  - Request: O recurso aceita o IP oferecido.
  - Acknowledge: O servidor confirma a reserva.

Atribuição em IPv6 (DHCPv6)   
Como o IPv6 não utiliza broadcast, a comunicação para descoberta do servidor utiliza o endereço multicast reservado ff02::1:2 (todos os servidores/relays DHCPv6).

⚙️ Opções de Configuração por Tipo de Sub-rede   
- Sub-redes de Pilha Dupla: O servidor DHCPv6 fornece apenas o endereço IPv6 para a instância EC2. Parâmetros adicionais (como servidores DNS e nome de domínio) continuam sendo entregues pela estrutura DHCP IPv4.
- Sub-redes Exclusivamente IPv6 (IPv6-Only): O servidor DHCPv6 fornece tanto o endereço IPv6 quanto as configurações de rede adicionais (servidores DNS e domínios).
- Resolução DNS sem IPv4: Em sub-redes IPv6-only, se o parâmetro AmazonProvidedDNS estiver presente no conjunto de opções DHCP, o serviço de metadados/DNS responderá pelo endereço reservado 169.254.169.253. Instâncias nessas sub-redes dispensam totalmente a alocação de endereços IPv4 privados.
- Delegação de Prefixos (Prefix Delegation): A VPC permite atribuir blocos/prefixos de IP inteiros diretamente a uma ENI, otimizando o roteamento interno para contêineres e microsserviços.

<a name="item03.02"><h4>3.2 IPv6 Support for Amazon VPC Services</h4></a>[Back to summary](#item03)

⚙️ Suporte a IPv6 nos Serviços Nativos da Amazon VPC   
A AWS expõe seus serviços de infraestrutura essenciais dentro das VPCs por meio de endpoints de sistema. Enquanto o padrão IPv4 tradicionalmente utiliza o bloco link-local (169.254.0.0/16), instâncias executadas no AWS Nitro System em sub-redes exclusivamente IPv6 (IPv6-only) acessam esses serviços via endereços IPv6 de Notação Local Exclusiva (ULA).

📍 Endpoints do AWS Nitro System para IPv6   
As instâncias baseadas na arquitetura Nitro com suporte a IPv6 acessam os serviços locais da VPC pelos seguintes endereços dedicados:
- Serviço de Metadados de Instância (IMDS): Acessível em fd00:ec2::254 (equivalente ao 169.254.169.254 no IPv4). Permite consultar informações de execução da instância. Recomenda-se a adoção do IMDSv2 para maior segurança.
- Nota de Configuração: O acesso ao endpoint IPv6 do IMDS não vem ativado por padrão. Ele precisa ser habilitado via AWS CLI (utilizando a chamada de API modify-instance-metadata-options) ou SDKs, não estando disponível para modificação no Console EC2.
- Amazon Route 53 Resolver (DNS): Acessível em fd00:ec2::253 (equivalente ao 169.254.169.253 no IPv4). Fornece resolução de nomes nativa e atua em conjunto com serviços de tradução (DNS64/NAT64) para comunicação retroativa.
- Serviço de Sincronização de Tempo (NTP): Acessível em fd00:ec2::123 (equivalente ao 169.254.169.123 no IPv4). Oferece sincronização de relógio Stratum-3 confiável para o sistema operacional.

🏷️ Convenções de Nomenclatura no Amazon EC2 (IPBN vs. RBN)   
O formato do nome de host (hostname) atribuído às instâncias EC2 varia de acordo com o protocolo e o tipo de sub-rede utilizada no lançamento:
- Nomenclatura Baseada em IP (IPBN): Padrão do IPv4 no formato ip-endereço-privado.região.compute.internal (exemplo: ip-10-20-14-8.us-west-2.compute.internal). Consultas por registros DNS do tipo A para nomes IPBN sempre retornam resposta.
- Nomenclatura Baseada em Recursos (RBN): Adotada automaticamente para instâncias em sub-redes IPv6-only (e opcional para pilha dupla), utilizando o ID da instância no formato ec2-instance-id.região.compute.internal (exemplo: i-0123456789abcdef.us-west-2.compute.internal).

🛠️ Diferenciais e Configuração de Consultas DNS   
Ao contrário da abordagem baseada em IP, a nomenclatura baseada em recursos (RBN) oferece flexibilidade no controle de respostas de nomes privados:
- É possível configurar se as consultas DNS responderão a registros A (IPv4), AAAA (IPv6) ou ambos.
- Essa definição pode ser ajustada nas configurações da sub-rede ou diretamente durante a criação da instância EC2.
- A coexistência entre nomes IPBN e RBN garante suporte retroativo e possibilita a transição gradual entre as estruturas.

<a name="item03.03"><h4>3.3 DNS for IPv6</h4></a>[Back to summary](#item03)

🌍 DNS para IPv6 e Recursos no Amazon Route 53   
A estrutura fundamental do Sistema de Nomes de Domínio (DNS) permanece consistente no IPv6, atuando como uma camada de abstração independente da versão do protocolo IP. A transição para o IPv6 introduziu novos tipos de registros e comportamentos específicos nas pilhas de rede dos sistemas operacionais e nos serviços gerenciados de resolução de nomes.

🧬 Registros DNS, Notação Reversa e Mapeamento de Alias   
O suporte ao IPv6 no ecossistema DNS baseia-se em mapeamentos estruturados para resolução direta e reversa:
- Registros AAAA: Equivalente ao registro A do IPv4. Vincula diretamente um nome de domínio totalmente qualificado (FQDN) a um endereço IPv6 de 128 bits.
- Registros PTR (Resolução Reversa): Mapeiam um endereço IPv6 de volta ao seu FQDN. Operam sob a árvore de domínio especial ip6.arpa. O endereço é representado em formato invertido, fracionado nibble por nibble (cada dígito hexadecimal separado por ponto), conforme estipulado pela RFC 3596.
- Registros de Alias (Route 53): Recurso nativo da AWS que mapeia nomes de domínio diretamente para recursos AWS (como balanceadores de carga). O Route 53 monitora dinamicamente a infraestrutura de destino e responde com registros A (para solicitações IPv4) ou AAAA (para solicitações IPv6) conforme a necessidade do cliente.

⚙️ Comportamento do Sistema Operacional e Algoritmo Happy Eyeballs   
A resolução de nomes e a escolha do protocolo na camada de aplicação dependem das configurações do sistema operacional convidado:
- Priorização Nativa do IPv6: Em redes de pilha dupla (dual-stack), sistemas operacionais modernos priorizam a consulta e a conexão via registro AAAA (IPv6) sobre o registro A (IPv4).
- Requisito de Roteamento Ponta a Ponta: É fundamental garantir que a rota IPv6 entre o cliente e o destino esteja totalmente operacional. Um erro comum ocorre quando o DNS resolve um registro AAAA, mas a rede não possui um caminho roteável, gerando falhas de conexão.
- Algoritmo Happy Eyeballs (Fast Fallback): Mecanismo normatizado pela IETF para mitigar atrasos causados por conectividade IPv6 deficiente. O aplicativo dispara tentativas de conexão simultâneas via IPv4 e IPv6, estabelecendo a comunicação pelo caminho que responder primeiro.
- Filtragem via Firewall do Resolver: Para prevenir falhas antes da consolidação do ambiente IPv6, o firewall do Route 53 Resolver pode ser configurado para bloquear temporariamente respostas AAAA até que as rotas físicas estejam operacionais.

🎯 Arquitetura de DNS na AWS com Amazon Route 53   
O Route 53 disponibiliza suporte completo a IPv6 para diferentes cenários de infraestrutura:
- Zonas Hospedadas Públicas: Suportam registros A e AAAA e oferecem servidores de nomes autoritativos (Name Servers) acessíveis nativamente via IPv4 e IPv6. As checagens de integridade (Health Checks) também monitoram endpoints IPv6.
- Zonas Hospedadas Privadas (PHZ): Permitem associar nomes de domínio internos a VPCs, resolvendo FQDNs para endereços IPv6 privados através de registros AAAA.
- Amazon Route 53 Resolver Local: Resolvedor integrado acessível pelo IP 169.254.169.253 (IPv4) e fd00:ec2::253 (para instâncias Nitro IPv6). Processa consultas combinando regras de encaminhamento e Zonas Hospedadas Privadas associadas à VPC.
- Endpoints do Route 53 Resolver (Inbound/Outbound): Pontes de integração DNS entre a AWS e redes corporativas locais (on-premises). Suportam sub-redes exclusivamente IPv4, de pilha dupla e exclusivamente IPv6 (IPv6-only), permitindo a adição e edição dinâmica de IPs IPv6.

<a name="item03.04"><h4>3.4 IPv6 Backward Compatibility with IPv4</h4></a>[Back to summary](#item03)

🔄 Retrocompatibilidade e Interoperabilidade entre IPv6 e IPv4   
Devido às diferenças estruturais entre o IPv4 e o IPv6, esses protocolos não são nativamente compatíveis. A transição gradual exige estratégias para garantir a comunicação fluida entre quatro cenários principais: IPv4 para IPv4, IPv4 para IPv6, IPv6 para IPv4 e IPv6 para IPv6.

Para viabilizar essa coexistência na AWS, utiliza-se a abordagem de pilha dupla (dual-stack) ou a implantação de redes exclusivamente IPv6 (IPv6-only) integradas a uma camada de tradução.

🧩 Camada de Interoperabilidade: DNS64 e NAT64   
Quando recursos em sub-redes IPv6-only precisam se comunicar com destinos que aceitam apenas IPv4 (na internet, em outras VPCs ou no ambiente local), utiliza-se a combinação dos serviços DNS64 e NAT64.

🔍 Funcionamento do DNS64   
O DNS64 resolve a incompatibilidade na camada de nomes quando um cliente IPv6-only consulta um destino estritamente IPv4:
- O recurso envia uma consulta DNS ao Amazon Route 53 Resolver.
- Se o destino possuir um registro AAAA (IPv6), o endereço original é retornado sem alterações.
- Se o destino possuir apenas um registro A (IPv4), o Route 53 sintetiza um endereço IPv6 anexando o prefixo padrão da RFC 6052 (64:ff9b::/96) ao IPv4 original.
- O cliente recebe esse endereço IPv6 sintetizado e inicia a transmissão.
- Nota de Configuração: O DNS64 é ativado por sub-rede em ambientes IPv6-only via AWS CLI (`modify-subnet-attribute`) ou no Console da Amazon VPC.

🔀 Funcionamento do NAT64   
O NAT64 é o mecanismo que realiza a tradução do pacote de dados na camada de rede. Na AWS, o NAT64 vem pré-integrado a todos os AWS NAT Gateways (não exige ativação manual):
- A tabela de roteamento da sub-rede IPv6-only direciona o tráfego do prefixo 64:ff9b::/96 para o NAT Gateway.
- O NAT Gateway identifica o prefixo, remove os 96 bits iniciais para extrair o IPv4 de destino original e substitui o IPv6 de origem por seu próprio endereço IPv4.
- O pacote é encaminhado ao destino como tráfego IPv4 nativo (via Internet Gateway, VPC Peering, Transit Gateway ou VPN).
- Na resposta, o NAT Gateway recebe os pacotes IPv4, desfaz a tradução adicionando novamente o prefixo 64:ff9b::/96 e entrega o tráfego em IPv6 ao host de origem.

🛠️ Conexão de Clientes IPv4 a Endpoints IPv6   
Para cobrir o fluxo inverso — permitir que clientes antigos em IPv4 alcancem serviços modernos em IPv6 —, utiliza-se uma camada de proxy ou tradução na borda:
- Elastic Load Balancing (ELB) em Pilha Dupla: Habilitar o modo dual-stack em balanceadores de carga (como Application Load Balancer ou Network Load Balancer) permite aceitar conexões vindas de clientes IPv4 na frente enquanto o tráfego de backend pode ser processado em IPv6.
- Amazon VPC Lattice: Facilita a comunicação entre serviços desacoplando as pilhas de protocolo das aplicações consumidoras e provedoras.
- Proxies / Bastion Hosts: Servidores atuando em pilha dupla para traduzir requisições de clientes legados.

⚙️ Resumo das Soluções de Interoperabilidade   
- Clientes IPv6 -> Endpoints IPv4: DNS64 (sintetiza o endereço 64:ff9b::/96) + NAT64 (executado nativamente pelo AWS NAT Gateway para converter os pacotes).
- Clientes IPv4 -> Endpoints IPv6: Proxies / ELB em Pilha Dupla (recebe IPv4 na borda e encaminha ao destino IPv6) ou VPC Lattice.
- Comunicação Nativa (IPv6 -> IPv6 e IPv4 -> IPv4): Tráfego direto através de roteamento padrão sem necessidade de síntese ou tradução.

<a name="item04"><h4>Foundational Amazon VPC IPv6 Connectivity</h4></a>[Back to summary](#item04)

<a name="item04.01"><h4>4.1 Amazon VPC IPv6 Internet Connectivity</h4></a>[Back to summary](#item04)

🌐 Conectividade com a Internet em Sub-redes Públicas e Privadas no IPv6   
No ambiente Amazon VPC, o modelo de conectividade com a internet para IPv6 difere do IPv4 devido à ausência do NAT tradicional. Como os endereços IPv6 alocados são do tipo Unicast Global (GUA), eles já nascem globalmente únicos e publicamente roteáveis, eliminando a necessidade de endereços IP Elásticos (EIPs).

🟢 Conectividade em Sub-redes Públicas para IPv6   
A definição de uma sub-rede pública para IPv6 segue a mesma lógica do IPv4: é qualquer sub-rede que possua uma tabela de roteamento configurada para direcionar o tráfego externo para um Gateway de Internet (Internet Gateway - IGW).
- Roteamento Padrão: O tráfego direcionado à internet é encaminhado apontando o destino ::/0 para o ID do Internet Gateway.
- Acesso Bidirecional: Permite que os recursos iniciem conexões com a internet e também recebam conexões de entrada vindas do exterior (desde que permitido pelas tabelas de roteamento, Grupos de Segurança e ACLs de rede).
- Flexibilidade por Sub-rede: As pilhas IPv4 e IPv6 operam de forma independente. Uma sub-rede de pilha dupla pode ter rotas públicas para ambos os protocolos, enquanto sub-redes IPv6-only mantêm apenas a rota ::/0 para o IGW.

🔒 Conectividade em Sub-redes Privadas para IPv6   
Para proteger ambientes privados e impedir exposição indesejada, recursos mantidos em sub-redes privadas não possuem rota direta para o Internet Gateway padrão. Enquanto o IPv4 utiliza Gateways NAT para traduzir IPs privados em públicos e viabilizar acesso externo, o IPv6 utiliza um componente especializado:

🛡️ Gateway de Internet Somente de Saída (Egress-Only Internet Gateway - EOIGW)   
O EOIGW é um componente de VPC de alta disponibilidade, redundante e escalável projetado especificamente para tráfego IPv6:
- Comunicação Unidirecional: Permite que as instâncias e recursos privados iniciem conexões de saída para a internet (para atualizações de software ou chamadas de API externas).
- Bloqueio de Entrada Estrito: Impede de forma absoluta que conexões externas iniciadas na internet alcancem os recursos privados da VPC, agindo como um escudo unilateral.
- Configuração de Rota: Nas sub-redes privadas IPv6, a rota padrão ::/0 aponta diretamente para o ID do Egress-Only Internet Gateway.

💡 Comparativo de Topologias de Internet na VPC
- Sub-rede Pública (IPv4 e IPv6): Tráfego 0.0.0.0/0 e ::/0 apontado para o Internet Gateway (IGW) -> Permite conexões de saída e de entrada.
- Sub-rede Privada IPv4: Tráfego 0.0.0.0/0 apontado para o NAT Gateway -> Tráfego de saída com tradução de endereço.
- Sub-rede Privada IPv6: Tráfego ::/0 apontado para o Egress-Only Internet Gateway (EOIGW) -> Tráfego de saída nativo mantendo o IP GUA original, bloqueando qualquer tentativa de início de conexão externa.

<a name="item04.02"><h4>4.2 Amazon VPC IPv6 Private Connectivity</h4></a>[Back to summary](#item04)

🔒 Opções de Conectividade Privada em IPv6 na Amazon VPC   
A comunicação privada entre VPCs, redes corporativas locais (on-premises) e serviços gerenciados da AWS pode ser estabelecida por meio de três tecnologias centrais. Cada mecanismo atende a diferentes topologias, níveis de escala e requisitos de isolamento.

🔗 Peering de VPC (VPC Peering)   
O emparelhamento direto entre duas VPCs (na mesma região ou inter-regiões) opera de forma privada e totalmente agnóstica à versão do protocolo IP.
- Roteamento Independente: Os prefixos IPv4 e IPv6 transitam sobre a mesma conexão de peering. É possível configurar tabelas de roteamento estáticas para autorizar exclusivamente o tráfego IPv6 entre as VPCs emparelhadas.
- Mitigação de Conflitos de IP: Se duas VPCs possuem blocos IPv4 sobrepostos (overlapping), o emparelhamento IPv4 falha. Contudo, se seus blocos IPv6 GUA forem distintos, o tráfego privado pode ser estabelecido utilizando apenas o roteamento IPv6.

🌐 AWS Transit Gateway (TGW)   
O AWS Transit Gateway atua como um roteador de nuvem centralizado e escalável, interconectando milhares de VPCs e redes locais através de uma topologia estrela (hub-and-spoke). Oferece suporte nativo a IPv4 e IPv6 por meio de diferentes tipos de conexões (attachments):
- Anexos VPC (VPC Attachments): Para habilitar o tráfego IPv6, as interfaces de rede elásticas (ENIs) criadas pelo TGW nas sub-redes da VPC devem possuir endereços IPv6. Portanto, a sub-rede do anexo precisa operar em pilha dupla (dual-stack) — não sendo suportada a criação de anexos em sub-redes exclusivamente IPv6.
- Conexões VPN Site-to-Site: Túneis IPsec podem transportar tráfego IPv6 interno. Quando configurados para IPv6, cada túnel recebe um bloco IPv4 /30 e um bloco IPv6 /126. Os pontos de terminação externos da VPN permanecem em IPv4, independentemente do protocolo transportado internamente.
- AWS Direct Connect Gateway: Permite sessões BGP separadas (ou combinadas) para IPv4 e IPv6 em uma única Interface Virtual de Trânsito (VIF), ligando data centers locais ao TGW.
- Transit Gateway Connect (GRE / SD-WAN): Para integrar dispositivos virtuais de terceiros (como SD-WANs), utiliza túneis GRE e o protocolo MP-BGP (Multiprotocol BGP). As sessões BGP para IPv6 utilizam blocos /125 do intervalo de Notação Local Exclusiva (fd00::/8).

⚡ AWS PrivateLink   
O AWS PrivateLink viabiliza o acesso privado e unidirecional a serviços hospedados em outras VPCs ou no catálogo da AWS, sem expor o tráfego à internet e sem exigir peering ou gateways de trânsito.
- Desacoplamento de Protocolo: O PrivateLink permite que clientes e provedores de serviços adotem o IPv6 de forma independente. O cliente pode consumir o serviço via IPv6 mesmo que o backend do provedor ainda opere em IPv4.
- Requisito de Front-end: Para oferecer suporte a conexões IPv6 dos clientes, o Network Load Balancer (NLB) posicionado no provedor de serviços deve ser configurado no modo de pilha dupla (dual-stack).
- Flexibilidade de Destino: Os alvos (targets) do NLB podem ser instâncias ou serviços em IPv4, IPv6 ou instâncias de Application Load Balancer (ALB).

🛠️ Resumo Comparativo de Conectividade Privada IPv6   
- VPC Peering: Conexão ponto a ponto simples -> Excelente para poucas VPCs; permite contornar sobreposições de IPv4 usando apenas IPv6.
- AWS Transit Gateway: Roteamento centralizado em escala -> Exige sub-redes dual-stack nos anexos VPC; suporta VPNs IPv6 e túneis GRE com MP-BGP.
- AWS PrivateLink: Publicação e consumo seguro de APIs/serviços -> Exige NLB em dual-stack; desacopla o protocolo do cliente em relação ao backend.