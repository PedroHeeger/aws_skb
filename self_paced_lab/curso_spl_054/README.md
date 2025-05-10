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

A tarefa inicial consistiu em criar uma chave no **AWS Key Management Service (KMS)** que seria utilizada para criptografar objetos (criptografia do lado do cliente) durante a gravação no S3 usando o EMRFS e descriptografá-la usando a mesma chave durante a leitura dos mesmos objetos no cluster. A chave KMS foi configurada da seguinte forma:
- `Configure key` (Configurar chave):
    - `Key type` (Tipo de chave): `Symmetric` (Simétrico).
    - `Key usage` (Uso da chave): `Encrypt and decrypt` (Criptografar e descriptografar).
- `Add labels` (Adicionar rótulos):
    - `Alias`: `emr-seclab-key`.
    - `Description - optional` (Descrição - opcional): `EMR key for use with encrypted clusters` (Chave EMR para uso com clusters criptografados).
- `Define key administrative permissions - optional` (Definir permissões administrativas principais - opcional): foi marcada a role do **AWS IAM** que era utilizada para se conectar ao console (`AWSLabsUser-kgzoBH8iSnoTyo9jPiKvKh`). Administradores de chaves são usuários ou funções que gerenciam o acesso à chave de criptografia.
- `Define key usage permissions - optional` (Definir permissões de uso de chave - opcional): foi marcada a role do **AWS IAM** que era utilizada para se conectar ao console (`AWSLabsUser-kgzoBH8iSnoTyo9jPiKvKh`). Usuários-chave são os usuários ou funções que usam a chave para criptografar e descriptografar dados.

