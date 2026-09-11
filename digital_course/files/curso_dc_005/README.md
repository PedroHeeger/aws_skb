# Authentication and Authorization with AWS Identity and Access Management   <img src="./0-aux/logo_course.png" alt="curso_dc_005" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_005 (Authentication and Authorization with AWS Identity and Access Management)   <img src="./0-aux/logo_course.png" alt="curso_dc_005" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/240911_dc_005_en.pdf">Certificate</a>

---

### Theme:
- Cloud Computing
- Identity Management

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
O objetivo do curso foi apresentar os fundamentos de autenticação e autorização no AWS IAM. Foram abordadas as diferenças entre identidades (usuários, grupos e roles), a elaboração de documentos de política em JSON, o fluxo de processamento de chamadas de API e estratégias práticas para proteção de ambientes críticos e mitigação de incidentes.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Módulo Único</h4></a>[Back to summary](#item01)

🔑 Conceituação de Operadores no IAM   
O entendimento correto do IAM exige precisão na definição de seus conceitos fundamentais, especialmente na distinção entre identidades operacionais e a concessão de acessos.
- Usuário (User): Representa um operador do sistema (humano ou automatizado) associado a um conjunto de credenciais permanentes, como senhas de acesso ou pares de chaves de API (Access Key e Secret Key). A identidade permanece ativa até que ocorra uma rotação explícita de credenciais.
- Grupo (Group): Atua unicamente como um mecanismo de organização que reúne múltiplos usuários. Serve para aplicar diretrizes operacionais em massa, simplificando a gestão de vários operadores simultaneamente.
- Função (Role): Define um operador cujas credenciais de autenticação são estritamente temporárias. A role não representa um conjunto de permissões em si, mas sim um método de autenticação flexível e de vida curta para humanos ou máquinas.

Todas as interações na infraestrutura AWS são processadas como chamadas de API. Nesse modelo, usuários e funções atuam primariamente como mecanismos de autenticação, identificando qual operador está realizando a requisição.

📄 O Documento de Política (Policy Document)   
A autorização na AWS é desvinculada do processo de autenticação e gerenciada por meio de um objeto independente denominado Policy Document. Estruturado em formato JSON, este documento pode ser associado a usuários, grupos ou roles.

A política estabelece quais chamadas de API estão liberadas (whitelist) ou bloqueadas e em quais recursos específicos elas podem atuar. Além disso, permite a definição de critérios contextuais para a execução, tais como:
- Origem da requisição limitada a sub-redes ou VPNs específicas.
- Restrições de horário operacional para execução de tarefas.
- Delimitação rigorosa de escopo por ambiente (desenvolvimento vs. produção).

🔄 Fluxo de Processamento de Requisições   
Quando um operador tenta executar uma operação na nuvem (como o envio de um arquivo para um bucket do Amazon S3), a chamada de API passa por dois estágios consecutivos de validação:
- Fase de Autenticação: O mecanismo do IAM recebe as credenciais enviadas (credenciais fixas de usuário ou temporárias de uma role) e confirma a identidade do operador.
- Fase de Autorização: Com a identidade confirmada, o motor do IAM consolida e avalia todos os Policy Documents vinculados ao operador (ou ao seu grupo). A ação só é executada se houver autorização explícita para aquela API específica e para o recurso informado.

🛡️ Aplicações Práticas de Controle de Acesso   
A separação entre autenticação e documentos de política oferece flexibilidade para a resolução de desafios críticos de segurança:
- Proteção de Ambientes Críticos via Negação Explícita: Instruções de negação explícita (Deny) sobrepõem-se a qualquer permissão existente. É possível, por exemplo, criar uma política que proíba a interrupção de instâncias EC2 de produção e anexá-la a todas as entidades da conta, garantindo que exceções sejam concedidas exclusivamente a administradores específicos. Isso impede desastres operacionais resultantes de erros humanos.
- Contenção Rápida de Incidentes e Credenciais Comprometidas: Em cenários de vazamento de credenciais ou comprometimento de máquinas operacionais, a arquitetura desvinculada permite uma resposta imediata. A equipe de segurança pode revogar ou desassociar os Policy Documents das entidades afetadas por meio de chamadas de API, neutralizando o acesso do invasor instantaneamente, sem a necessidade de excluir as contas de usuário do diretório.