# Amazon Elastic Block Store (Amazon EBS) Primer   <img src="./0-aux/logo_course.png" alt="curso_dc_019" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_019 (Amazon Elastic Block Store (Amazon EBS) Primer)   <img src="./0-aux/logo_course.png" alt="curso_dc_019" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260904_dc_019_en.pdf">Certificate</a>

---

### Theme:
- Cloud Computing
- Storage

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon CloudWatch   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_cloudwatch.svg" alt="aws_cloudwatch" width="auto" height="25">
  - Amazon Data Lifecycle Manager (DLM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_dlm.png" alt="aws_dlm" width="auto" height="25">
  - Amazon Elastic Block Store (EBS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ebs.svg" alt="aws_ebs" width="auto" height="25">
  - Amazon Simple Storage Service (S3)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_s3.svg" alt="aws_s3" width="auto" height="25">
  - AWS Backup   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_backup.png" alt="aws_backup" width="auto" height="25">
  - AWS Elastic Disaster Recovery (DRS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_drs.png" alt="aws_drs" width="auto" height="25">
  - AWS Identity and Access Management (IAM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_iam.svg" alt="aws_iam" width="auto" height="25">
  - AWS Nitro System   <img src="" alt="aws_nitro_system" width="auto" height="25">
  - AWS Organizations  <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_organizations.svg" alt="aws_organizations" width="auto" height="25">
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
  - AWS Application Migration Service (MGN)
  - AWS Elastic Disaster Recovery (DRS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_drs.png" alt="aws_drs" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Introduction to Block Storage</a><br>
  1.1 <a href="#item01.01">What is Block Storage?</a><br>
2. <a href="#item02">Introduction to Amazon EBS</a><br>
  2.1 <a href="#item02.01">Amazon EBS Overview</a><br>
  2.2 <a href="#item02.02">Features and Benefits</a><br>
  2.3 <a href="#item02.03">Use Cases</a><br>
3. <a href="#item03">Types of Amazon EBS Storage</a><br>
  3.1 <a href="#item03.01">Amazon EBS Performance</a><br>
  3.2 <a href="#item03.02">Amazon EBS Volume Types</a><br>
  3.3 <a href="#item03.03">Choosing the Correct Amazon EBS Volume Type</a><br>
  3.4 <a href="#item03.04">Amazon EBS Snapshots</a><br>
4. <a href="#item04">Pricing</a><br>
  4.1 <a href="#item04.01">Amazon EBS Pricing</a><br>
  4.2 <a href="#item04.02">Pricing Exercise</a><br>
5. <a href="#item05">Amazon EBS Architecture</a><br>
  5.1 <a href="#item05.01">Architecture</a><br>
6. <a href="#item06">Integration with other AWS Services</a><br>
  6.1 <a href="#item06.01">Data Security</a><br>
  6.2 <a href="#item06.02">AWS Backup</a><br>
  6.3 <a href="#item06.03">CloudEndure Disaster Recovery and AWS Application Migration Service</a><br>
  6.4 <a href="#item06.04">Amazon CloudWatch</a><br>

---

### Objective:
O curso teve como objetivo detalhar o funcionamento, a arquitetura e a gestão do Amazon Elastic Block Store (EBS) como solução de armazenamento em blocos de alta performance para o Amazon EC2. A formação abordou os conceitos fundamentais de armazenamento em nuvem, a comparação minuciosa entre os tipos de volumes (SSD gp2/gp3, io1/io2 e HDD st1/sc1), o cálculo de preços e dimensionamento de IOPS/throughput, o gerenciamento de ciclo de vida de snapshots via Amazon DLM e AWS Backup, e as estratégias de resiliência, criptografia nativa e observabilidade via Amazon CloudWatch.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introduction to Block Storage</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 What is Block Storage?</h4></a>[Back to summary](#item01)

💾 Categorias Principais de Armazenamento na Nuvem   
Independentemente da infraestrutura (seja em ambientes locais ou no modelo de nuvem), o armazenamento de dados classifica-se em três modalidades fundamentais: Bloco, Arquivo e Objeto. As bases operacionais de cada tipo mantêm-se constantes, variando apenas em recursos específicos segundo o provedor de serviços ou fabricante.

📦 Armazenamento em Bloco (Block Storage)   
- Estrutura e Apresentação: Oferecido como volume bruto (raw disk) dividido em segmentos contínuos de tamanho fixo chamados blocos.
- Camada de Gerenciamento: O sistema operacional da instância (ou aplicações com acesso direto ao disco) formata o volume com o sistema de arquivos escolhido e gerencia diretamente as operações de leitura e escrita.
- Protocolos e Hardware: Opera diretamente sobre unidades físicas (HDDs, SSDs, conectividade NVMe) ou arquiteturas de rede de área de armazenamento (SAN).
- Casos de Uso: Bancos de dados relacionais, sistemas operacionais e aplicações que exigem baixa latência e alto processamento de entrada e saída (I/O).

📁 Armazenamento de Arquivos (File Storage)   
- Estrutura e Apresentação: Construído sobre a camada de armazenamento em bloco, disponibiliza uma estrutura hierárquica organizada em diretórios e pastas.
- Camada de Gerenciamento: Gerenciado pelo sistema operacional de um servidor de arquivos ou por dispositivos dedicados de armazenamento conectado à rede (NAS).
- Protocolos e Hardware: Utiliza protocolos de rede como NFS (comum em sistemas Linux/Unix) e SMB (comum em sistemas Windows) para permitir acesso simultâneo de múltiplos clientes.
- Casos de Uso: Repositórios compartilhados, diretórios corporativos, sistemas de arquivos de projeto e fluxos de trabalho colaborativos.

🗄️ Armazenamento de Objetos (Object Storage)   
- Estrutura e Apresentação: Organiza os dados como unidades binárias dentro de uma estrutura plana (flat namespace), sem uso de diretórios rígidos.
- Camada de Gerenciamento: Os dados são empacotados em objetos contendo o conteúdo binário, identificadores únicos e metadados associados que descrevem as propriedades do arquivo.
- Protocolos e Hardware: Acessado e manipulado exclusivamente por chamadas de API via HTTP/REST (GET, PUT, POST, DELETE).
- Casos de Uso: Armazenamento de arquivos de mídia, repositórios de dados não estruturados (data lakes), backups, arquivos históricos e distribuição de conteúdo.

🏗️ Arquitetura e Componentes do Armazenamento em Bloco   
A arquitetura fundamental do armazenamento em bloco apoia-se em três elementos: o dispositivo de armazenamento físico ou lógico, o sistema computacional e o sistema operacional (ou aplicação dedicada) que executa na máquina. A interconexão entre a unidade e o sistema computacional ocorre por meio de enlaces físicos diretos ou conexões lógicas de rede.

O sistema operacional reconhece o volume bruto fornecido e realiza a formatação inicial para preparar o dispositivo para operações de gravação e leitura.

⚙️ Funções do Sistema Operacional e Gerenciamento   
O sistema operacional (ou uma aplicação com permissões diretas sobre o disco) controla a manipulação dos blocos por meio de rotinas específicas:
- Definição do Tamanho do Bloco: Escolha da dimensão fixa das unidades de alocação durante a formatação do volume. A flexibilidade na escolha do tamanho do bloco permite otimizar o espaço para cargas de trabalho que utilizam arquivos pequenos ou grandes.
- Gestão de Metadados: Criação e manutenção de informações sobre os dados armazenados. Os metadados registram:
  - Marcadores temporais: Data/hora de criação (ctime), última modificação (mtime) e último acesso (atime).
  - Mapeamento físico/lógico: Indicação exata de quais blocos no disco contêm os dados.
  - Propriedade e Acesso: Definição do proprietário do arquivo e permissões de leitura, escrita e execução.
- Controle de Leitura, Escrita e Cache: O sistema operacional gerencia o fluxo de entrada e saída, determinando a ordem das operações, o uso de memória cache para acelerar leituras/escritas e a consulta a repositórios de identidade (como LDAP ou Active Directory) para autorizar acessos.
- Bloqueio e Integridade (Locking): Aplicação de travas em nível de arquivo inteiro (file-level locking) ou em intervalos específicos de blocos (block-level locking) para impedir que gravações simultâneas corrompam os dados quando múltiplos processos tentam modificar o mesmo recurso.

🧱 Dispositivos, Agrupamentos e Volumes Lógicos   
O armazenamento em bloco pode originar-se de uma única unidade física ou da combinação de múltiplos discos através de controladores RAID ou redes SAN (Storage Area Network):
- Aparato Físico e Combinações: Unidades individuais (HDDs, SSDs ou módulos NVMe) podem ser agrupadas para aumentar o desempenho ou garantir redundância antes de serem apresentadas ao servidor.
- Abstração em Volumes: A capacidade bruta total pode ser fracionada em unidades lógicas menores chamadas volumes, assim como múltiplos discos físicos podem ser consolidados para formar um único volume lógico expandido. A capacidade não alocada em volumes permanece disponível no armazenamento para uso futuro.

⚡ Métricas e Indicadores de Desempenho   
O armazenamento em bloco destaca-se pelo alto desempenho no acesso direto aos dados, pois permite ler ou atualizar apenas os blocos modificados, sem a necessidade de reescrever o arquivo inteiro.
- Latência (Atraso de Resposta): Tempo decorrido entre o envio de uma requisição de E/S e o recebimento da resposta.
  - O armazenamento em bloco apresenta baixíssima latência devido à ausência de sobretaxas (overhead) pesadas de protocolos de rede no nível de aplicação (diferente do armazenamento em arquivo, que processa protocolos como NFS/SMB, ou do armazenamento em objeto, que processa chamadas HTTP/REST).
  - Variações dependem do tipo de conexão: discos locais diretos oferecem os menores atrasos, seguidos por redes SAN dedicadas e conexões de rede em nuvem.
- IOPS (Operações de Entrada e Saída Por Segundo): Medida estatística para quantificar a taxa de transações por segundo, predominante em operações de leitura e escrita aleatórias (arquivos pequenos e não correlacionados).
  - Unidades de estado sólido (SSDs) atingem taxas superiores de IOPS em relação a discos rígidos mecânicos (HDDs), pois não dependem do movimento físico de cabeçotes de leitura (tempo de busca ou seek time).
- Taxa de Transferência (Throughput): Medida expressa em megabytes por segundo (MB/s) que avalia o volume de dados lido ou gravado continuamente em operações sequenciais (arquivos grandes lidos do início ao fim, como mídias de áudio e vídeo).
  - Discos rígidos tradicionais (HDDs) mantêm viabilidade técnica e de custo para cargas que exigem alta taxa de transferência sequencial contínua, embora fiquem atrás dos SSDs em acessos aleatórios.

<a name="item02"><h4>Introduction to Amazon EBS</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Amazon EBS Overview</h4></a>[Back to summary](#item02)

🔄 Componentes do Portfólio de Armazenamento em Bloco na AWS   
A arquitetura de armazenamento em bloco da AWS divide-se entre dois serviços de volume e um recurso de cópia de segurança:

⚡ Armazenamento de Instância (EC2 Instance Store)   
- Natureza Efêmera: Discos físicos conectados diretamente ao servidor host que hospeda a instância Amazon EC2.
- Ciclo de Vida: Os dados são perdidos permanentemente quando a instância é parada, encerrada ou sofre uma falha de hardware host.
- Casos de Uso: Indicado para caches de alta velocidade, arquivos temporários, tabelas de memória e arquiteturas com replicação nativa entre nós (como clusters de banco de dados no nível de aplicação).

💾 Armazenamento Persistente (Amazon EBS)   
- Natureza Persistente: Armazenamento desacoplado do hardware físico do host, conectado via rede de alta velocidade.
- Flexibilidade de Desanexo: Pode ser desanexado de um nó e remontado em outra instância Amazon EC2 dentro da mesma Zona de Disponibilidade.
- Variedade de Perfis: Oferece opções otimizadas para baixo custo, alta taxa de transferência ou operações de I/O por segundo de um dígito em milissegundos.

📸 Cópias de Ponto no Tempo (Snapshots)   
- Cópias Incrementais: Backups pontuais dos volumes EBS armazenados de forma transparente no Amazon S3. Apenas os blocos modificados desde a última cópia são gravados, reduzindo custos de armazenamento.
- Mobilidade e Restauração: Utilizados para criar novos volumes, expandir capacidades ou migrar dados entre Zonas de Disponibilidade e Regiões da AWS.
- Automação com Amazon DLM: O Amazon Data Lifecycle Manager permite definir políticas automatizadas de criação, retenção e descarte de snapshots sem custos adicionais de gerenciamento.

📦 Visão Geral e Ecossistema do Amazon EBS   
O Amazon Elastic Block Store (Amazon EBS) é um serviço de armazenamento em bloco gerenciado e de alto desempenho projetado para integrar-se ao Amazon EC2. Oferece persistência de dados e suporte a cargas de trabalho dinâmicas, sejam orientadas a transações aleatórias de baixa latência ou a fluxos sequenciais de alta taxa de transferência (throughput).

🛠️ Características Principais do Amazon EBS   
- Comportamento como Disco Bruto: Apresenta-se ao Amazon EC2 como um volume não formatado, permitindo a instalação de sistemas de arquivos customizados ou acesso direto para aplicações de banco de dados.
- Persistência Independente: O volume e os dados nele contidos permanecem intactos e disponíveis mesmo que a instância Amazon EC2 associada seja interrompida ou encerrada.
- Ajuste Dinâmico (Elastic Volumes): Permite alterar o tipo de volume, expandir a capacidade de armazenamento ou ajustar o desempenho (IOPS/Throughput) em tempo de execução, sem necessidade de interrupção da aplicação.
- Alta Disponibilidade e Resiliência: Projetado com replicação automática de dados dentro de uma mesma Zona de Disponibilidade (AZ), minimizando falhas de hardware único.

<a name="item02.02"><h4>2.2 Features and Benefits</h4></a>[Back to summary](#item02)

🛡️ Fundamentos Arquiteturais e Recursos do Amazon EBS   
O Amazon Elastic Block Store (Amazon EBS) provê armazenamento em bloco de alta confiabilidade, segurança integrada e capacidade de escala flexível. Projetado para integrar-se ao Amazon EC2, desacopla a camada de armazenamento do ciclo de vida computacional, permitindo ajustes dinâmicos e persistência permanente dos dados.

🔒 Segurança, Resiliência e Persistência de Dados   
- Persistência e Mobilidade: Os volumes EBS mantêm-se ativos independentemente da interrupção ou encerramento das instâncias Amazon EC2. Podem ser desanexados e conectados a diferentes instâncias dentro da mesma Zona de Disponibilidade (AZ), viabilizando a troca flexível do perfil de computação sem perda de dados.
- Criptografia Nativa e Automática: Suporte à criptografia de dados em repouso e em trânsito (na comunicação entre o nó EC2 e o volume EBS) por meio de integração com o AWS Key Management Service (AWS KMS). É possível configurar a conta para criptografar automaticamente qualquer novo volume criado.
- Alta Disponibilidade e Durabilidade:
  - Série Padrão (gp2, gp3, st1, sc1, io1): Projetados para resiliência de 99,8% a 99,9% com replicação interna de hardware na mesma Zona de Disponibilidade.
  - Série de Alta Durabilidade (io2): Entrega 99,999% de durabilidade (AFR de 0,001%), oferecendo tolerância crítica para bancos de dados de missão crítica (SAP HANA, Oracle, MS SQL Server).

⚡ Flexibilidade Operacional e Funcionalidades Avançadas   
- Volumes Elásticos (Elastic Volumes): Recursos que permitem expandir a capacidade de armazenamento, alterar o tipo de volume e redefinir parâmetros de desempenho (IOPS/Throughput) em tempo real, sem necessidade de colocar a aplicação offline.
- Conexão Múltipla (Multi-Attach): Disponível nos volumes com suporte a SSD e IOPS Provisionadas (io1/io2). Permite que um único volume EBS seja conectado simultaneamente a até 16 instâncias Amazon EC2 baseadas em arquitetura Nitro na mesma Zona de Disponibilidade, exigindo que a aplicação gerencie o controle de escrita paralela.
- Monitoramento Técnico: Integração nativa com o Amazon CloudWatch para acompanhamento de métricas de largura de banda, taxa de transferência, latência e profundidade de fila de I/O.

📸 Estratégias de Cópia e Governança de Backup   
- Snapshots Incrementais no Amazon S3: Gravação pontual e incremental de dados. Apenas os blocos alterados após a última cópia são salvos. O recurso Fast Snapshot Restore (FSR) elimina a latência de inicialização ao hidratar volumes restaurados com desempenho total imediato.
- Capacidades de Snapshots: Permitem o compartilhamento seguro de imagens entre contas, cópia inter-regional (Cross-Region Copy) e acesso direto a APIs de leitura de blocos.
- Centralização com AWS Backup: Serviço totalmente gerenciado que automatiza políticas de retenção, conformidade e proteção de dados em nível de organização (AWS Organizations), cobrindo volumes EBS e demais serviços de armazenamento e banco de dados.

🎯 Categorização de Perfis de Volume   
- Armazenamento com Suporte a SSD (Orientado a Transações e IOPS):
  - Uso Geral (gp2 / gp3): Equilíbrio ideal de custo e desempenho para ambientes de desenvolvimento, boot de instâncias e aplicações de médio porte.
  - IOPS Provisionadas (io1 / io2): Alto desempenho e latência previsível de um dígito em milissegundos para bancos de dados relacionais e sistemas transacionais intensivos.
- Armazenamento com Suporte a HDD (Orientado a Taxa de Transferência):
  - HDD Otimizado para Throughput (st1): Projetado para acessos sequenciais frequentes, como Big Data, processamento de logs e Data Warehouses.
  - HDD Frio (sc1): Opção de menor custo para dados acessados com menor frequência que exigem alta capacidade e leitura sequencial.

<a name="item02.03"><h4>2.3 Use Cases</h4></a>[Back to summary](#item02)

🏢 Principais Casos de Uso do Amazon EBS na Nuvem   
A combinação de persistência, ajustes dinâmicos e opções variadas de desempenho faz do Amazon EBS a fundação de armazenamento em bloco para uma ampla diversidade de cargas de trabalho empresariais.

🎯 Aplicações Corporativas e Estratégias de Migração   
Projetos empresariais críticos (como sistemas ERP/CRM, Oracle, SAP, Microsoft Exchange e ambientes VMware) demandam latência ultra-baixa, disponibilidade de 99,999% e baixa taxa anual de falhas (AFR).
- Superação do Modelo Local (On-Premises): A infraestrutura tradicional exige renovação periódica de hardware a cada 3 a 5 anos, gerando alto custo de capital e complexidade operacional.
- Abordagem Lift-and-Shift: Migração rápida de aplicações legadas diretamente para instâncias Amazon EC2 e volumes EBS com alterações mínimas, reduzindo o tempo de entrada em produção. Ferramentas automatizadas como o AWS Application Migration Service (AWS MGN) viabilizam essa transição.
- Modernização Gradual: Após a transferência para a nuvem, o ambiente pode ser reestruturado em fases para adotar serviços totalmente gerenciados.

🗄️ Bancos de Dados Relacionais e NoSQL   
O armazenamento em bloco do EBS entrega o desempenho de E/S aleatória necessário para mecanismos de banco de dados:
- Bancos de Dados Relacionais:
  - Opção Nativa / Self-Hosted: Hospedagem direta de bancos como SAP HANA, Oracle, MS SQL Server, MySQL e PostgreSQL sobre volumes EBS em instâncias EC2, mantendo controle total sobre o SO e permissões.
  - Evolução para Serviços Gerenciados: Transição para o Amazon RDS (gerenciamento automatizado de patches, backups e hardware) ou refatoração para o Amazon Aurora (desempenho comercial a um custo reduzido).
- Bancos de Dados NoSQL:
  - Sistemas como Cassandra, MongoDB e CouchDB se beneficiam do desempenho previsível de baixa latência dos volumes baseados em SSD (gp3/io2), permitindo montar clusters com controle direto de segurança e licenças. Alternativamente, o Amazon DynamoDB oferece uma opção serverless e gerenciada.

📊 Análise de Big Data e Processamento Sequencial   
Cargas de trabalho orientadas a grande volume de dados sequenciais (como Hadoop, Apache Spark, data warehouses e streaming de logs) exigem alta taxa de transferência (throughput):
- Infraestrutura Flexível: Utilização de volumes baseados em HDD (st1/sc1) associados a instâncias EC2 para processamento de alto fluxo contínuo.
- Ajustes Dinâmicos: A capacidade de redimensionar e desanexar volumes facilita a reconfiguração de clusters sem perda de persistência.
- Alternativas Gerenciadas: Integração nativa com o Amazon EMR (framework Hadoop escalável) e Amazon MSK (serviço gerenciado de Apache Kafka).

📁 Sistemas de Arquivos Customizados e Fluxos de Mídia   
Aplicações que exigem sistemas de arquivos específicos ou protocolos de rede customizados para mídia e computação gráfica podem ser construídas sobre volumes EBS:
- Sistemas de Arquivos Próprios: Construção de servidores de arquivos em instâncias EC2 utilizando protocolos como NFS, SMB, XFS, EXT4, GPFS ou ZFS sobre blocos EBS.
- Serviços Gerenciados Correspondentes: A AWS oferece alternativas de arquivo prontas, como Amazon EFS (NFS para Linux), Amazon FSx for Windows File Server (SMB), FSx for Lustre (HPC), FSx for NetApp ONTAP e FSx for OpenZFS.

🚨 Continuidade de Negócios e Recuperação de Desastres   
- Proteção Geográfica via Snapshots: Gravação incremental de snapshots no Amazon S3 (com durabilidade de 99,999999999%), permitindo a restauração imediata de volumes em outras Zonas de Disponibilidade ou Regiões.
- Automação e Replicação Continuada: Uso do AWS Backup para centralização de políticas de retenção ou adoção de soluções de replicação contínua (como o CloudEndure Disaster Recovery) para alcançar RPO de segundos e RTO de minutos.

<a name="item03"><h4>Types of Amazon EBS Storage</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Amazon EBS Performance</h4></a>[Back to summary](#item03)

📊 Disponibilidade, Resiliência e Métricas de Desempenho do EBS   
A elaboração de arquiteturas de armazenamento exige a compreensão do comportamento de resiliência e dos indicadores de desempenho dos volumes Amazon EBS e EC2 Instance Store. A escolha da tecnologia impacta diretamente a durabilidade dos dados e a resposta a operações de Entrada/Saída (E/S).

🛡️ Disponibilidade e Durabilidade: Amazon EBS vs. Instance Store   
O ciclo de vida dos dados diferencia-se drasticamente conforme o serviço de armazenamento em bloco selecionado:
- Amazon EBS:
  - Replicação Interna: Os dados são automaticamente replicados em múltiplos servidores dentro da mesma Zona de Disponibilidade (AZ) para proteger contra falhas de hardware único.
  - Taxa Anual de Falha (AFR): Projetado com taxa de falha entre 0,1% e 0,2% (equivalente a 1 ou 2 falhas a cada 1.000 volumes por ano), tornando-o consideravelmente mais confiável que discos rígidos comerciais convencionais.
  - Suscetibilidade a AZ: Por residir em uma única Zona de Disponibilidade, a indisponibilidade pontual dessa AZ interrompe o acesso ao volume.
  - Snapshots Regionais: A criação periódica de snapshots no Amazon S3 (com disponibilidade de 99,999%) eleva a durabilidade. O snapshot fica acessível em todas as Zonas de Disponibilidade da Região e pode ser copiado para outras regiões para suporte a cenários de contingência.
- EC2 Instance Store (Efêmero):
  - Conexão Física: Unidades montadas diretamente no servidor host físico que abriga a instância Amazon EC2.
  - Perda Irrecuperável de Dados: Os dados são apagados permanentemente se a instância for interrompida (stop), encerrada (terminate), entrar em hibernação ou se o disco físico do host falhar (os dados persistem apenas durante reinicializações do SO).
  - Casos de Uso Adequados: Exclusivo para dados temporários, arquivos de buffer, tabelas de cache, processamento intermediário ou arquiteturas que gerenciam a replicação dos dados diretamente na camada de aplicação.

⚙️ Dinâmica de Processamento de E/S: Tamanho, IOPS e Throughput   
As características da carga de trabalho e o tamanho das operações de E/S determinam os limites operacionais atingidos pelos volumes:
- Limites de Tamanho por Operação de E/S:
  - Volumes com Suporte a SSD (gp2/gp3/io1/io2): Contabilizam blocos de no máximo 256 KiB por operação de E/S.
  - Volumes com Suporte a HDD (st1/sc1): Contabilizam blocos de no máximo 1.024 KiB por operação de E/S.
- Comportamento de Fusão e Fracionamento (Merging & Splitting):
  - Operações pequenas e fisicamente contíguas são mescladas pelo sistema operacional para formar um único bloco de até o limite máximo do volume.
  - Gravações ou leituras grandes sequenciais que excedam os limites são fracionadas. Uma requisição de 1.024 KiB conta como 4 operações distintas em volumes SSD (4 × 256 KiB) e como 1 única operação em volumes HDD (1 × 1.024 KiB). Operações não contíguas (aleatórias) são processadas individualmente.
- Conflitos entre Limites de IOPS e Throughput:
  - Gargalo em SSD: Cargas com blocos grandes em SSDs podem atingir o teto de throughput (MB/s) antes de utilizar o total de IOPS provisionado.
  - Gargalo em HDD: Cargas com blocos pequenos ou acessos aleatórios em HDDs consomem rapidamente o limite de IOPS, resultando em uma taxa de transferência (MB/s) bem menor que a capacidade nominal do volume.

⏱️ Latência, Saldo de Burst e Fila de E/S   
A otimização de desempenho exige o acompanhamento constante dos tempos de resposta e das filas do sistema:
- Saldos de Burst (Burst Balance):
  - Volumes que operam com modelo de créditos acumulam saldo ao trabalhar abaixo da linha de base de desempenho.
  - Ao demandar picos de uso, os créditos são consumidos para entregar desempenho acima do padrão. Ao esgotar o saldo de créditos, o volume fica restrito aos limites nominais de linha de base.
- Perfis de Latência:
  - Volumes SSD: Latência média na casa de 1 milissegundo a um dígito em milissegundos, indicados para transações aleatórias e bancos de dados.
  - Volumes HDD: Latência média na casa dos dois dígitos em milissegundos, adequados para fluxos sequenciais e contínuos de grande porte.
- Comprimento da Fila de Volume (Queue Length):
  - Mede o número de requisições de E/S pendentes aguardando processamento pelo dispositivo.
  - Aplicações transacionais exigem filas pequenas mantendo alto número de IOPS para preservar baixas latências.
  - Aplicações orientadas a throughput aceitam filas maiores para sustentar altos fluxos sequenciais.
- Monitoramento com Amazon CloudWatch: Fornece visibilidade de métricas essenciais como latência de leitura/escrita, volume de IOPS consumido, largura de banda e comprimento da fila, permitindo identificar gargalos de E/S.

<a name="item03.02"><h4>3.2 Amazon EBS Volume Types</h4></a>[Back to summary](#item03)

💾 Tipos de Volume Amazon EBS com Suporte a SSD   
O Amazon EBS oferece modalidades de armazenamento baseadas em SSD projetadas para cargas de trabalho transacionais, instâncias de boot e aplicações de baixa latência. As opções dividem-se em duas categorias principais: Uso Geral (gp2 e gp3) e IOPS Provisionadas (io1 e io2).

⚖️ SSD de Uso Geral: Comparativo entre gp2 e gp3   
Ambos os tipos oferecem capacidade entre 1 GiB e 16 TiB, suporte a volume de inicialização (boot volume) e disponibilidade de 99,999% com durabilidade entre 99,8% e 99,9%. A principal diferença reside na forma como o desempenho (IOPS e Throughput) é alocado:

🔄 Volume General Purpose gp2   
- Vinculação de Desempenho ao Tamanho: A taxa de IOPS de linha de base escala linearmente a 3 IOPS por GiB provisionado, variando de 100 IOPS (para volumes de 33,33 GiB ou menos) até o limite máximo de 16.000 IOPS (atingido a partir de 5.334 GiB).
- Modelo de Créditos de Burst: Volumes menores que 1.000 GiB utilizam um saldo inicial de 5,4 milhões de créditos para realizar bursts temporários de até 3.000 IOPS (sustentáveis por pelo menos 30 minutos para aceleração de boot). Volumes a partir de 334 GiB não gastam créditos para atingir a taxa máxima de transferência do tipo.
- Taxa de Transferência (Throughput): Limite entre 128 MiB/s e 250 MiB/s, variando conforme a capacidade do volume e o saldo de créditos.

⚡ Volume General Purpose gp3   
- Desalocação de Desempenho e Capacidade: Não utiliza modelo de créditos de burst. Oferece uma linha de base gratuita e consistente de 3.000 IOPS e 125 MB/s de taxa de transferência, independentemente do tamanho do disco.
- Provisionamento Independente: Permite escalar performance até 16.000 IOPS e 1.000 MB/s mediante custo adicional, sem necessidade de aumentar o tamanho do volume.
- Proporções Máximas: Aceita até 500 IOPS por GiB (requer volume de pelo menos 32 GiB para atingir 16.000 IOPS) e limite de 0,25 MB/s para cada IOPS provisionada.

🚀 SSD de IOPS Provisionadas: Comparativo entre io1 e io2   
Destinados a bancos de dados de missão crítica (SAP HANA, Oracle, MS SQL Server) que demandam latência de um dígito de milissegundo e alto volume de transações. Suportam o recurso Multi-Attach (conexão simultânea a até 16 instâncias EC2 Nitro na mesma AZ), volumes de 4 GiB a 16 TiB e desempenho de 100 a 64.000 IOPS (com taxa de transferência até 1.000 MB/s).

📐 Volume io1   
- Proporção Máxima de IOPS por GiB: Limitado a 50:1. Para provisionar a taxa máxima de 64.000 IOPS, é necessário alocar um volume de pelo menos 1.280 GiB.
- Nível de Durabilidade: Projetado para 99,8% a 99,9% (AFR de 0,1% a 0,2%).
- Compatibilidade: Disponível para todos os tipos de instâncias EC2.

🛡️ Volume io2   
- Proporção Máxima de IOPS por GiB: Elevado para 500:1 (10 vezes mais eficiente que o io1). É possível atingir a taxa máxima de 64.000 IOPS com um volume de apenas 128 GiB.
- Nível de Alta Durabilidade: Projetado para 99,999% de durabilidade (AFR de 0,001% — equivalente a apenas 1 falha a cada 100.000 volumes por ano).
- Compatibilidade: Recomendado pela AWS para todas as novas implementações (suportado na maioria das famílias EC2, exceto R5b).

📌 Regras de Hardware e Tamanho de E/S em IOPS Provisionadas   
- Instâncias Nitro System: Requisito obrigatório para atingir o limite máximo de 64.000 IOPS e 1.000 MB/s de transferência. Instâncias fora da arquitetura Nitro limitam-se a 32.000 IOPS e 500 MB/s.
- Bloco de E/S e Throughput: Requisições de até 32.000 IOPS utilizam blocos de no máximo 256 KiB. Ao ultrapassar 32.000 IOPS (até 64.000 IOPS), o tamanho máximo por operação passa a ser contabilizado em unidades de 16 KiB.

💾 Tipos de Volume Amazon EBS com Suporte a HDD e Geração Anterior   
Os volumes de armazenamento do Amazon EBS baseados em discos rígidos magnéticos (HDDs) são projetados estritamente para métricas de taxa de transferência (throughput, medido em MB/s) e operações de entrada e saída (E/S) sequenciais de grande porte (blocos de 1 MB). Não são recomendados para acessos aleatórios de pequeno porte — cenário em que a AWS indica os volumes SSD gp3 — e não possuem suporte para volumes de inicialização (boot volumes) ou para o recurso de conexão múltipla (Multi-Attach).

⚙️ HDD Otimizado para Throughput (st1)   
- Destinado a cargas de trabalho acessadas com frequência que demandam alto fluxo contínuo de dados e baixo custo por terabyte.
- Casos de Uso Ideais: Clusters de processamento do Amazon EMR, ambientes de Data Warehouse, pipelines de extração, transformação e carregamento (ETL) e ingestão/análise de arquivos de log.
- Avanço e Limites de Capacidade: Tamanho entre 125 GiB e 16 TiB. Entrega uma taxa de transferência de linha de base de 40 MB/s por TiB, variando de um desempenho sustentado mínimo de 5 MB/s (em 125 GiB) até o limite máximo de 500 MB/s (atingido a partir de 12,775 TiB).
- Mecanismo de Créditos de Burst:
  - Volumes acumulam créditos a uma taxa proporcional ao seu tamanho (40 MB/s por TiB) em um reservatório (bucket) com capacidade de até 1 TiB de créditos.
  - A taxa máxima de pico (burst) escala de até 250 MB/s para um volume de 1 TiB até o teto absoluto do tipo, fixado em 500 MB/s para discos maiores.
- Consistência de Entrega: Projetado para manter o desempenho provisionado em 90% dos casos, apresentando taxa anual de falha (AFR) de 0,1% a 0,2%.

❄️ HDD Frio (sc1 - Cold HDD)   
Fornece o perfil de custo mais baixo dentro das modalidades de armazenamento em bloco do Amazon EBS, direcionado para acessos menos frequentes.
- Casos de Uso Ideais: Repositórios de dados legados, conjuntos de dados arquivados que exigem processamento sequencial ocasional e cenários onde a otimização de custo sobressai ao tempo de resposta.
- Avanço e Limites de Capacidade: Tamanho entre 125 GiB e 16 TiB. Entrega taxa de transferência de linha de base de 12 MB/s por TiB, variando de um desempenho sustentado de 1,5 MB/s (em 125 GiB) até o teto sustentado de 192 MB/s (em 16,384 TiB).
- Mecanismo de Créditos de Burst:
  - Opera no mesmo modelo do st1, acumulando créditos no reservatório a uma taxa de 12 MB/s por TiB (com capacidade máxima de 1 TiB em saldo de créditos).
  - A taxa de pico (burst) é limitada a 80 MB/s para volumes de 1 TiB, escalando linearmente com o tamanho do disco até o teto de 250 MB/s.
- Consistência de Entrega: Projetado para entregar a performance provisionada em 90% das operações, compartilhando os mesmos parâmetros de durabilidade e disponibilidade da série st1.

🏛️ Volume Magnético (Standard - Geração Anterior)   
- Status de Infraestrutura: Trata-se do modelo de armazenamento em bloco de primeira geração da AWS. Embora permaneça disponível no console para manter compatibilidade com sistemas legados, a AWS orienta a migração ou adoção direta dos volumes SSD de uso geral gp3 para qualquer nova implementação, garantindo menor latência, maior consistência e relação custo-benefício superior.

<a name="item03.03"><h4>3.3 Choosing the Correct Amazon EBS Volume Type</h4></a>[Back to summary](#item03)

🎯 Estratégias de Seleção e Otimização de Volumes EBS   
A escolha do tipo de volume do Amazon EBS não precisa ser uma decisão estática. A arquitetura da AWS permite alterar a modalidade de armazenamento, capacidade e parâmetros de desempenho (Volumes Elásticos) sem interrupção dos serviços, permitindo o ajuste contínuo do ambiente com base no uso real.

📋 Mapeamento de Cargas de Trabalho (Locais e Novas)   
O dimensionamento correto exige a coleta de dados operacionais e a análise do perfil de acesso da aplicação:

🏠 Migração de Ambientes Locais (On-Premises)   
- Inventário de Mídia e Capacidade: Mapear a quantidade de discos, tamanhos alocados e o tipo de tecnologia física utilizada na infraestrutura de origem.
- Métricas de Desempenho Atual: Analisar picos de consumo, ocorrência de gargalos, IOPS necessários e taxas de transferência (throughput) exigidas.
- Projeção de Crescimento: Avaliar o número de usuários simultâneos atuais, o aumento esperado de acessos e o impacto de atualizações futuras de software nos requisitos de E/S.

🆕 Planejamento para Novas Cargas de Trabalho   
- Ambientes de Teste e Benchmark: Criar ambientes de desenvolvimento na nuvem para simular a aplicação sobre diferentes perfis de volume EBS e medir os tempos de resposta.
- Análise de Especificações e Software: Consultar a documentação técnica do banco de dados ou framework utilizado, que geralmente indica requisitos mínimos e boas práticas de alocação de armazenamento.

⚡ Critérios de Decisão para Escolha do Volume   
A escolha individual de cada volume conectado a uma instância Amazon EC2 deve considerar a sensibilidade da aplicação:
- Perfil de Demanda (IOPS vs. Throughput):
  - Demandas baseadas em IOPS (operações aleatórias de pequeno porte) apontam para a família de SSDs (gp3/io2).
  - Demandas baseadas em Throughput (fluxos sequenciais contínuos de grande porte) apontam para a família de HDDs (st1/sc1).
- Tolerância à Latência:
  - Submilisegundo a 1 ms: SSD de IOPS Provisionadas (io2).
  - Um dígito a dois dígitos baixos de ms: SSD de Uso Geral (gp3).
  - Sem sensibilidade estrita à latência: HDDs Otimizados (st1/sc1).
- Eliminação por Limites: Se a demanda projetada excede os tetos de desempenho de um perfil específico (ex: necessidade de mais de 500 MB/s em HDDs ou mais de 16.000 IOPS em gp3), descarte a opção e avance para o nível seguinte (io2).

🛠️ Reconfiguração Dinâmica e Análise com AWS Compute Optimizer   
Após o provisionamento, a gestão do ciclo de vida dos volumes conta com ferramentas automatizadas de análise e ajuste:
- Volumes Elásticos (Elastic Volumes): Permite alterar o tipo de volume, expandir o espaço em disco ou redefinir IOPS e Throughput em tempo de execução para os tipos gp3 e io2, sem tempo de inatividade.
- AWS Compute Optimizer:
  - Análise Preditiva: Serviço gerenciado que analisa continuamente as métricas de utilização coletadas pelo Amazon CloudWatch (exigindo habilitação prévia na conta ou via AWS Organizations).
  - Recomendações Direcionadas: Identifica volumes subutilizados ou com gargalos, gerando relatórios com gráficos comparativos e projeções de impacto para otimização de desempenho e redução de custos em instâncias EC2, volumes EBS e funções Lambda.

<a name="item03.04"><h4>3.4 Amazon EBS Snapshots</h4></a>[Back to summary](#item03)

📸 Mecanismos de Snapshots do Amazon EBS e Automação com DLM   
Os Snapshots do Amazon EBS são cópias de segurança pontuais e assíncronas armazenadas de forma transparente no Amazon S3. A infraestrutura gerenciada garante resiliência regional e durabilidade de 99,999999999% (onze noves), permitindo a recuperação contínua de dados e a expansão geográfica de volumes.

⚙️ Arquitetura de Snapshots Incrementais e Hidratação de Dados   
A eficiência do armazenamento de snapshots baseia-se na eliminação de redundâncias e na restauração sob demanda:
- Comportamento Incremental: O primeiro snapshot de um volume realiza uma cópia completa de todos os blocos alocados. Os snapshots subsequentes salvam apenas os blocos de dados modificados ou adicionados desde a última execução, utilizando ponteiros internos para referenciar informações inalteradas contidas em capturas anteriores.
- Regras de Exclusão Segura: A exclusão de um snapshot remove unicamente os blocos de dados exclusivos daquele ponto no tempo. Quaisquer blocos ainda referenciados por snapshots subsequentes ou anteriores são preservados para garantir a integridade de restauração de cada ponto do histórico.
- Hidratação em Segundo Plano (Lazy Loading): Ao recriar um volume EBS a partir de um snapshot, o novo disco torna-se disponível imediatamente para uso. A transferência dos dados do Amazon S3 para o volume ocorre em segundo plano. Caso a aplicação solicite um bloco ainda não baixado, a requisição força o download prioritário imediato daquele trecho específico.
- Consistência de Múltiplos Volumes: É possível capturar snapshots coordenados de todos os volumes EBS conectados a uma mesma instância Amazon EC2 de forma simultânea e consistente em relação a falhas (crash-consistent), garantindo a integridade de bancos de dados distribuídos em múltiplos discos.

🔄 Mobilidade, Compartilhamento e Regras de Criptografia   
Os snapshots podem ser manipuladas para integração entre contas e suporte a planos de recuperação de desastres:
- Cópia Inter-Regional (Cross-Region Copy): Embora o snapshot seja originalmente restrito à Região da AWS onde foi criado, ele pode ser copiado para outras regiões para suporte a migração de workloads e planos de contingência.
- Compartilhamento Privado: Permite conceder acesso direto de leitura a outras contas da AWS. As contas autorizadas podem criar volumes derivados a partir do snapshot compartilhado sem alterar a matriz original.
- Rastreamento de Eventos: Operações de criação, cópia e compartilhamento disparam eventos nativos no Amazon CloudWatch para auditoria.
- Herança e Conversão de Criptografia:
  - Volumes criados a partir de snapshots criptografados herdam a criptografia automaticamente.
  - Ao copiar um snapshot não criptografado, é possível ativar a criptografia durante o processo de cópia.
  - Ao copiar um snapshot criptografado, é possível re-criptografá-lo utilizando uma chave diferente do AWS KMS.
  - Nota Técnica: O primeiro snapshot tirado de um volume criado a partir de uma conversão de criptografia ou com chave redefinida será sempre um snapshot completo (não incremental), aumentando a utilização inicial de armazenamento.

🤖 Automação do Ciclo de Vida com Amazon Data Lifecycle Manager (Amazon DLM)   
O Amazon DLM é o serviço nativo encarregado de criar, gerenciar a retenção e descartar automaticamente backups de volumes EBS e Amazon Machine Images (AMIs) sem custo adicional de gerenciamento.
- Tipos de Políticas do DLM:
  - Política de Snapshots: Direcionada a volumes individuais (tag VOLUME) ou a todos os volumes de uma instância (tag INSTANCE).
  - Política de AMIs: Direcionada a instâncias para gerar imagens de inicialização compostas pelos snapshots dos discos associados.
  - Política de Eventos para Cópias: Automatiza a réplica de snapshots entre diferentes contas AWS.
- Mecanismo de Alocação por Tags: O DLM identifica os recursos-alvo inspecionando chaves e valores de tags personalizadas atribuídas às instâncias ou volumes Amazon EC2.
- Agendamentos e Retenção Múltipla:
  - Uma única política suporta até 4 agendamentos com frequências distintas (diária, semanal, mensal, anual), reduzindo a quantidade de regras ativas na conta.
  - A retenção pode ser definida por contagem fixa de itens ou por idade (dias/meses). Ao atingir o limite, o snapshot mais antigo do ciclo é purgado ou a AMI desregistrada.
  - Resolução de Conflitos: Se múltiplos agendamentos da mesma política coincidirem no horário de execução, o DLM gera apenas uma captura e aplica o prazo de retenção mais longo entre as regras conflitantes.

<a name="item04"><h4>Pricing</h4></a>[Back to summary](#item04)

<a name="item04.01"><h4>4.1 Amazon EBS Pricing</h4></a>[Back to summary](#item04)

💰 Estrutura de Precificação e Cálculos do Amazon EBS e Snapshots   
A cobrança do Amazon Elastic Block Store (Amazon EBS) é proporcional ao uso efetivo, faturada em incrementos por segundo (com tempo mínimo de 60 segundos) e calculada com base em períodos padronizados de 30 dias (equivalentes a 720/730 horas ou 2.592.000 segundos). As tarifas variam conforme a Região da AWS ou a Zona de Disponibilidade e recaem sobre a capacidade provisionada no caso dos discos e sobre o espaço real consumido no caso dos backups.

📐 Componentes e Fórmulas de Precificação   
A composição de custos do armazenamento em bloco considera três variáveis de provisionamento:
- Capacidade de Armazenamento: Aplica-se ao tamanho total alocado para o volume em gigabytes por mês, independentemente do espaço efetivamente ocupado por arquivos. O cálculo multiplica os gigabytes provisionados pelo preço mensal da unidade e pelo tempo de uso proporcional.
- Operações de Entrada e Saída (IOPS): Faturado sobre a quantidade de IOPS que excede a linha de base gratuita ou incluída no plano.
  - Volumes gp2, st1 e sc1 não possuem cobrança separada de IOPS, pois a performance já está inclusa no valor do gigabyte.
  - Volumes gp3 incluem 3.000 IOPS base sem custo adicional, tarifando apenas o que ultrapassar esse limite.
  - Volumes io1 e io2 utilizam faturamento em camadas progressivas. As primeiras 32.000 IOPS aplicam a tarifa do primeiro nível, enquanto a faixa de 32.001 a 64.000 IOPS aplica a tarifa reduzida do segundo nível.
- Taxa de Transferência (Throughput): Aplica-se aos volumes gp3, que incluem 125 megabytes por segundo sem custo e cobram apenas pela largura de banda adicional contratada.

📊 Regras de Cobrança por Tipo de Volume   
- Série General Purpose (gp2 e gp3):
  - No gp2, a cobrança é unificada e baseada estritamente no espaço total alocado.
  - No gp3, a cobrança é fracionada entre o espaço alocado, os IOPS que excederem 3.000 e a taxa de transferência que exceder 125 megabytes por segundo.
- Série Provisioned IOPS (io1 e io2):
  - No io1 e io2, o custo é a soma da capacidade alocada com as tarifas progressivas calculadas por faixa de IOPS.
- Série HDD (st1 e sc1):
  - A cobrança ocorre exclusivamente sobre a capacidade em gigabytes alocada. As operações de entrada e saída e a taxa de transferência temporária estão totalmente incluídas no preço do disco.
- Redução de Capacidade: Os Volumes Elásticos permitem apenas aumentar a capacidade de um disco ativo. Para diminuir o tamanho de um volume e reduzir custos, é necessário criar um novo volume menor e transferir os arquivos manualmente.

📸 Precificação de Snapshots do EBS   
Diferente dos volumes ativos que cobram pelo tamanho provisionado, os Snapshots do EBS são faturados estritamente sobre o volume real de dados armazenados no Amazon S3:
- Mecanismo Incremental: A primeira captura armazena a totalidade dos dados gravados no disco. Os snapshots subsequentes cobram apenas pelos blocos alterados ou adicionados durante o período.
- Transferência Entre Regiões: Copiar um snapshot para outra Região da AWS gera cobrança pelo tráfego de saída de dados. Após a transferência, o armazenamento na região de destino passa a ser tarifado pelo espaço consumido naquela localização.

<a name="item04.02"><h4>4.2 Pricing Exercise</h4></a>[Back to summary](#item04)

🧮 Prática de Estimativa de Custos com a Calculadora AWS   
A Calculadora de Preços da AWS permite simular cenários operacionais para volumes Amazon EBS e Snapshots, considerando capacidade alocada, IOPS provisionadas, taxa de transferência (throughput) e políticas de retenção de backup.

🛠️ Premissas da Ferramenta de Cálculo   
- Padrão Horário Mensal: A ferramenta adota o patamar fixo de 730 horas para quantificar um mês faturável completo (diferente do ciclo civil de 720 horas para 30 dias).
- Ajuste de Snapshots: A capacidade total do volume é utilizada como base para o primeiro snapshot completo. Capturas incrementais consideram a taxa de variação de dados (dados modificados ou adicionados) e a frequência de execução.
- Flexibilidade por Volume: As estimativas são processadas individualmente por tipo de volume, permitindo combinar múltiplos discos do mesmo perfil na simulação.

📊 Análise de Cenários e Exercícios Práticos   
1. Orçamento para Nova Aplicação (gp3 vs. st1)
Estrutura composta por um volume transacional (gp3) e um volume orientado a alta taxa de transferência (st1).
- Volume gp3 (75 GB, 3.000 IOPS base, Snapshots Diários com 1 GB de alteração):
  - Armazenamento: 75 GB cobrados à taxa base mensal resultam em 6,00 USD.
  - IOPS e Throughput: 3.000 IOPS e 125 MB/s estão dentro da faixa gratuita do perfil (0,00 USD adicionais).
  - Snapshots: 30 capturas mensais geram 4,50 USD (3,75 USD da base inicial e 0,75 USD do acúmulo incremental).
  - Subtotal gp3: 10,50 USD mensais.
- Volume st1 (1 TB / 1.024 GB para 40 MB/s sustentados, Snapshots Horários com 1 GB de alteração):
  - Armazenamento: 1.024 GB geram 46,08 USD mensais.
  - Snapshots: 729 capturas mensais geram 69,42 USD (impactado pela capacidade inicial superdimensionada para atingir o throughput desejado).
  - Subtotal st1: 115,50 USD mensais.
- Resultado do Cenário: Custo total consolidado de 126,00 USD por mês. A substituição do volume st1 por gp3 neste cenário específico reduziria o custo total para 93,73 USD mensais.

2. Comparativo de Migração: gp2 vs. gp3
Avaliação da transição de uma carga de trabalho de desempenho médio (1.000 IOPS sustentados e 150 GB de dados) do modelo legado para a geração atual.
- Volume gp2 (Necessita de 334 GB para atingir 1.002 IOPS pela regra de 3 IOPS/GB):
  - Armazenamento: 334 GB geram 33,40 USD.
  - Snapshots: 30 capturas diárias sobre a base superdimensionada resultam em 17,45 USD.
  - Subtotal gp2: 50,85 USD mensais.
- Volume gp3 (150 GB mantidos, 3.000 IOPS base inclusos sem superdimensionamento):
  - Armazenamento: 150 GB geram 12,00 USD.
  - IOPS e Throughput: Totalmente cobertos pela franquia gratuita (0,00 USD).
  - Snapshots: 30 capturas diárias resultam em 8,25 USD.
  - Subtotal gp3: 20,25 USD mensais.
- Impacto Financeiro: A migração do perfil gp2 para gp3 proporciona uma economia direta de 30,60 USD por mês por volume.

3. Comparativo de Migração: io1 vs. gp3
Avaliação da substituição de volumes de IOPS Provisionadas (io1) por gp3 em aplicações que exigem 1.000 IOPS e 150 GB de espaço (onde o alto custo do io1 não se justifica pela demanda atingir menos de 3.000 IOPS).
- Volume io1 (150 GB e 1.000 IOPS Provisionados):
  - Armazenamento: 150 GB geram 18,75 USD.
  - IOPS Provisionados: 1.000 IOPS tarifados sem franquia gratuita geram 65,00 USD.
  - Snapshots: 30 capturas diárias geram 8,25 USD.
  - Subtotal io1: 92,00 USD mensais.
- Volume gp3 (150 GB e 3.000 IOPS inclusos):
  - Armazenamento + IOPS + Snapshots: Mantém o subtotal de 20,25 USD mensais.
- Impacto Financeiro: A modernização da arquitetura substituindo io1 por gp3 reduz o custo operacional em 71,75 USD por mês em cada volume ajustado.

<a name="item05"><h4>Amazon EBS Architecture</h4></a>[Back to summary](#item05)

<a name="item05.01"><h4>5.1 Architecture</h4></a>[Back to summary](#item05)

🏛️ Padrões de Arquitetura de Armazenamento no Amazon EBS   
A arquitetura do Amazon Elastic Block Store (Amazon EBS) integra-se às instâncias Amazon EC2 dentro da Nuvem Privada Virtual (VPC). O acesso aos volumes segue os mesmos mecanismos de conectividade de rede (Internet, VPN, AWS Direct Connect ou AWS PrivateLink) e é gerenciado por políticas do AWS Identity and Access Management (IAM).

Os dados mantêm-se protegidos regionalmente por meio de snapshots incrementais armazenados em buckets do Amazon S3 gerenciados pela AWS na mesma região da aplicação.

📐 Modelos de Implantação Arquitetural   
Dependendo dos requisitos de desempenho, disponibilidade e gravação simultânea, os volumes EBS organizam-se em três padrões estruturais principais:

1. Arquitetura Padrão (Instância Única com Múltiplos Volumes)
- Topologia: Uma única instância Amazon EC2 pode ter um ou mais volumes EBS conectados simultaneamente, inclusive combinando tipos de mídia distintos (como gp3 para o sistema e st1 para dados).
- Restrição de Zona de Disponibilidade: A instância e seus volumes anexados devem residir obrigatoriamente na mesma Zona de Disponibilidade (AZ). Não é possível montar um volume EBS em um nó localizado em outra AZ.

2. Arquitetura de Conexão Múltipla (Multi-Attach)
- Topologia: Um único volume EBS é montado simultaneamente em até 16 instâncias Amazon EC2 baseadas na arquitetura Nitro dentro da mesma Zona de Disponibilidade.
- Restrições de Volume: Recurso exclusivo dos volumes baseados em SSD de IOPS Provisionadas (io1 e io2).
- Gerenciamento de Escrita: Todas as instâncias conectadas possuem permissões completas de leitura e escrita. O Amazon EBS não controla a consistência dos dados; a aplicação ou o sistema de arquivos deve implementar mecanismos de isolamento de E/S (cluster file system) para evitar corrupção de dados.

3. Arquitetura de Agrupamento em Faixas (RAID Striping)   
- Topologia: Múltiplos volumes EBS conectados a uma única instância Amazon EC2 configurados no nível do sistema operacional em um arranjo RAID 0 (distribuição em faixas).
- Objetivo: Combinar a capacidade e agregar o limite individual de IOPS e taxa de transferência (throughput) de cada volume para atingir um desempenho de E/S superior ao limite de um único disco.
- Snapshots: As cópias de segurança devem ser executadas com consistência de múltiplos volumes para garantir a integridade do conjunto do RAID em um único ponto no tempo.

<a name="item06"><h4>Integration with other AWS Services</h4></a>[Back to summary](#item06)

<a name="item06.01"><h4>6.1 Data Security</h4></a>[Back to summary](#item06)

🛡️ Integração de Segurança, IAM e Criptografia no Amazon EBS   
O Amazon Elastic Block Store (Amazon EBS) utiliza o ecossistema de segurança da AWS para controlar acessos e proteger dados em repouso e em trânsito. A camada de governança combina controle de acesso granular via AWS Identity and Access Management (IAM) e proteção criptográfica automatizada por meio do AWS Key Management Service (AWS KMS).

🔐 Controle de Acesso e Permissões com IAM   
A gestão de acesso ao Amazon EBS é fortemente vinculada às instâncias Amazon EC2:
- Modelo de Permissão Zero por Padrão: Identidades do IAM (usuários, grupos e funções) não possuem acesso inicial a volumes ou snapshots. As permissões devem ser explicitamente concedidas via políticas declarativas.
- Políticas Gerenciadas pela AWS: Opções pré-configuradas pela AWS para cenários comuns (como permissões de administrador de EC2 ou permissões de leitura), reduzindo a necessidade de mapear manualmente ações de API.
- Políticas Personalizadas por Recurso: Permite criar regras restritivas específicas baseadas em tags, regiões ou IDs de volume, limitando quem pode criar, modificar, desanexar ou excluir volumes e snapshots.

🔑 Criptografia Nativa com AWS KMS   
A criptografia do Amazon EBS elimina a complexidade de gerenciar infraestruturas próprias de chaves, operando diretamente no hardware host do nó Amazon EC2:
- Escopo de Proteção Integral: A criptografia cobre o volume de inicialização (boot), volumes de dados, todo o tráfego de rede entre a instância EC2 e o armazenamento EBS, além de todos os snapshots derivados e volumes recriados a partir desses snapshots.
- Uso Flexível: Instâncias Amazon EC2 podem manter volumes criptografados e não criptografados conectados simultaneamente.
- Padrão Algorítmico e Chaves de Dados:
  - Utiliza o algoritmo de criptografia simétrica AES-256, padrão reconhecido pela indústria.
  - O EBS gera uma chave de dados exclusiva para cada volume, que é criptografada utilizando uma chave gerenciada pelo cliente (CMK - Customer Managed Key) ou uma chave padrão da AWS mantida no AWS KMS.
  - A chave de dados nunca é salva em texto simples no disco, sendo gerenciada na memória do servidor host EC2 para criptografar as operações de Entrada e Saída (E/S) em tempo real.
  - Snapshots do volume e novos volumes gerados a partir deles compartilham a mesma chave de dados criptografada.

<a name="item06.02"><h4>6.2 AWS Backup</h4></a>[Back to summary](#item06)

🛡️ Governança e Proteção de Dados com AWS Backup   
O AWS Backup é um serviço totalmente gerenciado e centralizado que automatiza e orquestra a proteção de dados em múltiplos serviços da AWS. Enquanto os Snapshots do Amazon EBS atuam diretamente no nível de disco/EC2, o AWS Backup opera como uma plataforma independente de governança, auditabilidade e conformidade para toda a infraestrutura corporativa.

⚙️ Principais Funcionalidades e Recursos do Serviço   
O AWS Backup estende a proteção de dados com recursos avançados de gerenciamento:
- Planos de Backup Baseados em Políticas: Permite estruturar planos formais (Backup Plans) para definir janelas de execução, frequência de cópias e tempo de retenção. As políticas podem ser aplicadas automaticamente aos recursos da AWS por meio do uso de tags.
- Orquestração Centralizada com AWS Organizations: Integra-se à gestão de organizações para aplicar políticas de proteção unificadas em todas as contas membros da empresa.
- Transição Automatizada de Camadas (Lifecycle Policies): Move backups antigos da camada quente (warm storage) para camadas de armazenamento frio (cold storage) de menor custo, atendendo a requisitos regulatórios de retenção de longo prazo.
- Cofres de Backup e Controle de Acesso (Backup Vaults): Organiza as cópias em contêineres lógicos e aplica políticas de acesso baseadas em recursos, garantindo controle estrito de permissões sobre quem pode visualizar, restaurar ou excluir backups.
- Cópias Inter-Regionais e Entre Contas (Cross-Region & Cross-Account):
  - Cross-Region: Clona backups para outras regiões da AWS para suporte a planos de recuperação de desastres (DR).
  - Cross-Account: Copia backups para contas de destino confiáveis da organização. Esse isolamento protege contra exclusões acidentais, ações maliciosas internas ou ataques de ransomware na conta de origem.
- Painel de Auditoria e Painel de Controle: Console unificado que exibe o status de execução de todas as tarefas de backup e restauração, simplificando processos de conformidade técnica e regulatória.

🗄️ Serviços AWS Suportados pelo AWS Backup   
A plataforma unifica a proteção de dados de diversos recursos além do armazenamento em bloco:
- Computação e Armazenamento em Bloco: Instâncias Amazon EC2 e volumes Amazon EBS.
- Bancos de Dados Relacionais e NoSQL: Amazon RDS (incluindo clusters Amazon Aurora) e tabelas Amazon DynamoDB.
- Sistemas de Arquivos Gerenciados: Amazon EFS, Amazon FSx for Lustre e Amazon FSx for Windows File Server.
- Integração Híbrida: Volumes do AWS Storage Gateway.

<a name="item06.03"><h4>6.3 CloudEndure Disaster Recovery and AWS Application Migration Service</h4></a>[Back to summary](#item06)

🔄 Evolução dos Serviços de Migração e Recuperação: AWS DRS e AWS MGN   
O ecossistema da AWS evoluiu os antigos serviços baseados na tecnologia CloudEndure para soluções nativas e totalmente integradas. O CloudEndure Disaster Recovery foi sucedido pelo AWS Elastic Disaster Recovery (DRS), enquanto o CloudEndure Migration foi descontinuado em favor do AWS Application Migration Service (AWS MGN). Ambas as ferramentas utilizam instâncias Amazon EC2 e volumes Amazon EBS para criar áreas de preparação (staging) de baixo custo e realizar réplicas contínuas de nível de bloco.

🚨 AWS Elastic Disaster Recovery (DRS)   
Sucessor direto do CloudEndure Disaster Recovery, o AWS DRS minimiza o tempo de inatividade e a perda de dados, garantindo recuperação rápida de servidores físicos, virtuais ou em nuvem para a AWS (incluindo Regiões Públicas, AWS GovCloud e AWS Outposts).
- Proteção de Cargas Críticas: Suporta bancos de dados transacionais (Oracle, MySQL, SQL Server) e plataformas corporativas (SAP).
- Replicação Contínua em Área de Estágio: Monitora e replica continuamente o sistema operacional, estado do sistema, bancos de dados, aplicações e arquivos de origem. As alterações são gravadas em volumes Amazon EBS associados a instâncias EC2 de baixo custo na região de destino.
- Lançamento Automatizado em Minutos: Em cenários de desastre ou testes de contingência, o serviço converte e inicia automaticamente milhares de instâncias EC2 em estado totalmente provisionado em poucos minutos.
- Otimização de Custos: Reduz drasticamente a pegada financeira da infraestrutura de Disaster Recovery (DR), pois elimina a necessidade de manter servidores de alto desempenho ligados antes que um evento de falha ocorra.

🚚 AWS Application Migration Service (AWS MGN)   
Sucessor do CloudEndure Migration, o AWS MGN é a solução primária da AWS para migração por rehospedagem (lift-and-shift), simplificando e automatizando a transferência de aplicações para a nuvem.
- Migração Sem Interrupções: Transfere servidores físicos, virtuais ou de outras nuvens sem problemas de compatibilidade ou impacto perceptível de desempenho na origem.
- Mecanismo de Conversão Automática: Mantém a replicação contínua no nível de bloco para a conta da AWS. No momento do corte (cutover), converte o código e atualiza drivers automaticamente para iniciar o servidor nativamente como uma instância Amazon EC2 com volumes Amazon EBS.
- Estratégia de Transição Rápida: Permite mover cargas de trabalho rapidamente para a nuvem para capturar ganhos imediatos de custo e agilidade, postergando etapas de replataformagem ou refatoração para após a migração.

<a name="item06.04"><h4>6.4 Amazon CloudWatch</h4></a>[Back to summary](#item06)

📈 Monitoramento e Eventos do Amazon EBS com Amazon CloudWatch   
O Amazon CloudWatch fornece visibilidade operacional contínua para os volumes do Amazon EBS, permitindo analisar o comportamento de Entrada/Saída (E/S), diagnosticar gargalos e automatizar respostas a alterações de estado na infraestrutura.

⏱️ Coleta de Dados e Granularidade   
- Frequência Automática: Os volumes do Amazon EBS enviam pontos de dados ao CloudWatch em intervalos automáticos de 1 minuto, sem custos adicionais.
- Condição de Envio: As métricas são reportadas exclusivamente enquanto o volume estiver conectado a uma instância Amazon EC2.
- Parâmetro de Consulta (Period): Ao consultar dados via API ou pelo console do EC2, recomenda-se definir o parâmetro de período com valor igual ou superior ao tempo de coleta (1 minuto ou mais) para garantir a consistência das estatísticas exibidas.

📊 Principais Métricas do Namespace AWS/EBS   
O CloudWatch agrupa os dados de desempenho do Amazon EBS sob métricas específicas:
- Volume de Dados e Frequência de Operações:
  - VolumeReadBytes e VolumeWriteBytes: Medem o volume total de dados lidos ou gravados (em bytes) durante o intervalo especificado.
  - VolumeReadOps e VolumeWriteOps: Quantificam o número total de operações completas de leitura ou escrita realizadas no período.
- Latência e Ociosidade:
  - VolumeTotalReadTime e VolumeTotalWriteTime: Registram o tempo total acumulado em segundos gasto no processamento de leituras ou escritas. Como requisições simultâneas somam seus tempos individuais, o valor acumulado pode superar a duração do próprio intervalo analisado (não suportado em volumes com Multi-Attach ativo).
  - VolumeIdleTime: Quantifica os segundos em que o volume permaneceu sem processar nenhuma operação de leitura ou escrita (não suportado em volumes com Multi-Attach ativo).
- Fila e Desempenho Provisionado:
  - VolumeQueueLength: Mede o número de requisições de E/S pendentes aguardando conclusão. É o principal indicador para identificar gargalos de armazenamento.
  - VolumeThroughputPercentage: Exclusivo da série de IOPS Provisionadas (io1/io2). Exprime em porcentagem a taxa de IOPS efetivamente entregue em relação ao valor contratado (não suportado em volumes com Multi-Attach ativo).
  - VolumeConsumedReadWriteOps: Exclusivo da série de IOPS Provisionadas (io1/io2). Mede a quantidade total de operações de E/S consumidas, normalizadas em unidades de 256 KiB.
- Créditos de Desempenho:
  - BurstBalance: Aplicável aos volumes gp2, st1 e sc1. Indica a porcentagem restante de créditos de E/S ou de taxa de transferência (throughput) disponíveis no reservatório de burst.

⚡ Automação com Eventos do CloudWatch   
O Amazon EBS emite eventos nativos no CloudWatch para sinalizar mudanças de estado, permitindo disparar fluxos automatizados (como funções AWS Lambda ou notificações via Amazon SNS):
- Eventos de Volume: Notificam ações como criação, exclusão, conexão, reconexão ou modificação de parâmetros do volume (Elastic Volumes).
- Eventos de Snapshot: Notificam a conclusão de criação (individual ou em lote), cópia ou compartilhamento inter-contas de snapshots.