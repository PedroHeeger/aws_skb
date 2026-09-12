# Introduction to AWS Cloud WAN   <img src="./0-aux/logo_course.png" alt="curso_dc_015" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_015 (Introduction to AWS Cloud WAN)   <img src="./0-aux/logo_course.png" alt="curso_dc_015" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260823_dc_015_en.pdf">Certificate</a>

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
  - AWS Cloud WAN

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Módulo Único</a><br>

---

### Objective:
O curso teve como objetivo apresentar o AWS Cloud WAN para a construção, gestão e monitoramento centralizado de redes mundiais de longa distância (Global WANs). Foi abordado o uso da infraestrutura global da AWS para interconectar filiais, data centers e VPCs por meio de um plano de controle unificado (Core Network), detalhando a automação de políticas de rede em JSON/GUI, a segmentação de tráfego (VRF/MPLS), a associação dinâmica de anexos baseada em tags e os mecanismos de observabilidade, segurança e controle de mudanças.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Módulo Único</h4></a>[Back to summary](#item01)

🌐 Arquitetura Global com AWS Cloud WAN   
O AWS Cloud WAN é um serviço gerenciado de rede WAN (Wide Area Network) projetado para interconectar ambientes corporativos locais (data centers, filiais e escritórios), instâncias Amazon VPC em múltiplas regiões e usuários remotos sobre a infraestrutura global da AWS. A solução centraliza o plano de controle de rede em um painel único, reduzindo a complexidade de roteamento e provendo segmentação lógica fim a fim.

⚡ Infraestrutura Global da AWS   
A base física do AWS Cloud WAN utiliza o backbone privado da AWS, composto por conexões de fibra óptica redundantes de 400 Gbps entre regiões e Zonas de Disponibilidade (AZs). Essa infraestrutura dedicada oferece:
- Propriedade e Controle: Infraestrutura sem dependência de circuitos de terceiros no backbone, permitindo reencaminhamento automático e dinâmico de tráfego em caso de saturação de links.
- Criptografia Nativa: Proteção do tráfego em trânsito na camada física e de enlace em todas as interconexões globais.
- Conectividade Híbrida Direta: Suporte ao roteamento bidirecional unificado com pontos de presença usando AWS Direct Connect ou conexões AWS Site-to-Site VPN.

🧱 Componentes Estruturais e Conceitos Técnicos   
A construção de uma arquitetura global baseia-se em abstrações hierárquicas controladas pelo AWS Network Manager:
- Rede Global (Global Network): Contêiner de alto nível que agrupa os componentes de rede regionais, gateways e recursos da infraestrutura WAN.
- Rede Central (Core Network): Malha de roteamento totalmente gerenciada pela AWS dentro da Rede Global.
- Borda da Rede Central (Core Network Edge - CNE): Endpoints regionais do Cloud WAN que atuam como pontos de ancoragem locais para anexos de rede, totalmente interligados entre si.
- Segmentos (Segments): Fronteiras de roteamento isoladas na Camada 3 (equivalentes ao conceito de VRF ou VPN IP MPLS). As regras do segmento definem se os recursos anexados podem se comunicar internamente ou se permanecerão isolados.
- Anexos (Attachments): Conexões de entrada para a Core Network. Suporta conexões de VPC, VPN (IPsec Site-to-Site), Connect (túneis GRE/BGP para appliances SD-WAN), Transit Gateway (para Direct Connect) e Client VPN.

📜 Governança e Ciclo de Mudanças via Política de Rede   
A topologia da rede é definida de forma declarativa através de uma Política de Rede Central (Core Network Policy), expressa em formato JSON ou configurada via interface gráfica. A política centraliza as definições de regiões ativas, lista de segmentos, regras de compartilhamento de rotas e rotas estáticas.

🏷️ Automação de Anexos por Metadados   
A associação de novas VPCs ou links VPN aos segmentos ocorre de forma automatizada. Regras declarativas avaliam as Tags dos anexos ou o Account ID de origem para mapear o recurso ao seu segmento correspondente (ex: production, development, shared-services ou external).

🔄 Validação em Duas Etapas (Change Set)   
As alterações na arquitetura de rede seguem um fluxo estrito de infraestrutura como código (IaC):
- Geração de Versão: A edição do documento JSON cria uma nova versão da política.
- Geração do Conjunto de Alterações (Change Set): A plataforma compara a versão ativa com a nova proposta, exibindo exatamente as propagações de rotas, compartilhamentos ou isolamentos adicionados ou removidos.
- Execução em Produção: Após a validação técnica, o conjunto de alterações é aplicado globalmente na infraestrutura em um único ciclo de implantação.

🔒 Regras de Roteamento e Isolação de Tráfego   
O controle de tráfego entre segmentos e redes externas baseia-se em princípios de segurança e isolamento na Camada 3:
- Isolamento Inter-Segmentos: Por padrão, segmentos distintos não trocam rotas. As permissões de tráfego dependem de ações explícitas de compartilhamento (Segment Actions).
- Isolamento Intra-Segmento: Opção para proibir a comunicação direta entre recursos conectados a um mesmo segmento (ex: isolar múltiplos parceiros dentro do segmento external).
- Compartilhamento Seletivo: Regras direcionadas para liberar rotas específicas (ex: permitir que o segmento hybrid acesse nonprod e production, mantendo production completamente isolado do ambiente development).
- Remoção Imediata de Acesso: A alteração ou exclusão de um bloco de compartilhamento no JSON da política remove instantaneamente as rotas propagadas entre os segmentos afetados em todas as bordas regionais, revogando o tráfego.

📊 Visibilidade e Topologia Unificada   
O console do AWS Network Manager provê visibilidade operacional através dos seguintes recursos gráficos e analíticos:
- Painel Geográfico: Mapeamento físico dos pontos de borda da Core Network, links de interconexão, métricas de tráfego (bytes/pacotes de entrada e saída) e status da infraestrutura.
- Árvore de Topologia (Topology Graph): Grafo interativo que detalha a relação entre regiões, segmentos, anexos locais, emparelhamentos BGP (em conexões SD-WAN/Connect) e VPCs associadas.
- Auditoria de Eventos: Registro em tempo real de alterações operacionais na malha WAN, como quedas ou subidas de sessões BGP, alterações de status de túneis IPsec e novos anexos aprovados.