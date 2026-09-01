# Introduction to AWS Identity and Access Management (IAM)   <img src="./0-aux/logo_course.png" alt="curso_dc_003" width="auto" height="45">

### AWS <a href="../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../aws_partner/">aws_partner</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_003 (Introduction to AWS Identity and Access Management (IAM))   <img src="./0-aux/logo_course.png" alt="curso_dc_003" width="auto" height="25"></a>

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
O curso teve como objetivo apresentar o AWS IAM para a gestão centralizada de acesso e autenticação na nuvem. Foram abordados o gerenciamento de usuários e grupos, a criação de políticas de permissão em JSON, o uso de funções (roles) com credenciais temporárias para aplicações e a integração via federação de identidades.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Módulo Único</h4></a>[Back to summary](#item0)

👥 Gerenciamento de Identidades, Grupos e Políticas   
O AWS Identity and Access Management (IAM) viabiliza a administração centralizada de acessos para usuários e grupos, garantindo que o ciclo de vida das credenciais permaneça protegido. A autenticação é obrigatória para qualquer interação com a nuvem, ocorrendo via Console de Gerenciamento, AWS CLI, SDKs ou chamadas diretas de API.
- Usuários do IAM: Entidades individuais criadas na conta para corresponder às pessoas ou aplicações da organização, possuindo credenciais próprias para autenticação.
- Grupos do IAM: Coleções de usuários que facilitam a gestão em larga escala. A atribuição de permissões ao grupo replica automaticamente as mesmas políticas a todos os seus membros.
- Políticas de Permissão: Documentos no formato JSON que definem explicitamente os acessos. O modelo de segurança adota a negação implícita (implicit deny), ou seja, qualquer ação ou recurso não permitido de forma explícita é bloqueado por padrão.

A estrutura fundamental de um documento de política descreve a entidade afetada, as ações autorizadas, as condições para execução da chamada de API e os recursos específicos que sofrerão a intervenção.

🎭 Funções do IAM (IAM Roles) e Credenciais Temporárias   
As funções do IAM funcionam como identidades temporárias que não possuem credenciais permanentes, como senhas ou chaves de acesso fixas. Ao assumir uma função, a entidade recebe chaves de segurança temporárias com prazo de expiração definido.

Nesse processo, o solicitante abdica temporariamente de suas permissões originais para exercer estritamente o conjunto de acessos delegado pela função. A abordagem reduz os riscos de segurança ao eliminar o armazenamento de credenciais de longo prazo em código-fonte ou arquivos de configuração.

💡 Casos de Uso Práticos para Roles   
A utilização de funções do IAM resolve desafios operacionais de segurança em cenários variados:
- Acesso Seguro para Aplicações em Instâncias EC2: Em vez de inserir chaves de acesso fixas no código da aplicação para ler dados em um bucket do Amazon S3, atribui-se um perfil de instância (instance profile) associado a uma role. A aplicação obtém credenciais temporárias de forma automática e transparente.
- Elevação Temporária de Privilégios: Permite que um usuário com acessos restritos assuma temporariamente uma função administrativa para executar uma tarefa específica, retornando às suas permissões originais assim que a atividade é concluída.
- Federação de Identidades: Permite que usuários autenticados em provedores externos (como Microsoft Active Directory, Google ou Facebook) assumam roles do IAM para acessar os recursos da AWS sem a necessidade de provisionamento de contas IAM individuais.