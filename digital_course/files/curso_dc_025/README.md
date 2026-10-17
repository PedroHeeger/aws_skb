# Amazon EC2 Basics   <img src="./0-aux/logo_course.png" alt="curso_dc_025" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_025 (Amazon EC2 Basics)   <img src="./0-aux/logo_course.png" alt="curso_dc_025" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/261013_dc_025_en.pdf">Certificate</a>

---

### Theme:
- Cloud Computing
- Compute

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - AWS Compute Optimizer   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_compute_optimizer.jpg" alt="aws_compute_optimizer" width="auto" height="25">
  - AWS Cost Explorer  <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_cost_explorer.webp" alt="aws_cost_explorer" width="auto" height="25">
  - AWS Personal Health Dashboard; AWS Health Dashboard  <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_personal_health_dashboard.png" alt="aws_personal_health_dashboard" width="auto" height="25">
  - AWS Pricing Calculator   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_pricing_calculator.png" alt="aws_pricing_calculator" width="auto" height="25">
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
1. <a href="#item01">Section 0: Course Introduction and Scenario</a><br>
  1.1 <a href="#item01.01">Introduction</a><br>
  1.2 Course Scenario<br>
2. <a href="#item02">Section 1: Working with Amazon EC2 Instances</a><br>
  2.1 <a href="#item02.01">Amazon EC2 Instance Families</a><br>
  2.2 <a href="#item02.02">Selecting the Correct Instance Type</a><br>
3. <a href="#item03">Section 2: Balancing Cost and Performance</a><br>
  3.1 <a href="#item03.01">Amazon EC2 Instance Families</a><br>
  3.2 <a href="#item03.02">The Value of Performance</a><br>
4. <a href="#item04">Section 3: Working with Tools</a><br>
  4.1 <a href="#item04.01">Available Tools</a><br>
5. <a href="#item05">Section 4: Staying Updated</a><br>
  5.1 <a href="#item05.01">Advantages of Updating Instance Types</a><br>
6. <a href="#item06">Section 5: Course Summary and Additional Resources</a><br>
  6.1 <a href="#item06.01">Scenario Summary</a><br>

---

