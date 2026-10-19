# Understanding Amazon EBS Volume Encryption   <img src="./0-aux/logo_course.png" alt="curso_dc_027" width="auto" height="45">

### AWS <a href="../../../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../">digital_course</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_dc_027 (Understanding Amazon EBS Volume Encryption)   <img src="./0-aux/logo_course.png" alt="curso_dc_027" width="auto" height="25"></a>

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/cloud/aws/skb/dc/261014_dc_027_en.pdf">Certificate</a>

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
  - AWS Key Management Service (KMS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_kms.svg" alt="aws_kms" width="auto" height="25">
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
O objetivo do curso foi demonstrar o funcionamento do Amazon EBS Volume Encryption na proteção de dados gerenciada via AWS KMS. Foi abordado o ciclo de vida da criptografia do lado do servidor (Server-Side Encryption), incluindo o provisionamento criptográfico da chave de dados (Volume Key), a intermediação segura do host Amazon EC2 e a garantia de que as chaves mestras permaneçam permanentemente isoladas no AWS KMS.

### Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, com o conteúdo do curso.
- [0-aux](./0-aux/): Pasta auxiliar com imagens utilizadas na construção dos arquivos de README desse curso.

### Development:
<a name="item01"><h4>Módulo Único</h4></a>[Back to summary](#item01)

🔐 Entendendo a Criptografia de Volumes do Amazon EBS (EBS Volume Encryption)   
O Amazon EBS Volume Encryption é uma solução de segurança integrada que realiza a criptografia de dados em repouso e em trânsito de forma totalmente transparente. Ele trabalha em conjunto com o AWS Key Management Service (AWS KMS) para gerenciar as chaves criptográficas, garantindo conformidade e proteção sem impactar o desempenho do servidor.

⚙️ Principais Características e Benefícios   
- Criptografia do Lado do Servidor (Server-Side Encryption): As operações de cifragem e decifragem ocorrem no nível do hardware subjacente da AWS, sem consumir recursos de CPU ou memória da sua instância EC2.
- Proteção Abrangente: Ao ativar a criptografia em um volume EBS, a proteção é estendida automaticamente para:
  - Todos os dados armazenados dentro do volume.
  - Todas as operações de E/S (I/O) em trânsito entre a instância EC2 e o volume EBS.
  - Todos os snapshots criados a partir do volume.
  - Todos os volumes criados a partir desses snapshots criptografados.
- Segurança de Chaves Chave-Mestra: A Chave de KMS (KMS Key, antiga CMK) permanece isolada e protegida dentro do serviço AWS KMS, nunca saindo de seu ambiente seguro.

🔄 Fluxo de Funcionamento e Interação com o AWS KMS   
O processo de geração, troca de chaves e criptografia de um volume EBS segue quatro etapas fundamentais:

1. Solicitação da Chave do Volume: O serviço Amazon EBS envia uma requisição para a interface do AWS KMS solicitando a geração de uma Chave de Dados (Data Key), utilizando a Chave do KMS (KMS Key) configurada.
2. Recebimento da Chave Criptografada: O AWS KMS retorna uma Chave de Dados em texto claro e uma versão criptografada dessa chave (Encrypted Volume Key). O EBS armazena a versão criptografada nos metadados do volume e repassa a chave para o hipervisor no Amazon EC2 Host.
3. Decifragem da Chave no Host: O servidor físico do Amazon EC2 envia uma solicitação à interface do AWS KMS para decifrar a Encrypted Volume Key. O KMS decifra a chave usando a chave mestra e a devolve em texto claro, mantendo-a armazenada estritamente na memória volátil do host.
4. Cifragem e Decifragem de Dados de E/S: O hipervisor do Amazon EC2 Host utiliza a chave de dados em texto claro (armazenada em memória) para criptografar e decifrar de forma contínua todos os dados gravados e lidos no volume EBS.