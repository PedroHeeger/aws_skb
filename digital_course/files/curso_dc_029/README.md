# AWS Graviton Processors Fundamentals   <img src="./0-aux/logo_course.png" alt="curso_dc_029" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_029 (AWS Graviton Processors Fundamentals)   <img src="./0-aux/logo_course.png" alt="curso_dc_029" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/261023_dc_029_en.pdf">Certificate</a>

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
  - Amazon SageMaker   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_sagemaker.png" alt="aws_sage_maker" width="auto" height="25">
  - AWS Graviton   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_graviton.png" alt="aws_graviton" width="auto" height="25">
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
1. <a href="#item01">Understanding AWS Graviton and Its Benefits</a><br>
  1.1 <a href="#item01.01">What is AWS Graviton?</a><br>
  1.2 <a href="#item01.02">Business and Technical Benefits</a><br>
  1.3 <a href="#item01.03">Graviton-based EC2 Instances</a><br>
  1.4 <a href="#item01.04">AI Acceleration on Graviton</a><br>
  1.5 <a href="#item01.05">Key Takeaways</a><br>

---

### Objective:
O objetivo do curso foi orientar o uso dos processadores AWS Graviton (Arm) para maximizar o custo-benefício e a eficiência energética em instâncias Amazon EC2. Foram abordadas a integração com o AWS Nitro System, a evolução das gerações de chips, as vantagens operacionais e financeiras em diversas famílias de instâncias (séries M, C, R, I, entre outras), além do uso do Graviton em inferência de IA/ML e o suporte de ferramentas para migração de software.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Understanding AWS Graviton and Its Benefits</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 What is AWS Graviton?</h4></a>[Back to summary](#item01)

⚙️ Arquitetura e Propósito do AWS Graviton   
Os processadores AWS Graviton são chips desenvolvidos pela própria AWS baseados na arquitetura Arm (arm64). O objetivo central dessa iniciativa é entregar a melhor relação custo-benefício para cargas de trabalho executadas no Amazon EC2, oferecendo uma alternativa de alto desempenho aos processadores baseados na arquitetura x86 (Intel e AMD).

A estratégia de fabricação própria de semicondutores fundamenta-se em quatro pilares principais:
- Inovação Integrada: O desenvolvimento interno e simultâneo do silício, do software de servidor e do hipervisor viabiliza otimizações de ponta a ponta direcionadas a cenários reais de uso.
- Especialização de Hardware: Customização dedicada de componentes físicos para atender a requisitos estritos de segurança e desempenho da nuvem.
- Agilidade no Ciclo de Entrega: O domínio de todo o ciclo de vida — desde a concepção do chip até a implantação nos data centers — acelera a disponibilização de novas tecnologias ao mercado.
- Otimização Operacional: Integração contínua entre equipes de hardware e software suportada pela flexibilidade e elasticidade da própria infraestrutura da AWS.

🛡️ O AWS Nitro System como Fundamento de Desempenho e Segurança   
As instâncias equipadas com processadores Graviton funcionam sobre o AWS Nitro System, uma combinação de hardware dedicado e um hipervisor leve que descarrega (offload) tarefas de gerenciamento para placas especializadas:
- Placas Nitro (Nitro Cards): Placas dedicadas ao processamento de redes VPC, operações de armazenamento no Amazon EBS, SSDs locais e controle geral do sistema.
- Hipervisor Nitro: Camada leve responsável exclusivamente pela alocação de memória e CPU, entregando um desempenho praticamente idêntico ao de servidores bare-metal.
- Chip de Segurança Nitro: Componente integrado diretamente à placa-mãe que estabelece uma raiz de confiança (Hardware Root of Trust), monitora as interfaces do sistema e valida a integridade do firmware.

💡 Benefícios Técnicos do Nitro System   
- Isolamento e Segurança Estrita: Mecanismos como o Nitro Enclaves garantem ambientes isolados de processamento. A arquitetura impede o acesso de terceiros ou de administradores da própria AWS aos dados contidos nas instâncias.
- Desempenho e Estabilidade: A eliminação da sobrecarga (overhead) de virtualização resulta em taxas de transferência consistentes e menor variabilidade de latência.
- Eficiência e Sustentabilidade: O processamento otimizado reduz o consumo de energia da frota de servidores.
- Flexibilidade de Plataformas: Permite integrar diferentes arquiteturas de hardware (Intel, AMD, Graviton e Apple Mac) dentro do mesmo ecossistema do EC2.

⏳ Evolução Histórica da Família Graviton   
A linha de processadores Graviton evoluiu continuamente para ampliar a capacidade de processamento, a largura de banda e a eficiência energética:
- Lançamento do Graviton1 (2018): Primeiro chip desenvolvido pela AWS, focado na redução de custos para aplicações de escalabilidade horizontal (scale-out).
- Graviton2 (2019): Baseado na arquitetura Arm Neoverse de 64 bits. Entregou uma relação custo-benefício até 40% superior em relação às instâncias x86 equivalentes.
- Graviton3 (2021): Proporcionou ganhos de até 25% em desempenho geral, dobro de performance em operações de ponto flutuante e criptografia, além do pioneirismo no uso de memórias DDR5. Reduziu o consumo de energia em até 60% comparado a plataformas x86.
- Graviton3E (2022): Variante especializada para Computação de Alto Desempenho (HPC), trazendo até 35% de ganho em operações com instruções vetoriais em relação ao Graviton3.
- Graviton4 (2023): Aumento de até 30% no desempenho geral e suporte a instâncias maiores, oferecendo até 3 vezes mais vCPUs e memória em comparação ao Graviton3.
- Graviton5 (2025): Nova geração com saltos significativos de capacidade computacional, permitindo escalar o desempenho de aplicações complexas com menor custo de infraestrutura.

<a name="item01.02"><h4>1.2 Business and Technical Benefits</h4></a>[Back to summary](#item01)

💡 Pilares e Benefícios da Migração para AWS Graviton   
A adoção de instâncias baseadas em processadores AWS Graviton proporciona razões financeiras, técnicas e ecológicas para a transição de arquiteturas legadas (x86) para o ecossistema Arm.

📊 Principais Vetores de Impacto   
💰 Eficiência Financeira (Cost Optimization)   
- Redução de Custos de Até 40%: Entrega a mesma capacidade computacional por um valor nominal substancialmente menor em comparação com instâncias EC2 equivalentes de arquiteturas tradicionais.
- Maximização de Margens Operacionais: Melhora a rentabilidade por cliente/unidade para plataformas digitais e fornecedores de SaaS, liberando orçamento de infraestrutura para pesquisa e desenvolvimento.
- Previsibilidade Financeira: Reduz o impacto financeiro em frotas de grande escala e em aplicações de alto consumo de processamento.

⚡ Ganhos em Desempenho (Performance)   
- Arquitetura de vCPU Dedicada: Cada vCPU do Graviton corresponde a um núcleo físico real (sem hyperthreading), eliminando contenção entre threads.
- Largura de Banda Expandida: Hierarquia de cache otimizada para acesso rápido à memória RAM e suporte de rede avançado de até 200 Gbps (família C7gn).
- Eficiência em Execução: Respostas mais rápidas e maior throughput em microsserviços conteinerizados, servidores web, APIs e processadores de dados.

🌿 Sustentabilidade e Governança (ESG)   
- Redução de Até 60% no Consumo Energético: Desempenho por watt otimizado pela arquitetura Arm, diminuindo diretamente a pegada de carbono do ambiente em nuvem.
- Alinhamento com Metas Corporativas: Facilita o cumprimento de relatórios e compromissos institucionais de eficiência ambiental.

🛠️ Ecossistema de Adoção e Ferramental de Transição   
Muitas cargas de trabalho modernas exigem pouca ou nenhuma alteração de código-fonte para funcionarem em Arm:
- Compatibilidade Nativa: Linguagens interpretadas (Python, Node.js, Ruby) e compiladas modernas (Go, Java, .NET Core) possuem suporte maduro para a arquitetura.
- Ferramentas de Diagnóstico: Recursos como o Graviton Portability Advisor e guias de migração simplificam a identificação de dependências de hardware.

📈 Painel de Economia do AWS Graviton (Graviton Savings Dashboard)   
Ferramenta centralizada para avaliação de potencial de economia financeira e esforço técnico de migração:
- Visibilidade Consolidada: Consolida dados de consumo entre múltiplas contas e regiões em uma interface unificada.
- Projeções Baseadas no CUR: Utiliza os dados reais do Relatório de Custos e Uso (Cost and Usage Report) cruzados com as APIs de precificação pública da AWS para calcular a economia real estimada.
- Análise por Serviço Gerenciado: Identifica oportunidade de transição direta em serviços como Amazon RDS, Amazon ElastiCache e Amazon OpenSearch.
- Classificação por Complexidade: Categoriza as instâncias em "Normalmente Fácil" ou "Requer Planejamento Adicional", priorizando o plano de engenharia da equipe.

🏆 Estudo de Caso: Honeycomb.io   
A empresa de observabilidade de software Honeycomb.io migrou a totalidade de suas cargas de trabalho de testes para instâncias C6g (Graviton2):
- Redução da Frota: Reduziu o número de servidores ativos em 35% em comparação com o uso anterior de instâncias C5 (x86).
- Ganho Operacional: A redução da quantidade física de nós simplificou rotinas de manutenção, janelas de atualização e aplicação de patches de segurança.

<a name="item01.03"><h4>1.3 Graviton-based EC2 Instances</h4></a>[Back to summary](#item01)

🏷️ Nomenclatura e Decodificação de Instâncias EC2   
A nomenclatura das instâncias do Amazon EC2 traduz suas especificações de hardware por meio de uma combinação de série, geração, opções de arquitetura e tamanho (como no exemplo C7gn.2xlarge):

- Séries Primárias:
  - C: Computação Otimizada.
  - D / I / Im / Is: Armazenamento Otimizado (com diferentes proporções de memória por vCPU).
  - F / G / P / VT: Computação Acelerada (FPGAs, GPUs e processamento de vídeo).
  - Hpc: Computação de Alto Desempenho.
  - Inf / Trn: Aceleradores dedicados de IA (AWS Inferentia e AWS Trainium).
  - M: Propósito Geral.
  - Mac: Ambientes macOS.
  - R / U / X: Memória Otimizada e Intensiva.
  - T: Desempenho com Capacidade de Expansão (Burstable).
- Sufixos de Opções e Atributos de Hardware:
  - a: Processadores AMD.
  - g: Processadores AWS Graviton.
  - i: Processadores Intel.
  - b: Otimização de desempenho para armazenamento em bloco (EBS).
  - d: Armazenamento de instância local anexado (Instance Store NVMe).
  - e: Capacidade expandida de memória ou armazenamento.
  - flex: Modalidades de instâncias flexíveis.
  - n: Otimização avançada de rede e EBS.
  - q: Aceleradores de inferência Qualcomm.
  - z: Processadores de alta frequência.

🧩 Famílias de Instâncias Equipadas com AWS Graviton   
Os processadores Graviton integram diversas séries de instâncias do EC2 para atender a requisitos específicos de aplicação com foco no custo-benefício:
- Propósito Geral (Série M): Modelos como M7g e M6g entregam equilíbrio entre processamento, memória e rede, sendo indicados para servidores de aplicação, microsserviços e ambientes de cache.
- Computação Otimizada (Série C): Séries como C7g e C6g processam tarefas intensivas em CPU, como computação de alto desempenho (HPC), transcodificação de mídia, processamento em lote e inferência de IA baseada em CPU.
- Memória Otimizada (Séries R e X): Variantes como R7g e X2gd oferecem elevada proporção de memória RAM por vCPU, sendo voltadas para bancos de dados, análises em tempo real e estruturas in-memory.
- Expansível (Série T): A família T4g disponibiliza capacidade de processamento com desempenho básico e capacidade de picos (bursts), sendo adequada para microsserviços, desktops virtuais e sites de tráfego moderado.
- Computação Acelerada (Série G): A série G5g combina processadores Graviton com GPUs NVIDIA para gráficos, processamento de vídeo e aprendizado de máquina.
- Armazenamento Otimizado (Série I): Modelos como I4g, Im4gn e Is4gen associam o Graviton a SSDs AWS Nitro para baixíssima latência de E/S, atendendo a bancos de dados NoSQL, bancos relacionais e motores de análise como Apache Spark.
- Computação de Alto Desempenho (Série HPC): A família Hpc7g utiliza processadores Graviton3E e suporte a Elastic Fabric Adapter (EFA) para suportar dinâmicas de fluidos, modelagem molecular e previsões meteorológicas.
- Rede Otimizada (Série N): Instâncias como C7gn e C6gn fornecem largura de banda de rede estendida para dispositivos virtuais, análise massiva de dados e inferência de IA.

<a name="item01.04"><h4>1.4 AI Acceleration on Graviton</h4></a>[Back to summary](#item01)

🤖 AWS Graviton em Cargas de Trabalho de Inteligência Artificial e ML   
Os processadores AWS Graviton consolidaram-se como uma plataforma robusta para a execução de cargas de trabalho de Inteligência Artificial (IA) e Aprendizado de Máquina (ML). A arquitetura Arm otimizada combina alto desempenho computacional, previsibilidade de latência e eficiência energética, reduzindo substancialmente o custo de operações em escala.

⚡ Vantagens Arquiteturais para IA/ML   
O design das gerações recentes do Graviton foi aprimorado para atender às demandas de redes neurais complexas e modelos de linguagem:
- Unidades Vetoriais SIMD: Recursos avançados de processamento vetorial acelera a execução em paralelo de multiplicações matriciais e convoluções.
- Alta Largura de Banda de Memória: Acesso rápido à memória reduz gargalos no tráfego de dados durante a movimentação de tensores.
- Latência Previsível: Variação mínima nos tempos de resposta, garantindo consistência no tempo de processamento (jitter reduzido) em ambientes de produção.
- Eficiência Energética: Desempenho por watt otimizado que reduz custos operacionais de data centers e diminui o impacto ambiental.

🎯 Foco em Inferência de Aprendizado Profundo   
Embora o treinamento intensivo de grandes modelos costume utilizar aceleradores dedicados (como GPUs, AWS Trainium ou Inferentia), o Graviton destaca-se na inferência em produção — a fase em que o modelo treinado faz previsões sobre novos dados:
- Aceleração via NEON: Instruções especializadas para visão computacional e Processamento de Linguagem Natural (NLP).
- Eficiência Financeira: Menor custo por requisição para serviços voltados ao usuário final que demandam alta volumetria.
- Formatos de Precisão: Suporte nativo para operações em precisão reduzida (como FP16 e INT8), acelerando o processamento de inferência sem perda significativa de acurácia.

🛠️ Ecossistema de Software e Suporte ao Amazon SageMaker   
A AWS e a comunidade open-source otimizaram as principais bibliotecas para a arquitetura Arm:
- Frameworks Otimizados: Suporte nativo e otimizações de compilação em TensorFlow, PyTorch, MXNet e na Arm Compute Library.
- Imagens Pré-configuradas: Ambientes em contêineres e AMIs prontas com kits de ferramentas de ML compilados para Arm.
- Integração com Amazon SageMaker: Suporte nativo em pipelines de preparação de dados, desenvolvimento, processamento em lote e endpoints de inferência, permitindo selecionar instâncias Graviton diretamente no fluxo de trabalho.

🌐 Casos de Uso em Tempo Real   
A estabilidade de latência e o baixo custo do Graviton viabilizam aplicações de IA de grande escala:
- Sistemas de Recomendação: Personalização de conteúdo e produtos em tempo real com baixa latência.
- Detecção de Fraudes: Análise imediata de transações financeiras sob padrões rígidos de tempo de resposta.
- Processamento de Linguagem Natural (NLP): Análise de sentimento, tradução automática e categorização de texto.
- Visão Computacional e Moderação: Análise em lote ou fluxo contínuo de dados de imagem e vídeo.

<a name="item01.05"><h4>1.5 Key Takeaways</h4></a>[Back to summary](#item01)

🚀 Visão Geral e Vantagens Consolidadas do AWS Graviton   
Os processadores AWS Graviton oferecem uma combinação de otimização financeira, sustentabilidade e compatibilidade para cargas de trabalho executadas no Amazon EC2.

💡 Principais Benefícios Operacionais   
- Relação Custo-Benefício: Proporcionam até 40% mais eficiência de custo em comparação a instâncias equivalentes de arquiteturas x86 (Intel/AMD).
- Eficiência Energética: Consomem até 60% menos energia para a mesma capacidade computacional, auxiliando em metas corporativas de sustentabilidade (ESG).
- Suporte Ampliado a Cargas de Trabalho: Excelência no processamento de servidores web, microsserviços, bancos de dados de código aberto, caches em memória, servidores de jogos, Electronic Design Automation (EDA), HPC, transcodificação de vídeo e análise de dados em tempo real.
- Compatibilidade e Ecossistema:
  - Suporte nativo nas principais distribuições Linux (Amazon Linux, Red Hat, Ubuntu).
  - Disponibilidade imediata de imagens de contêiner para arm64 no Docker Hub.
  - Execução direta de linguagens interpretadas e recompilação simples para linguagens compiladas.
  - Certificação de softwares de terceiros através do programa Graviton Ready.

🗂️ Diversidade de Famílias de Instâncias   
A arquitetura Graviton atende a múltiplos perfis de hardware no ecossistema EC2:
- Propósito Geral: Séries M9g (e variantes com NVMe local M9gd).
- Computação Otimizada: Séries C8g e C8gd.
- Memória Otimizada: Séries R8g, R8gd e X8g.
- Armazenamento Otimizado: Série I8g.
- Desempenho Expansível (Burstable): Família T4g.
- Rede Otimizada: Série C7gn (alta taxa de transferência de rede).
- Computação Acelerada: Série G5g (combinação com GPUs NVIDIA).
- Acesso Direto: Disponibilidade de opções Bare-Metal para controle direto do hardware.

🌐 Disponibilidade e Suporte à Adoção   
- Alcance Global: Infraestrutura distribuída e disponível em praticamente todas as Regiões da AWS.
- Assistência Técnica: Programas de suporte direto da AWS para validação de compatibilidade, otimização de arquitetura e planejamento de migração.