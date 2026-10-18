# Amazon EBS Getting Started   <img src="./0-aux/logo_course.png" alt="curso_dc_026" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_026 (Amazon EBS Getting Started)   <img src="./0-aux/logo_course.png" alt="curso_dc_026" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/261014_dc_026_en.pdf">Certificate</a>

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
  - Amazon Elastic Block Store (EBS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ebs.svg" alt="aws_ebs" width="auto" height="25">
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
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
  1.1 <a href="#item01.01">Introduction to Amazon EBS</a><br>
  1.2 <a href="#item01.02">Architecture and Use Cases</a><br>
2. <a href="#item02">Amazon EBS Demonstrations</a><br>
  2.1 <a href="#item02.01">How to Use Amazon EBS</a><br>

---

### Objective:
O curso teve como objetivo apresentar o **Amazon EBS** para armazenamento de bloco persistente e de alto desempenho no **Amazon EC2**. Foram abordadas as categorias de volumes SSD e HDD, os mecanismos de redundância, criptografia (**AWS KMS**) e snapshots incrementais, além da gestão de custos e comandos práticos no Console AWS para provisionamento, redimensionamento dinâmico via Elastic Volumes e backup/recuperação de dados.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introduction</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Introduction to Amazon EBS</h4></a>[Back to summary](#item01)

💾 Conceitos Fundamentais do Amazon EBS   
O Amazon Elastic Block Store (Amazon EBS) é um serviço de armazenamento em bloco de alto desempenho projetado para uso com o Amazon EC2. Ele disponibiliza volumes virtuais que se comportam como discos rígidos brutos, permitindo a formatação com qualquer sistema de arquivos e a alocação flexível de dados.

Os volumes EBS possuem um ciclo de vida independente das instâncias às quais estão conectados. Essa arquitetura garante a persistência de dados, permitindo que as informações permaneçam intactas mesmo após a interrupção ou o encerramento dos servidores virtuais.

🛠️ Solução para Desafios de Infraestrutura   
O Amazon EBS resolve limitações estruturais associadas ao armazenamento de aplicações em nuvem:
- Persistência de Dados: Garante que arquivos e configurações sobrevivam ao desligamento das instâncias (volumes não raiz mantêm os dados por padrão).
- Gestão Flexível de Capacidade: Permite expandir o tamanho dos volumes ou alterar seus perfis sem interromper a execução do ambiente.
- Previsibilidade de Desempenho: Oferece taxas constantes e ajustáveis de operações de entrada e saída por segundo (IOPS) e throughput.
- Proteção Contra Falhas: Minimiza os riscos de indisponibilidade por meio de redundância interna na mesma Zona de Disponibilidade.

⚡ Principais Benefícios e Categorização de Volumes   
O serviço disponibiliza diferentes tipos de armazenamento para atender a requisitos variados de custo e performance:
- Alta Disponibilidade e Durabilidade: Desenhado para oferecer durabilidade anual de até 99,999999999% no perfil io2 Block Express e entre 99,8% e 99,9% nos demais tipos de volume.
- Volumes baseados em SSD:
  - Uso Geral (gp2 / gp3): Equilíbrio ideal entre custo e desempenho para a maioria das cargas de trabalho.
  - IOPS Provisionadas (io1 / io2): Focados em aplicações críticas com uso intensivo de E/S que demandam taxas elevadas e sustentadas de IOPS.
- Volumes baseados em HDD:
  - HDD Otimizado para Throughput (st1): Projetado para cargas de trabalho de streaming e grandes volumes de dados acessados frequentemente.
  - HDD Frio (sc1): Opção de menor custo para dados acessados raramente.
- Snapshots e Backups: Permite a criação de cópias de segurança pontuais armazenadas de forma incremental, nas quais apenas os blocos alterados geram novas cobranças.
- Segurança Integrada: Suporte a criptografia para dados em repouso e em trânsito utilizando chaves gerenciadas ou personalizadas via AWS KMS.

🏷️ Modelo de Precificação   
A cobrança do Amazon EBS baseia-se no modelo de pagamento conforme o uso (pay-as-you-go), considerando fatores específicos de alocação:
- Capacidade Provisionada: Cobrança pelo volume de armazenamento reservado (mensurado em GiB/mês), independentemente do espaço efetivamente ocupado pelos arquivos.
- Desempenho Adicional: Tarifas aplicadas conforme o provisionamento de IOPS e throughput acima dos limites padrão nos volumes compatíveis.
- Retenção de Snapshots: Valores calculados estritamente pelo espaço utilizado pelos blocos alterados acumulados nas cópias de segurança.
- Transferência de Dados: Custos associados à replicação geográfica de snapshots entre diferentes Regiões da AWS.

<a name="item01.02"><h4>1.2 Architecture and Use Cases</h4></a>[Back to summary](#item01)

🔗 Integração do Amazon EBS no Ecossistema AWS   
O Amazon Elastic Block Store (Amazon EBS) atua como camada de armazenamento primária conectada a instâncias EC2 via rede dedicada de alta velocidade. Sua arquitetura integra-se nativamente a diversos serviços para viabilizar segurança, monitoramento e automação:
- Amazon CloudWatch: Acompanhamento de métricas operacionais em tempo real (operações de leitura e escrita, tamanho de filas e status de integridade) com configuração de alarmes e ações automatizadas.
- AWS CloudFormation: Provisionamento e gestão de volumes e anexos por meio de declaração estruturada como código (IaC).
- AWS Backup e Amazon Data Lifecycle Manager (DLM): Automação centralizada de rotinas de criação, retenção e expiração de snapshots baseadas em políticas corporativas.
- AWS KMS (Key Management Service): Criptografia ponta a ponta para dados em repouso e em trânsito entre o servidor e os volumes anexados.
- AWS IAM: Controle granular de acesso para operações de criação, modificação, anexo e exclusão de recursos.
- Lixeira do Amazon EBS (Recycle Bin): Proteção contra exclusões acidentais de snapshots e AMIs, permitindo a recuperação de dados dentro de um período de retenção pré-definido.

🛠️ Conceitos Técnicos Fundamentais   
A gestão e dimensionamento do Amazon EBS fundamentam-se em métricas e recursos de arquitetura específicos:
- IOPS (Operações de Entrada e Saída por Segundo): Métrica que define a quantidade máxima de leituras e escritas individuais suportadas pelo volume por segundo.
- Throughput (Taxa de Transferência): Volume máximo de dados transferidos por unidade de tempo, mensurado em Mebibytes por segundo (MiB/s).
- Volumes Elásticos (Elastic Volumes): Capacidade de alterar dinamicamente o tamanho, a taxa de IOPS, a largura de banda ou o tipo do volume sem interromper a execução da aplicação.
- Instâncias Otimizadas para EBS: Perfil de hardware EC2 com banda de rede dedicada exclusivamente ao tráfego de armazenamento, eliminando contenção com a rede principal.

🎯 Casos de Uso Típicos   
O Amazon EBS atende a cenários organizacionais que demandam armazenamento persistente e ajustável:
- Bancos de Dados Empresariais: Suporte a motores de missão crítica (Oracle, SQL Server, MySQL, PostgreSQL) que exigem baixa latência e alto desempenho contínuo por meio de volumes SSD (io1 / io2 Block Express).
- Sistemas de Inicialização (Boot Volumes): Armazenamento durável do sistema operacional e configurações da aplicação para instâncias EC2, garantindo a preservação do estado após interrupções.
- Aplicações em Contêineres (ECS / EKS): Persistência de dados além do ciclo de vida dos contêineres, com suporte ao recurso Multi-Attach no io2 para acesso simultâneo por múltiplos nós.
- Computação de Alto Desempenho (HPC) e Big Data: Processamento de fluxos intensivos de dados e análises sequenciais utilizando volumes HDD otimizados para taxa de transferência (st1).

📋 Práticas de Governança e Operação   
A sustentação de ambientes baseados em Amazon EBS exige a aplicação de diretrizes contínuas de gestão:
- Estratégia de Recuperação e Cópia Geográfica: Configuração de réplicas automáticas de snapshots entre diferentes Regiões da AWS para suporte a planos de continuidade de negócios e conformidade regulatória.
- Inicialização Acelerada de Volumes: Uso de taxa de transferência provisionada para eliminar a latência de leitura inicial (pre-warming) ao restaurar grandes volumes a partir de snapshots.
- Otimização de Custos e Rastreabilidade: Implementação de etiquetas (tags) para alocação de despesas por projeto, revisão de volumes orfãos no AWS Cost Explorer e automação de rotinas via AWS Systems Manager.

<a name="item02"><h4>Amazon EBS Demonstrations</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 How to Use Amazon EBS</h4></a>[Back to summary](#item02)

🚀 Procedimentos Práticos de Uso do Amazon EBS   
A operação do Amazon Elastic Block Store (Amazon EBS) envolve o ciclo de vida completo dos recursos de armazenamento: desde o provisionamento inicial associado a instâncias do Amazon EC2 até tarefas de cópia de segurança, redimensionamento, restauração e descontinuação.

🛠️ Provisionamento de Instâncias e Anexo de Volumes   
Durante a inicialização de um servidor virtual, é possível configurar múltiplos discos EBS para atender a diferentes necessidades da arquitetura:
- Volume de Inicialização (Root Volume): Contém o sistema operacional e configurações de boot. O padrão de inicialização pode ser ajustado para otimizar o tempo de subida do ambiente.
- Volumes Adicionais de Dados: Unidades secundárias anexadas para armazenar arquivos de aplicação ou bancos de dados.
- Controle de Acesso e Segurança: Restrição de acesso ao servidor via pares de chaves SSH e configuração de regras de firewall (Security Groups) direcionadas a IPs específicos.

📸 Criação e Gestão de Snapshots   
Os snapshots representam backups pontuais e incrementais armazenados no Amazon S3:
- Procedimento de Cópia: A geração do snapshot é solicitada diretamente a partir do menu de volumes no console do EC2, atribuindo uma descrição para identificação e rastreamento.
- Consistência de Dados: Para garantir a integridade dos arquivos durante a cópia, recomenda-se pausar temporariamente as gravações no sistema de arquivos ou interromper a instância.

📏 Redimensionamento Dinâmico de Volumes (Elastic Volumes)   
O recurso de Elastic Volumes permite expandir a capacidade de armazenamento de um volume em execução sem causar indisponibilidade do serviço:
- Regra de Expansão Apenas: É possível somente aumentar a capacidade do volume (GiB). Para reduzir o tamanho de armazenamento, é necessário criar um novo volume menor e migrar os dados manualmente.
- Extensão do Sistema de Arquivos: O aumento do volume no nível do EBS disponibiliza o novo espaço bruto. Para utilizar a capacidade adicional, é obrigatório executar comandos no sistema operacional (Linux ou Windows) para estender a partição e o sistema de arquivos.
- Janela de Modificação: Alterações de tamanho aplicam restrições temporárias: deve-se aguardar um intervalo de pelo menos 6 horas entre modificações no mesmo volume. O tempo de conclusão do processo pode variar de minutos a horas.

🔄 Restauração e Criação de Volumes a partir de Snapshots   
A recuperação de dados ou a replicação de ambientes é realizada a partir de snapshots existentes:
- Geração de Novo Volume: A partir do snapshot selecionado, define-se o tipo de volume, o tamanho desejado e a Zona de Disponibilidade de destino.
- Taxa de Inicialização (Fast Snapshot Restore): Recurso opcional para acelerar o tempo de leitura dos blocos recuperados do S3, garantindo desempenho máximo imediato ao novo volume.

🧹 Limpeza de Recursos e Controle de Custos   
Para evitar cobranças indesejadas por armazenamento e capacidade computacional ociosa, a desativação de ambientes deve seguir uma sequência específica de dependências:
- Desanexo de Volumes: Volumes em uso devem ser primeiramente desconectados da instância. Se o volume estiver bloqueado, a instância associada precisa ser parada (Stopped) ou encerrada (Terminated).
- Exclusão de Volumes e Snapshots: A remoção definitiva de volumes e cópias de segurança exige a confirmação explícita no console para evitar apagamentos acidentais.
- Encerramento da Instância: O encerramento definitivo (Termination) do servidor elimina a máquina virtual e liberta as cotas de computação associadas.