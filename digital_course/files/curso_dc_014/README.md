# AWS Systems Manager Getting Started   <img src="./0-aux/logo_course.png" alt="curso_dc_014" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_014 (AWS Systems Manager Getting Started)   <img src="./0-aux/logo_course.png" alt="curso_dc_014" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260822_dc_014_en.pdf">Certification</a>
#### <a href="">Prática</a>

---

### Theme:
- Cloud Computing
- Systems Administrator

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - AWS Systems Manager (SSM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ssm.png" alt="aws_ssm" width="auto" height="25">
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
  1.1 <a href="#item01.01">Introduction to Systems Manager</a><br>
  1.2 <a href="#item01.02">Arquitetura e casos de uso</a><br>
2. <a href="#item02">Using Systems Manager</a><br>
  2.1 <a href="#item02.01">Como faço para registrar uma instância do EC2 como Systems Manager?</a><br>
  2.2 <a href="#item02.02">Como faço para verificar patches em um nó gerenciado e instalar sob demanda?</a><br>
  2.3 <a href="#item02.03">Como faço para programar instalações de patches em um nó gerenciado?</a><br>
  2.4 <a href="#item02.04">Como faço para me conectar com segurança a um nó gerenciado com o Systems Manager?</a><br>
  2.5 <a href="#item02.05">Como posso usar o Systems Manager com o AWS CLI?</a><br>
  2.6 <a href="#item02.06">Como faço para remover os recursos usados neste curso?</a><br>

---

### Objective:
O curso teve como objetivo apresentar o AWS Systems Manager como uma solução centralizada para o gerenciamento, automação e governança de recursos em ambientes de nuvem e híbridos. Foram abordados os quatro pilares do serviço (Gerenciamento de Operações, Aplicações, Mudanças e Nós), integrando recursos como Patch Manager, State Manager, Session Manager, Run Command e Parameter Store. Além disso, foram demonstradas as rotinas de configuração via console e AWS CLI para o registro de instâncias, execução sob demanda e agendamento de correções, acesso remoto seguro sem portas de entrada abertas e exclusão de recursos.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introduction</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Introduction to Systems Manager</h4></a>[Back to summary](#item01)

⚙️ Visão Geral do AWS Systems Manager
O AWS Systems Manager é uma solução de gerenciamento ponta a ponta projetada para ambientes de nuvem e infraestruturas híbridas. Sua função principal é centralizar a visibilidade e o controle operacional, simplificando a administração de recursos e reduzindo o tempo de detecção e resolução de problemas em larga escala. A ferramenta realiza a varredura contínua de instâncias gerenciadas para garantir conformidade com políticas de segurança e aplicar ações corretivas automatizadas.

A plataforma permite a criação de grupos lógicos de recursos organizados por aplicação, ambiente ou camada de infraestrutura. A partir dessa agregação, é possível monitorar alterações de configuração, históricos de chamadas de API, alertas operacionais, inventário de software e estado de patches em serviços como Amazon EC2, Amazon RDS, Amazon ECS e Amazon EKS.

🛠️ Pilares de Funcionalidades   
O ecossistema do AWS Systems Manager divide-se em quatro áreas principais de atuação:
- Gerenciamento de Operações: Agrupa recursos e centraliza a investigação e resolução de itens de trabalho operacionais.
- Gerenciamento de Aplicações: Viabiliza o controle e o acompanhamento de softwares implantados na infraestrutura.
- Gerenciamento de Mudanças: Executa alterações em recursos de forma rastreável, auditável e segura.
- Gerenciamento de Nós: Administra instâncias Amazon EC2, servidores on-premises, máquinas virtuais em outras nuvens e dispositivos de borda.

🚀 Capacidades Operacionais   
A plataforma oferece um conjunto integrado de recursos técnicos para a execução de rotinas administrativas:
- Agrupamento e Organização: Categorização de recursos por critérios personalizados, como projeto, unidade de negócio, região ou ciclo de vida.
- Automação via Runbooks: Execução e agendamento de rotinas operacionais por meio de documentos declarativos (SSM Documents).
- Acesso Remoto Seguro: Conexão direta a instâncias sem a necessidade de abertura de portas de entrada no firewall ou gerenciamento de chaves SSH.
- Gerenciamento de Parâmetros: Armazenamento centralizado e seguro de dados de configuração e segredos, separando credenciais do código das aplicações.
- Inventário Automático: Coleta contínua de metadados de software, configurações de rede e estado dos sistemas operacionais.
- Auditoria e Conformidade: Painéis para verificação de níveis de patch, atualização de antivírus e aplicação de regras de firewall.

💡 Benefícios Técnicos   
A adoção do Systems Manager otimiza a operação de TI em diversos aspectos estruturais:
- Detecção Rápida de Incidentes: Consolidação de métricas e dados operacionais em um único painel, eliminando a navegação entre múltiplos consoles.
- Redução de Erro Humano: Substituição de intervenções manuais por fluxos automatizados com controles de pausa em caso de falha.
- Suporte a Ambientes Híbridos: Adoção de um agente unificado para administrar sistemas Windows e Linux rodando na AWS, em datacenters locais ou em provedores concorrentes.
- Governança Continuada: Integração nativa com o AWS Config para rastreamento de mudanças e auditoria de estado ao longo do tempo.

💰 Estrutura de Custos   
O modelo de precificação do AWS Systems Manager baseia-se no consumo individual de cada funcionalidade. Não há exigência de pagamentos antecipados ou taxas mínimas. A precificação varia conforme o recurso utilizado, contando com opções integradas ao nível gratuito da AWS e cobrança sob demanda calculável via AWS Pricing Calculator.

<a name="item01.02"><h4>1.2 Arquitetura e casos de uso</h4></a>[Back to summary](#item01)

🏛️ Arquitetura e Componentes do AWS Systems Manager   
O AWS Systems Manager provê mecanismos para controle, governança e configuração de nós gerenciados — classe de ativos que inclui instâncias Amazon EC2, servidores on-premises, dispositivos de borda e máquinas virtuais em ambientes multicloud. A interoperabilidade com esses nós exige a execução do SSM Agent, um software open-source responsável por interpretar os comandos da plataforma e aplicar as mudanças no sistema operacional.

O ecossistema divide suas capacidades arquiteturais em frentes operacionais integradas:
- Acesso e Execução: O Session Manager viabiliza conexões interativas criptografadas via terminal (navegador ou CLI) sem abertura de portas de entrada, uso de bastion hosts ou gestão de chaves SSH. Para ações pontuais em escala, o Run Command executa tarefas administrativas simultâneas na frota sem necessidade de login manual.
- Gerenciamento de Mudanças e Estado: O State Manager garante a conformidade contínua da infraestrutura por meio de associações que definem o estado desejado dos recursos. Complementarmente, o Change Manager estrutura os fluxos operacionais corporativos de solicitação, aprovação e implantação de alterações de infraestrutura.
- Manutenção de Patches: O Patch Manager automatiza a aplicação de correções de segurança e atualizações em sistemas operacionais e aplicações, validando o nível de conformidade frente a regras predefinidas.
- Orquestração e Dados: A execução de rotinas complexas ocorre via SSM Documents (incluindo runbooks de Automation). Para a persistência de segredos e dados de configuração, o Parameter Store armazena informações em texto simples ou criptografadas por chave de KMS.

🚦 Resposta a Incidentes e Gestão Operacional   
A resolução de falhas operacionais é centralizada pela combinação de ferramentas de observabilidade e automação. Alarmes do Amazon CloudWatch e eventos do Amazon EventBridge acionam a criação automática de itens de trabalho (OpsItems) no OpsCenter, permitindo a investigação contextual do recurso afetado.

Quando ocorrem interrupções críticas, o Incident Manager executa planos de resposta pré-configurados. A ferramenta gerencia o escalonamento da equipe de plantão, inicia canais de comunicação, disponibiliza dados contextuais para triagem e sugere runbooks de remediação automatizada para restabelecer a operação e apoiar análises pós-incidente.

⚙️ Conceitos Técnicos Fundamentais   
A operação do Systems Manager fundamenta-se nos seguintes artefatos e abstrações:
- Nó Gerenciado: Qualquer servidor ou máquina virtual com o SSM Agent instalado e registrado no serviço.
- OpsItem: Registro unificado no OpsCenter contendo metadados, métricas e histórico de alarmes sobre um problema operacional.
- Linha de Base de Patch (Patch Baseline): Conjunto de regras que define quais atualizações são aprovadas automaticamente com base em categoria, severidade ou tempo do lançamento.
- Associação do State Manager: Configuração vinculada a um grupo de nós que força o cumprimento de diretrizes (ex: instalação de antivírus ou fechamento de portas) em intervalos programados.
- Documentos SSM: Arquivos declarativos (JSON ou YAML) que contêm instruções para ações de configuração, scripts Python/PowerShell ou fluxos de automação.
- Parâmetros: Chaves cadastradas no Parameter Store para consulta centralizada por scripts e pipelines, evitando o hardcoding de credenciais.

🔗 Integração com o Ecossistema e Ferramentas Externas   
O Systems Manager consolida dados de auditoria e governança ao integrar-se nativamente a serviços como AWS Config, AWS CloudTrail e AWS Audit Manager. Para validação de resiliência e continuidade, atua em conjunto com o AWS Resilience Hub e o AWS Fault Injection Simulator, permitindo validar metas de RTO e RPO por meio de testes de injeção de falhas e automações do SSM.

O suporte a ferramentas de terceiros ocorre via AWS Service Management Connector, estabelecendo integração bidirecional com plataformas ITSM como ServiceNow e Jira Service Desk. Além disso, a disponibilidade de APIs abertas permite a conexão com sistemas legados ou pipelines personalizados da organização.

🎯 Casos de Uso Práticos   
- Manutenção Automatizada de Patches: Varredura e aplicação contínua de correções de segurança em frotas híbridas Linux e Windows sem intervenção manual.
- Acesso Seguro e Auditável: Substituição de conexões SSH/RDP tradicionais por sessões criptografadas e registradas no CloudTrail.
- Padronização de Imagens e Ambientes: Bootstrapping de instâncias na inicialização, inclusão automatizada em domínios Active Directory e aplicação de ferramentas de configuração como Ansible e Chef.
- Centralização Operacional: Monitoramento consolidado de métricas e conformidade em múltiplas contas e regiões por meio do painel do Explorer.

<a name="item02"><h4>Using Systems Manager</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Como faço para registrar uma instância do EC2 como Systems Manager?</h4></a>[Back to summary](#item02)

🚀 Provisionamento e Registro de Nós Gerenciados   
O processo de integração de instâncias Amazon EC2 ao AWS Systems Manager exige o provisionamento dos ativos de computação e a aplicação de uma estrutura de suporte ao gerenciamento, como o Quick Setup. Essa rotina garante a associação do agente às diretrizes do serviço e viabiliza ações de inventário, correção de vulnerabilidades e acesso remoto seguro.

🛠️ Procedimento de Implantação e Configuração   
O fluxo operacional para inicializar instâncias e associá-las ao painel administrativo compreende as seguintes etapas:
- Lançamento de Instâncias de Computação: A partir do console do Amazon EC2, realiza-se o provisionamento de dois nós distintos em uma mesma VPC e com suporte a acesso SSH/RDP:
  - Um nó baseado no sistema operacional Linux (Amazon Linux 2 AMI, tipo de instância t2.micro).
  - Um nó baseado no sistema operacional Windows (Microsoft Windows Server 2019 Base, tipo de instância t2.micro).
- Habilitação do Gerenciamento Automatizado: No console do AWS Systems Manager, utiliza-se a funcionalidade Quick Setup acionando a opção Host Management. As definições padrão de configuração devem ser mantidas para garantir a aplicação automática de políticas básicas de governança.
- Associação de Alvos (Targets): Na etapa de definição de escopo, seleciona-se a região personalizada (Custom Region), escolhendo a atribuição manual para marcar e adicionar explicitamente as duas instâncias criadas.

🔍 Validação e Inspeção de Inventário   
Após a conclusão da implantação do Quick Setup, a confirmação da comunicação do SSM Agent com a plataforma é realizada no painel do Fleet Manager:
- Acesse o Fleet Manager para visualizar a lista de nós gerenciados ativos.
- Selecione a instância Linux registrada.
- Navegue através do menu de ações do nó (Node Actions) em direção aos detalhes (View details) e selecione a aba Inventory para inspecionar os metadados de software, rede e sistema operacional coletados pelo serviço.

<a name="item02.02"><h4>2.2 Como faço para verificar patches em um nó gerenciado e instalar sob demanda?</h4></a>[Back to summary](#item02)

🔍 Detecção e Aplicação Sob Demanda de Patches   
O AWS Systems Manager Patch Manager permite realizar varreduras de vulnerabilidades e aplicar correções de software sob demanda em instâncias gerenciadas. A execução compreende duas etapas principais: a auditoria para identificação de atualizações pendentes e a instalação efetiva dos pacotes de correção com reinicialização controlada dos nós.

⚙️ Fluxo Operacional de Correção   
O procedimento técnico no console do AWS Systems Manager para verificação e correção sob demanda é realizado na seguinte sequência:
- Varredura de Conformidade (Scan):
  - Navegue até o Patch Manager e acione a opção de execução imediata (Patch Now).
  - Defina a operação como apenas verificação (Scan).
  - Em escopo de alvos (Instances to patch), selecione a opção de especificação manual (Choose instances manually) e adicione as duas instâncias registradas.
  - Configure a opção de armazenamento de logs de patches como desativada (Não armazenar).
- Instalação de Atualizações (Scan and install):
  - Inicie novamente o processo de correção imediata (Patch instances now).
  - Altere a operação para verificação e instalação simultânea (Scan and install).
  - Configure o comportamento de reinicialização (Reboot option) para reiniciar apenas se necessário (Reboot if needed).
  - Mantenha a seleção manual dos dois nós gerenciados e confirme a execução sem retenção de registros de log.

<a name="item02.03"><h4>2.3 Como faço para programar instalações de patches em um nó gerenciado?</h4></a>[Back to summary](#item02)

📅 Agendamento Recorrente de Patches via Janelas de Manutenção   
O agendamento de correções de segurança no AWS Systems Manager Patch Manager garante que as varreduras e instalações de pacotes ocorram de forma automatizada e previsível. Esse processo utiliza janelas de manutenção (Maintenance Windows) organizadas por expressões temporais para evitar impactos em horários de pico operacional.

⚙️ Fluxo de Configuração da Janela de Correção   
O procedimento no console do AWS Systems Manager para criar o ciclo recorrente de manutenção segue as etapas:
- Definição de Escopo e Agendamento:
  - Acesse o Patch Manager e selecione a opção de configuração de correção (Configure patching).
  - No escopo de alvos (Instances to patch), defina a seleção manual (Select instances manually) e adicione os nós gerenciados.
  - Em agendamento (Patching schedule), selecione o agendador por expressão CRON (CRON scheduler).
  - Configure a frequência para execução semanal (ex: todos os sábados às 02:00) e mantenha a duração padrão da janela.
  - Defina a operação de correção (Patching operation) para verificação e instalação (Scan and Install).
  - Nomeie a janela de manutenção (Maintenance Window Name) e finalize em Review and create.
- Auditoria da Janela de Manutenção:
  - Acesse o recurso Maintenance Windows para verificar o objeto criado.
  - Inspecione as guias de detalhamento para validar as configurações: Description (parâmetros gerais), Tasks (tarefa de patch associada), History (registro de execuções), Targets (instâncias vinculadas) e Tags (metadados de identificação).

<a name="item02.04"><h4>2.4 Como faço para me conectar com segurança a um nó gerenciado com o Systems Manager?</h4></a>[Back to summary](#item02)

🔐 Conexão Remota Segura a Nós Gerenciados   
O acesso administrativo a instâncias EC2 gerenciadas pode ser realizado de forma centralizada e segura via Fleet Manager. Esse mecanismo elimina a necessidade de expor portas de gerenciamento (como 22 para SSH ou 3389 para RDP) à internet, prescindindo também do uso de IP público ou pares de chaves na infraestrutura.

🛠️ Procedimento de Conexão por Sistema Operacional   
A interface do Fleet Manager provê métodos distintos de acesso adaptados à natureza do sistema operacional do nó gerenciado:
- Sessão de Terminal em Instâncias Linux:
  - No console do AWS Systems Manager, acesse o Fleet Manager.
  - Marque a instância Linux desejada e navegue até Node Actions.
  - Selecione Connect e acione a opção Start terminal session.
  - A interface abrirá uma sessão interativa de shell diretamente no navegador, permitindo a execução de comandos administrativos como date e pwd.
- Área de Trabalho Remota em Instâncias Windows:
  - No Fleet Manager, selecione o nó gerenciado Windows.
  - Navegue até Node Actions e selecione Connect seguido de Connect with Remote Desktop.
  - Defina o tipo de autenticação (Authentication type) como par de chaves (Key pair).
  - Mantenha o nome da conta administrativa (Administrador) e faça o upload do arquivo local contendo a chave privada em Key pair content.
  - Após a validação das credenciais, a sessão gráfica do Windows é aberta no próprio console para a realização das rotinas operacionais.

📌 Restrições da Interface RDP   
A funcionalidade de acesso via Remote Desktop no Fleet Manager possui um limite de concorrência por interface: é possível manter conexões ativas com no máximo quatro nós gerenciados simultaneamente por janela do navegador.

<a name="item02.05"><h4>2.5 Como posso usar o Systems Manager com o AWS CLI?</h4></a>[Back to summary](#item02)

💻 Gerenciamento via AWS CLI   
A administração do AWS Systems Manager por meio da Interface de Linha de Comando (AWS CLI) permite automatizar tarefas operacionais, integrar comandos a scripts e gerenciar recursos sem dependência da interface gráfica. Todas as chamadas utilizam o namespace de comandos aws ssm.

🛠️ Comandos de Interação Operacional   
Abaixo estão dispostas as operações fundamentais executadas via CLI para consulta, varredura, automação e acesso aos nós gerenciados:
- Inspeção de Nós Gerenciados: Para verificar se uma instância Amazon EC2 está devidamente registrada e comunicando-se com a plataforma: `aws ssm describe-instance-information`. Nota: É possível aplicar filtros por Tags ou IDs de instância para restringir os resultados em frotas maiores.
- Execução de Varredura de Patches (Send Command): Para disparar a análise de conformidade de atualizações pendentes sem acessar o servidor: `aws ssm send-command --document-name 'AWS-RunPatchBaseline' --targets Key=InstanceIds,Values='i-<id-da-instancia>' --parameters 'Operation=Scan'`. Nota: A resposta desta chamada retorna a propriedade CommandId, necessária para o acompanhamento da execução.
- Monitoramento do Status do Comando: Para verificar o progresso e o resultado do comando enviado anteriormente: `aws ssm list-commands --command-id "<valor-do-command-id>"`.
- Início de Sessão Interativa (Start Session): Para estabelecer uma conexão direta e segura de terminal com o nó gerenciado: `aws ssm start-session --target i-<id-da-instancia>`.
- Execução e Acompanhamento de Runbooks de Automação: 
  - Para acionar a reinicialização automatizada de um nó por meio do documento padrão da AWS: `aws ssm start-automation-execution --document-name "AWS-RestartEC2Instance" --parameters "InstanceId=i-<id-da-instancia>"`
  - Para consultar o status de detalhado do fluxo de automação disparado: `aws ssm get-automation-execution --automation-execution-id <id-da-execucao>`.
- Consulta de Inventário de Pacotes e Aplicações: Para listar os programas instalados em um nó gerenciado coletados pelo inventário: `aws ssm list-inventory-entries --instance-id "i-<id-da-instancia>" --type-name "AWS:Application" --max-results 1`.

📌 Requisito Prévio para Acesso via Shell Local   
Para utilizar o subcomando aws ssm start-session na maquina local (seja em ambientes Windows, macOS ou Linux), é obrigatória a instalação prévia do Session Manager Plugin para a AWS CLI. Sem esse componente binário instalado no ambiente de origem, a tentativa de abertura do canal de terminal interativo resultará em falha.

<a name="item02.06"><h4>2.6 Como faço para remover os recursos usados neste curso?</h4></a>[Back to summary](#item02)

🧹 Desprovisionamento e Limpeza de Recursos   
Após a conclusão das rotinas operacionais e testes no AWS Systems Manager, a remoção completa dos ativos evita custos desnecessários na conta AWS e previne a permanência de artefatos órfãos na infraestrutura.

🛠️ Fluxo Sequencial de Exclusão   
O processo de desmontagem dos componentes criados durante o laboratório deve seguir a ordem abaixo:
- Encerramento de Instâncias de Computação:
  - No console do Amazon EC2, acesse a seção Instances.
  - Selecione as duas instâncias ativas (Linux e Windows).
  - Navegue até Instance State, acione a opção Terminate Instances e confirme em Terminate.
- Remoção de Credenciais de Acesso:
  - Ainda no console do Amazon EC2, acesse a guia Key Pairs.
  - Localize o par de chaves utilizado no projeto e execute a exclusão.
- Exclusão da Janela de Manutenção:
  - No console do AWS Systems Manager, acesse a funcionalidade Maintenance Windows.
  - Selecione a janela configurada para o agendamento de patches e confirme sua remoção.
- Desmontagem do Quick Setup:
  - Ainda no console do Systems Manager, navegue até o Quick Setup.
  - Acesse a configuração ativa de Host Management, abra o menu Actions e selecione Delete Configuration para desassociar os parâmetros de gerenciamento aplicados.