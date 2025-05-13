# Lab - Introduction to Amazon EMR Cluster Management and Job Processing   <img src="./0-aux/logo_course.png" alt="curso_spl_054" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_054 (Lab - Introduction to Amazon EMR Cluster Management and Job Processing)   <img src="./0-aux/logo_course.png" alt="curso_spl_054" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Cloud Computing
- Big Data

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon Elastic MapReduce (EMR)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_emr.svg" alt="aws_emr" width="auto" height="25">
  - Amazon Simple Storage Service (S3)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_s3.svg" alt="aws_s3" width="auto" height="25">
  - AWS Key Management Service (KMS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_kms.svg" alt="aws_kms" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
  - Python   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="python" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Big Data:
  - Apache Spark   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/apache_spark.png" alt="apache_spark" width="auto" height="25">
  - Spark History Server   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/apache_spark.png" alt="spark_history_server" width="auto" height="25">
- Library:
  - PySpark   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/frame_library/pyspark.webp" alt="pyspark" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Introduction to Amazon EMR Cluster Management and Job Processing<br>
1.1 <a href="#item01.1">Tarefa 1: Criar uma chave AWS KMS</a><br>
1.2 <a href="#item01.2">Tarefa 2: Criar uma configuração de segurança no Amazon EMR</a><br>
1.3 <a href="#item01.3">Tarefa 3: Iniciando um cluster do Amazon EMR</a><br>
1.4 <a href="#item01.4">Tarefa 4: Enviar uma tarefa Spark ETL usando as etapas EMR</a><br>
1.5 <a href="#item01.5">Tarefa 5: Monitoramento avançado de tarefas</a><br>
1.6 <a href="#item01.6">Tarefa 6: Verificar a saída do trabalho no Amazon S3</a><br>

---

### Objective:
O objetivo deste laboratório foi criar uma chave no **AWS Key Management Service (KMS)** e utilizá-la em uma configuração de segurança aplicada a um cluster básico no **Amazon Elastic MapReduce (EMR)**. Em seguida, foi executado um job de ETL por meio da adição de uma step ao cluster. Esse job utilizava um arquivo em **Python** com **Apache Spark** (**PySpark**), armazenado em um bucket do **Amazon S3**, para processar uma base de dados de viagens de táxi também localizada no S3.

O processamento consistiu na leitura dos dados em formato CSV, inclusão de um campo com data e hora do processamento, conversão dos dados para o formato Parquet e armazenamento em outro prefixo do mesmo bucket. Por fim, foram explorados alguns recursos de monitoramento do EMR relacionados à execução do job.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README.
- A pasta `resource` com os arquivos utilizados.

### Development:
<a name="item01.1"><h4>Tarefa 1: Criar uma chave AWS KMS</h4></a>[Back to summary](#item0)



<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: Criar uma configuração de segurança no Amazon EMR</h4></a>[Back to summary](#item0)



<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<a name="item01.3"><h4>Tarefa 3: Iniciando um cluster do Amazon EMR</h4></a>[Back to summary](#item0)


<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<a name="item01.4"><h4>Tarefa 4: Enviar uma tarefa Spark ETL usando as etapas EMR</h4></a>[Back to summary](#item0)


<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

<a name="item01.5"><h4>Tarefa 5: Monitoramento avançado de tarefas</h4></a>[Back to summary](#item0)



<div align="Center"><figure>
    <img src="./0-aux/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="./0-aux/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>



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



<a name="item01.6"><h4>Tarefa 6: Verificar a saída do trabalho no Amazon S3</h4></a>[Back to summary](#item0)



<div align="Center"><figure>
    <img src="./0-aux/img10.png" alt="img10"><br>
    <figcaption>Imagem 10.</figcaption>
</figure></div><br>

