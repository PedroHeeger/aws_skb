# Lab - Analyze Big Data with Hadoop   <img src="./0-aux/logo_course.png" alt="curso_spl_009" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_009 (Lab - Analyze Big Data with Hadoop)   <img src="./0-aux/logo_course.png" alt="curso_spl_009" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Cloud Computing

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Linux Distribution:
  - Amazon Linux   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/amazon_linux.png" alt="amazon_linux" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon Elastic MapReduce (EMR)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_emr.svg" alt="aws_emr" width="auto" height="25">
  - Amazon Simple Storage Service (S3)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_s3.svg" alt="aws_s3" width="auto" height="25">
  - Amazon Virtual Private Cloud (VPC)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_vpc.svg" alt="aws_vpc" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - Apache Hive Query Language (Apache HiveQL)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/apache_hive.png" alt="apache_hiveql" width="auto" height="25">
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Big Data:
  - Apache Hadoop   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/hadoop/hadoop-original.svg" alt="apache_hadoop" width="auto" height="25">
  - Apache Hive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/apache_hive.png" alt="apache_hive" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Analyze Big Data with Hadoop<br>
1.1 <a href="#item01.1">Tarefa 1: Criar um bucket do Amazon S3</a><br>
1.2 <a href="#item01.2">Tarefa 2: iniciar um cluster do Amazon EMR</a><br>
1.3 <a href="#item01.3">Tarefa 3: Processe seus dados de amostra executando um script Hive</a><br>
1.4 <a href="#item01.4">Tarefa 4: Visualizar os resultados</a><br>
1.5 <a href="#item01.5">Tarefa 5: conectar-se à CLI do cluster EMR e executar a consulta usando HiveQL</a><br>
1.6 <a href="#item01.6">Tarefa 6: Encerre seu cluster Amazon EMR</a><br>

---

### Objective:
O objetivo deste laboratório prático foi implantar um cluster **Hadoop** totalmente funcional no serviço **Amazon EMR** e com um script **HiveQL** processar os dados de log de amostra armazenados em um bucket do **Amazon Simple Storage Service (S3)**. **HiveQL** é uma linguagem de script semelhante a SQL para armazenamento e análise de dados. O **Amazon EMR** é um serviço gerenciado que torna rápido, fácil e econômico executar o **Apache Hadoop** e o **Apache Spark** para processar grandes quantidades de dados. O **Amazon EMR** também oferece suporte a ferramentas Hadoop poderosas e comprovadas, como **Presto**, **Hive**, **Pig**, **HBase** e muito mais.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README. 

### Development:
Este curso foi um laboratório prático realizado na plataforma **AWS Skill Builder**, cuja subscrição foi devida a uma parceria entre a **AWS** e a **Escola da Nuvem**. A infraestrutura de cloud utilizada foi fornecida através de um sandbox do **AWS Skill Builder** que possibilitava acesso ao console da **AWS**. Contudo foi necessário seguir estritamente as orientações determinadas no laboratório. Dessa maneira, a forma de interação com os recursos da cloud foram sempre através do console fornecido pelo sandbox, a não ser em casos em que o próprio laboratório instruiu para utilização de outras ferramentas de interação como **AWS CLI** ou **AWS SDK**.

O laboratório do **AWS Skill Builder** tem o foco em executar apenas o que é orientado no escopo, todos os recursos ou serviços que podem ser requisitados adicionalmente já vêm provisionados por padrão pelo laboratório. Ao iniciar o laboratório, o sandbox do **AWS Skill Builder** provisiona diversos recursos e serviços para o funcionamento através de uma ou mais pilhas do **AWS CloudFormation** de forma automática. 

O acesso ao console no sandbox do **AWS Skill Builder** é realizado por meio de uma identidade federada. O Skill Builder funciona como um provedor de identidade (IdP), autenticando o usuário e vinculando-o a uma role do **AWS IAM** provisionada automaticamente por uma das pilhas do CloudFormation. Essa role concede permissões temporárias e mínimas necessárias para a execução do laboratório, garantindo segurança e controle sobre os recursos utilizados. O laboratório, por padrão, determina a região a ser utilizada e ela não deve ser alterada, somente se o próprio laboratório indicar. As configurações não informadas no laboratório devem ser sempre mantidas como padrão que estão.

