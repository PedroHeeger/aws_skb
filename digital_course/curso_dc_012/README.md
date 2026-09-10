# Getting Started with AWS Cloud Essentials   <img src="./0-aux/logo_course.png" alt="curso_dc_012" width="auto" height="45">

### AWS <a href="../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../aws_partner/">aws_partner</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_012 (Getting Started with AWS Cloud Essentials)   <img src="./0-aux/logo_course.png" alt="curso_dc_012" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260820_dc_012_en.pdf">Certificate</a>

---

### Theme:
- Cloud Computing

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

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Getting Started in the AWS Cloud</a><br>
  1.1 <a href="#item01.01">Getting Started in the AWS Cloud</a><br>
  1.2 AWS Management Console demonstration<br>
  1.3 <a href="#item01.03">AWS core service areas</a><br>
2. <a href="#item02">Understanding the AWS Global Infrastructure</a><br>
  2.1 <a href="#item02.01">Understanding the AWS Global Infrastructure</a><br>
3. <a href="#item03">Core Services Overview: Compute</a><br>
  3.1 <a href="#item03.01">Core Services Overview: Compute</a><br>
  3.2 <a href="#item03.02">Serverless doesn't run idle resources.</a><br>
  3.3 <a href="#item03.03">Serverless application use cases</a><br>
  3.4 AWS Lambda demonstration<br>
  3.5 <a href="#item03.05">Containers orchestration</a><br>
4. <a href="#item04">Core Services Overview: Storage</a><br>
  4.1 <a href="#item04.01">Core Services Overview: Storage</a><br>
  4.2 <a href="#item04.02">Some of the Amazon S3 storage benefits</a><br>
  4.3 <a href="#item04.03">Amazon S3 demonstration</a><br>
5. <a href="#item05">Core Services Overview: Databases</a><br>
  5.1 <a href="#item05.01">Core Services Overview: Databases</a><br>
  5.2 <a href="#item05.02">Use AWS Cloud databases</a><br>
  5.3 <a href="#item05.03">Managed relational database—Amazon RDS</a><br>
6. <a href="#item06">Core Services Overview: Networking</a><br>
  6.1 <a href="#item06.01">Core Services Overview: Networking</a><br>
7. <a href="#item07">Core Services Overview: Security</a><br>
  7.1 Core Services Overview: Security<br>
  7.2 <a href="#item07.02">The shared responsibility model</a><br>
  7.3 <a href="#item07.03">When running your workloads</a><br>
8. <a href="#item08">Core Services Overview: Pricing</a><br>
  8.1 <a href="#item08.01">Core Services Overview: Pricing</a><br>
9. <a href="#item09">Next Steps</a><br>
  9.1 <a href="#item09.01">Next Steps</a><br>
  9.2 <a href="#item09.02">Explore the four levels of expertise in AWS certification</a><br>

---

