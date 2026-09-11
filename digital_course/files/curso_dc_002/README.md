# AWS Identity and Access Management - Basics   <img src="./0-aux/logo_course.png" alt="curso_dc_002" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_002 (AWS Identity and Access Management - Basics)   <img src="./0-aux/logo_course.png" alt="curso_dc_002" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/231206_dc_002_en.pdf">Certificate</a>

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
1. <a href="#item01">Introduction to AWS Security and Identity Concepts</a><br>
  1.1 <a href="#item01.01">Authentication and Authorization</a><br>
  1.2 <a href="#item01.02">Root account credentials</a><br>
  1.3 <a href="#item01.03">The IAM Service</a><br>
2. <a href="#item02">Benefits and Use Cases of IAM</a><br>
  2.1 <a href="#item02.01">Shared Access to Your AWS Account</a><br>
  2.2 <a href="#item02.02">Multi-factor Authentication</a><br>
  2.3 <a href="#item02.03">Secure Access for Applications on EC2</a><br>
  2.4 <a href="#item02.04">Identity Federation</a><br>
3. <a href="#item03">IAM Boundaries and Access Methods</a><br>
  3.1 <a href="#item03.01">Where IAM Cannot be Used</a><br>

---

### Objective:
O curso teve como objetivo apresentar o AWS IAM para a gestão centralizada e segura de acessos na nuvem. Foram abordados os conceitos de autenticação e autorização, a criação de usuários, grupos e políticas de permissão, o uso seguro de funções para aplicações e MFA, além da integração com provedores de identidade externos e o escopo de atuação do serviço via Console e API.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Introduction to AWS Security and Identity Concepts</h4></a>[Back to summary](#item01)

<a name="item01.01"><h4>1.1 Authentication and Authorization</h4></a>[Back to summary](#item01)

🔐 Fundamentos de Gestão de Identidade e Acesso (IAM)   
O gerenciamento de identidade e acesso constitui o pilar central de um programa de segurança da informação na nuvem. A disciplina garante que o acesso aos recursos computacionais seja concedido exclusivamente a entidades autorizadas e autenticadas, delimitando com precisão o escopo das ações permitidas.

🔑 Autenticação vs. Autorização   
A segurança de acesso opera dividida em dois processos complementares:
- Autenticação (Quem é você?): Mecanismo de validação da identidade de um usuário, aplicação ou sistema principal (principal entity). A verificação atesta a veracidade da identidade alegada por meio do fornecimento de credenciais cadastradas (ex: uso de Single Sign-On ou combinações de usuário e senha).
- Autorização (O que você pode fazer?): Processo que estabelece os limites de atuação e as permissões de uma identidade já validada. A autorização mapeia quais recursos podem ser consultados, modificados ou excluídos, impedindo ações fora do escopo atribuído à função da entidade.

💻 Interfaces de Acesso e Tipos de Credenciais   
A AWS separa o acesso à sua infraestrutura de acordo com o endpoint de interação, exigindo credenciais distintas e não intercambiáveis para cada modalidade:
- AWS Management Console (Acesso Gráfico): Interface baseada em navegador web destinada à navegação interativa. A autenticação exige o uso de nome de usuário, senha e, opcionalmente, fatores multifator de autenticação (MFA).
- API de Consulta / AWS CLI / SDKs (Acesso Programático): Ponto de acesso para automações, scripts e integração de softwares. A autenticação exige um par de chaves composto por uma Chave de Acesso (Access Key ID) e uma Chave de Acesso Secreta (Secret Access Key).

Nota: As chaves de acesso programático não concedem login na interface gráfica do console, assim como usuário e senha não autenticam chamadas diretas às APIs da AWS.

<a name="item01.02"><h4>1.2 Root account credentials</h4></a>[Back to summary](#item01)

👤 Usuário Raiz (Root User) e Práticas de Segurança   
Ao registrar uma conta na AWS, a identidade inicial criada é o usuário raiz (root user), associada ao e-mail e senha informados no cadastro. Essa credencial concede acesso irrestrito, ilimitado e absoluto a todos os recursos computacionais, configurações administrativas e informações de faturamento da conta.

Devido ao alto nível de privilégios, o uso da conta raiz deve ser restrito à configuração inicial do ambiente e a tarefas administrativas de exceção (como alteração de senha mestre ou encerramento da conta). A condução de rotinas operacionais diárias com essa credencial representa um risco grave de segurança, devendo ser substituída pelo uso de usuários e funções do IAM.

<a name="item01.03"><h4>1.3 The IAM Service</h4></a>[Back to summary](#item01)

🛡️ Estrutura e Conceitos do AWS IAM   
O AWS Identity and Access Management (IAM) é o serviço gratuito responsável pelo controle granular de acesso aos recursos da nuvem. Ele intercepta e avalia as chamadas de API individuais para validar permissões sobre instâncias, bancos de dados e serviços em geral.

A organização dos acessos no IAM estrutura-se em três conceitos fundamentais:
- Usuários (Users): Identidades individuais criadas para pessoas ou aplicações que necessitam de interações diretas e recorrentes com o ambiente.
- Grupos (Groups): Conjuntos lógicos de usuários que compartilham as mesmas atribuições funcionais (ex: desenvolvedores, administradores de banco de dados ou auditores).
- Permissões (Permissions): Declarações de políticas que definem explicitamente quais ações são permitidas ou negadas sobre quais recursos específicos.

<a name="item02"><h4>Benefits and Use Cases of IAM</h4></a>[Back to summary](#item02)

<a name="item02.01"><h4>2.1 Shared Access to Your AWS Account</h4></a>[Back to summary](#item02)

🛡️ Gestão Granular de Credenciais no AWS IAM   
O AWS Identity and Access Management (IAM) elimina a necessidade de compartilhamento de senhas ou chaves mestre, permitindo a criação de identidades individuais para cada usuário da organização. Esse isolamento viabiliza a atribuição de permissões personalizadas e o controle de acesso baseado no princípio do menor privilégio.
- Credenciais Únicas: Cada entidade possui dados de acesso próprios, permitindo rastreabilidade e revogação imediata de permissões a qualquer momento sem afetar outros usuários.
- Permissões Diferenciadas: É possível delimitar escopos de atuação específicos para cada função. Por exemplo, um perfil pode possuir privilégios administrativos sobre o Amazon EC2 e Amazon S3, enquanto outro possui apenas permissões de leitura no Amazon S3 ou acesso restrito ao painel de faturamento.
- Controle Granular: As declarações de políticas definem ações exatas (Actions) permitidas ou negadas sobre recursos específicos (Resources), garantindo que os usuários acessem exclusivamente o necessário para suas atribuições.

<a name="item02.02"><h4>2.2 Multi-factor Authentication</h4></a>[Back to summary](#item02)

🔐 Autenticação Multifator (MFA)   
A Autenticação Multifator (MFA) introduz uma camada adicional de proteção ao fluxo de login, exigindo a validação de duas categorias distintas de fatores de autenticação antes de conceder acesso aos serviços da AWS:
- Fatores de Validação: A combinação exige algo que o usuário sabe (senha ou chave de acesso) e algo que o usuário possui (código dinâmico e temporário gerado por um dispositivo MFA).
- Opções de Hardware e Software: O segundo fator pode ser gerado por aplicativos de autenticação virtuais instalados em dispositivos móveis ou por tokens físicos de hardware (como chaves de segurança USB).
- Abrangência Operacional: A exigência de MFA aplica-se tanto às conexões interativas no AWS Management Console quanto ao acesso programático via AWS CLI. Além disso, é possível condicionar a execução de ações sensíveis (como a inicialização de instâncias Amazon EC2) à validação prévia de um token MFA ativo.

<a name="item02.03"><h4>2.3 Secure Access for Applications on EC2</h4></a>[Back to summary](#item02)

🎭 Funções do IAM para Instâncias EC2 (IAM Roles)   
Aplicações hospedadas em instâncias Amazon EC2 frequentemente demandam integração com outros serviços da nuvem, como leitura de objetos no Amazon S3 ou escrita de dados no Amazon RDS. O AWS IAM permite associar Funções do IAM (IAM Roles) diretamente às instâncias para viabilizar esse acesso de forma automatizada e segura:
- Eliminação de Credenciais Fixas: Evita a prática insegura de codificar senhas ou chaves de acesso (Access Keys) no código-fonte da aplicação ou em arquivos de configuração local.
- Gerenciamento e Rotação Automática: A instância obtém credenciais temporárias do serviço de metadados do EC2, com renovação e rotação automáticas conduzidas pelo próprio ambiente da AWS.

<a name="item02.04"><h4>2.4 Identity Federation</h4></a>[Back to summary](#item02)

🔗 Federação de Identidades   
A Federação de Identidades permite integrar o provedor de identidades corporativo pré-existente (como Microsoft Active Directory ou fornecedores compatíveis com padrões abertos como SAML 2.0 e OIDC) ao ecossistema da AWS:
- Acesso Unificado (Single Sign-On): Colaboradores e equipes de desenvolvimento utilizam suas credenciais corporativas habituais para acessar o console ou as APIs da AWS, eliminando a necessidade de provisionar usuários duplicados no IAM.
- Centralização da Governança: Reduz o esforço operacional de administração de contas, permitindo que a concessão, alteração ou revogação de acessos ocorra diretamente no repositório central de usuários da organização.

<a name="item03"><h4>IAM Boundaries and Access Methods</h4></a>[Back to summary](#item03)

<a name="item03.01"><h4>3.1 Where IAM Cannot be Used</h4></a>[Back to summary](#item03)

⚠️ Limitações do IAM e Acesso ao Sistema Operacional   
Embora o AWS IAM seja o mecanismo central de governança de acesso para o plano de controle da AWS (console e chamadas de API), ele possui fronteiras claras de atuação e não gerencia a autenticação direta no nível do sistema operacional das instâncias Amazon EC2.

🔒 Fronteira entre o Plano de Controle e o Sistema Operacional   
A gestão de credenciais administrativas de baixo nível para instâncias EC2 ocorre fora do escopo do IAM:
- Acesso RDP a Instâncias Windows: O acesso via Remote Desktop Protocol utiliza senhas e certificados gerados no momento do provisionamento a partir do par de chaves da instância. Uma vez descriptografada e obtida a senha de administrador local, o IAM não possui mecanismos para revogar ou restringir a sessão ativa no nível do sistema operacional.
- Acesso SSH a Instâncias Linux: A autenticação remota em máquinas Linux depende de pares de chaves criptográficas (public/private keypair). O IAM não é responsável por gerar, rotacionar ou auditar a distribuição de arquivos de chave privada (.pem). Qualquer usuário em posse da chave privada possui acesso direto ao servidor, independentemente de suas permissões no IAM.

📌 Escopo de Atuação do IAM
O IAM gerencia autorizações e autenticações sobre os serviços e APIs da AWS (ações como iniciar, interromper, criar ou excluir recursos). A administração de identidades locais, arquivos authorized_keys e contas de usuários dentro dos sistemas operacionais executados nas instâncias do Amazon EC2 deve ser realizada por ferramentas dedicadas de gerenciamento de configuração ou serviços como o AWS Systems Manager.