<a name="item01.1"><h4>Tarefa 1: Criar um bucket do Amazon S3</h4></a>[Back to summary](#item0)

Na primeira tarefa, o objetivo foi provisionar o bucket do **Amazon S3** para armazenar os arquivos de log e dados de saída. Na configuração desse bucket apenas o seguinte nome foi definido: `edn-dpcn-aws-hadoop`. A imagem 01 exibe o bucket criado.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: iniciar um cluster do Amazon EMR</h4></a>[Back to summary](#item0)

A tarefa seguinte foi iniciar o cluster **Apache Hadoop** no serviço **Amazon Elastic MapReduce (EMR)** para processar os dados. Antes de iniciar a criação, foi necessário garantir que a região selecionada no console era igual a indicada nas informações do lab (`us-east-1`). O cluster foi definido com as seguintes configurações:
- Nome: `Meu cluster`.
- Versão Amazon EMR: `emr-5.36.1`.
- Pacote de aplicativos: foi escolha `Personalizado` e selecionados os seguintes aplicativos, caso ainda não tenham sido selecionados:
  - **Hue**
  - **Hadoop**
  - **Hive**
  - **Pig**
- Na seção `Configuração do cluster - necessária`; foi configurado o seguinte:
  - Foi escolhido `Grupos de instâncias uniformes`.
  - Para `Primary`, `Core` e `Task 1 de 1`: foi selecionado `m4.large` no menu suspenso `Escolher tipo de instância EC2`.
- Na seção `Rede - necessária`, foi configurado o seguinte:
  - Para `Nuvem privada virtual (VPC)`: foi escolhida a opção `Procurar`.
  - Na janela pop-up `Escolher VPC`: foi selecionado a VPC `Lab VPC` e escolhida a o
  - A seção `Grupos de segurança do EC2 (firewall)` foi expandida e, para o `grupo de segurança gerenciado pelo EMR`, foi selecionado o grupo de segurança que continha o nome `xxxx-EmrSecurityGroup-xxxx` para o nó `Primary` e os nós `Core` e de `Task`.
- Na seção `Encerramento do cluster e substituição do nó`, foi desmarcado `Use proteção de terminação`.
- Foi expandida a seção `Logs do cluster` e configure o seguinte:
  - Foi selecionado `Publique logs específicos do cluster no Amazon S3`.
  - Para localização do Amazon S3: foi escolhida `Procurar S3`.
  - Na janela pop-up `Escolher local do Amazon S3`: foi selecionado o bucket do Hadoop que foi criado anteriormente (`edn-dpcn-aws-hadoop`).
- Na seção `Configuração de segurança e par de chaves EC2`: foi configurado o seguinte:
  - Para o par de chaves Amazon EC2 para SSH no cluster: foi escolhido `Procurar`.
  - Na janela pop-up Escolher par de chaves do Amazon EC2 para SSH no cluster: foi selecionado o par de chaves chamado `EMRKey-lab` que já veio criado pelas pilhas do CloudFormation.
-  Na seção `Funções de gerenciamento de identidade e acesso (IAM) - obrigatórias`, foi configurado o seguinte:
  - Para a função de serviço do Amazon EMR: foi selecionada a role `EMR_DefaultRole` que também já tinha sido criada.
  - Para o perfil de instância do EC2 para Amazon EMR: foi selecionado o perfil de instância `EMR_EC2_DefaultRole` que também já tinha sido construído.

A imagem 02 evidencia o cluster provisionado com sucesso. Pode ser que o cluster levasse aproximadamente cinco minutos para ser iniciado.

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

A configuração padrão instalou automaticamente vários aplicativos padrões no cluster:
- **Apache Hadoop**: é um projeto de software de código aberto que pode ser usado para processar grandes conjuntos de dados de forma eficiente. Em vez de usar um computador grande para processar e armazenar os dados, o Hadoop usa clusters de hardware de commodity para analisar conjuntos de dados massivos em paralelo (MPP).
- **Ganglia**: O projeto de código aberto **Ganglia** é um sistema escalável e distribuído, projetado para monitorar clusters e grades, minimizando o impacto em seu desempenho. O **Ganglia** pode gerar relatórios e visualizar o desempenho do cluster como um todo, bem como inspecionar o desempenho de nós individuais.
- **Apache Tez**: é uma estrutura para criar um grafo acíclico direcionado (DAG) complexo de tarefas para processamento de dados. Em alguns casos, ele é usado como uma alternativa ao **Apache Hadoop MapReduce**. Por exemplo, os fluxos de trabalho Pig e Hive podem ser executados usando o Hadoop MapReduce ou podem usar o Tez como um mecanismo de execução.
- **Apache Hive**: é um data warehouse de código aberto e um pacote analítico que roda em cima de um cluster Hadoop. Os scripts do Hive usam uma linguagem semelhante a SQL chamada **Hive Query Language (HiveQL)** que abstrai modelos de programação e suporta interações típicas de data warehouse. O Hive permite que sejam evitadas as complexidades de escrever trabalhos Tez com base em gráficos acíclicos direcionados (DAGs) ou programas MapReduce em uma linguagem de computador de nível inferior, como **Java**.
- **Hadoop User Experience (Hue)**: é uma interface gráfica de usuário de código aberto, baseada na web, para uso com **Amazon EMR** e **Apache Hadoop**. Hue agrupa vários projetos diferentes do ecossistema Hadoop em uma interface configurável para o cluster **Amazon EMR**.
- **Apache Pig**: é uma biblioteca Apache de código aberto que roda em cima do Hadoop. A biblioteca pega comandos do tipo SQL escritos em uma linguagem chamada **Pig Latin** e converte esses comandos em trabalhos Tez baseados em gráficos acíclicos direcionados (DAGs) ou programas MapReduce. Não é preciso escrever código complexo usando uma linguagem de computador de nível inferior, como **Java**.

Resumidamente:
- **Apache Hadoop**: é um projeto de software de código aberto que pode ser usado para processar grandes conjuntos de dados de forma eficiente. Em vez de usar um computador grande para processar e armazenar os dados, o Hadoop usa clusters de hardware de commodity para analisar conjuntos de dados massivos em paralelo (MPP).
- **Ganglia**: Monitoramento.
- **Apache Tez**: processamento com DAGs.
- **Apache Hive**: Data Warehouse e processamento com linguagem HiveQL.
- **Hadoop User Experience (Hue)**: Interface Gráfica de Usuário (GUI) para MapReduce.
- **Apache Pig**: biblioteca que converte comandos escritos em linguagem **Pig Latin** em trabalhos do Tez, ou seja, DAGs, ou em programas MapReduce.










<a name="item01.3"><h4>Tarefa 3: Processe seus dados de amostra executando um script Hive</h4></a>[Back to summary](#item0)









<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

<a name="item01.4"><h4>Tarefa 4: Visualizar os resultados</h4></a>[Back to summary](#item0)







<div align="Center"><figure>
    <img src="./0-aux/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

<a name="item01.5"><h4>Tarefa 5: conectar-se à CLI do cluster EMR e executar a consulta usando HiveQL</h4></a>[Back to summary](#item0)






<div align="Center"><figure>
    <img src="./0-aux/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>





<a name="item01.6"><h4>Tarefa 6: Encerre seu cluster Amazon EMR</h4></a>[Back to summary](#item0)



<div align="Center"><figure>
    <img src="./0-aux/img07.png" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>



<div align="Center"><figure>
    <img src="./0-aux/img08.png" alt="img08"><br>
    <figcaption>Imagem 08.</figcaption>
</figure></div><br>


<div align="Center"><figure>
    <img src="./0-aux/img09.png" alt="img09"><br>
    <figcaption>Imagem 09.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="./0-aux/img10.png" alt="img10"><br>
    <figcaption>Imagem 10.</figcaption>
</figure></div><br>