### Objective:
O curso teve como objetivo orientar a escolha e o dimensionamento correto de instâncias no Amazon EC2. Foram abordadas as cinco famílias de instâncias e suas convenções de nomenclatura, as opções de processadores (Intel, AMD e Graviton), as práticas de right-sizing e os modelos de compra (Sob Demanda, Spot, RIs e Savings Plans), além do uso do AWS Compute Optimizer e Cost Explorer para análise de desempenho e redução de custos.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Section 0: Course Introduction and Scenario</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Introduction</h4></a>[Back to summary](#item01)

🖥️ Visão Geral do Amazon EC2   
O Amazon Elastic Compute Cloud (Amazon EC2) constitui a infraestrutura fundamental de processamento na Amazon Web Services (AWS), servindo de sustentação para a implantação de aplicações web e suporte a diversos outros serviços da plataforma. A seleção adequada de instâncias exige a análise detalhada das famílias de máquinas disponíveis e das demandas específicas de cada carga de trabalho, visando a otimização contínua da relação entre custo e desempenho operacional. Acompanhar a evolução e o lançamento de novos tipos de instâncias garante a adoção de arquiteturas mais eficientes e economicamente viáveis.

🎯 Objetivos de Aprendizagem   
- Categorização das famílias de instâncias EC2 e identificação dos cenários de uso adequados para cada perfil de processamento.
- Seleção estratégica do tipo de instância com foco no equilíbrio ideal entre performance e investimento financeiro.
- Avaliação dos benefícios técnicos e econômicos associados à atualização constante para as gerações mais recentes de instâncias.

<a name="item02"><h4>Section 1: Working with Amazon EC2 Instances</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Amazon EC2 Instance Families</h4></a>[Back to summary](#item02)

🧱 Conceitos Fundamentais do Amazon EC2   
Uma instância do Amazon EC2 representa uma máquina virtual criada no ambiente de nuvem da AWS. Durante a sua inicialização, o perfil do hardware virtual é definido pela escolha do tipo de instância, que especifica a capacidade de processamento, memória, armazenamento e rede alocados do servidor físico subjacente.

A capacidade computacional das instâncias é mensurada em vCPUs (unidades centrais de processamento virtual), onde cada vCPU corresponde, na maioria dos casos, a uma thread de execução de um núcleo físico. O dimensionamento e o alinhamento dessas capacidades determinam a eficiência operacional de cada ambiente.

🗂️ Categorização das Famílias de Instâncias   
As instâncias são agrupadas em famílias direcionadas a cenários específicos de uso, subdividindo-se em subfamílias de acordo com a arquitetura do processador e o tipo de armazenamento empregado:
- Propósito Geral: Garantem o equilíbrio proporcional entre recursos de CPU, memória e rede. São indicadas para cargas de trabalho diversificadas com consumo uniforme, como servidores web e repositórios de código. Incluem também as instâncias expansíveis (família T), projetadas para operar a um custo reduzido sob demanda moderada, com capacidade de elevar temporariamente o desempenho de CPU durante picos de utilização.
- Computação Otimizada: Destinadas a aplicações com uso intensivo de processamento que demandam CPUs de alta performance. Adequadas para processamento em lote, transcodificação de mídia, servidores web de alto tráfego, modelagem científica, motores de jogos e inferência de aprendizado de máquina.
- Memória Otimizada: Projetadas para entregar alto rendimento no processamento de grandes conjuntos de dados executados diretamente na memória RAM.
- Armazenamento Otimizado: Focadas em cargas de trabalho que exigem leitura e escrita sequencial em grandes volumes de dados locais, oferecendo elevada taxa de operações de entrada e saída por segundo (IOPS) com baixa latência.
- Computação Acelerada: Utilizam coprocessadores e aceleradores de hardware (como GPUs, FPGAs ou AWS Inferentia) para a execução paralela de tarefas complexas, incluindo cálculos de ponto flutuante, processamento gráfico e reconhecimento de padrões.

🏷️ Nomenclatura e Atributos de Hardware   
A nomenclatura de uma instância traduz sua arquitetura técnica por meio da combinação de família, geração, atributos e tamanho (por exemplo, m5zn). A primeira letra indica a família principal; o número subsequente representa a geração do hardware, na qual valores mais altos sinalizam tecnologias mais recentes com melhor custo-benefício.

Sufixos alfabéticos adicionais identificam características específicas de hardware e otimização:
- a: Processadores AMD.
- g: Processadores AWS Graviton.
- i: Processadores Intel.
- d: Armazenamento local anexado (instance store).
- n: Recursos avançados de rede com alta taxa de transferência.
- b: Otimização de desempenho para volumes de armazenamento em bloco.
- e: Capacidade expandida de memória ou armazenamento.
- z: Processadores de alta frequência para processamento em núcleo único.

📏 Dimensionamento e Métricas de Capacidade   
O tamanho da instância (variando de nano até 32xlarge) define a escala total de recursos alocados. Conforme o tamanho se expande, a oferta de vCPUs, memória e largura de banda cresce proporcionalmente ao foco da família correspondente.

Na medição de memória e armazenamento, adota-se o Gibibyte (GiB), baseado em potências de dois (1024^3 bytes), em vez do Gigabyte (GB), baseado em potências de dez (1000^3 bytes). Essa distinção métrica garante precisão no dimensionamento e na alocação de recursos em ambientes de grande escala.

<a name="item02.02"><h4>2.2 Selecting the Correct Instance Type</h4></a>[Back to summary](#item02)

🎯 Dimensionamento Adequado (Right-Sizing)   
O dimensionamento adequado consiste no alinhamento contínuo entre as especificações dos recursos de computação e as reais necessidades de desempenho da carga de trabalho. O objetivo principal é eliminar desperdícios financeiros resultantes do superdimensionamento de infraestrutura, mantendo a capacidade operacional necessária sem comprometer a performance.

Na migração para a nuvem, o erro comum de replicar a arquitetura física local resulta em subutilização de hardware e custos desnecessários. Como a infraestrutura em nuvem é flexível, o dimensionamento deve ser tratado como um processo contínuo de análise e readequação de capacidade.

🔄 Flexibilidade e Mudança de Instâncias   
A escolha inicial de uma instância não é permanente. O Amazon EC2 permite reconfigurar tamanhos e famílias conforme as demandas da aplicação evoluem:
- Ajuste de Capacidade: Alteração para tamanhos maiores ou menores dentro da mesma família para responder a variações de tráfego.
- Troca de Arquitetura: Migração entre diferentes famílias de instâncias ou gerações de processadores (Intel, AMD e ARM Graviton) para otimização de custo e ganho de eficiência.
- Atualização Tecnológica: Adoção de gerações de instâncias mais recentes para obter recursos avançados e melhor relação custo-benefício.

Muitas alterações de dimensionamento exigem apenas a interrupção momentânea da instância para a troca do perfil de hardware, enquanto outras abordagens envolvem a implantação de um novo ambiente e a posterior migração da aplicação.

💡 Estudo de Caso: Otimização com AWS Graviton e Instâncias Spot   
A viabilidade técnica de readequação de instâncias é demonstrada na otimização de ambientes de processamento de logs e dados em tempo real:
- Substituição de Arquitetura: A transição de instâncias de propósito geral ou otimizadas para memória para a família de processadores baseados em ARM (AWS Graviton) proporciona redução expressiva nos custos operacionais com ganho em estabilidade.
- Uso de Capacidade Ociosa: A combinação de arquiteturas eficientes com o modelo de Instâncias Spot permite aproveitar capacidades computacionais não utilizadas da AWS com reduções drásticas nos valores de cobrança em relação ao modelo Sob Demanda.
- Adequação por Carga de Trabalho: Tarefas de escalabilidade horizontal e processamento contínuo de fluxos de dados beneficiam-se diretamente do equilíbrio entre custo e performance oferecido por processadores dedicados.

<a name="item03"><h4>Section 2: Balancing Cost and Performance</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Amazon EC2 Instance Families</h4></a>[Back to summary](#item03)

🌐 Benefícios Econômicos da Computação em Nuvem   
A transição da infraestrutura física para a nuvem fundamenta-se na diluição de custos operacionais e no ganho de flexibilidade. A consolidação da demanda de múltiplos clientes permite que os provedores de nuvem alcancem expressivas economias de escala, resultando em custos variáveis inferiores aos praticados em data centers tradicionais.

Esse modelo transforma investimentos substanciais em capital (Capex) em despesas operacionais variáveis (Opex), eliminando a necessidade de estimar capacidades futuras antes da implantação de projetos. A flexibilidade do ambiente viabiliza o provisionamento e o encerramento instantâneo de recursos, acelerando o ciclo de desenvolvimento de software e permitindo a expansão global de aplicações para múltiplas regiões em minutos.

💳 Modelos de Opções de Compra e Precificação do Amazon EC2   
O Amazon EC2 oferece diferentes estruturas tarifárias voltadas à otimização financeira conforme a previsibilidade e a natureza de cada carga de trabalho:
- Sob Demanda (On-Demand): Cobrança por segundo ou hora sem a exigência de compromissos de longo prazo ou pagamentos antecipados. Modelo indicado para aplicações de curta duração, cargas de trabalho imprevisíveis, testes e ambientes em desenvolvimento inicial.
- Instâncias Spot: Aquisição de capacidade computacional ociosa da AWS com descontos expressivos em relação ao modelo Sob Demanda. Modalidade voltada para tarefas tolerantes a interrupções, processamentos em lote, análises de dados e execuções de baixa prioridade.
- Planos de Economia (Savings Plans): Modelo baseado no compromisso de um valor fixo de uso horário (mensurado em USD/hora) por um período de 1 ou 3 anos. Divide-se em:
  - Compute Savings Plans: Oferecem aplicação automática do desconto sobre o uso do Amazon EC2, AWS Fargate e AWS Lambda, independentemente de região, família de instâncias, sistema operacional ou tipo de processador.
  - EC2 Instance Savings Plans: Concedem os maiores descontos mediante o compromisso com uma família específica de instâncias em uma região determinada, mantendo a flexibilidade de alteração entre tamanhos e sistemas operacionais.
- Instâncias Reservadas (Reserved Instances - RIs): Concessão de descontos faturados com base em compromissos de 1 ou 3 anos para capacidades contínuas. A opção Padrão oferece os maiores descontos para cargas de uso constante; a opção Conversível permite a alteração de famílias e arquiteturas. Diferenciam-se por garantirem reserva de capacidade quando associadas a uma Zona de Disponibilidade específica e pela possibilidade de revenda do contrato sobressalente no mercado secundário da AWS.
- Hosts Dedicados (Dedicated Hosts): Alocação de um servidor físico inteiramente dedicado a um único cliente. Indicado para o atendimento de requisitos rígidos de conformidade e segurança, bem como para o aproveitamento de licenças de software corporativas vinculadas ao hardware (BYOL). Podem ser contratados Sob Demanda ou por Reserva.

<a name="item03.02"><h4>3.2 The Value of Performance</h4></a>[Back to summary](#item03)

⚖️ Equilíbrio entre Desempenho e Custo no Provisionamento   
A escolha do tipo de instância ideal exige uma análise detalhada da relação entre performance e custo. O provisionamento excessivo resulta em desperdício financeiro por recursos subutilizados, enquanto o subdimensionamento compromete o desempenho e a estabilidade da aplicação.

Analisar a arquitetura da carga de trabalho permite identificar se ela é limitada por CPU ou memória. Em determinados cenários, a adoção de instâncias mais potentes reduz o tempo total de processamento e diminui o custo final de execução. Além disso, a consolidação de ambientes e o encerramento de recursos ociosos são práticas fundamentais para conter gastos desnecessários.

🚀 Atualização Tecnológica e Seleção Estratégica   
Optar por instâncias de gerações mais recentes traz vantagens financeiras e operacionais significativas:
- Hardware Otimizado: Instâncias modernas utilizam componentes mais rápidos e eficientes, oferecendo maior capacidade de processamento por um custo menor em comparação a gerações antigas.
- Disponibilidade de Recursos: Gerações atuais possuem maior oferta de capacidade na infraestrutura da AWS, reduzindo gargalos de alocação.
- Relação Custo-Benefício: A escolha pela opção de menor valor nominal em hardware antigo pode resultar em custos mais elevados a longo prazo devido ao tempo prolongado de execução e ao desempenho inferior.

📍 Impacto da Localização Geográfica nos Custos   
A seleção da Região da AWS onde as instâncias serão implantadas afeta diretamente a performance e a estrutura tarifária do ambiente:
- Experiência do Usuário: A proximidade física entre o ambiente de computação e os usuários finais reduz a latência e melhora a velocidade de resposta da aplicação.
- Variação Regional de Preços: Os custos dos serviços variam entre as diferentes regiões devido a fatores operacionais locais, impostos e custos de infraestrutura.
- Planejamento Financeiro: Quando a latência não é um fator crítico, a alocação de cargas de trabalho em regiões com tarifas mais reduzidas representa uma estratégia eficiente de otimização de orçamento.

<a name="item04"><h4>Section 3: Working with Tools</h4></a>[Back to summary](#item04)

<a name="item04.01"><h4>4.1 Available Tools</h4></a>[Back to summary](#item04)

📊 AWS Compute Optimizer   
O AWS Compute Optimizer é um serviço de recomendação acionado por aprendizado de máquina que analisa as configurações de infraestrutura e o histórico de utilização de recursos para sugerir otimizações de custo e desempenho. Sem custo adicional por padrão, a ferramenta avalia métricas do Amazon CloudWatch coletadas nos últimos 14 dias para identificar padrões de carga de trabalho e inferir o comportamento dos ambientes sob diferentes perfis de hardware.

🚦 Categorias de Classificação de Instâncias   
A análise realizada pelo serviço enquadra as instâncias EC2 em quatro status operacionais:
- Subprovisionado: Indica que ao menos um recurso (CPU, memória, rede ou throughput do EBS) não atende às demandas da aplicação, resultando em gargalos e perda de desempenho.
- Provisionado em Excess: Sinaliza que a capacidade de hardware pode ser reduzida sem impacto na carga de trabalho, identificando custos desnecessários de infraestrutura.
- Otimizado: Confirma que as especificações do servidor atendem com precisão às necessidades computacionais com a melhor relação custo-benefício, podendo sugerir atualizações para gerações mais recentes de hardware.
- Nenhum: Notifica a ausência de recomendações por falta de histórico mínimo de métricas (menos de 30 horas de execução ou 12 horas de ativação do serviço) ou por incompatibilidade do tipo de instância.

As recomendações geradas pelo Compute Optimizer podem ser exportadas para o Amazon S3 e integradas nativamente ao AWS Cost Explorer e ao AWS Systems Manager, exibindo estimativas de economia, nível de risco de desempenho e grau de esforço para a migração.

🧮 Calculadora de Preços da AWS (AWS Pricing Calculator)   
A Calculadora de Preços da AWS é uma ferramenta web de planejamento que permite estimar os custos de arquiteturas na nuvem antes da implantação ou durante a expansão de projetos existentes.

A ferramenta fornece transparência financeira ao detalhar as fórmulas e premissas por trás dos cálculos de cada serviço. As estimativas podem ser organizadas hierarquicamente em grupos alinhados à estrutura do projeto e exportadas nos formatos CSV e PDF, além de permitirem o compartilhamento via links salvos nos servidores da AWS.

📈 AWS Cost Explorer   
O AWS Cost Explorer é uma interface gráfica para visualização, análise e projeção de custos e consumo de recursos. A ferramenta disponibiliza o histórico financeiro dos últimos 12 meses e gera previsões de gastos para os 12 meses subsequentes.

🔍 Funcionalidades e Relatórios Padrão   
- Recomendações de Dimensionamento (Right-Sizing): Identifica instâncias EC2 ociosas ou subutilizadas em todas as contas da organização, apontando oportunidades imediatas de redução de despesas via encerramento ou readequação de tamanho.
- Relatórios Financeiros Pré-definidos: Exibe visões consolidando custos diários, gastos mensais por conta vinculada, consumo discriminado por serviço da AWS e horas de execução de Instâncias Reservadas.
- Planejamento de Reservas: Avalia o perfil de consumo contínuo para recomendar a compra de Instâncias Reservadas e Planos de Economia.

📏 Cotas de Serviço do Amazon EC2 (Service Quotas)   
O Amazon EC2 impõe limites padrão de alocação de recursos por Região e por conta da AWS, abrangendo componentes como instâncias, volumes EBS, imagens (AMIs) e snapshots. Esse mecanismo previne o provisionamento acidental de infraestrutura excessiva e garante a estabilidade do ambiente. Os limites atuais são consultáveis pelo Console de Gerenciamento da AWS, permitindo a solicitação direta de aumento de cota conforme a necessidade da operação.

<a name="item05"><h4>Section 4: Staying Updated</h4></a>[Back to summary](#item05)

<a name="item05.01"><h4>5.1 Advantages of Updating Instance Types</h4></a>[Back to summary](#item05)

🚀 Vantagens Tecnológicas e Econômicas das Novas Gerações   
A evolução constante da infraestrutura do Amazon EC2 permite que novas gerações de instâncias entreguem desempenho superior com custos operacionais reduzidos. Diferente do mercado de hardware tradicional, no qual novos lançamentos costumam apresentar valores mais elevados, a AWS aplica ganhos de escala e eficiência operacional para reduzir continuamente as tarifas dos seus serviços.

Instâncias de gerações mais recentes incorporam processadores de maior velocidade, arquiteturas de memória otimizadas e maior largura de banda de rede. Essa evolução permite que as cargas de trabalho sejam concluídas em menos tempo, resultando na diminuição da quantidade total de recursos computacionais consumidos e na redução do Custo Total de Propriedade (TCO).

🔄 Motivações para Redimensionamento e Atualização   
A migração de uma carga de trabalho para outro tipo ou geração de instância deve ocorrer de forma planejada, fundamentada em critérios técnicos e operacionais:
- Evolução da Aplicação: Alterações no perfil de consumo do software, como a transição de um padrão intensivo em memória para uma demanda mista de CPU e memória.
- Lançamento de Hardware Atualizado: Disponibilização de uma nova geração na mesma família de instâncias, oferecendo melhor relação custo-benefício.
- Otimização Especializada: Surgimento de famílias de instâncias projetadas para tipos específicos de processamento, como computação de alto desempenho (HPC) ou análise avançada de dados.
- Readequação Financeira: Otimização contínua do dimensionamento para evitar recursos ociosos após mudanças nos requisitos de negócios.

📢 Monitoramento de Atualizações e Saúde da Infraestrutura   
Para acompanhar lançamentos tecnológicos e manter a estabilidade operacional, a AWS disponibiliza mecanismos de acompanhamento contínuo:
- O que há de novo na AWS (What's New with AWS): Serviço de notificações e feeds de notícias que informa lançamentos de novos tipos de instâncias, recursos de serviços e expansões geográficas de regiões em tempo real.
- Painel de Saúde da AWS (AWS Health Dashboard): Central de informações que exibe o status de funcionamento da infraestrutura e alertas personalizados relativos à conta. A ferramenta permite monitorar eventos ocorridos nos últimos 7 dias, detalhando serviços impactados, horários de início e término, regiões, zonas de disponibilidade afetadas e instruções para mitigação.

<a name="item06"><h4>Section 5: Course Summary and Additional Resources</h4></a>[Back to summary](#item06)

<a name="item06.01"><h4>6.1 Scenario Summary</h4></a>[Back to summary](#item06)

📌 Síntese da Arquitetura e Gestão do Amazon EC2   
A escolha e a administração eficiente do Amazon EC2 fundamentam-se no alinhamento contínuo entre os requisitos operacionais da aplicação e a capacidade computacional provisionada na nuvem.

🧩 Estrutura de Instâncias e Nomenclatura   
- Famílias de Instâncias: Agrupadas segundo a especialização de hardware em Propósito Geral, Computação Otimizada, Memória Otimizada, Armazenamento Otimizado e Computação Acelerada.
- Decodificação de Nomes: O identificador de uma instância (como c6.small) sintetiza sua especificação técnica, onde a letra inicial indica a família (c para computação), o numeral representa a geração da instância (6) e o sufixo aponta a escala de recursos alocados (small).

🎯 Dimensionamento Adequado e Evolução Tecnológica   
- Processo de Right-Sizing: Consiste em adequar a escala de recursos às demandas reais de processamento, eliminando gastos com capacidades subutilizadas e garantindo a estabilidade operacional.
- Flexibilidade e Readequação: A infraestrutura em nuvem permite migrar entre famílias, tamanhos e arquiteturas de processadores sem a necessidade de substituição física de hardware.
- Adoção de Novas Gerações: A avaliação contínua e a atualização para instâncias mais recentes asseguram ganhos de desempenho e redução do Custo Total de Propriedade (TCO).

🛠️ Ecossistema de Governança e Otimização   
- AWS Compute Optimizer: Ferramenta de análise preditiva baseada em aprendizado de máquina para identificação de gargalos e oportunidades de redução de custos.
- AWS Cost Explorer: Interface para gestão financeira, acompanhamento de histórico de gastos, previsão de consumo e recomendações de dimensionamento.
- Calculadora de Preços da AWS: Mecanismo de simulação e planejamento orçamentário para modelagem de arquiteturas antes do provisionamento.
- AWS Health Dashboard: Central de monitoramento da disponibilidade de serviços e eventos de infraestrutura impactantes na conta.