# AWS Billing and Cost Management   <img src="./0-aux/logo_course.png" alt="curso_dc_007" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_007 (AWS Billing and Cost Management)   <img src="./0-aux/logo_course.png" alt="curso_dc_007" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/260727_dc_007_en.pdf">Certificate</a>

---

### Theme:
- Cloud Computing
- FinOps

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - AWS Billing and Cost Management   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_billing.svg" alt="aws_billing_cost_management" width="auto" height="25">
  - AWS Budgets  <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_budgets.png" alt="aws_budget" width="auto" height="25">
  - AWS Cost and Usage Reports (CUR)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_cur.webp" alt="aws_cur" width="auto" height="25">
  - AWS Cost Explorer  <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_cost_explorer.webp" alt="aws_cost_explorer" width="auto" height="25">
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
  - AWS Cost Anomaly Detection

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. <a href="#item01">Introdução</a><br>
  1.1 <a href="#item01.01">Introdução</a><br>
  1.2 <a href="#item01.02">Gestão de faturamento e custos no console</a><br>
2. <a href="#item02">Estabelecer Visibilidade e Gerenciar Gastos</a><br>
  2.1 <a href="#item02.01">Obtenha visibilidade dos seus gastos com nuvem</a><br>
  2.2 <a href="#item02.02">Evite gastos excessivos com a AWS</a><br>
3. <a href="#item03">Conclusão</a><br>

---

