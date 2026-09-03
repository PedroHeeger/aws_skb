# AWS Identity and Access Management - Architecture and Terminology   <img src="./0-aux/logo_course.png" alt="curso_dc_004" width="auto" height="45">

### AWS <a href="../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../aws_partner/">aws_partner</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_004 (AWS Identity and Access Management - Architecture and Terminology)   <img src="./0-aux/logo_course.png" alt="curso_dc_004" width="auto" height="25"></a>

#### <a href="https://www.credly.com/badges/9d6fd8e2-9d1b-4db5-b600-c37bceb8867d/public_url">Certificate</a>

---

### Theme:
- Cloud Computing

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - AWS Identity and Access Management (IAM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_iam.svg" alt="aws_iam" width="auto" height="25">
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
1. <a href="#item01">Módulo Único</a><br>

---

### Objective:
O objetivo do curso foi apresentar a estrutura e a lógica de avaliação do AWS IAM para o controle de acesso granular. Foram abordados o gerenciamento de usuários, grupos e funções (roles), os tipos de políticas em JSON, a identificação de recursos via ARN e o funcionamento dos mecanismos de permissão e negação explícita.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Módulo Único</h4></a>[Back to summary](#item01)

👤 Estruturas e Organização de Entidades no IAM   
O gerenciamento de acessos no IAM distribui-se em entidades com papéis e dinâmicas de credenciais distintas:
- Usuários do IAM: Entidades internas vinculadas a uma conta principal. Possuem credenciais permanentes (senhas e chaves de acesso) e permissões diretas associadas.
- Grupos do IAM: Agrupamentos lógicos criados para centralizar a atribuição de permissões a múltiplos usuários. Não possuem credenciais próprias nem podem conter outros grupos entrelaçados. A movimentação de um usuário entre grupos altera automaticamente suas permissões herdadas, sem afetar suas políticas individuais.
- Funções do IAM (Roles): Identidades sem credenciais de longo prazo, projetadas para serem assumidas temporariamente por usuários, aplicações ou serviços. A emissão de acessos ocorre via AWS Security Token Service (STS), que gera credenciais temporárias com prazo de expiração definido. Uma role é composta por duas estruturas fundamentais: a Política de Confiança (Trust Policy), que utiliza o elemento Principal para determinar quem tem autorização para assumi-la, e a Política de Permissões, que estabelece as ações executáveis sob aquela identidade.

📄 Tipos e Estrutura de Políticas de Acesso   
As políticas do IAM determinam os limites de atuação das identidades na infraestrutura AWS. Elas se dividem quanto à arquitetura de implantação:
- Políticas Gerenciadas pela AWS: Documentos criados e mantidos pela própria AWS, disponíveis para associação rápida em diversas entidades.
- Políticas Gerenciadas pelo Cliente: Documentos independentes desenvolvidos pela própria organização, permitindo reuso em múltiplos usuários, grupos e roles.
- Políticas Em Linha (Inline Policies): Declarações incorporadas diretamente a uma única entidade específica, mantendo uma relação de exclusividade de um para um.

Quanto ao ponto de vinculação, as diretrizes podem ser Políticas Baseadas em Identidade (associadas a usuários, grupos ou roles) ou Políticas Baseadas em Recurso (anexadas diretamente a componentes como buckets do S3, tópicos do SNS e filas do SQS). A elaboração dessas políticas ocorre em formato JSON através de elementos padronizados:
- Version: Declara a especificação da linguagem da política (sendo 2012-12-17 o padrão atual recomendado para suporte a variáveis).
- Statement: Bloco obrigatório que agrupa uma ou mais declarações individuais de controle.
- Effect: Define o resultado da declaração, assumindo obrigatoriamente os valores Allow ou Deny.
- Action / NotAction: Especifica as operações mapeadas ou excluídas da regra. Ambos são mutuamente exclusivos.
- Resource / NotResource: Delimita os alvos abrangidos usando o formato ARN (Amazon Resource Name). Também são mutuamente exclusivos.
- Condition: Valida parâmetros operacionais da solicitação (como endereço IP, horário ou suporte a MFA) por meio de operadores booleanos.
- Sid: Identificador opcional para rotulagem individual de cada instrução dentro do documento.

🏷️ Identificação de Recursos via ARN   
Cada componente na nuvem é referenciado de forma única por meio de um Amazon Resource Name (ARN). A sintaxe padrão segue a estrutura arn:partição:serviço:região:id-da-conta:tipo-de-recurso/recurso. Por se tratar de um serviço global, o campo de região é omitido em ARNs do IAM (exemplo: arn:aws:iam::123456789012:user/Engenharia).

A utilização do ARN viabiliza o estabelecimento de permissões em nível de recurso, permitindo conceder ou restringir permissões granulares, como autorizar o desligamento de uma instância EC2 específica em vez de liberar o comando para todo o parque de máquinas.

⚙️ Lógica de Avaliação e Decisão do IAM   
O mecanismo de decisão do IAM adota a negação por padrão (implicit deny) como estado inicial para qualquer requisição de API. Durante o processamento de uma chamada, a infraestrutura analisa dinamicamente todas as políticas aplicáveis (baseadas em identidade e em recursos) seguindo uma ordem de precedência estrita:
- Avaliação de Negação Explícita: O sistema varre o conjunto de declarações em busca de qualquer instrução Deny. Caso exista ao menos uma negação explícita aplicável, a avaliação é encerrada imediatamente e o acesso é bloqueado, independente de outras permissões existentes.
- Avaliação de Permissão Explícita: Se nenhuma instrução Deny for encontrada, o mecanismo verifica a presença de alguma declaração Allow direta para a ação, recurso e contexto solicitados. Encontrando a permissão explícita, o acesso é liberado.
- Resultado Padrão: Na ausência de declarações Allow explícitas, a requisição é rejeitada pela própria negação implícita inicial.