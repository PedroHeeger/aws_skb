# AWS for Media & Entertainment Content Production Storage Requirements   <img src="./0-aux/logo_course.png" alt="curso_dc_022" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_022 (AWS for Media & Entertainment Content Production Storage Requirements)   <img src="./0-aux/logo_course.png" alt="curso_dc_022" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260929_dc_022_en.pdf">Certificate</a>

---

### Theme:
- Cloud Computing

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Block Store (EBS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ebs.svg" alt="aws_ebs" width="auto" height="25">
  - Amazon Elastic File System (EFS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_efs.svg" alt="aws_efs" width="auto" height="25">
  - Amazon FSx   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_fsx.png" alt="aws_fsx" width="auto" height="25">
  - Amazon Simple Storage Service (S3)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_s3.svg" alt="aws_s3" width="auto" height="25">
  - AWS Storage Gateway   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_storage_gateway.svg" alt="aws_storage_gateway" width="auto" height="25">
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
1. <a href="#item01">Introduction to AWS Security and Identity Concepts</a><br>
  1.1 <a href="#item01.01">Introduction to Content Production Storage Requirements</a><br>
  1.2 <a href="#item01.02">Storage Types and Services</a><br>
2. <a href="#item02">Content Production Storage Requirements</a><br>
  2.1 <a href="#item02.01">File Storage Requirements for Content Production</a><br>
  2.2 <a href="#item02.02">Object Storage Requirements for Content Production</a><br>
  2.3 <a href="#item02.03">Media Storage Strategy</a><br>
3. <a href="#item03">Conclusion</a><br>
  3.1 <a href="#item03.01">Summary</a><br>

---

### Objective:
O curso teve como objetivo apresentar as estratégias, benefícios e arquiteturas de armazenamento na AWS para fluxos de trabalho de produção de conteúdo e mídia. A formação abordou a diferenciação entre os tipos de armazenamento (Bloco, Arquivo e Objeto), detalhando como o Amazon EBS (bloco) suporta estações de trabalho virtuais, como a família Amazon FSx (ONTAP, Windows, OpenZFS e Lustre) atende à edição colaborativa em tempo real com baixa latência e concorrência (SMB/NFS/POSIX), e como o Amazon S3 e suas classes de armazenamento (Objeto/Glacier) viabilizam data lakes, sistemas MAM e arquivamento de longo prazo com excelente custo-benefício.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introduction to AWS Security and Identity Concepts</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Introduction to Content Production Storage Requirements</h4></a>[Back to summary](#item01)

☁️ Vantagens do Armazenamento em Nuvem na Produção Cultural   
A transição dos repositórios de dados físicos para arquiteturas de armazenamento em nuvem reestrutura a gestão de ativos digitais em fluxos de trabalho de mídia, otimizando o acesso compartilhado entre equipes distribuídas.
- Agilidade Operacional: Substitui a expansão física de data centers — que demanda aquisição de hardware, espaço físico e planejamento prévio de capacidade — pelo provisionamento imediato de novos volumes e serviços sob demanda.
- Aceleração da Inovação: Elimina o isolamento dos dados (data silos) comum em infraestruturas locais. A flexibilidade do ambiente em nuvem permite testar novos fluxos de trabalho, ajustar capacidades e validar diferentes modelos de armazenamento em ambientes de desenvolvimento e teste sem investimentos fixos.
- Eficiência Financeira: Reduz os custos operacionais e a necessidade de alocação permanente de pessoal para manutenção de hardware. A conversão de investimentos de capital (CapEx) em despesas operacionais (OpEx) permite dimensionar o armazenamento estritamente conforme a demanda dos projetos ativos.

<a name="item01.02"><h4>1.2 Storage Types and Services</h4></a>[Back to summary](#item01)

📦 Arquiteturas e Tipos de Armazenamento na Nuvem   
A escolha do modelo de armazenamento adequado é fundamental para sustentar as exigências de desempenho, compartilhamento e arquivamento em fluxos de trabalho de mídia e entretenimento.

🧱 Armazenamento em Bloco (Amazon EBS)   
Estrutura de baixo nível onde o volume é dividido em blocos fixos de dados gerenciados diretamente pelo sistema operacional da instância.
- Características: Oferece acesso direto ao disco com latência mínima e altíssimo desempenho de leitura e escrita.
- Casos de Uso: Servir de disco de sistema e cache local para instâncias Amazon EC2 configuradas como estações virtuais de trabalho.
- Limitações: Apresenta complexidade para compartilhamento simultâneo entre múltiplas instâncias ou usuários na rede.

📁 Armazenamento de Arquivos (Família Amazon FSx)   
Sistemas de arquivos gerenciados que abstraem o armazenamento subjacente, disponibilizando estrutura hierárquica de pastas e arquivos acessível simultaneamente por múltiplas instâncias via rede.
- Amazon FSx para Lustre: Projetado para computação de alta performance (HPC) e renderização massiva. Utiliza protocolo compatível com POSIX para entregar altíssima taxa de transferência.
- Amazon FSx para Windows File Server: Baseado no ambiente nativo da Microsoft, utiliza o protocolo SMB para suporte a aplicações Windows e integração com Active Directory.
- Amazon FSx para NetApp ONTAP: Solução multiprotocolo com suporte a NFS, SMB e iSCSI, permitindo a migração de workloads complexos da NetApp para a nuvem sem alteração de arquitetura.
- Amazon FSx para OpenZFS: Armazenamento gerenciado baseado em OpenZFS, facilitando a transição de servidores de arquivos locais com o mínimo de esforço de readequação.
- Casos de Uso: Repositórios centrais de mídia, diretórios de projetos compartilhados, ambientes de desenvolvimento e edição colaborativa.

🗄️ Armazenamento de Objetos (Amazon S3)   
Repositório estruturado para armazenar dados como objetos binários acompanhados de metadados detalhados, sem o uso de hierarquia tradicional de pastas.
- Características: Escalabilidade praticamente ilimitada, alta durabilidade, suporte a versionamento e políticas automatizadas de retenção.
- Classes de Armazenamento: Oferece opções otimizadas para acesso frequente (Amazon S3 Standard) até opções de baixíssimo custo para arquivamento de longa duração (Amazon S3 Glacier).
- Casos de Uso: Gestão de ativos digitais (MAM), pipelines de transcodificação, distribuição de conteúdo e acervos frios.
- Desafios: Latência superior em relação a bloco e arquivo, além de ausência de suporte nativo por parte de alguns softwares tradicionais de edição.

🌉 Gateway de Armazenamento Híbrido (AWS Storage Gateway)   
Dispositivo de software que estabelece uma ponte entre a infraestrutura local e a nuvem da AWS.
- Mecanismo: Converte protocolos padrão de rede local (como NFS e SMB) em chamadas de API do Amazon S3, mantendo cache local para reduzir a latência de acesso aos arquivos mais utilizados.
- Casos de Uso: Transferência gradual de acervos para a nuvem, fluxos de backup e edição proxy com baixa concorrência. Não é indicado para playback de vídeo de alta resolução em tempo real ou fluxos de edição pesada.

<a name="item02"><h4>Content Production Storage Requirements</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 File Storage Requirements for Content Production</h4></a>[Back to summary](#item02)

🎬 Requisitos de Armazenamento de Arquivos na Produção de Conteúdo   
Sistemas de arquivos gerenciados são o pilar central na pós-produção audiovisual, fornecendo baixa latência, alta taxa de transferência e compatibilidade nativa com os softwares criativos padrão do mercado sem a necessidade de camadas intermediárias de adaptação.
- Acesso e Edição em Tempo Real: Resposta imediata de gravação e leitura para manipular vídeos em alta resolução sem perda de quadros.
- Bloqueio de Arquivos (File Locking): Previne a sobreposição e corrupção de projetos quando múltiplos artistas e editores acessam os mesmos diretórios de mídia de forma simultânea.
- Espaço de Nomes Unificado: Suporte aos protocolos padrão SMB e NFS, permitindo a integração direta com ecossistemas Windows, Linux e macOS.
- Alta Disponibilidade e Custo: Mecanismos de replicação entre múltiplas Zonas de Disponibilidade (Multi-AZ), criptografia de dados e estruturas de cobrança baseadas apenas na capacidade e performance alocadas (IOPS e throughput).

🧮 Cálculo de Taxa de Transferência (Throughput)   
A definição do throughput exigido pela infraestrutura de armazenamento depende da soma do consumo de todos os fluxos de trabalho simultâneos. A vazão total é calculada pela fórmula:
- Fórmula: Taxa de bits do Codec (Mbps) × Quantidade de Usuários Ativos × Número de Fluxos de Vídeo Simultâneos por Usuário.
- Exemplo Prático: Para 10 editores utilizando o codec DNxHD 115 (115 Mbps), onde cada um executa 2 fluxos de vídeo ao mesmo tempo na timeline, o consumo total exigido do armazenamento será de 115 × 10 × 2 = 2300 Mbps (aproximadamente 2,3 Gbps de taxa de transferência contínua).

📈 Padrões de Escalonamento de Desempenho   
- Escalonamento Vertical (Scale-Up): Focado em altíssima velocidade e baixíssima latência para fluxos de dados de thread única, manipular arquivos pequenos, acessos aleatórios ou uso intensivo de metadados.
- Escalonamento Horizontal (Scale-Out): Focado em expandir a largura de banda agregada e a capacidade total. Ideal para leitura e escrita sequencial ou aleatória de arquivos grandes e operações multi-thread.

🛠️ Comparativo da Família Amazon FSx para Mídia   
- Amazon FSx para Windows File Server
  - Protocolos Suportados: Exclusivamente SMB.
  - Desempenho e Limites: Latência inferior a 1 ms, vazão por sistema de até 20 GB/s e capacidade máxima por compartilhamento de 64 TiB.
  - Casos de Uso e Benefícios: Edição e transcodificação em ambientes Windows, integração com Active Directory, desduplicação de dados e custo otimizado para edição colaborativa.
- Amazon FSx para OpenZFS
  - Protocolos Suportados: Exclusivamente NFS.
  - Desempenho e Limites: Latência ultrabaixa (< 0,5 ms), vazão de até 21 GB/s e capacidade de armazenamento até 512 TiB.
  - Casos de Uso e Benefícios: Animação, efeitos visuais (VFX) e renderização que exigem o menor tempo de resposta possível.
- Amazon FSx para NetApp ONTAP
  - Protocolos Suportados: Multiprotocolo nativo (NFS, SMB e iSCSI).
  - Desempenho e Limites: Latência inferior a 1 ms, vazão agregada de até 80 GB/s e capacidade de armazenamento de escala petabyte.
  - Casos de Uso e Benefícios: Pipelines de VFX, edição e renderização em ambientes heterogêneos (Linux/Windows). Oferece gerenciamento avançado de dados corporativos e camadas automáticas para dados pouco acessados.
- Amazon FSx para Lustre: 
  - Protocolos Suportados: Cliente Lustre compatível com POSIX (sistemas Linux).
  - Desempenho e Limites: Latência inferior a 1 ms e taxa de transferência massiva de até 1000 GB/s (1 TB/s) com capacidade na escala de múltiplos petabytes.
  - Casos de Uso e Benefícios: Renderização paralela pesada de alta performance. Possui integração nativa com o Amazon S3 para carga e persistência de ativos.

<a name="item02.02"><h4>2.2 Object Storage Requirements for Content Production</h4></a>[Back to summary](#item02)

🗄️ Armazenamento de Objetos no Ciclo de Vida de Mídia   
O Amazon S3 atua como o repositório central escalável e durável para ingestão, processamento, distribuição e preservação de ativos digitais em fluxos de trabalho audiovisuais.

🎯 Principais Casos de Uso na Produção de Conteúdo   
- Gestão de Ativos de Mídia (MAM/PAM/DAM): Serve de camada de persistência para armazenar brutos, áudios e imagens. A integração com sistemas de MAM (Media Asset Management) adiciona uma camada de software sobre os objetos, mapeando metadados, tags e sinalizações contextuais para organizar o acervo sem depender de estruturas rígidas de pastas.
- Distribuição Global de Conteúdo: Funciona como origem para a rede de entrega de conteúdo Amazon CloudFront. Os arquivos são armazenados em cache nos pontos de presença (Edge Locations) mais próximos dos usuários finais, minimizando a latência no streaming e download.
- Data Lake de Mídia: Funciona como repositório centralizado sem necessidade de estruturação prévia dos dados, permitindo armazenar filmagens brutas, arquivos transcodificados, registros de metadados e logs analíticos no mesmo local para processamento e análise de dados.
- Backup e Preservação de Longo Prazo: Fornece alta durabilidade para a retenção de acervos históricos e cópias de segurança de conteúdo valioso, mitigando riscos de perda de ativos originais.

🏛️ Hierarquia e Classes de Armazenamento Amazon S3   
A escolha da classe de armazenamento no Amazon S3 varia de acordo com a frequência de acesso aos dados e os requisitos orçamentários do projeto.
- Amazon S3 Standard: Projetado para dados de alta disponibilidade e acesso frequente, como arquivos em fase ativa de produção, transcodificação ou edição.
- S3 Standard-Infrequent Access (S3 Standard-IA): Indicado para dados acessados com menor frequência, mas que exigem milissegundos de tempo de resposta quando solicitados.
- S3 Glacier Instant Retrieval: Oferece custo de armazenamento reduzido para ativos raramente acessados, mantendo a recuperação em milissegundos para mídias que podem ser reativadas de forma imprevisível.
- S3 Glacier Flexible Retrieval e S3 Glacier Deep Archive: As opções de menor custo por gigabyte da AWS, desenvolvidas para arquivamento frio e de longo prazo, onde o tempo de recuperação varia de minutos a horas.

<a name="item02.03"><h4>2.3 Media Storage Strategy</h4></a>[Back to summary](#item02)

🎯 Estratégia de Mapeamento e Governança de Dados de Mídia   
Uma estratégia eficiente de armazenamento em fluxos de trabalho audiovisuais exige a categorização dos ativos de acordo com a fase de produção, equilibrando o desempenho de acesso, a capacidade de throughput e os custos de permanência.

⚡ Camada de Alto Desempenho (Sistemas de Arquivos Amazon FSx)   
Ambientes de baixa latência e alta taxa de transferência (como Amazon FSx para ONTAP, FSx para Windows File Server ou FSx para OpenZFS) devem ser reservados para dados de uso intensivo e imediato.
- Projetos Ativos e Arquivos de Trabalho: Arquivos de linha do tempo, sequências de áudio, gráficos e mídias brutas envolvidas ativamente no processo de montagem e finalização.
- Arquivos Intermediários e Proxies: Arquivos gerados para pré-visualização, caches de render e arquivos proxy de menor resolução que passam por leitura e gravação constantes durante as etapas de edição e pós-produção.

🏛️ Camada de Persistência e Arquivamento (Amazon S3)   
O repositório de objetos (Amazon S3) atua como a camada de menor custo por gigabyte e altíssima durabilidade para mídias que não exigem velocidades extremas de gravação e leitura.
- Brutos Não Utilizados e Materiais Originais: Filmagens e assets de câmeras que não estão em uso imediato nas edições ativas, mantidos para consultas futuras ou reuso de acervo.
- Entregáveis e Projetos Finalizados: Master finais, arquivos exportados para distribuição e pacotes de projetos concluídos que saíram do ciclo ativo de edição.
- Cópias de Segurança e Recuperação de Desastres: Backups periódicos dos volumes de produção para garantia de continuidade operacional e proteção contra corrupção de dados ou falhas físicas.

<a name="item03"><h4>Conclusion</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Summary</h4></a>[Back to summary](#item03)

📑 Resumo Geral: Armazenamento em Nuvem para Produção de Conteúdo   
A adoção do armazenamento em nuvem na produção audiovisual transforma a gestão de dados ao substituir infraestruturas físicas locais por modelos escaláveis e otimizados para colaboração global.

💡 Fundamentos e Vantagens do Armazenamento em Nuvem   
- Agilidade e Flexibilidade: Permitir alterações e novos provisionamentos de armazenamento sem o tempo de espera e custos fixos associados à aquisição de hardware físico.
- Inovação Contínua: Eliminação dos silos de dados locais, possibilitando a realização de testes de novos fluxos de trabalho e o ajuste da capacidade de armazenamento sob demanda.
- Redução de Custos: A conversão de investimentos fixos em despesas variáveis ajustadas ao uso real, reduzindo gastos com espaço físico, energia e manutenção de data centers.

🏗️ Modelos de Armazenamento e Serviços AWS   
Cada arquitetura atende a necessidades específicas da cadeia de produção de mídia:
- Armazenamento em Bloco (Amazon EBS): Conecta-se a instâncias Amazon EC2 para oferecer acesso de baixíssima latência e alto desempenho local, ideal para discos de sistema e cache de estações de trabalho remotas.
- Armazenamento de Arquivos (Família Amazon FSx): Sistemas gerenciados com suporte aos protocolos SMB, NFS e cliente Lustre. Fornece acesso simultâneo com suporte a bloqueio de arquivos, indispensável para edição colaborativa e renderização paralela.
- Armazenamento de Objetos (Amazon S3): Estrutura escalável e durável voltada para o armazenamento de grandes acervos, integração com sistemas de MAM, repositórios de dados (data lakes), distribuição via Amazon CloudFront e arquivamento de longo prazo.
- Integração Híbrida (AWS Storage Gateway): Dispositivo de software que conecta a rede local ao Amazon S3 via protocolos padrão, utilizando cache local para simplificar a movimentação de dados e backups.

🎯 Estratégia de Alocação de Dados   
A otimização de desempenho e custo exige o mapeamento adequado dos ativos em cada fase do ciclo de vida:
- Camada de Alto Desempenho (Amazon FSx): Reservada para projetos ativos, edições em tempo real, arquivos proxy e caches de renderização que exigem baixa latência e alta vazão de leitura e escrita.
- Camada de Menor Custo (Amazon S3 e S3 Glacier): Indicada para guardar materiais brutos sem uso imediato, entregáveis finais, backups de segurança e acervos históricos mantidos para preservação de longo prazo.