### Objective:
O objetivo do curso foi apresentar as ferramentas e práticas do **AWS Billing and Cost Management** para a visibilidade, análise e controle de custos na nuvem. Foram abordados o monitoramento de gastos por meio de gráficos e projeções no **AWS Cost Explorer**, a extração de dados granulares via Relatórios de Custos e Uso (CUR), além do uso do **AWS Budgets** e da Detecção de Anomalias de Custo com aprendizado de máquina para prevenção proativa de gastos excessivos.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introdução</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Introdução</h4></a>[Back to summary](#item01)

📊 Gestão e Visibilidade de Custos na Nuvem   
A dinâmica da computação em nuvem permite a variação instantânea no provisionamento de recursos conforme a demanda da aplicação. O dimensionamento elástico da infraestrutura — como a expansão pontual do número de instâncias computacionais — impacta diretamente a fatura, tornando a visibilidade financeira um requisito operacional essencial para a sustentabilidade do negócio. Compreender e mensurar os gastos em tempo quase real possibilita prever despesas, identificar desvios e garantir a otimização dos investimentos em TI.

🛠️ Suíte de Faturamento e Gerenciamento de Custos   
A AWS disponibiliza um conjunto integrado de serviços focados na administração financeira da nuvem. Essas ferramentas auxiliam nas seguintes frentes operacionais:
- Planejamento Financeiro: Estimativa e projeção de investimentos futuros em infraestrutura.
- Monitoramento e Alertas: Notificação automatizada para desvios ou aproximação de limites de gastos definidos.
- Análise de Investimentos: Identificação dos serviços e recursos de maior impacto orçamentário.
- Consolidação Contábil: Simplificação da gestão financeira para organizações que operam com múltiplas contas de forma centralizada.

🧰 Ferramentas de Análise e Prevenção de Gastos   
As ferramentas de governança financeira dividem-se entre capacidades de visibilidade histórica e mecanismos proativos de controle de orçamento:
- AWS Cost Explorer: Interface gráfica destinada à visualização, análise e compreensão dos padrões de consumo e custos ao longo do tempo.
- Relatórios de Custo e Uso da AWS (AWS Cost and Usage Reports): Geração de conjuntos de dados detalhados que fornecem visibilidade granular sobre a utilização dos recursos.
- AWS Budgets: Mecanismo para estabelecimento de limites orçamentários personalizados, permitindo o acompanhamento de metas financeiras com suporte a previsões dinâmicas.
- Detecção de Anomalias de Custo da AWS (AWS Cost Anomaly Detection): Recurso que utiliza machine learning para monitorar continuamente o padrão de consumo, identificando e alertando sobre picos atípicos de gastos de forma automatizada.

<a name="item01.02"><h4>1.2 Gestão de faturamento e custos no console</h4></a>[Back to summary](#item01)

🖥️ Painel de Faturamento da AWS (AWS Billing Dashboard)   
O Painel de Faturamento funciona como o centro operacional para acompanhamento dos aspectos financeiros da conta na AWS. O acesso à interface ocorre por meio da barra de pesquisa do console web, digitando o termo equivalente e selecionando o serviço.

A interface compila indicadores e ferramentas essenciais para a governança de despesas:
- Resumo da AWS: Apresenta indicadores consolidados de gastos em múltiplas contas, regiões e serviços. Exibe a comparação entre os custos consolidados do último mês encerrado e a projeção para o ciclo atual, permitindo a customização das métricas exibidas.
- Maior Custo (Top Cost): Destaca os maiores focos de despesas acumuladas no mês vigente, categorizados por serviço, conta ou região geográfica.
- Tendência de Custos dos Principais Serviços: Mapeia os cinco serviços de maior impacto financeiro em janelas de três a seis meses. A visualização detalha o nome do serviço, o valor total do mês recém-fechado, a média histórica e a variação percentual entre o acumulado e a média.
- Tendência de Custos por Conta: Exibe a evolução financeira das contas vinculadas nos últimos meses, considerando aplicações de descontos e planos de economia. Acompanha colunas para média, total consolidado e indicador de tendência.
- Atalhos de Cobrança: Centraliza o acesso aos extratos das faturas, histórico de pagamentos e inicialização de relatórios de consumo detalhados.
- Atalhos de Gestão de Custos: Oferece direcionamento direto para ferramentas de otimização, como o AWS Cost Explorer e o AWS Budgets.

📈 Console de Gerenciamento de Custos (AWS Cost Management)   
Embora integrados, o console de Faturamento e o console de Gerenciamento de Custos possuem focos complementares: enquanto o primeiro lida com pagamentos, transações correntes e extratos passados, o segundo é voltado à análise preditiva e otimização orçamentária futura.

O acesso pode ser feito diretamente pela navegação lateral do painel de faturamento ou pela busca de termos como Cost Explorer. O console exibe as seguintes seções operacionais:
- Resumo de Custos: Exibe o total acumulado até o momento no mês atual, acompanhado pela estimativa computada para o encerramento do ciclo com base no padrão de consumo.
- Tendências Mensais: Realiza a análise comparativa entre o período decorrido do mês atual e o exato mesmo intervalo de dias do mês anterior. Identificações de variações atípicas contêm atalhos para investigação detalhada no Cost Explorer.
- Custos Diários Não Combinados (Unblended Costs): Representa o modelo financeiro de regime de caixa, registrando os custos efetivos aplicados à conta no exato dia em que o recurso foi consumido. O gráfico exibe esse histórico retroativo cobrindo até o mês anterior.
- Relatórios Recentes: Histórico com registro de data das últimas análises e relatórios financeiros consultados na conta.
- Navegação Lateral: Menu que concede acesso direto aos recursos avançados do ecossistema financeiro, incluindo o AWS Cost Explorer, AWS Budgets, Detecção de Anomalias de Custo, além da gestão de Reservas e Planos de Economia (Savings Plans).

<a name="item02"><h4>Estabelecer Visibilidade e Gerenciar Gastos</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Obtenha visibilidade dos seus gastos com nuvem</h4></a>[Back to summary](#item02)

💼 Caso de Uso: Visibilidade de Custos e Relatórios Operacionais   
Diante do desafio de estabelecer governança financeira com foco na eficiência de custos para uma operação de produção, a liderança de infraestrutura precisa adotar soluções que combinem análise visual imediata e capacidade de auditoria detalhada. A arquitetura da AWS atende a esses requisitos por meio de duas ferramentas complementares de observabilidade financeira.

📊 AWS Cost Explorer   
O AWS Cost Explorer é a ferramenta indicada para a análise visual, acompanhamento de tendências e projeção de custos ao longo do tempo.
- Histórico e Previsão: Ao ser ativado, o serviço compila os dados retroativos de consumo dos últimos 12 meses e utiliza esse histórico para gerar estimativas preditivas de gastos para os 12 meses subsequentes.
- Análise Granular e Filtros: A interface permite alternar entre visões macroscópicas e análises detalhadas por meio da aplicação de filtros específicos (como isolamento de despesas por serviço ou região geográfica).
- Modos de Acesso: Os dados podem ser consultados gratuitamente via interface gráfica no console ou de forma automatizada por meio da API do Cost Explorer.
- Relatórios Padrão e Customizados: Disponibiliza modelos pré-configurados de fábrica, como o relatório de custos diários. As visualizações modificadas podem ser salvas na biblioteca de relatórios da conta para consultas futuras.

📄 Relatórios de Custo e Uso da AWS (AWS Cost and Usage Reports - CUR)   
O AWS CUR é a solução para cenários que exigem o maior nível de detalhamento e granularidade sobre cada transação e recurso consumido na nuvem.
- Granularidade Extrema: Gera registros abrangentes em formato de planilha (.csv), estruturando itens de linha para cada combinação única de produto, tipo de uso e operação realizada na conta.
- Entrega Automática no Amazon S3: Os relatórios são exportados e atualizados automaticamente até uma vez por dia em um bucket do Amazon S3 pertencente à própria organização.
- Integração e Consultas Personalizadas: O armazenamento dos arquivos brutos no Amazon S3 viabiliza a execução de consultas SQL complexas via Amazon Athena, a criação de painéis de Business Intelligence no Amazon QuickSight ou a ingestão dos dados por aplicações de terceiros e scripts próprios.
- Investigação de Desvios: A profundidade das informações contidas no CUR torna-o indispensável para auditorias profundas caso ocorram picos atípicos ou inesperados nos custos de infraestrutura.

<a name="item02.02"><h4>2.2 Evite gastos excessivos com a AWS</h4></a>[Back to summary](#item02)

🛡️ Gestão Proativa de Gastos e Prevenção de Desvios   
No aprendizado e experimentação com serviços em nuvem — especialmente arquiteturas serverless como o AWS Lambda —, o consumo elástico de recursos pode gerar custos inesperados caso ocorram erros de configuração ou picos de acesso indesejados. Para evitar surpresas orçamentárias, a AWS disponibiliza mecanismos automáticos de monitoramento, alerta e mitigação de despesas.

💰 AWS Budgets   
O AWS Budgets viabiliza o acompanhamento e o controle de gastos por meio do estabelecimento de limites financeiros teto para períodos configuráveis.
- Definição de Limites e Filtros: Permite estipular valores máximos de consumo diários, mensais ou anuais. O acompanhamento pode ser refinado pela aplicação de filtros por serviços, regiões, contas ou tags organizacionais (como monitorar apenas recursos rotulados como ambiente de desenvolvimento).
- Limites de Alerta e Notificações: Suporta a criação de gatilhos acionados ao atingir uma porcentagem do orçamento (ex: 80% do valor estipulado) ou uma quantia absoluta em dólares. Os alertas são enviados por e-mail ou integrados ao Amazon Simple Notification Service (Amazon SNS).
- Ações de Orçamento (Budget Actions): Executa procedimentos automatizados quando um limite é atingido, permitindo aplicar restrições de acesso (como bloquear o provisionamento de novos recursos via políticas do IAM).
- Frequência de Atualização: Os dados do AWS Budgets são processados e atualizados na interface em intervalos de 8 a 12 horas (até três vezes ao dia).

🤖 Detecção de Anomalias de Custo da AWS (AWS Cost Anomaly Detection)   
O AWS Cost Anomaly Detection é uma ferramenta de proteção complementar que utiliza algoritmos de machine learning para identificar padrões atípicos de consumo em tempo quase real.
- Monitores de Custo Personalizáveis: Permitem configurar o nível de detalhamento do rastreamento, acompanhando contas individuais, serviços específicos ou categorias de uso.
- Notificação e Análise de Causa Raiz: Ao detectar um pico anômalo de gastos, o serviço envia alertas e gera uma análise indicando a provável causa raiz e o impacto financeiro estimado do incidente.
- Ativação e Integração: O recurso é ativado automaticamente junto com a habilitação do AWS Cost Explorer, podendo ser cancelado a qualquer momento. Os dados apontados pelo monitor de anomalias servem de base para investigações aprofundadas no Cost Explorer ou nos Relatórios de Custo e Uso (CUR).

<a name="item03"><h4>Conclusão</h4></a>[Back to summary](#item03)

🏁 Síntese do Gerenciamento FinOps na AWS   
A maximização do valor financeiro na nuvem depende diretamente da visibilidade de custos e da adoção de uma postura proativa na gestão de despesas. O ecossistema de ferramentas de gestão financeira da AWS articula-se para oferecer desde a análise visual básica até o controle preditivo e a auditoria profunda.

🛠️ Ecossistema Integrado de Ferramentas   
A combinação das soluções atende às diferentes demandas do ciclo de vida financeiro da infraestrutura:
- AWS Cost Explorer: Fornece visibilidade histórica, tendências e projeções futuras por meio de gráficos interativos e navegáveis.
- Relatórios de Custo e Uso da AWS (CUR): Fornece dados brutos e altamente detalhados em arquivos estruturados, viabilizando análises granulares, auditorias e processamento via data analytics.
- AWS Budgets: Estabelece tetos orçamentários dinâmicos com notificações automáticas e capacidade de disparar ações preventivas para conter desvios.
- AWS Cost Anomaly Detection: Emprega inteligência computacional para monitorar desvios de consumo fora do padrão, alertando a organização e identificando a causa raiz dos incidentes.