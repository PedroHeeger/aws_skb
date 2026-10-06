# AWS for Media & Entertainment Content Production Workstation Requirements   <img src="./0-aux/logo_course.png" alt="curso_dc_021" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_021 (AWS for Media & Entertainment Content Production Workstation Requirements)   <img src="./0-aux/logo_course.png" alt="curso_dc_021" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260913_dc_021_en.pdf">Certificate</a>

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

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Introduction</a><br>
  1.1 <a href="#item01.01">Introduction to Content Production Workstation Requirements</a><br>
2. <a href="#item02">Workstation Requirements</a><br>
  2.1 <a href="#item02.01">Amazon EC2 Considerations</a><br>
  2.2 <a href="#item02.02">Selecting and Right Sizing Amazon EC2 Instances</a><br>
  2.3 <a href="#item02.03">Virtual Workstation System Requirements</a><br>
3. <a href="#item03">Conclusion</a><br>
  3.1 <a href="#item03.01">Summary</a><br>

---

### Objective:
O curso teve como objetivo capacitar na seleção, dimensionamento e otimização de instâncias do Amazon EC2 e estações de trabalho virtuais (Virtual Workstations) para fluxos de trabalho de produção de conteúdo audiovisual na AWS. A formação abordou os benefícios da nuvem para colaboração remota global, a análise comparativa entre requisitos de CPU e GPU (para NLE, edição de áudio, gradação de cor e finalização), e a escolha de famílias de instâncias apropriadas (C5 para processamento intensivo de CPU; G4, G5, G6 e P3 para aceleração gráfica e machine learning). Além disso, detalhou práticas de right-sizing via Amazon CloudWatch, integração com Active Directory/DNS, protocolos de streaming de pixels (Amazon DCV e HP Anyware) e diretrizes de resiliência e segurança.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introduction</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Introduction to Content Production Workstation Requirements</h4></a>[Back to summary](#item01)

🎬 Produção de Conteúdo na Nuvem AWS   
A migração de ambientes de pós-produção, edição e renderização para a nuvem permite que estúdios substituam a infraestrutura física local por estações de trabalho virtuais dinâmicas e escaláveis.
- Foco na Criação: Elimina a complexidade do gerenciamento de data centers, fornecendo conectividade de alta velocidade e recursos otimizados com GPUs para cargas de trabalho gráficas.
- Colaboração Global sem Fronteiras: A implantação de estações de trabalho em regiões geograficamente próximas aos profissionais reduz a latência e viabiliza a contratação de talentos em qualquer lugar do mundo.
- Otimização Continuada de Custos (Right-Sizing): A adequação de recursos substitui o provisionamento estático focado em picos de demanda. O monitoramento constante permite desativar máquinas ociosas e redimensionar instâncias superdimensionadas, convertendo custos fixos em despesas variáveis alinhadas ao uso real.

🛠️ Requisitos e Especificações para Estações de Trabalho   
A definição do ambiente virtual depende das exigências dos softwares de edição, correção de cor e composição visual, além dos periféricos necessários.
- Hardware Especializado e Periféricos: Suporte à integração com superfícies de controle para áudio/vídeo e mesas digitalizadoras com sensibilidade a pressão para artistas.
- Processador (CPU): Suporte obrigatório a instruções AVX2. O desempenho varia desde arquiteturas multicore modernas para execução básica até processadores de altíssima frequência com suporte a aceleração de codificação para mídia em alta definição.
- Memória RAM: Capacidade configurada conforme a resolução do projeto, partindo de patamares para mídia em HD até volumes expandidos para processamento em 4K ou superior.
- Processador Gráfico (GPU) e VRAM: GPUs dedicadas com suporte a bibliotecas de aceleração gráfica (OpenCL ou arquiteturas proprietárias) com memória de vídeo dedicada dimensionalmente adequada ao volume e complexidade das cenas.
- Armazenamento e Rede: Utilização de volumes SSD de altíssima velocidade para cache de aplicações e arquivos de projeto. A conectividade de rede interna exige interfaces de alta capacidade (como links de 10 Gbps) para suportar o fluxo de dados em rede compartilhada durante edições em alta resolução.

💻 Famílias de Instâncias EC2 para Mídia e Entretenimento   
O provisionamento da infraestrutura baseia-se na escolha do perfil computacional correto para cada etapa da cadeia de produção.
- Propósito Geral (Séries T e M): Recursos equilibrados de processamento, memória e rede. Adequados para serviços administrativos, servidores de licenciamento de software e bancos de dados de fluxo de trabalho.
- Computação Otimizada (Série C): Processadores de alto desempenho voltados para tarefas com uso intensivo de CPU, como processamento em lote, transcodificação de áudio e conversão de formatos de mídia.
- Computação Acelerada (Série G): Equipadas com aceleradores de hardware e GPUs dedicadas. Indicadas para aplicações com alta exigência de renderização 3D, edição não linear (NLE) e softwares gráficos de alta performance.

🖥️ Desktops Virtuais de Desempenho (Amazon WorkSpaces)   
A adoção de áreas de trabalho remotas baseadas em Amazon WorkSpaces integradas a instâncias da família de computação acelerada oferece um ambiente completo para artistas e editores.
- Dimensionamento Dinâmico: Capacidade de expandir a memória e o poder de processamento gráfico sob demanda durante fases de pico de produção.
- Experiência de Usuário Preservada: Entrega de baixa latência e alta fidelidade visual para edição remota em tempo real sem perda de qualidade em relação a estações físicas.
- Redução de Custos Operacionais: Eliminação do ciclo de atualização de hardware local e redução de despesas estruturais com espaço físico.

<a name="item02"><h4>Workstation Requirements</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Amazon EC2 Considerations</h4></a>[Back to summary](#item02)

🎛️ Papel dos Componentes de Hardware na Computação Gráfica   
A correta alocação de recursos de hardware no Amazon EC2 é determinante para a estabilidade e eficiência de custo em ambientes de pós-produção na nuvem.
- Unidade Central de Processamento (CPU): Responsável pela execução das rotinas do sistema operacional, gerenciamento da lógica dos softwares, processamento sequencial de dados e coordenação de tarefas de codificação, decodificação e computação multi-thread.
- Unidade de Processamento Gráfico (GPU): Circuito especializado projetado para o processamento vetorial e matemático em paralelo. Acelera tarefas intensivas como renderização de cenas, edição de vídeo em tempo real, aplicação de efeitos visuais e processamento de modelos de aprendizado de máquina.
- Memória de Acesso Aleatório (RAM): Armazenamento temporário de altíssima velocidade para carregamento de assets ativos, caches de aplicação e buffers de reprodução. Capacidades ampliadas são fundamentais para evitar gargalos de processamento, falhas e interrupções inesperadas durante a manipulação de mídias de alta resolução.

📽️ Perfis Computacionais por Tipo de Carga de Trabalho   
Cada etapa da cadeia de produção visual impõe exigências distintas sobre a arquitetura dos computos virtuais.

Edição de Vídeo Não Linear (NLE)   
Softwares de montagem que preservam os arquivos originais exigem capacidade computacional elevada para realizar a manipulação em tempo real dos projetos.
- Requisito de CPU: Exigem processadores com múltiplos núcleos de alto desempenho para lidar com a decodificação de múltiplos fluxos de vídeo na linha do tempo e exportação final.
- Requisito de GPU: Necessitam de GPUs dedicadas para garantir a aceleração de hardware na renderização de efeitos e assegurar a reprodução fluida do conteúdo sem queda de quadros (dropped frames).

Correção e Gradação de Cores (Color Grading)   
Atividades focadas na padronização cromática, ajuste de contraste e estilização estética da imagem.
- Requisito de GPU: Apresentam dependência primária da capacidade de processamento paralelo da GPU em relação à CPU, demandando alto volume de memória de vídeo (VRAM).
- Requisito de Memória: Exigem volumes expressivos de memória RAM do sistema para manter o fluxo de leitura contínuo em timelines densas e com mídias em resolução 4K ou superior.

Finalização e Acabamento de Alta Qualidade (Finishing)   
Processo de composição avançada, integração de efeitos visuais 3D e conformação final dos arquivos para entrega em diferentes formatos e codecs.
- Requisito de CPU: Necessitam de CPUs otimizadas com contagem elevada de núcleos para suportar a composição de múltiplos nós (nodes) e camadas complexas.
- Requisito de GPU: GPUs dedicadas com suporte às arquiteturas CUDA ou OpenCL e drivers otimizados, garantindo a interatividade e aceleração dos efeitos durante a renderização.
- Requisito de Memória: Exigem o provisionamento de margens amplas de RAM (tendo como patamar inicial recomendado 32 GB), com expansão proporcional ao nível de complexidade e densidade de efeitos do projeto.

<a name="item02.02"><h4>2.2 Selecting and Right Sizing Amazon EC2 Instances</h4></a>[Back to summary](#item02)

🎯 Seleção de Instâncias EC2 e Alocação de Recursos   
A escolha do tipo de instância Amazon EC2 para fluxos de trabalho visuais deve equilibrar capacidade de processamento, aceleração gráfica, throughput de rede e memória RAM, garantindo desempenho com o menor custo no modelo sob demanda.
- Adequação de Recursos: O dimensionamento inicial vincula as necessidades da aplicação (como contagem de núcleos e volume de RAM) ao porte da instância dentro de cada família tecnológica.
- Rede e Armazenamento Otimizados: O uso de volumes Amazon EBS de alto desempenho provê a taxa de transferência necessária para edição de mídia, enquanto a largura de banda de rede dedicada impede gargalos no carregamento de assets.

💻 Famílias de Instâncias para Produção Visual   
A AWS oferece famílias específicas otimizadas para processamento intensivo de CPU, aceleração por GPU e inteligência artificial.
- Série C (Ex: C5): Otimizada para cargas de trabalho focadas em processamento numérico de alta velocidade. Indicada para transcodificação de arquivos de vídeo e processamento pesado de efeitos de áudio.
- Série G (Ex: G4, G5 e G6): Equipadas com GPUs dedicadas para aceleração gráfica e estações virtuais de trabalho.
  - G4 (G4dn): Solução versátil e econômica com aceleradores NVIDIA, ideal para estações remota NLE, streaming e suporte às bibliotecas CUDA e NVENC.
  - G5: Entrega ganhos de desempenho gráfico significativamente superiores em relação à geração anterior, sendo indicada para renderização em tempo real e gráficos de alta fidelidade.
  - G6: Incorpora GPUs com suporte a NVIDIA RTX e núcleos RT de última geração. Oferece alta proporção de memória por vCPU para manipular cenas complexas. Caso existam problemas de compatibilidade de drivers na Série G6, o redimensionamento para instâncias equivalentes da Série G5 é a alternativa padrão.
- Série P (Ex: P3dn): Instâncias de altíssimo desempenho computacional e aprendizado de máquina distribuído, equipadas com suporte a Elastic Fabric Adapter (EFA) para comunicação entre nós de computação paralela.

📉 Metodologia de Dimensionamento Correto (Right-Sizing)   
O dimensionamento correto consiste em identificar a menor configuração de instância capaz de atender às métricas de desempenho exigidas pelo projeto, ajustando a capacidade conforme a demanda real.
- Início Conservador: A recomendação operacional é iniciar o provisionamento com instâncias de menor porte e expandir a capacidade conforme a necessidade do projeto.
- Análise de Telemetria com CloudWatch: Utilização do Amazon CloudWatch para monitorar continuamente métricas de utilização de CPU, RAM e I/O. Instâncias que apresentam uso baixo constante são candidatas ao redimensionamento imediato (downsizing).
- Tratamento de Variação de Carga: Aplicação de Amazon EC2 Auto Scaling combinado com Elastic Load Balancing para ajustar dinamicamente a quantidade de instâncias ativas em cenários de demanda flutuante.
- Cargas de Trabalho Previsíveis: Para projetos estáveis e de longa duração, a transição do modelo Sob Demanda para Instâncias Reservadas (RIs) garante redução substancial nos custos de infraestrutura.

<a name="item02.03"><h4>2.3 Virtual Workstation System Requirements</h4></a>[Back to summary](#item02)

🖥️ Estações de Trabalho Virtuais na Nuvem (AWS & NVIDIA)   
A implementação de estações de trabalho virtuais aceleradas por hardware viabiliza a entrega de capacidades computacionais de alta performance para profissionais de mídia e entretenimento, independentemente da sua localização geográfica.
- Acesso Remoto e Latência: Permite a contratação de profissionais globalmente ao disponibilizar recursos posicionados em regiões geograficamente próximas aos usuários, garantindo baixos níveis de latência e alta taxa de transferência.
- Flexibilidade de Hardware: As famílias de instâncias otimizadas oferecem configurações escaláveis com múltiplas combinações de processadores, volumes de memória RAM e unidades de processamento gráfico (GPUs).

⚙️ Especificações e Escalabilidade da Série G6   
A linha de instâncias Amazon EC2 G6 integra placas NVIDIA L4 Tensor Core, apresentando variações de capacidade estruturadas para diferentes níveis de demanda criativa:
- Configurações de Entrada e Médio Porte (ex: g6.xlarge a g6.8xlarge): Oferecem suporte computacional variando de 4 a 32 vCPUs, de 16 a 128 GiB de RAM do sistema e 24 GiB de memória de vídeo dedicada (VRAM), sendo indicadas para fluxos de trabalho padrão de edição e modelagem.
- Configurações Otimizadas para RAM (Série gr6): Apresentam proporções expandidas de memória do sistema em relação às vCPUs para atender aplicações com alta exigência de cache e manipulação de assets volumosos.
- Configurações de Alta Capacidade (ex: g6.12xlarge a g6.48xlarge): Alocam conjuntos multi-GPU (de 4 a 8 unidades físicas de GPU) somando até 192 GiB de VRAM, 192 vCPUs e 768 GiB de RAM, voltadas para renderização massiva e processamento gráfico paralelo extremo.
- Conectividade Dedicada: O uso do AWS Direct Connect em conjunto com a Amazon VPC garante o tráfego de dados por links privados dentro da rede global da AWS, contornando a internet pública e reduzindo variações de latência.

🔐 Identidade, Serviços de Rede e Acesso Remoto   
A operação de instâncias virtuais exige a integração de mecanismos de autenticação e protocolos de transmissão de baixa latência.
- Integração com Active Directory e DNS: O gerenciamento de identidades pode ocorrer via AWS Directory Service ou conexões com estruturas locais existentes através do AD Connector. Para a resolução de nomes de domínio, utiliza-se o AWS Managed Microsoft AD ou o Amazon Route 53.
- Transmissão de Pixels e Agentes de Conexão: A entrega da interface visual para os monitores dos usuários é realizada por tecnologias de streaming de pixels criptografados (como Amazon DCV ou HP Anyware). Agentes de conexão (connection brokers) gerenciam o brokeramento, a alocação e o acesso seguro dos usuários as máquinas disponíveis.
- Segurança de Rede: Utilização de túneis AWS VPN e sub-redes privadas em uma Amazon VPC para restringir e criptografar os fluxos de tráfego entre os clientes remotos e a infraestrutura virtual.

🔄 Continuidade de Negócios e Resiliência   
O planejamento de disponibilidade para estações de trabalho de missão crítica requer a definição clara de metas operacionais e validação contínua.
- Métricas de Recuperação: Definição do Tempo Objetivo de Recuperação (RTO), que estabelece o prazo máximo aceitável para restauração dos serviços após uma falha, e do Ponto Objetivo de Recuperação (RPO), que define a tolerância limite para perda de dados.
- Avaliação de Resiliência: O AWS Resilience Hub analisa as aplicações contra as metas de RTO e RPO estabelecidas, fornecendo recomendações de arquitetura com base no AWS Well-Architected Framework.
- Injeção de Falhas: Execução de testes de engenharia de caos via AWS Fault Injection Service para simular interrupções controladas na infraestrutura, permitindo identificar vulnerabilidades em dependências antes que ocorram falhas reais em produção.

<a name="item03"><h4>Conclusion</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Summary</h4></a>[Back to summary](#item03)

📑 Síntese Consolidada: Estações de Trabalho na Nuvem AWS   
A adoção da infraestrutura da AWS para a produção de conteúdo transforma o fluxo de trabalho de mídia e entretenimento, substituindo equipamentos físicos locais por recursos virtuais otimizados e altamente dimensionáveis.

💡 Fundamentos e Benefícios Estratégicos   
- Foco no Core Criativo: Transferência da gestão da infraestrutura física para a AWS, permitindo direcionar esforços para a criação e pós-produção.
- Acesso Global a Talentos: A infraestrutura distribuída reduz a latência ao aproximar o processamento dos usuários, permitindo a contratação de profissionais em qualquer região.
- Otimização Financeira: Adoção de arquiteturas baseadas em custos variáveis, eliminando investimentos massivos em hardware local propenso à obsolescência.

🎛️ Perfis Computacionais do Amazon EC2   
A escolha das instâncias Amazon EC2 deve considerar a natureza de cada etapa de produção:
- Série C5 (Processamento Otimizado): Voltada para tarefas intensivas de CPU sem alta exigência gráfica, como transcodificação de mídia e codificação de áudio.
- Séries G4, G5 e G6 (Computação Acelerada): Instâncias otimizadas com GPUs para edição não linear, renderização 3D e composição visual, variando em volume de VRAM, contagem de núcleos e velocidade de rede.
- Série P3 (Cargas Especializadas): Voltada para modelos de aprendizado de máquina aplicados à análise e processamento de mídia.

📏 Dimensionamento Correto e Eficiência Operacional   
A governança do consumo computacional exige o monitoramento e o ajuste contínuo da infraestrutura:
- Telemetria de Uso: Utilização do Amazon CloudWatch para analisar o consumo de memória, CPU e I/O, identificando instâncias subutilizadas para redução de porte.
- Flexibilidade de Carga: Emprego de Amazon EC2 Auto Scaling para adequar a capacidade em momentos de demanda flutuante.
- Previsibilidade Financeira: Uso de Instâncias Reservadas (RIs) para demandas contínuas de longo prazo, garantindo reduções de custo relevantes sobre a tarifa sob demanda.

🔒 Arquitetura de Estações Virtuais e Segurança   
O desenho de ambientes de trabalho remotos exige a integração de múltiplos componentes de infraestrutura e governança:
- Gestão de Identidades e Nomes: Integração com serviços de diretório via Active Directory e resolução DNS de baixa latência para garantir políticas de acesso unificadas.
- Experiência Remota e Conectividade: Uso de protocolos de streaming de alta performance para a transmissão de pixels criptografados, garantindo resposta imediata sem perdas visuais.
- Resiliência e Proteção de Dados: Definição rigorosa de parâmetros de RTO e RPO, aliada a políticas de segurança de rede isoladas via Amazon VPC, para assegurar a continuidade do negócio contra interrupções.