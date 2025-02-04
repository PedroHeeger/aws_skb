# Lab - Troubleshooting IAM Access Issues   <img src="./0-aux/logo_course.png" alt="curso_spl_015" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_015 (Lab - Troubleshooting IAM Access Issues)   <img src="./0-aux/logo_course.png" alt="curso_spl_015" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Cloud Computing

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - Amazon Web Services (AWS)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic MapReduce (EMR)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_emr.svg" alt="aws_emr" width="auto" height="25">
  - Amazon SageMaker   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_sagemaker.png" alt="aws_sage_maker" width="auto" height="25">
  - Amazon SageMaker Canvas   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_sagemaker_canvas.png" alt="aws_sagemaker_canvas" width="auto" height="25">
  - Amazon SageMaker Studio; Amazon SageMaker Studio Lab   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_sagemaker_studio.png" alt="aws_sagemaker_studio" width="auto" height="25">
  - Amazon Simple Storage Service (S3)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_s3.svg" alt="aws_s3" width="auto" height="25">
  - AWS CodeCommit  <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_codecommit.svg" alt="aws_codecommit" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - Python   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="python" width="auto" height="25">
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Notebook Interface:
  - JupyterLab   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/jupyterlab.png" alt="jupyterlab" width="auto" height="25">
  - Jupyter Notebook   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/jupyter_notebook.png" alt="jupyter_notebook" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Big Data:
  - Apache Hadoop   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/hadoop/hadoop-original.svg" alt="apache_hadoop" width="auto" height="25">
  - Apache Hive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/apache_hive.png" alt="apache_hive" width="auto" height="25">
  - Apache Spark   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/apache_spark.png" alt="apache_spark" width="auto" height="25">
- Library:
  - Pandas   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/pandas/pandas-original.svg" alt="pandas" width="auto" height="25">
  - PySpark   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/frame_library/pyspark.webp" alt="pyspark" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Troubleshooting IAM Access Issues<br>
1.1 <a href="#item01.1">Tarefa 1: Acessando o laboratório</a><br>
1.2 <a href="#item01.2">Tarefa 2: Solução de problemas e correção do problema e verificação da solução</a><br>

---

### Objective:
O objetivo deste laboratório prático foi utilizar o recurso **Amazon SageMaker Data Wrangler** no **Amazon SageMaker Canvas** para criar um data flow, importando um conjunto de dados de um bucket do **Amazon S3**. A partir desse data flow, foram geradas três análises diferentes e realizadas diversas transformações nos dados, preparando-os para as etapas de treinamento e inferência de um modelo de machine learning (ML) em um cenário hipotético proposto pelo laboratório. Ao final do processo de transformação, o conjunto de dados foi dividido em três datasets e armazenados em prefixos específicos do mesmo bucket do **Amazon S3**, cada um com sua respectiva finalidade: treinamento, validação e teste.  

O cenário proposto envolveu a empresa fictícia **AnyCompany Consulting**, que precisava fornecer uma solução de ML para prever se um indivíduo ganharia menos de **50.000 USD** com base em dados demográficos. O objetivo era identificar se esse indivíduo estaria apto a receber um serviço de assistência governamental.  

Além disso, neste laboratório, foi utilizado o **JupyterLab** no **Amazon SageMaker Studio** para clonar um repositório do **AWS CodeCommit** e executar um arquivo de código em **PySpark**, que foi utilizado para consultar dados em uma tabela do **Apache Hive** em um cluster do **Amazon Elastic MapReduce (EMR)**.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README.
- A pasta `resource` com os arquivos utilizados.

### Development:
Este curso foi um laboratório prático realizado na plataforma **AWS Skill Builder**, cuja subscrição foi devida a uma parceria entre a **AWS** e a **Escola da Nuvem**. A infraestrutura de cloud utilizada foi fornecida através de um sandbox do **AWS Skill Builder** que possibilitava acesso ao console da **AWS**. Contudo foi necessário seguir estritamente as orientações determinadas no laboratório. Dessa maneira, a forma de interação com os recursos da cloud foram sempre através do console fornecido pelo sandbox, a não ser em casos em que o próprio laboratório instruiu para utilização de outras ferramentas de interação como **AWS CLI** ou **AWS SDK**.

O laboratório do **AWS Skill Builder** tem o foco em executar apenas o que é orientado no escopo, todos os recursos ou serviços que podem ser requisitados adicionalmente já vêm provisionados por padrão pelo laboratório. Ao iniciar o laboratório, o sandbox do **AWS Skill Builder** provisiona diversos recursos e serviços para o funcionamento através de uma ou mais pilhas do **AWS CloudFormation** de forma automática. 

O acesso ao console no sandbox do **AWS Skill Builder** é realizado por meio de uma identidade federada. O Skill Builder funciona como um provedor de identidade (IdP), autenticando o usuário e vinculando-o a uma role do **AWS IAM** provisionada automaticamente por uma das pilhas do CloudFormation. Essa role concede permissões temporárias e mínimas necessárias para a execução do laboratório, garantindo segurança e controle sobre os recursos utilizados. O laboratório, por padrão, determina a região a ser utilizada e ela não deve ser alterada, somente se o próprio laboratório indicar. As configurações não informadas no laboratório devem ser sempre mantidas como padrão que estão.

<a name="item01.1"><h4>Tarefa 1: Acessando o laboratório</h4></a>[Back to summary](#item0)






<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>


<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>


<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>



<a name="item01.2"><h4>Tarefa 2: Solução de problemas e correção do problema e verificação da solução</h4></a>[Back to summary](#item0)


