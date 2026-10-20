# AWS Compute Services Overview   <img src="./0-aux/logo_course.png" alt="curso_dc_028" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_028 (AWS Compute Services Overview)   <img src="./0-aux/logo_course.png" alt="curso_dc_028" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/261020_dc_028_en.pdf">Certificate</a>

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
  - Amazon Elastic Container Service (ECS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ecs.svg" alt="aws_ecs" width="auto" height="25">
  - Amazon Elastic Kubernetes Service (EKS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_eks.png" alt="aws_eks" width="auto" height="25">
  - Amazon Lightsail   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_lightsail.svg" alt="aws_lightsail" width="auto" height="25">
  - AWS Batch   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_batch.svg" alt="aws_batch" width="auto" height="25">
  - AWS Elastic Beanstalk   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_elastic_beanstalk.svg" alt="aws_elastic_beanstalk" width="auto" height="25">
  - AWS Lambda   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_lambda.svg" alt="aws_lambda" width="auto" height="25">
  - AWS Step Functions   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_step_functions.svg" alt="aws_step_functions" width="auto" height="25">
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
1. <a href="#item01">Section 1: AWS Compute Options</a><br>
  1.1 <a href="#item01.01">Course Scenario</a><br>
  1.2 <a href="#item01.02">AWS Compute Options</a><br>
  1.3 <a href="#item01.03">Defining Serverless Computing</a><br>
2. <a href="#item02">Benefits and Use Cases of IAM</a><br>
  2.1 <a href="#item02.01">Compute Types and Features</a><br>
  2.2 <a href="#item02.02">Choosing a Compute Option for your Workload</a><br>
  2.3 <a href="#item02.03">Additional Compute Options</a><br>
3. <a href="#item03">Section 3: Summary and Additional Resources</a><br>
  3.1 <a href="#item03.01">Scenario Summary</a><br>

---

### Objective:
O curso teve como objetivo guiar a escolha das opções de computação da AWS (Amazon EC2, Contêineres com ECS/EKS e Serverless com AWS Lambda/Fargate) com base nas características das aplicações. Foram analisados fatores como nível de controle de infraestrutura, arquitetura (monolítica vs. microsserviços/orientada a eventos), tempos de execução e portabilidade, além de serviços de suporte como AWS Step Functions, AWS Batch, Elastic Beanstalk e Amazon Lightsail.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Section 1: AWS Compute Options</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Course Scenario</h4></a>[Back to summary](#item01)

🎬 Introdução ao Estudo de Caso de Serviços de Computação   
O módulo introduz uma abordagem orientada a cenários práticos para analisar e diferenciar as ofertas de computação da Amazon Web Services (AWS). A dinâmica acompanha a transição profissional de um gestor de programas focado no planejamento e modernização de infraestruturas tecnológicas.

🎯 Desafios e Objetivos de Aprendizagem   
O estudo de caso estrutura a jornada de aprendizado em torno das decisões estratégicas necessárias para a migração de ambientes locais (on-premises) para a nuvem:
- Arquitetura de Nuvem Resiliente: Compreensão dos conceitos fundamentais de computação para projetar ambientes de alta disponibilidade e tolerância a falhas.
- Otimização de Custos e Desempenho: Avaliação das diversas opções computacionais da AWS para alinhar o consumo de recursos às exigências orçamentárias e operacionais das aplicações.
- Planejamento de Migração: Identificação dos perfis de carga de trabalho e seleção do modelo de computação mais adequado para cada cenário de transição.
- Mentoria Técnica: Acompanhamento guiado por liderança técnica para estruturação progressiva dos conceitos operacionais da plataforma AWS.

<a name="item01.02"><h4>1.2 AWS Compute Options</h4></a>[Back to summary](#item01)

💡 Conceito Fundamental de Computação na Nuvem   
No contexto de TI, computação define o conjunto de recursos de processamento, memória e capacidade gráfica necessários para executar aplicações e resolver problemas de software. Na nuvem, esses recursos são disponibilizados via internet sob demanda, substituindo limitações físicas locais por infraestruturas escaláveis e elásticas.

A elasticidade permite que ambientes expandam ou reduzam sua capacidade automaticamente em resposta a picos de tráfego (como eventos de e-commerce), garantindo disponibilidade operacional e cobrando estritamente pelos recursos consumidos.

🏗️ As Três Categorias Primárias de Computação na AWS   
A AWS organiza suas ofertas de processamento em três pilares principais, cada um voltado a diferentes níveis de controle, padronização e gerenciamento de infraestrutura:
- Computação Baseada em Instâncias (Amazon EC2):
  - Conceito: Fornece máquinas virtuais (instances) configuráveis, que atuam como servidores virtuais completos com controle total sobre o sistema operacional e arquitetura.
  - Recursos: Permite alocar combinações personalizadas de vCPUs (medidas em frações de núcleo) e memória RAM (em bytes), adequando a capacidade a cargas de trabalho específicas.
- Serviços de Contêineres (Amazon ECS e Amazon EKS):
  - Conceito: Empacotam o código da aplicação, suas dependências e configurações em unidades isoladas que compartilham o kernel do sistema operacional host, garantindo consistência entre ambientes de desenvolvimento e produção.
  - Amazon ECS (Elastic Container Service): Serviço nativo da AWS para orquestração e execução de contêineres em clusters gerenciados.
  - Amazon EKS (Elastic Kubernetes Service): Serviço gerenciado compatível com o padrão open-source Kubernetes para automação de implantação, escalonamento e gestão de contêineres.
- Computação Sem Servidor (Serverless - AWS Lambda):
  - Conceito: Modelo que permite a execução de código acionado por eventos sem a necessidade de provisionar, gerenciar ou manter servidores ou sistemas operacionais.
  - Cobrança e Escalonamento: A infraestrutura escala automaticamente de forma transparente, ocorrendo cobrança estritamente pelo tempo de execução do código e pela memória alocada durante o processamento.

<a name="item01.03"><h4>1.3 Defining Serverless Computing</h4></a>[Back to summary](#item01)

☁️ Abstração na Computação Sem Servidor (Serverless)   
A computação sem servidor eleva o nível de abstração na nuvem ao ocultar não apenas a infraestrutura física, mas também o gerenciamento de instâncias e sistemas operacionais.

Embora servidores físicos continuem existindo, toda a responsabilidade de provisionamento, manutenção, aplicação de patches de segurança e escalabilidade é transferida para a AWS. Isso permite que equipes de desenvolvimento concentrem esforços exclusivamente na escrita de código e em regras de negócio, acelerando o ciclo de inovação e reduzindo o TCO (Total Cost of Ownership).

📊 Comparativo das Modalidades de Computação na AWS   
A escolha do modelo computacional adequado depende do nível de controle e da responsabilidade operacional desejada sobre a infraestrutura:
- Instâncias (Amazon EC2):
  - Modelo de Responsabilidade: Fornece controle total sobre o ambiente virtual. A AWS gerencia o hardware físico subjacente, enquanto o usuário é responsável por escolher CPU, memória, sistema operacional, chaves de acesso, segurança e atualizações de software.
  - Cobrança: Faturamento contínuo baseado no tempo em que a instância permanece no estado executando (running), independentemente de estar ociosa.
- Contêineres (Amazon ECS e Amazon EKS):
  - Portabilidade: Empacotam a aplicação juntamente com todas as suas dependências (bibliotecas, executáveis e arquivos de configuração), garantindo comportamento idêntico em qualquer ambiente host.
  - Flexibilidade de Execução: Podem ser executados sobre instâncias gerenciadas do EC2 ou em modelo serverless com o AWS Fargate (que elimina a necessidade de provisionar, configurar ou dimensionar clusters e instâncias físicas).
- Computação Sem Servidor (AWS Lambda):
  - Execução Baseada em Eventos: O código é acionado automaticamente em resposta a requisições de usuários ou eventos de outros serviços da AWS, sem necessidade de servidores pré-provisionados.
  - Cobrança Granular: Cobrança estrita pela duração do processamento e quantidade de memória consumida durante a execução do código (sem custos enquanto não houver requisições).

<a name="item02"><h4>Benefits and Use Cases of IAM</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Compute Types and Features</h4></a>[Back to summary](#item02)

🎯 Análise Comparativa e Critérios de Seleção de Computação AWS   
A escolha do modelo computacional ideal exige o alinhamento das características técnicas e operacionais da aplicação com os pontos fortes de cada categoria de serviço.

🖥️ Instâncias Virtuais (Amazon EC2)   
O Amazon EC2 é indicado para cargas de trabalho que exigem controle total do ambiente operacional, persistência de estado e processamento contínuo.
- Acesso e Governança Granular: Controle de nível raiz (root/administrator) sobre o sistema operacional, drivers, atualizações e pilha de software.
- Diversidade de Perfis: Mais de 500 tipos de instâncias organizadas em famílias otimizadas para uso geral, computação, memória, armazenamento e processamento acelerado.
- Sustentação de Cargas Contínuas: Ideal para sistemas de longa duração com pipelines de execução extensos (que ultrapassam dezenas de minutos ou horas) e dependência de estado mantido na máquina.
- Alta Disponibilidade e Flexibilidade: Acordo de Nível de Serviço (SLA) garantido de até 99,99%, com suporte a modelos de aquisição variáveis (Sob Demanda, Reservadas e Spot).

📦 Serviços de Contêineres (Amazon ECS e Amazon EKS)   
Os contêineres fornecem empacotamento padronizado para arquiteturas baseadas em microsserviços, oferecendo portabilidade entre ambientes e tempos de inicialização reduzidos.
- Portabilidade Sem Dependências: O código é encapsulado com todas as suas bibliotecas e configurações, garantindo comportamento idêntico do ambiente de desenvolvimento à produção.
- Livre de Limites de Tempo e Tamanho: Não impõem restrições de tempo limite de execução (timeout), sendo adequados para processos que excedem 15 minutos de processamento ou exigem inicialização instantânea sem a latência de subida de VMs.
- Modernização de Aplicações: Facilita a decomposição de sistemas monolíticos legados em partes menores, mais escaláveis e isoladas.

⚡ Computação Sem Servidor (Serverless - AWS Lambda)   
O AWS Lambda é voltado para arquiteturas sem estado, acionadas por eventos, eliminando completamente a gestão de infraestrutura.
- Foco Exclusivo no Código: A AWS gerencia o provisionamento, aplicação de patches, escalonamento e alta disponibilidade entre múltiplas Zonas de Disponibilidade.
- Execução Orientada a Eventos: Acionamento automático a partir de alterações de estado, requisições de API ou integrações com outros serviços da AWS.
- Restrição Temporal Estrita: Limite máximo de execução de 15 minutos por invocação. Cargas de trabalho que excedam esse período devem ser direcionadas para contêineres (ECS/EKS) ou instâncias (EC2).
- Cobrança por Uso Real: Faturamento estrito pelo tempo de computação e memória consumidos por milissegundo durante a execução, sem custos por tempo ocioso.

<a name="item02.02"><h4>2.2 Choosing a Compute Option for your Workload</h4></a>[Back to summary](#item02)

🎯 Mapeamento de Cargas de Trabalho e Critérios de Decisão   
A seleção da solução de computação ideal exige a análise combinada do design da aplicação, dos padrões de uso e dos requisitos operacionais. Decisões arquiteturais fundamentadas em dados de testes e benchmarks garantem eficiência de desempenho e otimização de custos na AWS.

🖥️ Cenários Indicados para Amazon EC2   
O Amazon EC2 é a escolha ideal para aplicações que exigem controle direto do ambiente e suporte a arquiteturas de rede ou armazenamento complexas.

- Características Favoráveis:
- Controle de Infraestrutura: Requisito de acesso aos arquivos de sistema, personalizações do sistema operacional e controle total de permissões raiz.
- Aplicações de Longa Duração e com Estado (Stateful): Sistemas que mantêm sessões contínuas em memória ou dependem de armazenamento persistente diretamente conectado (em bloco ou arquivo).
- Demandas Computacionais Elevadas: Cargas de trabalho que necessitam de capacidade previsível e dedicada de CPU e memória, aproveitando instâncias com perfis especializados (computação, memória ou armazenamento otimizados).
- Topologias Complexas: Ambientes que exigem configurações avançadas de segurança, roteamento de rede e integração nativa com diversos serviços da AWS.

📦 Cenários Indicados para Contêineres (Amazon ECS e Amazon EKS)   
A adoção de contêineres beneficia ecossistemas baseados em microsserviços, acelera ciclos de implantação e viabiliza a migração de aplicações sem alteração de código (Lift-and-Shift).

- Características Favoráveis:
- Decomposição de Monólitos: Divisão de aplicações grandes e complexas em partes independentes (microsserviços), isolando atualizações e reduzindo o impacto de falhas.
- Processamento Intensivo de Curta Duração: Módulos que exigem alto poder computacional e terminam a execução em menos de 15 minutos, mas que superam os limites do AWS Lambda.
- Necessidade de Escalabilidade Rápida: Ambientes que demandam criação e destruição instantânea de processos para responder a picos de tráfego.
- Migração Transparente: Transferência de aplicações complexas para a nuvem sem a necessidade de reescrever o código-fonte.

- Recomendações de Acompanhamento (Pontos de Atenção):
- Dependência de Armazenamento Persistente: A necessidade de persistência de dados adiciona complexidade de configuração e reduz a portabilidade natural do contêiner.
- Dependências de Rede e Segurança Rígidas: Topologias com requisitos complexos de roteamento dificultam a movimentação fluida de contêineres entre ambientes (desenvolvimento, homologação e produção).

⚡ Cenários Indicados para Computação Sem Servidor (AWS Lambda)   
O modelo serverless é voltado para arquiteturas modulares, orientadas a eventos e com foco exclusivo no código de aplicação.

- Características Favoráveis:
- Aplicações Modulares e Leves: Execução de tarefas simples e focadas, como chatbots, APIs RESTful ou manipulação de listas.
- Arquiteturas Orientadas a Eventos: Fluxos acionados por alterações de estado em outros serviços (como o carregamento de um arquivo no Amazon S3 que dispara um processamento).
- Execução Rápida e Sem Estado (Stateless): Cargas de trabalho pontuais com tempo de resposta curto que não excedem o limite máximo de 15 minutos por invocação.
- Foco em Código e Automação: Equipes que priorizam testes e implantações frequentes sem a necessidade de gerenciar instâncias ou atualizar sistemas operacionais.

🧩 Resumo Estruturado das Opções de Computação   
- Amazon EC2: Servidores virtuais que oferecem controle granular sobre a infraestrutura e suportam qualquer tipo de carga de trabalho.
- Amazon ECS / Amazon EKS: Gerenciadores de contêineres que podem ser executados em instâncias EC2 gerenciadas ou em infraestrutura serverless utilizando o AWS Fargate.
- AWS Lambda: Serviço computacional serverless para execução de código sem estado acionado estritamente por gatilhos e eventos.

<a name="item02.03"><h4>2.3 Additional Compute Options</h4></a>[Back to summary](#item02)

🏛️ O Amazon EC2 como Alicerce do Ecossistema AWS   
O Amazon EC2 atua como a infraestrutura computacional fundamental sobre a qual a vasta maioria dos serviços da Amazon Web Services é construída e executada. Mesmo em arquiteturas abstratas, como soluções baseadas em contêineres (Amazon ECS e Amazon EKS), o EC2 permanece como a opção de sustentação que oferece controle granular completo sobre instâncias, redes e hipervisores.

⚡ Orquestração Serverless: AWS Lambda e AWS Step Functions   
A computação sem servidor permite a execução de aplicações desvinculadas da gestão de infraestrutura física ou virtual:
- Funções AWS Lambda: Unidades de código independentes e sem estado (stateless) acionadas por eventos (como o carregamento de arquivos no Amazon S3). O serviço escala automaticamente o número de execuções conforme a taxa de eventos recebidos, cobrando estritamente pelo tempo de processamento consumido.
- AWS Step Functions: Servico de orquestração visual totalmente gerenciado que coordena componentes distribuídos e funções Lambda em fluxos de trabalho passo a passo. O serviço gerencia o estado da aplicação, trata exceções automaticamente, executa retentativas e permite diagnosticar falhas sem a necessidade de reescrever o código de infraestrutura.

🛠️ Serviços Especializados de Computação e Implantação   
A AWS disponibiliza plataformas otimizadas para atender a diferentes perfis de desenvolvimento, processamento e maturidade operacional:

🔄 Processamento em Lote: AWS Batch   
- Automação de Trabalhos: Planeja, agenda e executa trabalhos computacionais em escala (como processamento ETL, pipelines de HPC e redes de deep learning) sem intervenção manual.
- Gestão Dinâmica de Recursos: Dimensiona automaticamente a capacidade de CPU, GPU e memória utilizando instâncias EC2 (incluindo Spot) ou a plataforma serverless AWS Fargate.

🚀 Plataforma de Aplicação: AWS Elastic Beanstalk   
- Implantação Simplificada: Serviço PaaS (Plataforma como Serviço) no qual o desenvolvedor fornece o pacote de código e o serviço gerencia o provisionamento, balanceamento de carga (Elastic Load Balancing), Auto Scaling e monitoramento da integridade.
- Suporte Multi-Linguagem e Controle: Suporta linguagens como Java, Python, Node.js e .NET. Não possui custo adicional e garante acesso direto aos recursos subjacentes do EC2 para personalizações.

🌐 Servidores Virtuais Privados: Amazon Lightsail   
- Simplicidade e Custos Previsíveis: Solução VPS projetada para cargas de trabalho simples, sites e aplicações web de menor escala.
- Pacotes Pré-configurados: Fornece instâncias com pilhas de software prontas (WordPress, LAMP) e preços mensais fixos, incluindo rede, armazenamento e DNS. Permite migração simplificada para o Amazon EC2 à medida que a aplicação cresce.

🎯 Seleção de Arquitetura por Perfil de Carga de Trabalho   
A escolha do ambiente computacional deve priorizar a velocidade de lançamento no mercado (time-to-market) e o alinhamento com as habilidades da equipe:
- Início do Zero e Foco Exclusivo na Regra de Negócio: Adoção de arquitetura totalmente serverless (AWS Lambda, Amazon API Gateway, Step Functions) para eliminar a gestão de servidores e código de infraestrutura.
- Uso de Contêineres ou Processamento > 15 Minutos: Adoção de Amazon ECS ou Amazon EKS executados sobre AWS Fargate (para eliminar o gerenciamento de clusters e nós virtuais).
- Aplicações Monolíticas Tradicionais e Controle de Servidor: Uso do AWS Elastic Beanstalk para acelerar a implantação de frameworks web (Django, Laravel, Rails) mantendo controle sobre o ambiente do EC2.

<a name="item03"><h4>Section 3: Summary and Additional Resources</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Scenario Summary</h4></a>[Back to summary](#item03)

🎯 Consolidação da Estratégia de Migração de Cargas de Trabalho   
A alocação de cargas de trabalho na Nuvem AWS exige a análise das características arquiteturais de cada aplicação para garantir o melhor equilíbrio entre desempenho, escalabilidade e facilidade de manutenção.

📦 Adoção do Amazon ECS (Serviço de Contêineres)   
Para três aplicações específicas do ecossistema local, a solução baseada em contêineres foi definida como a mais adequada.
- Foco Operacional: Capacitação prévia das equipes de TI no gerenciamento de contêineres para facilitar a transição e a sustentação do novo ambiente.
- Benefícios Práticos: Padronização do empacotamento, facilidade na implantação e melhor aproveitamento dos recursos de infraestrutura.

⚡ Implementação com AWS Lambda (Computação Sem Servidor)   
Sistemas atuais e futuros com perfil modular foram direcionados para a arquitetura serverless.
- Orquestração de Processos: Integração com o AWS Step Functions para gerenciar fluxos de trabalho complexos e coordenar a execução de múltiplos serviços da AWS.
- Automação e Escala: Substituição de tarefas operacionais manuais por rotinas automáticas ativadas por eventos, acelerando o tempo de lançamento de novos produtos no mercado (time-to-market).

🖥️ Migração para o Amazon EC2 (Instâncias Virtuais)   
Sistemas com dependências legadas e requisitos rígidos de infraestrutura foram mantidos em instâncias virtuais personalizadas.
- Acesso Granular ao Sistema: Requisito de acesso direto aos arquivos de sistema e suporte a sistemas operacionais específicos.
- Topologias Complexas: Aplicações que demandam arquiteturas avançadas de rede, mecanismos específicos de replicação de dados e tempo de processamento contínuo e prolongado.
- Capacidade de Expansão: Aproveitamento dos recursos de dimensionamento rápido do EC2 para responder a aumentos de demanda na aplicação.