### Objective:
O objetivo do curso foi apresentar os fundamentos da nuvem e os serviços essenciais da AWS. Foram abordados os conceitos de infraestrutura global, as soluções de computação, armazenamento, redes e bancos de dados gerenciados, além do modelo de responsabilidade compartilhada, estratégias de otimização de custos e diretrizes de segurança.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Getting Started in the AWS Cloud</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Getting Started in the AWS Cloud</h4></a>[Back to summary](#item01)

🌩️ A Transformação da Infraestrutura: Hardware como Software   
A computação em nuvem redefine a gestão de TI ao substituir a dependência de ativos físicos por recursos digitais programáveis, disponibilizados sob demanda através da internet. A infraestrutura deixa de ser um custo de capital fixo para se tornar um elemento flexível e acionável por código.

💎 Os 3 Pilares Fundamentais do Modelo em Nuvem   
A adoção da nuvem apoia-se em três vantagens operacionais centrais:
- Recursos Programáveis: A infraestrutura é gerenciada por meio de APIs e ferramentas de automação. É possível criar, modificar ou excluir servidores, redes e bancos de dados de forma quase instantânea.
- Capacidades Dinâmicas (Elasticidade): O ambiente expande ou encolhe automaticamente para acompanhar as variações de demanda da aplicação, eliminando a subutilização ou o esgotamento de recursos.
- Modelo de Tarifação por Uso (Pay-as-you-Go): Ausência de investimentos financeiros iniciais massivos em ativos fixos (CAPEX). A cobrança é atrelada exclusivamente ao consumo e ao tempo de utilização real dos serviços (OPEX).

⚖️ Comparativo: Ambientes Tradicionais vs. Modelo Nuvem   
A diferença entre a TI local (on-premises) e a infraestrutura em nuvem impacta diretamente o ritmo de inovação e a eficiência financeira das empresas:
- Modelo Tradicional (On-Premises): Exige estimativas rígidas de capacidade com antecedência. Envolve processos morosos de compra, transporte, montagem física e configuração de hardware. Riscos frequentes incluem gargalos por falta de capacidade ou desperdício financeiro devido a infraestruturas ociosas superdimensionadas.
- Modelo de Nuvem Gerenciada: O provedor (como a AWS) assume integralmente a manutenção física, segurança predial e conectividade dos data centers. O cliente mantém o controle lógico sobre seus sistemas, ajustando capacidade, armazenamento e topologia de rede em tempo real.

🛠️ Modos de Interação e Gestão de Recursos   
O gerenciamento da infraestrutura virtualizada ocorre por meio de interfaces padronizadas fornecidas pelo provedor:
- AWS Management Console: Interface gráfica via navegador web para navegação e configuração visual de serviços.
- AWS Command Line Interface (AWS CLI): Ferramenta de linha de comando para automação de tarefas e controle direto por terminal.
- AWS SDKs: Bibliotecas de software que permitem integrar o gerenciamento de infraestrutura diretamente ao código-fonte das aplicações em diversas linguagens de programação.

<a name="item01.03"><h4>1.3 AWS core service areas</h4></a>[Back to summary](#item01)

🗂️ Panorama Geral de Serviços e Pilares Fundamentais da AWS   
A Amazon Web Services oferece uma plataforma abrangente composta por dezenas de categorias de serviços. Essa amplitude permite construir desde arquiteturas web simples até soluções avançadas de inteligência artificial e conectividade espacial.

🌐 Categorias de Serviços da Plataforma AWS   
O portfólio completo abrange diversas especialidades tecnológicas para atender a diferentes cenários de negócios:
- Infraestrutura e Redes: Computação (Compute), Armazenamento (Storage), Redes e Distribuição de Conteúdo, Migração e Transferência.
- Dados e Inteligência: Bancos de Dados, Análises (Analytics), Aprendizado de Máquina (Machine Learning), Blockchain.
- Desenvolvimento e Aplicações: Ferramentas de Desenvolvedor, Integração de Aplicativos, Aplicações Empresariais, Serviços de Mídia, Recursos Móveis.
- Operações e Proteção: Segurança, Identidade e Conformidade; Gestão e Governança; Gestão de Custos.
- Tecnologias Emergentes e Setoriais: Internet das Coisas (IoT), Robótica, Realidade Aumentada e Virtual (AR/VR), Satélite, Computação do Usuário Final, Tecnologia de Jogos, Envolvimento do Cliente.

🎯 As 5 Áreas de Atuação Principal (Core Services)   
Para gerenciar a nuvem de maneira eficiente e construir fundamentos sólidos de arquitetura, o foco inicial de aprendizado e operação concentra-se em cinco pilares essenciais:
- Computação (Compute): Fornecimento de capacidade de processamento flexível (como instâncias de servidores virtuais, contêineres e arquiteturas sem servidor) para executar sistemas e aplicações.
- Armazenamento (Storage): Soluções para guardar arquivos, blocos de dados e backups de forma altamente disponível, escalável e segura.
- Bancos de Dados (Databases): Motores relacionais e não relacionais gerenciados para estruturar, consultar e persistir informações com alto desempenho.
- Redes (Networking): Definição de isolamento lógico, topologias de sub-redes, roteamento de tráfego e regras de conectividade privada e pública.
- Segurança (Security): Gestão centralizada de identidades, permissões de acesso, criptografia de dados e proteção da infraestrutura.

<a name="item02"><h4>Understanding the AWS Global Infrastructure</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Understanding the AWS Global Infrastructure</h4></a>[Back to summary](#item02)

🏗️ Hierarquia da Infraestrutura Global da AWS   
A Infraestrutura Global da AWS é a base física e de rede sobre a qual todos os serviços de nuvem são executados. Sua arquitetura é projetada para oferecer resiliência, baixa latência e alta disponibilidade em escala mundial, dividindo-se em três blocos operacionais encadeados:
- Data Center: A unidade física fundamental. Trata-se da instalação que abriga milhares de servidores, equipamentos de rede e sistemas de energia e refrigeração.
- Zona de Disponibilidade (AZ): Conjunto formado por um ou mais data centers fisicamente isolados em uma mesma localização geográfica. Cada AZ possui infraestrutura de energia, refrigeração e segurança independentes para garantir alta tolerância a falhas (um problema em uma AZ não afeta as demais).
- Região AWS: Área geográfica que agrupa duas ou mais Zonas de Disponibilidade interconectadas por uma rede de fibra óptica dedicada de altíssima velocidade (backbone da AWS). A maioria das aplicações e dados é vinculada a uma Região específica.

💡 As 6 Vantagens Financeiras e Operacionais da Nuvem   
A utilização dessa estrutura global reflete-se em seis benefícios estratégicos para a gestão de TI e negócios:
- Substituição de Investimentos Fixos por Custos Variáveis: Eliminação de grandes aportes de capital (CAPEX) na compra e manutenção preventiva de hardware, adotando cobrança operacional atrelada ao consumo real (OPEX).
- Economias de Escala Massivas: Devido ao volume massivo de clientes agregados na plataforma, a AWS reduz custos operacionais e repassa essas eficiências aos usuários através de preços menores por unidade de consumo.
- Fim das Estimativas de Capacidade: Ausência da necessidade de prever demandas futuras de servidores antes de lançar um projeto. A infraestrutura aloca recursos dinamicamente, evitando custos com ativos ociosos ou degradação por falta de capacidade.
- Ganho de Velocidade e Agilidade: Recursos computacionais podem ser provisionados em poucos minutos via código ou painel web, acelerando o ciclo de desenvolvimento e lançamento de novos produtos.
- Foco no Core Business: Redução das atividades braçais e complexas de manutenção predial, cabeamento, alimentação e climatização de data centers, permitindo concentrar esforços em aplicações estratégicas para os clientes.
- Alcance Global em Minutos: Capacidade de implantar aplicações em múltiplas Regiões ao redor do mundo com apenas alguns cliques, reduzindo a latência para os usuários finais e cumprindo requisitos locais de conformidade.

<a name="item03"><h4>Core Services Overview: Compute</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Core Services Overview: Compute</h4></a>[Back to summary](#item03)

🖥️ Processamento Escalável com Amazon EC2 e Arquiteturas Nativas   
O Amazon Elastic Compute Cloud (Amazon EC2) é o serviço fundamental de computação em nuvem da AWS. Ele fornece capacidade de processamento reconfigurável por meio de máquinas virtuais gerenciadas, permitindo alterar o tamanho e a quantidade de servidores virtuais de acordo com a oscilação da demanda.

Além de máquinas virtuais, o ecossistema de computação abrange contêineres, ferramentas para processamento em lote e arquiteturas sem servidor (serverless).

🎯 Atributos Operacionais do Amazon EC2   
A utilização de instâncias EC2 oferece diferenciais de gestão em relação aos servidores físicos tradicionais:
- Controle do Sistema Operacional: A AWS gerencia a infraestrutura física de hardware, enquanto o cliente retém acesso root/administrador para configurar bibliotecas, aplicações e regras de segurança.
- Ciclo de Vida Flexível: Capacidade de iniciar, interromper, reiniciar ou encerrar servidores via painel, linha de comando (CLI) ou código (SDKs) em poucos minutos.
- Ajuste de Dimensionamento: Possibilidade de alterar a família ou o porte da instância (como aumentar a memória RAM ou os vCPUs de um servidor existente) para acompanhar o crescimento da aplicação.

Peço desculpas pela desatenção. Ajustei o conteúdo para eliminar completamente a tabela e remover todos os emojis do corpo do texto, mantendo os emojis estritamente no início dos títulos das seções.

🏎️ Famílias de Instâncias e Casos de Uso   
A AWS organiza os tipos de instâncias em categorias especializadas para alinhar a arquitetura física às necessidades de cada carga de trabalho:
- Uso Geral (Prefixos t2, t3, m4, m5, a1): Oferecem equilíbrio entre recursos de processamento, memória RAM e rede. São recomendadas para servidores web, repositórios de código e ambientes de desenvolvimento.
- Otimizada para Computação (Prefixos c4, c5): Focadas em processadores de alto desempenho. São ideais para tarefas com uso intensivo de CPU, como processamento em lote, transcodificação de mídia e servidores dedicados para jogos.
- Otimizada para Memória (Prefixos r4, r5, x1, z1): Fornecem elevada proporção de memória RAM. Indicadas para bancos de dados relacionais e em memória, caches como Redis e análises de big data em tempo real.
- Computação Acelerada (Prefixos g3, g4, p2, p3, f1): Utilizam GPUs dedicadas e FPGAs. Voltadas para modelos de aprendizado de máquina, renderização gráfica e dinâmica de fluidos computacional.
- Otimizada para Armazenamento (Prefixos i3, d2, h1): Priorizam altas taxas de operações de entrada e saída (E/S) por segundo e baixas latências em disco. Adequadas para sistemas de arquivos distribuídos, data warehouses e bancos NoSQL de alto volume de transações.
- Computação de Alto Desempenho - HPC (Prefixos Hpc6a, Hpc6id): Projetadas para processamento denso e interconexão de alta velocidade. Indicadas para simulações complexas de grande porte e treinamento de aprendizado profundo.

📈 Automação com Amazon EC2 Auto Scaling   
O Amazon EC2 Auto Scaling gerencia a capacidade computacional automaticamente para manter a disponibilidade e conter custos, evitando a subutilização ou o esgotamento de recursos.
- Escalonamento Dinâmico e Preditivo: Adiciona ou remove instâncias em tempo real com base em métricas operacionais (como uso de CPU) ou agendamentos prévios e modelos preditivos.
- Gerenciamento Autônomo da Frota: Detecta instâncias com falhas ou aplicações inoperantes e realiza a substituição automática dos servidores sem necessidade de intervenção humana.
- Ajuste Horizontal: Ajusta o número total de instâncias ativas exatamente ao volume de tráfego do momento, viabilizando o conceito de infraestrutura descartável e elástica.

⚡ Abordagem de Computação Sem Servidor (Serverless)   
Em contraste com o modelo de instâncias EC2 — onde o cliente configura o sistema operacional e a capacidade do servidor —, a computação sem servidor permite executar código diretamente em resposta a eventos. O provedor gerencia automaticamente o provisionamento, a execução, a tolerância a falhas e o dimensionamento, cobrando estritamente pelo tempo de execução do código.

<a name="item03.02"><h4>3.2 Serverless doesn't run idle resources.</h4></a>[Back to summary](#item03)

⚡ Arquitetura Sem Servidor (Serverless) e AWS Lambda   
A computação sem servidor (serverless) elimina a necessidade de provisionar, configurar ou gerenciar servidores físicos e virtuais. Nesse modelo, a plataforma assume integralmente a gestão da infraestrutura, permitindo que as equipes de desenvolvimento foquem exclusivamente na criação do código e nas regras de negócio da aplicação.

🎯 Atributos da Computação Sem Servidor   
A adoção do modelo sem servidor oferece vantagens operacionais e financeiras em relação à computação tradicional baseada em instâncias:
- Gestão Zero de Infraestrutura: Ausência de tarefas manuais de provisionamento, atualização de sistema operacional ou manutenção de servidores.
- Dimensionamento Automático: A capacidade computacional acompanha a variação de tráfego instantaneamente, escalando do zero até milhares de execuções simultâneas conforme o volume de requisições.
- Cobrança Exclusiva por Execução: Eliminação do custo por recursos ociosos. Diferente de um servidor virtual mantido ligado continuamente, a cobrança ocorre apenas durante o tempo exato em que o código está sendo processado.
- Resiliência e Tolerância a Falhas Integradas: A alta disponibilidade e a redundância do ambiente são fornecidas nativamente pelo serviço, sem necessidade de configurar clusters adicionais.

🚀 Execução de Código com AWS Lambda   
O AWS Lambda é o serviço de computação sem servidor orientado a eventos da AWS. Ele executa o código em resposta a gatilhos específicos e gerencia automaticamente toda a capacidade necessária.
- Orientação a Eventos: O código pode ser disparado por ações em outros serviços da AWS, como a adição de um arquivo em um bucket do Amazon S3, alterações em registros de tabelas do Amazon DynamoDB ou chamadas via APIs HTTP.
- Cobrança Granular por Milissegundo: A tarifação é calculada com base no número de solicitações e no tempo exato de processamento do código, medido em milissegundos.
- Execução Sem Estado (Stateless): As funções Lambda processam cada requisição de forma isolada, simplificando o escalonamento horizontal em massa.
- Suporte Multilinguagem: Permite o carregamento de código em diversas linguagens de programação populares, além de suportar a execução de contêineres personalizados.

<a name="item03.03"><h4>3.3 Serverless application use cases</h4></a>[Back to summary](#item03)

🎯 Casos de Uso para Aplicações Sem Servidor   
A arquitetura sem servidor (serverless) é aplicável a diversos cenários operacionais, permitindo construir desde automações simples até plataformas altamente escaláveis. A seguir estão os principais cenários de implementação:

🌐 Aplicações Web e Backends   
- Aplicações Web: Desenvolvimento de sites estáticos, plataformas web complexas e migração de microsserviços utilizando frameworks tradicionais (como Flask e Express).
- Backends de Serviços: Suporte a regras de negócios para aplicações móveis, sistemas web e serviços integrados a dispositivos de Internet das Coisas (IoT).

📊 Processamento de Dados e Automação   
- Processamento de Dados: Execução de pipelines em tempo real, rotinas de processamento em lote, algoritmos no modelo MapReduce e inferência em modelos de aprendizado de máquina.
- Chatbots e Assistentes de Voz: Sustentação da lógica de conversação e processamento de chatbots, além de integração com o Alexa Skills Kit para criar aplicações orientadas a comandos de voz.
- Automação de TI: Execução de motores de políticas de segurança, extensão de funcionalidades nativas dos serviços de nuvem e automação de rotinas de gestão de infraestrutura.

<a name="item03.05"><h4>3.5 Containers orchestration</h4></a>[Back to summary](#item03)

📦 Orquestração de Contêineres na AWS com Amazon ECS e Amazon EKS   
O gerenciamento de aplicações em contêineres em escala exige ferramentas automatizadas para agendar a execução, monitorar a integridade e dimensionar a infraestrutura subjacente. A AWS oferece duas plataformas principais de orquestração gerenciada para simplificar a implantação de contêineres sem a necessidade de manter clusters manuais complexos.

🛠️ Serviços de Orquestração Gerenciada   
- Amazon Elastic Container Service (Amazon ECS): Serviço nativo da AWS projetado para orquestração simples e altamente integrada. Oferece controle centralizado sobre o ciclo de vida das aplicações em contêineres, facilitando a implantação e a escala com profunda integração aos demais serviços do ecossistema AWS.
- Amazon Elastic Kubernetes Service (Amazon EKS): Serviço gerenciado que permite executar o Kubernetes na AWS sem a necessidade de instalar, operar e manter o plano de controle (control plane) ou os nós do cluster. É ideal para organizações que buscam padronização com o ecossistema open source do Kubernetes.

🎯 Benefícios do Uso de Orquestradores   
- Automação do Ciclo de Vida: Gerenciamento automático da inicialização, reinicialização e encerramento de contêineres em caso de falhas.
- Dimensionamento da Frota: Ajuste dinâmico da capacidade computacional e do número de réplicas de acordo com a variação da demanda.
- Redução da Complexidade Operacional: Eliminação do trabalho pesado associado à configuração e ao gerenciamento manual da infraestrutura de servidores.

<a name="item04"><h4>Core Services Overview: Storage</h4></a>[Back to summary](#item04)

<a name="item04.01"><h4>4.1 Core Services Overview: Storage</h4></a>[Back to summary](#item04)

💾 Armazenamento de Objetos com Amazon S3   
O Amazon Simple Storage Service (Amazon S3) é um serviço de armazenamento de objetos totalmente gerenciado, sem servidor e de alta durabilidade. Ele permite guardar volumes ilimitados de dados não estruturados de qualquer formato com custos otimizados.

Para atender a diferentes frequências de acesso, tempos de retenção e orçamentos, o Amazon S3 disponibiliza múltiplas classes de armazenamento.

🗂️ Classes de Armazenamento do Amazon S3   
- Amazon S3 Standard: Classe padrão projetada para dados de acesso frequente. Oferece alta velocidade e baixa latência, sendo indicada para sites dinâmicos, distribuição de conteúdo, aplicações móveis e análises de dados.
- Amazon S3 Intelligent-Tiering: Classe automatizada que otimiza custos ao mover os dados entre camadas de acesso (frequente, pouco frequente e arquivamento instantâneo) sem impacto na latência. Ideal para cenários com padrões de acesso desconhecidos ou imprevisíveis, como data lakes e conteúdos gerados por usuários.
- Amazon S3 Standard-Infrequent Access (S3 Standard-IA): Voltada para dados acessados com menor frequência, mas que exigem disponibilidade imediata quando solicitados. Oferece custo de armazenamento por gigabyte reduzido com cobrança pela taxa de recuperação, sendo recomendada para backups e recuperação de desastres.
- Amazon S3 One Zone-Infrequent Access (S3 One Zone-IA): Armazena dados de acesso infrequente em uma única Zona de Disponibilidade, proporcionando um custo menor que o S3 Standard-IA. Indicada para cópias secundárias de backup ou dados facilmente recriáveis que não exigem a resiliência de múltiplas zonas.

🏢 Experiência Híbrida com AWS Outposts   
Para cenários operacionais que exigem o processamento de dados localmente por questões de latência ou conformidade, a família AWS Outposts permite executar serviços gerenciados da AWS — como o próprio Amazon S3 — diretamente no data center físico do cliente, mantendo a mesma interface e modelo de gerenciamento da nuvem.

<a name="item04.02"><h4>4.2 Some of the Amazon S3 storage benefits</h4></a>[Back to summary](#item04)

🛡️ Principais Vantagens do Amazon S3   
O Amazon S3 destaca-se por ser uma plataforma flexível para o armazenamento de dados não estruturados, unindo máxima resiliência com capacidades de automação:
- Alta Durabilidade dos Dados: Projetado para oferecer 99,999999999% (11 noves) de durabilidade. Isso garante que os dados armazenados estejam protegidos contra falhas de hardware, perda ou corrupção de arquivos.
- Integração com Arquitetura Orientada a Eventos: Permite configurar gatilhos automáticos para solicitações e envios de arquivos. Por exemplo, ao carregar uma imagem em um bucket, o S3 pode disparar uma função AWS Lambda para processá-la instantaneamente (como gerar miniaturas) e salvar o resultado final.

🎯 Casos de Uso do Amazon S3 e S3 Glacier   
O Amazon S3 atende a uma ampla variedade de demandas operacionais e estratégicas de TI:
- Lakes de Dados e Análises Avançadas: Funciona como um repositório central (Data Lake) para armazenar volumes ilimitados de dados estruturados e não estruturados, servindo de base para análises de big data, inteligência artificial (IA) e computação de alto desempenho (HPC).
- Hospedagem e Distribuição de Conteúdo: Armazena e entrega mídias, vídeos, imagens e arquivos estáticos em alta escala para aplicações web e dispositivos móveis.
- Backup e Recuperação de Desastres: Permite realizar cópias de segurança de dados críticos e de outros serviços da AWS. Utiliza recursos avançados de replicação para atender aos objetivos de tempo (RTO) e ponto (RPO) de recuperação.
- Arquivamento de Longo Prazo com Amazon S3 Glacier: Classe projetada especificamente para retenção durável e de baixíssimo custo. Inclui recursos como o bloqueio do cofre (Vault Lock), que impede a exclusão de arquivos para cumprir requisitos rigorosos de conformidade.
- Aplicações Nativas da Nuvem: Fornece a camada de persistência para aplicações web e móveis altamente disponíveis, escalando a capacidade de armazenamento de forma automática.

<a name="item04.03"><h4>4.3 Amazon S3 demonstration</h4></a>[Back to summary](#item04)

📁 Serviços de Armazenamento em Bloco e Arquivos na AWS   
Além do armazenamento de objetos com o S3, a AWS oferece soluções para persistência de disco local de alta velocidade e sistemas de arquivos compartilhados em rede. Cada serviço atende a requisitos específicos de conectividade, protocolo e desempenho.

🧱 Armazenamento em Bloco Persistente com Amazon EBS   
O Amazon Elastic Block Store (Amazon EBS) fornece volumes de armazenamento em nível de bloco conectados via rede para uso com instâncias do Amazon EC2. Funciona de maneira análoga a um disco rígido físico ou SSD virtualizado.
- Persistência Independente: O volume EBS mantém seus dados salvos mesmo após o encerramento da instância EC2 à qual está conectado.
- Cópias de Segurança (Snapshots): Permite criar cópias de segurança incrementais no Amazon S3. Os snapshots podem ser mantidos por tempo indeterminado e usados para recriar volumes rapidamente.
- Segurança e Criptografia: Suporta criptografia nativa. Ao ativar o recurso, os dados em repouso no volume, os dados em trânsito entre o disco e a instância, e todos os snapshots derivados são criptografados automaticamente.
- Flexibilidade de Desempenho: Permite escolher entre tipos de discos SSD (focados em IOPS/baixa latência) e HDD (focados em taxa de transferência) e alterar o tamanho ou o tipo do volume sem interromper a instância.

🌐 Sistema de Arquivos Compartilhado com Amazon EFS   
O Amazon Elastic File System (Amazon EFS) oferece um sistema de arquivos elástico, sem servidor (serverless) e totalmente gerenciado, projetado para ser compartilhado concorrencialmente entre múltiplos servidores.
- Acesso Concorrente: Permite que milhares de instâncias EC2 e serviços de computação acessem simultaneamente os mesmos arquivos via protocolo Network File System (NFS).
- Elasticidade Automática: Expande e contrai a capacidade de armazenamento automaticamente conforme arquivos são adicionados ou removidos, sem necessidade de provisionamento prévio de espaço.
- Resiliência e Economia: Oferece quatro classes de armazenamento para otimização de custos e garante alta durabilidade ao replicar os dados entre múltiplas Zonas de Disponibilidade.

⚡ Sistemas de Arquivos de Alto Desempenho com Amazon FSx   
O Amazon FSx é um serviço totalmente gerenciado para criar e operar sistemas de arquivos corporativos ricos em recursos e otimizados para cargas de trabalho específicas. O serviço assume a manutenção do hardware, atualizações de software e rotinas de backup.

Fornece suporte nativo para quatro motores de sistemas de arquivos populares do mercado:
- Amazon FSx for Windows File Server: Construído sobre o sistema nativo da Microsoft, oferecendo suporte completo ao protocolo SMB e integração com o Active Directory.
- Amazon FSx for NetApp ONTAP: Disponibiliza todos os recursos e APIs das soluções de armazenamento corporativo da NetApp na nuvem.
- Amazon FSx for OpenZFS: Voltado para cargas de trabalho de alta performance baseadas em Linux utilizando o motor ZFS.
- Amazon FSx for Lustre: Projetado para processamento massivo, computação de alto desempenho (HPC), aprendizado de máquina e análise de dados em grande escala.

<a name="item05"><h4>Core Services Overview: Databases</h4></a>[Back to summary](#item05)

<a name="item05.01"><h4>5.1 Core Services Overview: Databases</h4></a>[Back to summary](#item05)

🗄️ Modernização de Infraestrutura com Bancos de Dados na AWS   
A migração e a modernização de bancos de dados na nuvem permitem substituir tarefas operacionais repetitivas por soluções focadas em desempenho, inovação e eficiência financeira. A AWS disponibiliza diferentes modelos de implantação para adequar a infraestrutura ao nível de controle e automação desejado.

⚙️ Modelos de Implantação de Bancos de Dados   
- Auto-gerenciado em Instâncias Amazon EC2: Instalação e operação do motor de banco de dados diretamente em máquinas virtuais. Este modelo garante controle total sobre o sistema operacional, parametrização do banco e arquivos de configuração, mas exige que a equipe interna gerencie rotinas de backup, correções de segurança e alta disponibilidade.
- Serviços de Bancos de Dados Gerenciados: Plataformas nativas e desenvolvidas sob medida para finalidades específicas (relacionais, chave-valor, documentos, em memória, entre outros). O serviço assume automaticamente tarefas operacionais complexas, como provisionamento de hardware, aplicação de patches, backups e replicação de dados.

🚀 Vantagens dos Bancos de Dados Gerenciados   
- Redução da Carga Operacional: Eliminação do trabalho pesado de manutenção contínua e configuração manual de infraestrutura.
- Otimização de Custos e Agilidade: Alocação precisa do tipo e porte do banco de dados de acordo com o caso de uso real da aplicação, acelerando o tempo de lançamento de novos recursos.
- Escalabilidade e Inovação: Capacidade de expandir o armazenamento e o processamento com o crescimento da demanda, permitindo que as equipes foquem no desenvolvimento das regras de negócio.

<a name="item05.02"><h4>5.2 Use AWS Cloud databases</h4></a>[Back to summary](#item05)

🗄️ Bancos de Dados Gerenciados e Especializados na AWS   
A modernização da camada de dados envolve a substituição de sistemas legados rígidos por motores totalmente gerenciados e projetados para atender a necessidades específicas de arquitetura. Esse modelo garante alta disponibilidade, segurança integrada e escalabilidade de desempenho.

🎯 Categorias de Bancos de Dados, Casos de Uso e Serviços AWS   
A AWS oferece motores especializados ajustados para os padrões de acesso e modelos de dados de cada aplicação:
- Relacional: Indicado para aplicações corporativas tradicionais, sistemas ERP, CRM e plataformas de e-commerce. Serviços: Amazon RDS, Amazon Aurora e Amazon Redshift.
- Chave-Valor: Voltado para aplicações web de alto tráfego, microsserviços e jogos com necessidade de baixa latência em escala. Serviço: Amazon DynamoDB.
- Em Memória: Utilizado para armazenamento em cache, gestão de sessões de usuário e placares em tempo real. Serviços: Amazon ElastiCache e Amazon MemoryDB.
- Documentos: Adequado para gestão de conteúdo, catálogos de produtos e perfis de usuários com esquemas flexíveis. Serviço: Amazon DocumentDB (compatível com MongoDB).
- Coluna Larga: Projetado para dados industriais de grande escala, como monitoramento de frotas e telemetria de equipamentos. Serviço: Amazon Keyspaces.
- Gráfico: Ideal para mapeamento de relacionamentos complexos em redes sociais, motores de recomendação e sistemas de detecção de fraudes. Serviço: Amazon Neptune.
- Séries Temporais: Otimizado para sequências de dados ordenadas por tempo, como métricas de IoT, logs de DevOps e telemetria. Serviço: Amazon Timestream.
- Livro-Razão (Ledger): Voltado para registros imutáveis, auditorias transparentes, transações bancárias e cadeias de suprimentos. Serviço: Amazon QLDB.

⚡ Soluções Relacionais Avançadas: Amazon Aurora e Amazon RDS   
Para motores relacionais de alta performance, a AWS oferece recursos específicos de resiliência e automação:

🚀 Amazon Aurora   
- Desempenho e Custo: Entrega o desempenho e a disponibilidade de bancos comerciais por uma fração do custo, mantendo total compatibilidade com MySQL e PostgreSQL.
- Modo Sem Servidor (Serverless): Ajusta automaticamente a capacidade computacional e de memória de acordo com a demanda real da aplicação.
- Escala Global e Resiliência: Suporta replicação entre múltiplas Regiões e oferece alta durabilidade de dados com tolerância a falhas.

🛡️ Amazon RDS Multi-AZ   
- Alta Disponibilidade Integrada: Provisiona automaticamente uma instância primária e uma réplica de espera (standby) em Zonas de Disponibilidade distintas.
- Replicação Síncrona: Mantém os dados duplicados em tempo real entre as zonas.
- Failover Automático: Em caso de indisponibilidade no banco principal, o tráfego é redirecionado autonomamente para a instância de espera, garantindo a continuidade do negócio.

<a name="item05.03"><h4>5.3 Managed relational database—Amazon RDS</h4></a>[Back to summary](#item05)

🗄️ Serviços de Bancos de Dados Relacionais, Não Relacionais e Analíticos na AWS   
A AWS disponibiliza um portfólio completo de motores de banco de dados e soluções analíticas gerenciadas. A escolha da tecnologia correta permite otimizar o desempenho, reduzir a latência e eliminar tarefas operacionais de manutenção.

🏛️ Bancos de Dados Relacionais e Analíticos   
- Amazon RDS: Serviço que automatiza a configuração, operação e escala de bancos de dados relacionais na nuvem. Oferece suporte a sete motores do setor: Amazon Aurora (compatível com MySQL), Amazon Aurora (compatível com PostgreSQL), MySQL, MariaDB, PostgreSQL, Oracle e SQL Server.
- Amazon Redshift: Serviço de data warehouse orientado a colunas, otimizado para o processamento analítico online (OLAP). Permite a execução de consultas complexas sobre grandes volumes de dados para inteligência de negócios.

⚡ Motores Não Relacionais e Especializados   
- Amazon DynamoDB: Banco de dados não relacional (NoSQL), totalmente gerenciado e sem servidor (serverless). Entrega desempenho na casa dos milissegundos e ajusta a capacidade automaticamente em qualquer escala, sendo ideal para esquemas flexíveis e alto volume de leitura/escrita (como placares de jogos).
- Amazon ElastiCache & MemoryDB: Soluções de armazenamento em memória que fornecem latência de microssegundos para aceleração de acessos via cache, gerenciamento de sessões e aplicações que exigem altíssimo desempenho.
- Amazon DocumentDB: Serviço gerenciado de banco de dados de documentos orientado a JSON, totalmente compatível com o ecossistema MongoDB e pronto para requisitos corporativos.
- Amazon Keyspaces: Banco de dados de colunas largas altamente disponível e gerenciado, compatível com as APIs do Apache Cassandra.
- Amazon Neptune: Banco de dados de grafos projetado para mapear e consultar conjuntos de dados altamente conectados de forma eficiente. É indicado para aplicações de redes sociais e motores de detecção de fraudes.
- Amazon Timestream: Motor de banco de dados para séries temporais que permite armazenar e analisar trilhões de eventos e métricas de telemetria por dia.
- Amazon QLDB (Quantum Ledger Database): Banco de dados de livro-razão que fornece um diário de transações transparente, imutável e criptograficamente verificável para auditorias rigorosas.

<a name="item06"><h4>Core Services Overview: Networking</h4></a>[Back to summary](#item06)

<a name="item06.01"><h4>6.1 Core Services Overview: Networking</h4></a>[Back to summary](#item06)

🌐 Redes e Roteamento de Tráfego na AWS   
A comunicação entre recursos, aplicações e usuários finais na AWS depende de três serviços fundamentais de rede: isolamento privado via VPC, resolução de nomes com o Route 53 e distribuição de tráfego com o Elastic Load Balancing.

🔒 Isolamento Lógico com Amazon VPC   
A Amazon Virtual Private Cloud (Amazon VPC) é uma rede virtual privada e isolada logicamente na nuvem da AWS para a execução de recursos.
- Ambiente Isolado: Garante a separação total entre diferentes redes de clientes ou ambientes de trabalho da mesma organização (como isolar desenvolvimento de produção).
- Controle Total de Tráfego: Permite definir o endereçamento IP, a criação de sub-redes e o comportamento das rotas de entrada e saída de pacotes.
- Conectividade Flexível: Oferece opções personalizadas para conectar a VPC à internet, a outras VPCs ou a infraestruturas locais (on-premises).

🧭 Resolução de Nomes com Amazon Route 53   
O Amazon Route 53 é um serviço web de Sistema de Nomes de Domínio (DNS) altamente disponível e escalável.
- Três Funções Centrais: Realiza o registro de domínios, o roteamento de consultas DNS e verificações de integridade (health checks) de recursos.
- Tradutor da Internet: Converte nomes amigáveis em endereços IP para conectar requisições de usuários a aplicações na AWS ou locais.
- Políticas de Roteamento: Disponibiliza diferentes estratégias para direcionar o tráfego com base em latência, geolocalização ou redundância.

⚖️ Distribuição de Carga com Elastic Load Balancing (ELB)   
O Elastic Load Balancing (ELB) atua como um gerenciador de tráfego que distribui automaticamente as conexões de entrada entre múltiplos alvos e Zonas de Disponibilidade.
- Ponto Único de Contato: Oculta a complexidade da infraestrutura interna dos usuários finais, que interagem apenas com o endereço do balanceador de carga sem precisar conhecer os IPs das instâncias.
- Alta Disponibilidade: Envia tráfego apenas para instâncias saudáveis e contorna falhas ao distribuir cargas entre múltiplas Zonas de Disponibilidade.
- Aumento de Resiliência: Melhora a tolerância a falhas e a capacidade de absorção de picos de acessos na aplicação.

<a name="item07"><h4>Core Services Overview: Security</h4></a>[Back to summary](#item07)

<a name="item07.02"><h4>7.2 The shared responsibility model</h4></a>[Back to summary](#item07)

🛡️ O Modelo de Responsabilidade Compartilhada da AWS   
A segurança e a conformidade na nuvem não recaem sobre uma única entidade. O Modelo de Responsabilidade Compartilhada define claramente a divisão de tarefas entre a AWS e o cliente para garantir a proteção de dados, sistemas e infraestruturas. A regra fundamental dessa divisão diferencia a segurança da nuvem da segurança na nuvem.

🏗️ Responsabilidade da AWS: Segurança "DA" Nuvem   
A AWS é responsável pela proteção e operação de toda a infraestrutura física e lógica subjacente que sustenta os serviços oferecidos na nuvem:
- Infraestrutura Física Global: Proteção contra acesso indevido, desastres naturais e falhas ambientais em Regiões, Zonas de Disponibilidade e Locais de Borda (Edge Locations).
- Hardware e Camada de Virtualização: Manutenção, reparo e substituição de servidores físicos, dispositivos de armazenamento, cabos e equipamentos de rede.
- Software Básico do Provedor: Gerenciamento, atualização e aplicação de correções (patches) nos sistemas operacionais do hipervisor e software dos serviços nativos (computação, armazenamento, bancos de dados e redes).

👤 Responsabilidade do Cliente: Segurança "NA" Nuvem   
A extensão do papel do cliente depende diretamente dos serviços de nuvem selecionados. O cliente é responsável por configurar e gerenciar tudo o que é implantado sobre a infraestrutura da AWS:
- Dados do Cliente: Criptografia de informações em repouso e em trânsito, gestão de ciclo de vida dos arquivos e classificação de conteúdo.
- Gestão de Acesso e Identidade (IAM): Controle rigoroso de permissões de usuários, políticas de senhas e autenticação de múltiplos fatores (MFA).
- Sistemas Operacionais e Aplicações: Atualização de patches e correções de segurança em instâncias de servidores virtuais (como o Amazon EC2), além do código das próprias aplicações.
- Configuração de Segurança de Rede: Definição de regras em firewalls virtuais (Grupos de Segurança e ACLs de rede), tabelas de roteamento e criptografia de conexões.

<a name="item07.03"><h4>7.3 When running your workloads</h4></a>[Back to summary](#item07)

🛡️ Ferramentas de Segurança, Conformidade e Governança na AWS   
A construção de ambientes seguros e resilientes na AWS apoia-se em cinco pilares fundamentais de proteção, complementados por ferramentas de auditoria e orientação de melhores práticas.

🔒 Os 5 Pilares de Segurança da AWS   
- Gestão de Identidade e Acesso: Controle centralizado de autenticação e autorização para usuários, sistemas e serviços internos ou voltados ao cliente.
- Proteção de Rede e de Aplicativos: Inspeção e filtragem de tráfego nos limites da infraestrutura para impedir acessos não autorizados e ataques direcionados.
- Proteção de Dados: Recursos de criptografia, gerenciamento de chaves e descoberta de dados confidenciais em repouso e em trânsito.
- Detecção e Resposta: Monitoramento contínuo para identificar ameaças, comportamentos suspeitos e falhas de configuração em tempo real.
- Conformidade: Verificações automáticas do ambiente para alinhar a infraestrutura aos padrões internacionais e requisitos regulatórios do setor.

🛠️ Serviços Essenciais de Proteção e Governança   
- AWS Identity and Access Management (IAM): Gerencia permissões e credenciais para controlar quem ou o que pode acessar recursos específicos da conta.
- AWS Key Management Service (AWS KMS): Cria, gerencia e rotaciona chaves de criptografia usadas para proteger dados em diversos serviços da AWS.
- AWS Shield: Serviço de proteção gerenciado contra ataques de negação de serviço distribuída (DDoS).
- AWS Artifact: Portal sob demanda para download de relatórios de auditoria e documentos de conformidade regulatória da AWS.

💡 Auditoria do Ambiente com AWS Trusted Advisor   
O AWS Trusted Advisor é uma ferramenta de consultoria automatizada que avalia a conta em tempo real e fornece recomendações personalizadas em cinco dimensões operacionais:
- Otimização de Custos: Identifica gastos desnecessários, como instâncias RDS ociosas, volumes EBS subutilizados e endereços IP elásticos não associados.
- Desempenho: Analisa a taxa de transferência de disco, latência e uso de computação para garantir que as cargas operem com eficiência.
- Segurança: Detecta vulnerabilidades do ambiente, como grupos de segurança abertos demais, chaves de acesso expostas e buckets S3 públicos.
- Tolerância a Falhas: Avalia a resiliência do sistema, verificando a ausência de backups automáticos, uso de Auto Scaling e redundância entre Zonas de Disponibilidade.
- Cotas de Serviço (Service Quotas): Alerta quando a utilização do ambiente atinge 80% ou mais do limite de recursos permitido pela conta, prevenindo interrupções operacionais.

<a name="item08"><h4>Core Services Overview: Pricing</h4></a>[Back to summary](#item08)

<a name="item08.01"><h4>8.1 Core Services Overview: Pricing</h4></a>[Back to summary](#item08)

💵 Padrões de Precificação e Opções de Compra na AWS   
A gestão financeira na nuvem baseia-se na substituição de custos fixos de infraestrutura por modelos de tarifação flexíveis. A estrutura de preços da AWS apoia-se em quatro preceitos centrais: pagar apenas pelo que for utilizado, obter descontos mediante compromissos de uso, acessar preços reduzidos por volume e beneficiar-se de reduções de custo à medida que a plataforma expande suas operações.

🎟️ Opções de Compra do Amazon EC2   
Para otimizar os custos de processamento, a AWS oferece diferentes modalidades de contratação de instâncias EC2, adequadas a cada perfil de tráfego e previsibilidade:
- Instâncias Sob Demanda (On-Demand): Cobrança por segundo ou por hora sem necessidade de pagamento antecipado ou compromisso de longo prazo. Indicadas para aplicações de curto prazo, testes ou cargas de trabalho com padrões imprevisíveis.
- Savings Plans e Instâncias Reservadas (RI): Concedem descontos significativos em troca de um compromisso de uso por 1 ou 3 anos. O valor do desconto aumenta proporcionalmente à quantia paga antecipadamente.
  - Instância Reservada Padrão: Permite alterar a Zona de Disponibilidade, a rede e o tamanho dentro da mesma família de instâncias.
  - Instância Reservada Conversível: Permite trocar a família da instância, o sistema operacional e a locação por outra configuração de valor igual ou superior.
- Instâncias Spot: Disponibilizam a capacidade ociosa de computação da AWS com descontos de até 90% em relação ao preço Sob Demanda. Adequadas para cargas de trabalho com horários flexíveis, processamento em lote ou processamento emergencial que tolerem interrupções operacionais.

🎁 Tipos de Ofertas do Nível Gratuito da AWS   
O Nível Gratuito (AWS Free Tier) permite experimentar serviços e adquirir experiência prática na plataforma por meio de três categorias de ofertas:
- Sempre Grátis: Recursos que disponibilizam limites fixos de uso gratuito mensalmente para todos os clientes, sem prazo de expiração.
- 12 Meses Grátis: Acesso gratuito a cotas específicas de serviços selecionados durante os primeiros 12 meses após a abertura da conta.
- Testes Gratuitos: Avaliações temporárias de curto prazo acionadas a partir do primeiro uso de um determinado serviço.

<a name="item09"><h4>Next Steps</h4></a>[Back to summary](#item09)

<a name="item09.01"><h4>9.1 Next Steps</h4></a>[Back to summary](#item09)

🎓 Caminhos para Capacitação e Certificação na AWS   
A evolução técnica na nuvem exige o aprimoramento contínuo de competências. A AWS disponibiliza diferentes modalidades de aprendizado e um programa de certificações oficiais para validar o conhecimento técnico de profissionais e equipes.

📚 Opções de Aprendizado e Treinamento   
A capacitação pode ser estruturada de acordo com a rotina e o estilo de aprendizado do estudante:
- Treinamento Digital: Cursos gratuitos e sob demanda que permitem aprender sobre os serviços e arquiteturas da AWS no próprio ritmo, em qualquer lugar.
- Treinamento em Sala de Aula: Aulas práticas conduzidas por instrutores credenciados pela AWS, disponíveis em formato presencial ou virtual, focadas em cenários reais de mercado.

📜 Valor e Recursos para as Certificações AWS   
As Certificações AWS atestam a capacidade técnica de projetar, implantar e gerenciar soluções na nuvem, servindo como um diferencial para profissionais e organizações.

🌟 Benefícios do Reconhecimento Oficial   
- Comprovação de Expertise: Validação formal das habilidades práticas exigidas pelo mercado.
- Visibilidade Profissional: Destaque em processos seletivos e progresso na carreira de tecnologia.
- Credibilidade Corporativa: Aumento da confiança de empregadores, clientes e parceiros nas soluções desenvolvidas.

🛠️ Materiais de Preparação   
Para apoiar a jornada de estudos rumo aos exames de certificação, a plataforma disponibiliza cursos preparatórios focados no formato da prova e laboratórios práticos de autoaprendizagem, permitindo fixar os conceitos antes do teste final.

<a name="item09.02"><h4>9.2 Explore the four levels of expertise in AWS certification</h4></a>[Back to summary](#item09)

🏆 Níveis de Certificação e Recursos do AWS Skill Builder   
O programa de Certificações da AWS é estruturado em níveis progressivos de complexidade para validar conhecimentos técnicos desde conceitos básicos até arquiteturas especializadas. O aprimoramento contínuo é suportado por plataformas oficiais de aprendizado digital.

🎖️ Níveis do Programa de Certificação AWS   
- Fundamentos (Foundational): Voltado para profissionais com cerca de seis meses de contato com a nuvem. Valida o entendimento geral da infraestrutura, serviços essenciais, segurança e modelos de precificação.
- Associado (Associate): Indicado para profissionais com cerca de um ano de experiência prática na resolução de problemas e implementação de arquiteturas na AWS.
- Profissional (Professional): Projetado para especialistas com aproximadamente dois anos de atuação profunda no projeto, operação avançada e otimização de soluções complexas em nuvem.
- Especializado (Specialty): Avalia conhecimentos técnicos aprofundados em domínios específicos (como segurança, redes, dados ou aprendizado de máquina), conforme os requisitos de cada guia de exame.

💡 Capacitação com o AWS Skill Builder   
O AWS Skill Builder é o hub oficial de aprendizado digital projetado para preparar profissionais para os exames e para o mercado de trabalho:
- Acervo Abrangente: Acesso a mais de 500 cursos digitais gratuitos e planos de aprendizado estruturados por função ou serviço.
- Acessibilidade Global: Conteúdos distribuídos em mais de 16 idiomas, cobrindo desde conceitos introdutórios até tópicos avançados.
- Flexibilidade de Estudo: Treinamento digital sob demanda que permite ao estudante evoluir no seu próprio ritmo.
- Comunidade e Benefícios: A conquista de credenciais concede acesso à comunidade oficial de certificados AWS, guias de estudo atualizados e benefícios exclusivos para futuros exames.