A imagem 01 mostra a chave do **AWS KMS** criada com sucesso.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: Criar uma configuração de segurança no Amazon EMR</h4></a>[Back to summary](#item0)

Na segunda tarefa foi elaborada uma configuração de segurança no **Amazon Elastic MapReduce (EMR)** para habilitar a criptografia em repouso do lado do cliente usando uma chave gerenciada pelo **AWS KMS** para dados armazenados no **Amazon S3** com o EMRFS. A região do console tinha que ser a mesma região definida no parâmetro `Region` nas instruções do laboratório (`us-west-2` (Oregon)). O serviço EMR foi acessado, a seção `EMR on EC2` (Seção EMR no EC2) foi expandida e a opção `Security configurations` (Configurações de segurança) foi selecionada para criar a configuração de segurança com as seguintes definições:
- `Create security configurationa` (Criar configuração de segurança):
    - `Name` (Nome): 
        - `Security configuration name` (Nome da configuração de segurança): `emr-cfg-NAME`.
    - `Security configuration setup options` (Opções de configuração de segurança): `Choose custom settings` (Escolher configurações personalizadas).
        - `Encryption` (Criptografia):
            - Foi marcada a caixa de seleção ao lado de `Turn on at-rest encryption for data in Amazon S3` (Ativar criptografia em repouso para dados no Amazon S3):
                - `Encryption mode` (Modo de criptografia): `CSE-KMS`.
                - `Choose your AWS KMS key` (Escolher sua chave AWS KMS): `emr-seclab-key`, que foi a chave KMS construída na tarefa 1.

A imagem 02 comprova que foi criada uma configuração de segurança no **Amazon EMR** para habilitar a criptografia em repouso do lado do cliente usando uma chave gerenciada pelo **AWS KMS** para dados armazenados no **Amazon S3** com EMRFS. O *EMR File System (EMRFS)* é um sistema de arquivos personalizado usado pelo **Amazon EMR** para ler e gravar dados diretamente no **Amazon S3** como se fosse um sistema de arquivos local.

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<a name="item01.3"><h4>Tarefa 3: Iniciando um cluster do Amazon EMR</h4></a>[Back to summary](#item0)

Com a parte de criptografia dos dados definida, nesta terceira tarefa foi realizado o provisionamento do cluster do **Amazon EMR** com as seguintes configurações:
- `Create cluster` (Criar cluster):
    - `Name and applications - required` (Nome e aplicações - obrigatório):
        - `Name` (Nome): `emr-sec`.
    - `AWS Glue Data Catalog settings` (Configurações do AWS Glue Data Catalog): 
        - As caixas `Use for Hive table metadata` (Usar para metadados da tabela Hive) e `Use for Spark table metadata` (Usar para metadados da tabela Spark) foram marcadas.
    - `Cluster configuration - required` (Configuração do Cluster - obrigatório): `Uniform instance groups` (Grupos de instâncias uniformes)
        - `Uniform instance groups` (Grupos de instâncias uniformes):
            - `Primary` (Primário): 
                - `Choose EC2 instance type` (Escolha o tipo de instância EC2): `m4.large`.
            - `Core` (Núcleo):
                - `Choose EC2 instance type` (Escolha o tipo de instância EC2): `m4.large`.
            - `Task 1 of 1` (Tarefa 1 de 1):
                - `Choose EC2 instance type` (Escolha o tipo de instância EC2): `m4.large`.
    - `Networking - required` (Rede - obrigatório):
        - `Virtual private cloud (VPC)` (Nuvem privada virtual (VPC)): foi selecionada a VPC de nome `Lab VPC`.
    - `Cluster logs` (Logs do cluster):
        - `Amazon S3 location` (Localização do Amazon S3): foi escolhido o bucket de nome `emr-us-west-2-9011958100679946`, que tinha sido o provisionado pelo laboratório ao iniciá-lo, adicionando o prefixo `/logs` no final. A URL completa ficou `s3://emr-us-west-2-9011958100679946/logs`.
    - `Security configuration and EC2 key pair` (Configuração de segurança e par de chaves EC2):
        - `Security configuration` (Configuração de segurança): foi selecionada a configuração de segurança criada na tarefa 2 que habilitava a criptografia em repouso do lado do cliente com chave gerenciada pelo **AWS KMS** (`emr-cfg-NAME`).
    - `Identity and Access Management (IAM) roles - required ` (Funções de Gerenciamento de Identidade e Acesso (IAM) - obrigatório):
        - `Amazon EMR service role` (Função de serviço do Amazon EMR): `Choose an existing service role` (Escolher uma função de serviço existente).
            - `Service role` (Função de serviço): `EMR_DefaultRole`. Essa role do **AWS IAM** já tinha sido provisionada pelo laboratório ao iniciá-lo.
        - `EC2 instance profile for Amazon EMR` (Perfil de instância do EC2 para Amazon EMR): `Choose an existing instance profile` (Escolher um perfil de instância existente).
            - `Instance profile` (Perfil de instância): `EMR_EC2_DefaultRole`. Esse perfil de instância já tinha sido provisionado pelo laboratório ao iniciá-lo.

O provisionamento do cluster durava cerca de 10 minutos. A imagem 03 exibe o cluster do **Amazon EMR** criado e com status `Waiting` (Aguardando). Dentro do cluster foi copiado, na seção `Summary` (Resumo), o valor do DNS público do nó primário do cluster (`ec2-54-201-85-186.us-west-2.compute.amazonaws.com`).

<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<a name="item01.4"><h4>Tarefa 4: Enviar uma tarefa Spark ETL usando as etapas EMR</h4></a>[Back to summary](#item0)

As três primeiras tarefas do laboratório foram construção da infraestrutura. A partir dessa quarta tarefa, iniciou-se o processamento dos dados com o envio de um job **Apache Spark** ETL utilizando o *EMR Steps* (Etapas EMR). Um job (trabalho) no **Amazon EMR** é uma tarefa de processamento de dados (como rodar um script Spark, Hive, ou MapReduce) executada dentro do cluster EMR para transformar, analisar ou mover dados. ETL é o processo de extrair dados de uma ou mais fontes, transformá-los para atender a requisitos de análise ou armazenamento (como limpeza, formatação ou agregação) e, em seguida, carregá-los em um destino final, como um data lake ou data warehouse. Para este job (tarefa) foi executado um ETL (Extract, Transform, Load) para processar dados de viagens de táxi. Este exemplo foi escolhido porque:
- Utilizava formatos de dados comuns (CSV e Parquet).
- Executava transformações de dados simples.
- Produzia resultados verificáveis.

Dessa forma, a estrutura do bucket do **Amazon S3** que seria utilizado foi analisado. Este bucket continha a seguinte estrutura:
- `files/`: Continha o arquivo de script [spark-etl.py](./resource/spark-etl.py), que possuía código em **Python** com uso do Spark (**PySpark**) para executar a transformação ETL. Esse script foi projetado para:
    - Ler os dados da viagem de táxi da pasta de entrada (`input/`).
    - Adicionar um registro de data e hora de processamento.
    - Converter os dados do formato CSV para Parquet.
    - Salvar os dados transformados na pasta de saída (`output/`).
- `input/`: Continha o arquivo [tripdata.csv](./resource/tripdata.csv), que armazenava os registros de viagens de táxi em Nova York, incluindo horários de embarque/desembarque, tarifas e locais.
- `data/`: Continha o arquivo [sales.csv](./resource/sales.csv), um conjunto de dados suplementar para análise adicional.
- `output/`: Uma pasta vazia onde os dados transformados seriam armazenados em formato Parquet.

No console do **Amazon EMR**, a aba `Steps` (Etapas) foi aberta e uma etapa foi adicionada com a seguinte configuração:
- `Step settings` (Configurações de etapas):
- `Type` (Tipo): `Custom JAR` (JAR personalizado).
- `Name` (Nome): `Spark ETL Job`.
- `JAR location` (Localização do JAR): `command-runner.jar`.
- `Arguments - optional` (Argumentos - opcional): foi inserido o seguinte comando `spark-submit s3://emr-us-west-2-9011958100679946/files/spark-etl.py s3://emr-us-west-2-9011958100679946/input s3://emr-us-west-2-9011958100679946/output`, passando o nome do bucket do S3 utilizado nos três paths. Esse nome do bucket era listado também no parâmetro `EMRBucketName` nas instruções do lab (`emr-us-west-2-9011958100679946`). Esses argumentos especificavam:
    - A localização do script ETL (`spark-etl.py`).
    - A pasta de entrada contendo o arquivo de dados (`tripdata.csv`).
    - A pasta de saída onde os arquivos Parquet transformados seriam salvos.
- `Step action` (Etapa de Ação):
    - `Action if step fails` (Ação em caso de falha): foi mantido o padrão, `Continue` (Continue).

Ao adicionar a etapa, o trabalho (`job`) era iniciado e o status passava de `Pending` (Pendente) para `Running` (Em execução) até ser `Completed` (Concluído). O trabalho de ETL processava o arquivo `tripdata.csv` da pasta de entrada e gravava os resultados no formato Parquet na pasta de saída (`output/`) no mesmo bucket do S3, utilizando o arquivo em **PySpark** para processamento. A imagem 04 mostra que o job foi executado com sucesso.

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

