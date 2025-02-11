# Lab - Train a model with Amazon SageMaker   <img src="./0-aux/logo_course.png" alt="curso_spl_017" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_017 (Lab - Train a model with Amazon SageMaker)   <img src="./0-aux/logo_course.png" alt="curso_spl_017" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Cloud Computing
- Machine Learning

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
  - Amazon SageMaker   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_sagemaker.png" alt="aws_sage_maker" width="auto" height="25">
  - Amazon SageMaker AI   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_sagemaker.png" alt="aws_sage_maker" width="auto" height="25">
  - Amazon SageMaker Studio; Amazon SageMaker Studio Lab   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_sagemaker_studio.png" alt="aws_sagemaker_studio" width="auto" height="25">
  - Amazon Simple Storage Service (S3)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_s3.svg" alt="aws_s3" width="auto" height="25">
  - AWS CodeCommit  <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_codecommit.svg" alt="aws_codecommit" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Containerization: 
  - Docker   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="docker" width="auto" height="25">
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
- Artificial Intelligence:
  - eXtreme Gradient Boosting (XGBoost)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/frame_library/xgboost.png" alt="xgboost" width="auto" height="25">

---

<a name="item0"><h3>Course Strcuture:</h3></a>
1. Lab - Train a model with Amazon SageMaker<br>
1.1 <a href="#item01.1">Tarefa 1: Treinar um modelo usando um algoritmo integrado</a><br>
1.2 <a href="#item01.2">Tarefa 2: Treinar um modelo usando um script personalizado no modo script</a><br>

---

### Objective:
Neste laboratório prático, o **JupyterLab** do **Amazon SageMaker Studio** foi utilizado para treinar dois modelos de machine learning (ML) a partir de um conjunto de dados armazenado em um bucket do **Amazon S3**. Esse conjunto de dados foi o mesmo utilizado no laboratório [a]() na etapa de preparação. O objetivo agora foi realizar uma classificação binária, prevendo se os valores da coluna de renda (`income`) da base de dados seriam maiores ou menores que US$ 50.000, a fim de determinar se a pessoa tinha direito ou não a um programa de assistência governamental.

Para o primeiro modelo, foi utilizado o algoritmo **Extreme Gradient Boosting (XGBoost)** integrado ao SageMaker, ou seja, com o código de treinamento do **XGBoost** já predefinido. No segundo modelo, foi explorado um cenário mais avançado, no qual o **XGBoost** foi executado como uma estrutura personalizada, permitindo maior flexibilidade na customização dos scripts de treinamento e inferência, além da implementação de técnicas como validação cruzada k-fold. O **XGBoost** é amplamente reconhecido por sua eficiência no aprendizado baseado em árvores de decisão.

O treinamento dos modelos foi realizado a partir de arquivos **Python** no **JupyterLab**, utilizando imagens de container que já possuíam o **XGBoost** instalado, armazenadas no **Amazon Elastic Container Registry (ECR)**, dentro de um repositório gerenciado pelo SageMaker. Após o treinamento, os modelos finais foram salvos em outro bucket do **Amazon S3**, possibilitando seu uso em futuras inferências. Os relatórios de treinamento do **XGBoost** também foram salvos nesse bucket e analisados para comparar os resultados das métricas Precision, Recall e F1-score entre os dois modelos, a fim de identificar as diferenças de desempenho.

### Structure:
A estrutura do curso é formada por:
- Este arquivo de README.
- A pasta `0-aux`, pasta auxiliar com imagens utilizadas na construção desse arquivo de README.
- A pasta `resource` com os arquivos utilizados.

### Development:
Este curso foi um laboratório prático realizado na plataforma **AWS Skill Builder**, cuja subscrição foi devida a uma parceria entre a **AWS** e a **Escola da Nuvem**. A infraestrutura de cloud utilizada foi fornecida através de um sandbox do **AWS Skill Builder** que possibilitava acesso ao console da **AWS**. Contudo foi necessário seguir estritamente as orientações determinadas no laboratório. Dessa maneira, a forma de interação com os recursos da cloud foram sempre através do console fornecido pelo sandbox, a não ser em casos em que o próprio laboratório instruiu para utilização de outras ferramentas de interação como **AWS CLI** ou **AWS SDK**.

O laboratório do **AWS Skill Builder** tem o foco em executar apenas o que é orientado no escopo, todos os recursos ou serviços que podem ser requisitados adicionalmente já vêm provisionados por padrão pelo laboratório. Ao iniciar o laboratório, o sandbox do **AWS Skill Builder** provisiona diversos recursos e serviços para o funcionamento através de uma ou mais pilhas do **AWS CloudFormation** de forma automática. 

O acesso ao console no sandbox do **AWS Skill Builder** é realizado por meio de uma identidade federada. O Skill Builder funciona como um provedor de identidade (IdP), autenticando o usuário e vinculando-o a uma role do **AWS IAM** provisionada automaticamente por uma das pilhas do CloudFormation. Essa role concede permissões temporárias e mínimas necessárias para a execução do laboratório, garantindo segurança e controle sobre os recursos utilizados. O laboratório, por padrão, determina a região a ser utilizada e ela não deve ser alterada, somente se o próprio laboratório indicar. As configurações não informadas no laboratório devem ser sempre mantidas como padrão que estão.

<a name="item01.1"><h4>Tarefa 1: Treinar um modelo usando um algoritmo integrado</h4></a>[Back to summary](#item0)

A arquitetura inicial, conforme apresentada na imagem 01, mostra um bucket do **Amazon Simple Storage Service (S3)** contendo os dados de treinamento que seriam importados para o **JupyterLab** no **Amazon SageMaker Studio**. No **JupyterLab**, uma pasta de um repositório do **AWS CodeCommit** foi clonada e acessada, e arquivos notebook em **Python** foram utilizados. O código desses arquivos utilizava uma imagem de container de um repositório do SageMaker no **Amazon Elastic Container Registry (ECR)** para executar os containers de treinamento dos dois modelos de machine learning construídos. Os modelos treinados, bem como os relatórios dos resultados de treinamento, foram armazenados em outro bucket do **Amazon S3**.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

Nesta primeira tarefa, um aplicativo de notebook, ou seja o **JupyterLab**, foi iniciado no **Amazon SageMaker Studio** e o repositório do **AWS CodeCommit** contendo os arquivos de código em **Python** para implantação dos dois modelos de machine learning foi clonado. O primeiro modelo foi executado nesta tarefa e ele utilizava o algoritmo **eXtreme Gradient Boosting (XGBoost)** integrado do SageMaker. 

O **JupyterLab** é um ambiente interativo baseado em navegador para criar e executar notebooks, utilizado principalmente em ciência de dados e aprendizado de máquina. Notebooks são documentos interativos que combinam código executável, resultados (como gráficos e tabelas), e anotações (em formato Markdown), permitindo uma abordagem prática e visual para análise de dados e desenvolvimento de modelos de machine learning. Tanto o SageMaker Studio quanto os aplicativos **JupyterLab** quando iniciados, rodam sobre um container **Docker** gerenciado pela **AWS** em uma mesma instância do **Amazon EC2**, entretanto isso ocorre por debaixo dos panos. Cada notebook aberto no **JupyterLab** inicia um novo container dentro da mesma instância, carregando o ambiente do kernel escolhido. Se a capacidade de uma única instância EC2 não for suficiente para suprir uma quantidade de containers em execução, a própria **AWS** escala automaticamente o número de instâncias para atender a demanda.

O laboratório facilitou o processo ao fornecer nas instruções o parâmetro `SageMakerStudioUrl` que continha a URL completa para abrir no navegador um aplicativo do **JupyterLab** no SageMaker Studio já conectado no perfil de usuário `SageMakerStudioUser` (`https://us-west-2.console.aws.amazon.com/sagemaker/home?region=us-west-2#/studio/open/d-3otoahdphphe/SageMakerStudioUser/LabSpace/JupyterLab`). O aplicativo do **JupyterLab** poderia levar cerca de 1 a 2 minutos para carregar na primeira vez. Dentro do aplicativo, um repositório **Git** foi clonado do **AWS CodeCommit** e a pasta `MLMLMD_Repository` do repositório foi acessada. Caso fosse necessário, o parâmetro `CloneUrlForRepo` nas instruções desse lab tinha a URL correta para acessar o repositório (`https://git-codecommit.us-west-2.amazonaws.com/v1/repos/MLMLMD_Repository`). Na imagem 02 é visualizado o **JupyterLab** aberto já com o repositório clonado e a pasta acessada.

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

Observe que na pasta existiam vários arquivos notebook, sendo cinco iguais ao arquivo [train_built_in.ipynb](./resource/code/train_built_in.ipynb), usado para construção do primeiro modelo nesta tarefa, e outros cinco iguais ao arquivo [train_script_mode.ipynb](./resource/code/train_script_mode.ipynb), usados para implantação do segundo modelo na tarefa 2. Em cada grupo de arquivos o que mudava era a linguagem natural utilizada, por padrão a língua era inglês, mas existiam as versões em português desses arquivos, que foram as utilizadas para implantação dos dois modelos: [train_built_in_pt_br.ipynb](./resource/code/train_built_in_pt_br.ipynb) e [train_script_mode_pt_br.ipynb](./resource/code/train_script_mode_pt_br.ipynb). Além desses, um terceiro tipo de arquivo, cujo nome era [xgboost_train.py](./resource/code/xgboost_train.py) também existia na pasta. Esse arquivo era o de script personalizado utilizado pelo arquivo que implementava o segundo modelo, onde o **XGBoost** era executado separadamente.

Ao abrir o arquivo de notebook `train_built_in_pt_br.ipynb` no aplicativo do **JupyterLab**, um novo container era iniciado, no qual o kernel utilizado era definido como `Python 3 (ipykernel)`, já que o arquivo continha código em linguagem **Python**. Cada célula do arquivo foi executada na ordem, utilizando o atalho `Shift + Enter` em cada uma. Um asterisco aparecia ao lado do bloco de código enquanto ele era executado. A partir desse momento, foram executados os código para iniciar o processo de treinamento do primeiro modelo. O arquivo dividia o processo nas seis seguintes partes:
- `Tarefa 1.1: Configurar o ambiente`: Preparação do ambiente de execução, incluindo a configuração dos caminhos de origem dos dados e destino dos modelos, e a definição de variáveis necessárias.
- `Tarefa 1.2: Configurar um objeto estimador`: Criação de um objeto estimador do SageMaker que definia o modelo e o algoritmo a ser utilizado no treinamento.
- `Tarefa 1.3: Configurar hiperparâmetros`: Definição dos parâmetros do modelo que influenciavam a performance do treinamento, como taxa de aprendizado e número de estimadores.
- `Tarefa 1.4: Executar um trabalho de treinamento do SageMaker`: Início do treinamento do modelo no SageMaker utilizando os dados processados e a configuração dos hiperparâmetros definidos.
- `Tarefa 1.5: Avaliar um modelo`: Avaliação do modelo treinado com base em métricas de performance, como precisão, recall e f1-score, para verificar sua eficiência.
- `Tarefa 1.6: Visualizar os artefatos do modelo`: Exibição dos artefatos gerados pelo treinamento, como o modelo final, métricas e gráficos de desempenho, para análise dos resultados.

O desenvolvimento de um modelo de machine learning (ML) inicia-se com o processamento dos dados. Depois dessa etapa, um algoritmo de ML é selecionado para o treinamento do modelo. O objetivo do treinamento é produzir um modelo capaz de realizar previsões sobre novos dados. Durante esse processo, os dados processados devem incluir uma variável de referência (destino), enquanto os dados futuros não possuem essa informação disponível, ou seja, eles não estão rotulados. O algoritmo identifica padrões que relacionam os atributos dos dados de entrada a essa variável-alvo e, com base nesses padrões, gera um modelo. Uma vez que o modelo esteja pronto, ele pode ser utilizado para prever valores-alvo desconhecidos em novos conjuntos de dados.

O destino (rótulo ou label ou variável-alvo ou variável dependente ou variável de referência ou valor-alvo) refere-se ao valor que se deseja prever. Nos dados de treinamento, essa variável está presente e é utilizada para ensinar o modelo a identificar padrões. Já nos dados futuros (na inferência), essa variável não está disponível, e o modelo deve ser capaz de inferi-la com base nos padrões aprendidos. Quando se diz que os dados não estão "rotulados", significa que não possuem um valor de destino conhecido. No contexto de aprendizado supervisionado, os dados rotulados incluem tanto as características (features ou variáveis independentes ou preditores ou atributos de entrada ou fatores explicativos) quanto o valor-alvo. Por outro lado, os dados não rotulados possuem apenas as características e precisam ser classificados ou previstos pelo modelo.

Por exemplo, ao treinar um modelo de machine learning para classificar e-mails como spam ou não, é necessário fornecer dados de treinamento contendo mensagens cujo destino já é conhecido (ou seja, um rótulo informando se o e-mail é spam ou legítimo). Com base nesses dados, o algoritmo constrói um modelo capaz de identificar padrões e prever a classificação dos e-mails. Depois disso, esse modelo pode ser utilizado para analisar novas mensagens e determinar se elas são spam ou não. Esse tipo de machine learning é chamado de aprendizado supervisionado (supervised learning).

Neste laboratório, o objetivo foi prever se uma pessoa possuía uma renda inferior a USD 50 mil. O modelo estava sendo treinado para maximizar a precisão nessa previsão. O processo de treinamento exigia algumas configurações, incluindo a escolha do algoritmo, que, neste caso, foi o **eXtreme Gradient Boosting (XGBoost)**. Além disso, foi necessário definir os hiperparâmetros, que são variáveis que controlam o funcionamento do treinamento. Esses hiperparâmetros podem ser ajustados para influenciar diferentes aspectos do processo. A seleção adequada desses valores foi essencial para garantir um bom desempenho e alta precisão do modelo. Após o treinamento, o modelo foi avaliado, e seus artefatos poderam ser analisados.

##### Configurar o ambiente

Antes de iniciar o treinamento do modelo, todas as dependências necessárias precisaram ser instaladas. Primeiro foi instaladas as bibliotecas do **Python**, *Matplotlib* e *Bokeh*, e reiniciado o kernel desse arquivo do **JupyterLab** (container). Em seguida, diversas bibliotecas como **Boto3**, *Math*, *Matplotlib*, *os*, *Pandas*, *SageMaker*, foram importadas, além de métodos específicos dessas biliotecas. Após importação, os comandos em python abaixo foram executados:
- `sagemaker_session = sagemaker.Session()`: Criava uma sessão do SageMaker.
- `role = sagemaker.get_execution_role()`: Obtinha a role de execução do SageMaker associada à instância atual do SageMaker.
- `region = boto3.Session().region_name`: Obtinha a região da **AWS** onde a instância do SageMaker estava sendo executada.
- `sess = boto3.Session()`: Criava uma sessão do **Boto3** para interagir com os serviços da **AWS**.
- `sm = sess.client('sagemaker')`: Criava um cliente do SageMaker para interagir com o serviço SageMaker usando a sessão do **Boto3**.

Caso um erro de dependência fosse exibido ao executar essa primeira célula, este podia ser ignorado, pois não prejudicava o resto do código. A imagem 03 mostra as importações realizadas assim como os comandos **Python** necessários.

<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

Além de importar as dependências, o conjunto de dados também precisva ser importado. O conjunto de dados utilizado foi o mesmo do laboratório [curso_spl_014](https://github.com/PedroHeeger/aws_skb/tree/main/self_paced_lab/curso_spl_014), onde no lab 14 os dados foram processados e preparados para etapa de treinamento e inferência que estava sendo executado agora. Não foi necessário salvar os datasets do laboratório anterior, pois o lab atual fornecia os mesmos datasets já processados em um bucket do **Amazon S3** divididos em dados de treinamento ([adult_data_processed_train.csv](./resource/dataset/adult_data_processed_train.csv)), dados de validação ([adult_data_processed_validation.csv](./resource/dataset/adult_data_processed_validation.csv)) e dados de teste ([adult_data_processed_test.csv](./resource/dataset/adult_data_processed_test.csv)). Todos os três estavam separados no bucket em seu respectivo prefixo: `https://labdatabucket-us-west-2-497232574.s3.us-west-2.amazonaws.com/scripts/data/train/adult_data_processed_train.csv`, `https://labdatabucket-us-west-2-497232574.s3.us-west-2.amazonaws.com/scripts/data/validation/adult_data_processed_validation.csv` e `https://labdatabucket-us-west-2-497232574.s3.us-west-2.amazonaws.com/scripts/data/test/adult_data_processed_test.csv`. Os dados foram divididos na seguinte proporação: 70% para treinamento, 20% para validação e 10% para teste.

No código, para importar os dados foi utilizado o **Boto3** para conectar ao bucket do **Amazon S3**, os caminhos para os datasets de treinamento e validação foram passados e os objetos de entrada do treinamento foram construídos. Os conjuntos de dados de treinamento e validação eram usados durante o treinamento, enquanto o conjunto de dados de teste era usado na avaliação do modelo após a implantação. O caminho de saída do modelo foi definido com os comandos `prefix = 'scripts/data'` e `output_path = 's3://{}/{}/output'.format(bucket, prefix)`.

Por fim, ainda nesse bloco de código, um container **Docker** para o treinamento foi configurado com os comandos abaixo:
- `create_date = strftime("%m%d%H%M")`: Criava uma string com a data e hora no formato mês, dia, hora e minuto.
- `container = image_uris.retrieve(framework='xgboost',region=boto3.Session().region_name,version='1.5-1')`: Recuperava a URI da imagem **Docker** do SageMaker armazenada no **Amazon ECR** na região atual que já vinha com o framework **XGBoost** instalado na versão especificada. Por exemplo, o nome da imagem seria algo como `895741380848.dkr.ecr.us-west-2.amazonaws.com/sagemaker-xgboost:1.5-1`
- `run_name = 'lab-2-run-{}'.format(create_date)`: Criava um nome único para o experimento, concatenando "lab-2-run-" com a data e hora geradas.

A imagem 04 exibe as importações dos datasets do bucket do S3, a definição do caminho de saída do modelo, a criação dos objetos de treinamento e a configuração do container que seria utilizado.

<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

##### Configurar um objeto estimador

Um estimador é uma interface de alto nível para o treinamento no **Amazon SageMaker**. Ele é criado fornecendo parâmetros como a função do AWS Identity and Access Management (IAM), a quantidade e o tipo de instâncias de computação, além do caminho de saída no **Amazon S3**.

Na Tarefa 1, foi utilizada uma imagem **Docker** do repositório do SageMaker no **Amazon ECR**, que já vinha com o **XGBoost** instalado. O laboratório se referia a essa abordagem como a "integração do **XGBoost** com o SageMaker", o que pode causar confusão. Na prática, o que ocorria era que, ao invés de criar uma imagem personalizada ou utilizar um script personalizado no container para configurar manualmente o **XGBoost**, o treinamento era realizado dentro de um container **Docker** que já possuía o **XGBoost** instalado e configurado. O SageMaker gerenciava automaticamente esse container para o treinamento do modelo, sem que fosse necessário configurar o ambiente manualmente por meio de um script ou imagem personalizada. Assim, essa "integração" não representa uma interação profunda entre o SageMaker e o **XGBoost**, mas sim o uso de uma imagem otimizada e pronta para uso, na qual o **XGBoost** já estava pré-instalado e pronto para ser utilizado. Em contraste, na Tarefa 2, foi utilizado um script **Python** personalizado, no qual a instalação e configuração do **XGBoost** eram feitas diretamente pelo script, enquanto o SageMaker gerenciava a execução do código ao criar o container. A principal diferença entre as formas de execução estava na flexibilidade no uso do **XGBoost**, onde a execução na segunda tarefa oferecia maior flexibilidade, já que a configuração era feita manualmente.

O **XGBoost** é uma implementação de código aberto eficiente do algoritmo baseado em árvores com aumento de gradiente. O aumento de gradiente é um algoritmo de aprendizado supervisionado que visa prever com precisão uma variável de destino, combinando estimativas de modelos mais simples e fracos. O **XGBoost** tem bom desempenho ao lidar com diferentes tipos de dados, relacionamentos, distribuições e permite o ajuste de vários hiperparâmetros. Esse algoritmo pode ser aplicado a problemas de regressão, classificação (binária e multiclasse) e ranking. Neste caso, o **XGBoost** estava sendo utilizado para resolver um problema de classificação (determinar se alguém ganha menos de USD 50 mil ou não). Dessa forma, o comando abaixo foi executado:

```python
xgb_model = sagemaker.estimator.Estimator(
    image_uri = container,
    role = role, 
    instance_count = 1, 
    instance_type ='ml.m5.xlarge',
    output_path = output_path,
    sagemaker_session = sagemaker_session,
    rules=[
        Rule.sagemaker(
        rule_configs.create_xgboost_report(),
        s3_output_path=output_path + "/rule-output"
        )
    ]
)
```

Nesse comando, um estimador **XGBoost** era criado usando a classe `sagemaker.estimator.Estimator` e definindo os seguintes parâmetros:
- `image_uri`: o URI da imagem do container de treinamento. Este URI da imagem já tinha sido especificada anteriormente, onde a variável `container` armazenou essa informação.
- `função`: o perfil do IAM que o SageMaker usava para executar tarefas em seu nome (por exemplo, ler resultados de treinamento, chamar artefatos de modelo do **Amazon S3** e gravar resultados de treinamento no **Amazon S3**). A variável `role` também já tinha armazenada essa informação.
- `instance_type` e `instance_count`: o tipo e o número de instâncias de computação de ML do **Amazon EC2** a serem usadas para treinamento de modelo. Neste laboratório, foi utilizado uma única instância `ml.m5.xlarge`, que tinha `4` CPUs, `16` GB de memória, armazenamento **Amazon Elastic Block Store (EBS)** e alto desempenho de rede.
- `output_path`: o caminho para o bucket do S3 onde o SageMaker armazenava o artefato do modelo e os resultados do treinamento. A variável `output_path` já tinha armazenada essa informação.
- `sagemaker_session`: o objeto de sessão que gerenciava interações com operações de API do SageMaker e outros serviços da **AWS** usados pelo trabalho de treinamento. A variável `sagemaker_session` já tinha essa informação armazenada.
- `regras`: uma lista de regras integradas do *Amazon SageMaker Debugger*. Neste exemplo, a regra `create_xgboost_report()` criava um relatório **XGBoost** que fornecia informações sobre o progresso e os resultados do treinamento. Contudo, foi identificado que era necessário informar onde esses relatórios seriam armazenados, portanto foi acrescentado o comando `s3_output_path=output_path + "/rule-output"`. Porém, ainda existia um problema. Ao consultar os relatórios lá no final desta tarefa, o local procurado iniciava com o estabelecido pela variável `output_path`, que tinha sido `output_path = 's3://{}/{}/output'.format(bucket, prefix)`, ou seja, o nome do bucket do S3 mais o prefixo que era `prefix = 'scripts/data'`. A pasta inicialmente procurada era `bucket/scripts/data`. Dentro dela, cada trabalho de treinamento que era construído provisionava uma pasta com o nome desse trabalho específico. Logo, o prefixo `/rule-output` deveria ser criado dentro de cada uma dessas pastas, mas não encontrei solução para isso. Sendo assim, a pasta `/rule-output` teve que ficar fora da pasta do job de treinamento, ou seja, dentro de `bucket/scripts/data`. Se um novo trabalho fosse criado, essa pasta e seus arquivos seriam sobrescritos.

A imagem 05 evidencia a configuração do objeto estimador utilizando o algoritmo **XGBoost** integrado ao SageMaker.

<div align="Center"><figure>
    <img src="./0-aux/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

##### Configurar hiperparâmetros

Os hiperparâmetros controlam diretamente a estrutura, a função e o desempenho do modelo. O ajuste de hiperparâmetros permite que os data scientists ajustem o desempenho do modelo para obter resultados ideais. Esse processo é uma parte essencial do machine learning, e a escolha de valores de hiperparâmetros apropriados é crucial para o sucesso. Para definir hiperparâmetros para o algoritmo **XGBoost** foi utilizado o método `set_hyperparameters` do estimador, conforme código abaixo:

```python
xgb_model.set_hyperparameters(
    max_depth = 5,
    eta = 0.2,
    gamma = 4,
    min_child_weight = 6,
    subsample = 0.7,
    verbosity = 0,
    objective = 'binary:logistic',
    num_round = 800
)
```
A explicação de cada parâmetro utilizado é apresentada a seguir:
- `max_depth`: Define a profundidade máxima das árvores, controlando a complexidade do modelo.
- `eta`: Taxa de aprendizado que controla a contribuição de cada árvore para o modelo final.
- `gamma`: Determina a quantidade mínima de redução da perda para dividir um nó, controlando a complexidade da árvore.
- `min_child_weight`: Define o peso mínimo das amostras em um nó filho para garantir que a divisão seja válida.
- `subsample`: Percentual de dados usados para treinar cada árvore, ajudando a evitar overfitting.
- `verbosity`: Controla o nível de mensagens de saída durante o treinamento (0 = sem mensagens).
- `objective`: Define o tipo de problema a ser resolvido (no caso, classificação binária usando a função logística).
- `num_round`: Número de iterações (ou árvores) que o modelo irá treinar.

A imagem 06 exibe a configuração dos hiperparâmetros do algoritmo **XGBoost**.

<div align="Center"><figure>
    <img src="./0-aux/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>

##### Executar um trabalho de treinamento do SageMaker

Com o objeto estimador e os hiperparâmetros configurados, o treinamento do modelo foi iniciado. Para iniciar o treinamento do modelo, foi utilizado o método `fit()` do estimador com os conjuntos de dados de treinamento e de validação, conforme código abaixo. Como foi definido `wait=True`, o método `fit()` exibia logs de progresso e aguardava até que o treinamento fosse concluído. A imagem 07 mostra a execução dessa célula de código. O treinamento levou entre 3 a 4 minutos para ser concluído. A imagem 08 exibe o trabalho de treinamento provisionado pelo SageMaker.

```python
xgb_model.fit(
    {
        "train": train_input,
        "validation": validation_input
    },
    wait=True
)
```

<div align="Center"><figure>
    <img src="./0-aux/img07.png" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="./0-aux/img08.png" alt="img08"><br>
    <figcaption>Imagem 08.</figcaption>
</figure></div><br>

##### Avaliar um modelo

Após a conclusão do trabalho de treinamento, foi possível baixar o relatório de treinamento **XGBoost** gerado pelo SageMaker Debugger. Esse relatório fornecia informações detalhadas sobre o progresso e os resultados do treinamento, como a função de perda em relação à iteração, a importância dos recursos, a matriz de confusão, as curvas de acurácia e outros dados estatísticos. Para o trabalho de treinamento **XGBoost** no SageMaker foi utilizada a regra `CreateXgboostReport` do Debugger para gerar um relatório completo sobre o progresso e os resultados. O processo de geração do relatório poderia levar de cinco a dez minutos. 

No bloco de código a seguir, foi verificado se o relatório final estava disponível no local de destino do S3 que era formado por `bucket/scripts/data/job-name/rule-output`, conforme comando `rule_output_path = xgb_model.output_path + "/" + xgb_model.latest_training_job.job_name + "/rule-output"`. Entretanto, como explicado anteriormente, o caminho onde os relatórios seriam armazenados não tinha como ser construído contendo o nome de um trabalho de treinamento que não tinha sido iniciado. Logo, foi preciso alterar esse caminho, eliminando a pasta com o nome do job de treinamento, ficando da forma que tinha sido estabelecida na criação do objeto estimador: `bucket/scripts/data/rule-output`. Uma outra alteração também precisou ser feita nesse código, o comando `! aws s3 cp {rule_output_path} ./ --recursive` copiava os arquivos da pasta correta no **Amazon S3**, mas colava na pasta raiz desse repositório (`MLMLMD_Repository`). Porém, ao executar o comando `the_file = Path("CreateXgboostReport/xgboost_report.ipynb"`, o arquivo era procurado dentro de uma sub-pasta de nome `CreateXgboostReport` que não tinha sido criada. Portanto, foi necessário alterar o comando para `! aws s3 cp {rule_output_path} ./CreateXgboostReport/ --recursive` para que a pasta correta fosse construída e os arquivos armazenados dentro dela.

Esse processo demorava um pouco, pois o local no S3 era consultado a cada 30 segundos para verificar se os arquivos existiam, ou seja, já tinha sido criados, para então copiá-los para o **JupyterLab**. 

```python
%%capture
the_file = Path("CreateXgboostReport/xgboost_report.ipynb")
notexists = True
while notexists:
    if the_file.is_file():
        notexists = False
    else:
        time.sleep(30)
        rule_output_path = xgb_model.output_path + "/" + "/rule-output"
        ! aws s3 ls {rule_output_path} --recursive
        ! aws s3 cp {rule_output_path} ./CreateXgboostReport/ --recursive
```

Após a conclusão, os arquivos foram armzenados na pasta `CreateXgboostReport`, conforme mostrado na imagem 09, e o último comando executado foi o `display("Click link below to view the XGBoost Training notebook", FileLink("CreateXgboostReport/xgboost_report.ipynb"))`. Este, apenas criava um link com nome do arquivo que seria acessado, que foi o arquivo `xgboost_report.ipynb`

<div align="Center"><figure>
    <img src="./0-aux/img09.png" alt="img09"><br>
    <figcaption>Imagem 09.</figcaption>
</figure></div><br>

Esse arquivo, que também era de notebook com código **Python**, foi aberto em outra guia do **JupyterLab**, conforme imagem 10. Deviso a isso, um novo container era provisionado e o seu kernel foi definido como `Python 3 (ipykernel)`. Em seguida, a opção que reiniciava o kernel e executava todas as células do arquivo foi selecionada. A execução do código desse arquivo levava aproximadamente de dois a três minutos. Após a execução, o arquivo foi rolado para baixo até a matriz de confusão (`Confusion Matriz`). A matriz de confusão ilustrava em uma tabela o número de previsões corretas e incorretas para cada classe, comparando a classe prevista de uma observação e sua classe verdadeira. Ao acessar o diagrama, conforme imagem 11, foram visualizados os seguintes valores:
- `Verdadeiro positivo (TP)`: se a classificação real for positiva e a classificação prevista for positiva (1,1), isso é chamado de resultado verdadeiro positivo, porque a amostra positiva foi identificada corretamente pelo classificador. 
- `Falso negativo (FN)`: se a classificação real for positiva e a classificação prevista for negativa (1,0), isso é chamado de resultado de falso negativo, porque a amostra positiva é identificada incorretamente pelo classificador como sendo negativa. 
- `Falso positivo (FP)`: se a classificação real for negativa e a classificação prevista for positiva (0,1), isso é chamado de resultado de falso positivo, porque a amostra negativa é identificada incorretamente pelo classificador como sendo positiva. 
- `Verdadeiro negativo (TN)`: se a classificação real for negativa e a classificação prevista for negativa (0,0), isso é chamado de resultado verdadeiro negativo, porque a amostra negativa é identificada corretamente pelo classificador.

Um bom modelo tem altos valores de TP e TN, e baixos valores de FP e FN.

<div align="Center"><figure>
    <img src="./0-aux/img10.png" alt="img10"><br>
    <figcaption>Imagem 10.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="./0-aux/img11.png" alt="img11"><br>
    <figcaption>Imagem 11.</figcaption>
</figure></div><br>

Na sequência, a barra de rolagem foi rolada para baixo até `Avaliação da matriz de confusão` e foi analisado o `Relatório de classificação` para entender o resumo da precisão, o recall e a pontuação F1 de cada classe. A imagem 12 mostra o relatório de classificação.
- `Precision` (Precisão): mede a fração de positivos reais que foram previstos como positivos entre todos os previstos como positivos (Verdadeiros + Falsos). O intervalo é de 0 a 1 e um valor maior indica melhor acurácia, ou seja, poucos falsos positivos. A precisão expressa a proporção de pontos de dados que o modelo diz serem relevantes e que eram realmente relevantes. A precisão é uma boa medida a considerar, especialmente quando os custos de FP são elevados. Fórmula: `VP / (VP + FP)`.
- `Recall` (Sensibilidade/taxa de verdadeiro positivo (TPR)): mede a fração de positivos reais que foram previstos como positivos do todo (VP + FN). O intervalo também é de 0 a 1, e um valor maior indica uma melhor acurácia preditiva, ou seja, poucos falsos negativos. Isso também é conhecido como Recall/sensibilidade. Essa medida expressa a capacidade de encontrar todas as instâncias relevantes em um conjunto de dados. Fórmula: `VP / (VP + FN)`.
- `F1-score` (Pontuação F1): demonstra sua métrica-alvo, que é a média harmônica de precisão e recall. A F1 leva em consideração os FP e os FN para dar o mesmo peso à precisão e ao recall. Fórmula: `F1 = 2 x ((Precision * Recall) / (Precision + Recall))`. A F1-score dá um equilíbrio entre Precisão e Recall e é útil quando nenhum dos dois pode ser ignorado (ex.: classificação de fraudes bancárias). Se a F1-score for alta, significa que o modelo está equilibrado entre evitar FP e FN.

<div align="Center"><figure>
    <img src="./0-aux/img12.png" alt="img12"><br>
    <figcaption>Imagem 12.</figcaption>
</figure></div><br>

No cenário do lab, estava sendo previsto se as pessoas ganhavam menos de USD 50 mil para poder promover serviços de assistência governamental a esses cidadãos qualificados. Nesse caso, a pontuação F1 é uma boa medida a ser usada, porque leva em consideração os FP (pessoas que ganhavam mais de USD 50 mil e que foram rotuladas como ganhando menos de USD 50 mil) e os FN (pessoas que ganhavam menos de USD 50 mil e que foram rotuladas como ganhando mais de USD 50 mil) em conta. 

Para que o modelo tivesse poucos falsos positivos e falsos negativos era necessário que os valores de precisão e recall fossem altos respectivamente. Como a pontuação F1 é uma média harmônica entre precisão e recall, se F1 for alta, isso significa que ambas as métricas também estão altas, garantindo um bom equilíbrio no desempenho do modelo. Portanto, na tarefa 2, para atender esses resultados, o modelo foi otimizado, ajustando os hiperparâmetros para ver se conseguia uma pontuação F1 mais alta.

<a name="item01.2"><h4>Tarefa 2: Treinar um modelo usando um script personalizado no modo script</h4></a>[Back to summary](#item0)

Na tarefa anterior, o modelo de machine learning foi construído utilizando o algoritmo **XGBoost** "integrado" ao SageMaker. Ou seja, a imagem **Docker** do repositório do SageMaker no **Amazon ECR**, que já vinha com o **XGBoost** instalado, configurado e com o código de treinamento embutido, foi utilizada para treinar o modelo. Essa abordagem, embora prática, era menos flexível e não permitia configurações avançadas, como validação cruzada k-fold. Para criar um modelo mais flexível, foi necessário utilizar uma imagem **Docker** gerenciada pelo SageMaker, porém otimizada, que permitia o fornecimento de código de treinamento personalizado por meio de um arquivo de script. Com essa abordagem, foi possível ter maior controle sobre o processo, realizando customizações e garantindo que o algoritmo **XGBoost** fosse configurado de acordo com as necessidades específicas, com a possibilidade de implementar recursos avançados no treinamento.

Portanto, um segundo modelo foi treinado utilizando os mesmos conjuntos de dados, porém fazendo uso de arquivo de script **Python** para instalação e configuração do **XGBoost**. As etapas foram praticamente as mesmas do primeiro modelo, o arquivo de notebook para o segundo modelo ([train_script_mode.ipynb](./resource/)) foi aberto e definido `Python 3 (ipykernel)` como kernel, já que ele também usava a linguagem de programação **Python**. Em seguida, o ambiente foi configurado realizando as importações e os comandos inicias mostrados abaixo:
- `sess = sagemaker.Session()`: Criava uma sessão do SageMaker que gerencia a interação com os serviços do SageMaker.
- `region = sess.boto_region_name`: Obtinha a região da **AWS** associada à sessão do SageMaker.
- `s3_client = boto3.client("s3", region_name=region)`: Criava um cliente do S3 usando a região obtida anteriormente.
- `sagemaker_role = sagemaker.get_execution_role()`: Obtinha a role de execução do SageMaker para a instância atual.
- `sagemaker_client = boto3.client("sagemaker")`: Criava um cliente do SageMaker para interagir com o serviço SageMaker usando a sessão do **Boto3**.

A imagem 14 mostra o primeiro bloco de código executado.

<div align="Center"><figure>
    <img src="./0-aux/img14.png" alt="img14"><br>
    <figcaption>Imagem 14.</figcaption>
</figure></div><br>

Na segunda célula de código, foram configurados os caminhos de treinamento e validação que o trabalho de treinamento usava como entrada e definidos os caminhos de saída usados para armazenar os resultados e artefatos gerados durante o treinamento e análise do modelo. Os caminhos de saída são explicados abaixo:
- `model_uri`: Caminho onde o modelo treinado seria salvo no S3.
- `output_uri`: Caminho onde outros resultados ou saídas do treinamento (como métricas ou logs) seriam armazenados.
- `estimator_output_uri`: Caminho onde os artefatos de treinamento, como o modelo final, seriam armazenados após a execução do treinamento.
- `bias_report_output_uri`: Caminho onde o relatório de viés gerado pelo SageMaker Clarify seria salvo.
- `explainability_report_output_uri`: Caminho onde o relatório de explicabilidade, também do SageMaker Clarify, seria armazenado.

A imgem 15 exibe as definições dos caminhos do **Amazon S3** tanto de entrada como saída estabelecidos.

<div align="Center"><figure>
    <img src="./0-aux/img15.png" alt="img15"><br>
    <figcaption>Imagem 15.</figcaption>
</figure></div><br>

Com o comando seguinte foram definidas as configurações do trabalho de ajuste: prefixo do nome do trabalho de treinamento, prefixo do nome do trabalho de tuning, nome do modelo construído com **XGBoost**, quantidade e tipo de instância do **Amazon EC2** utilizada para executar o treinamento. O tuning job é responsável por testar diferentes combinações de hiperparâmetros para encontrar a melhor configuração para o modelo. A melhor escolha de combinações de hiperparâmetros proporcionaria ao final um resultado do F1-score melhor, indicando um modelo melhor, com poucos falsos positivos e falsos negativos.

```python
training_job_name_prefix = "xgbtrain"
tuning_job_name_prefix = "xgbtune" 
xgb_model_name = "xgb-script-mode-model"
train_instance_count = 1
train_instance_type = "ml.m5.xlarge"
```

Em seguida, foram configurados os hiperparâmetros estáticos (`static_hyperparams`), os intervalos de hiperparâmetros (`hyperparameter_ranges`) e o objeto estimador (`xgb_estimator = XGBoost`). Os hiperparâmetros estáticos correspondiam aos valores fixos que não seriam ajustados durante o tuning. Já os intervalos de hiperparâmetros definiam as faixas de valores a serem exploradas pelo job de ajuste de hiperparâmetros (tuning job). O objetivo era encontrar a melhor combinação de valores dentro desses intervalos, maximizando o F1-score.

A configuração do objeto estimador foi diferente da tarefa 1 e abaixo é explicada detalhadamente as diferenças:
- Tareafa 1:
    - Foi utilizado o comando `import sagemaker` para exportar o SDK do SageMaker para linguegem **Python** e o comando `xgb_model = sagemaker.estimator.Estimator` para construir o objeto estimador.
    - O `Estimator` é uma classe genérica dentro do SDK do SageMaker para criar objetos estimadores com qualquer framework ou algoritmo suportado, como: **XGBoost**, **TensorFlow**, **PyTorch**, etc.
    - O `Estimator` faz parte do módulo `sagemaker.estimator` dentro do SageMaker SDK para **Python**.
    - Quando usado com **XGBoost**, `Estimator` permite especificar manualmente a imagem **Docker** que será usada para o treinamento, e o SageMaker gerencia essa execução internamente.
- Tarefa 2:
    - Foi utilizado o comando `from sagemaker.xgboost.estimator import XGBoost` para importar a classe especializada do **XGBoost**, que que herdava da classe genérica `Estimator`.
    - Como essa classe já era específica para **XGBoost**, não era necessário definir a imagem do container manualmente, pois o SageMaker já sabia qual imagem utilizar.
    - O **XGBoost** faz parte do módulo `sagemaker.xgboost.estimator` dentro do SageMaker SDK para **Python**.
    - Em vez de precisar configurar manualmente um container com a classe `Estimator`, a classe **XGBoost** já lidava com essa parte automaticamente.
    - Essa abordagem permitiu passar um script personalizado (`entry_point="xgboost_train.py"`), garantindo maior controle sobre o processo de treinamento. O arquivo de script utilizado foi o [xgboost_train.py](./resource/code/xgboost_train.py)


Os três blocos de código abaixo mostram na ordem: os hiperparâmetros estáticos; os intervalos de hiperparâmetros; a criação do objeto estimador **XGBoost**. Já a imagem 16 evidencia a construção do estimador.

```python
static_hyperparams = {  
                        "eval_metric" : "auc",
                        "objective": "binary:logistic",
                        "num_round": "5"
                      }
```

```python
hyperparameter_ranges = {
    "max_depth": IntegerParameter(6, 9),
    "eta": ContinuousParameter(0.01, 0.03),
    "gamma": ContinuousParameter(0.5, 0.9),
    "min_child_weight": ContinuousParameter(0.5, 0.9),
    "subsample": ContinuousParameter(0.2, 0.5)
}
```

```python
xgb_estimator = XGBoost(
                        entry_point="xgboost_train.py",
                        output_path=estimator_output_uri,
                        code_location=estimator_output_uri,
                        hyperparameters=static_hyperparams,
                        role=sagemaker_role,
                        instance_count=train_instance_count,
                        instance_type=train_instance_type,
                        framework_version="1.7-1",
                        base_job_name=training_job_name_prefix
                    )
```

<div align="Center"><figure>
    <img src="./0-aux/img16.png" alt="img16"><br>
    <figcaption>Imagem 16.</figcaption>
</figure></div><br>

Na sequência, com o comando abaixo, o objeto de sintonizador (`tuner`) que utilizava o objeto estimador **XGBoost**, bem como os intervalos de hiperparâmetros definidos, foi criado. O objeto de sintonizador é a configuração de job de tuning que vai ser executada. Nesse job, a métrica que seria otimizada foi definida como `validation:auc`, que significava que o AUC (Área Sob a Curva ROC) da validação seria usado como objetivo. O dicionário `turner_config_dict` possuía todas configurações para o ajuste de hiperparâmetros:
- `estimator`: O objeto xgb_estimator (modelo **XGBoost** já configurado).
- `max_jobs`: Número máximo de experimentos que seriam executados para encontrar a melhor configuração. Aqui, foram 6 jobs.
- `max_parallel_jobs`: Número máximo de experimentos que podiam rodar simultaneamente. Aqui, foram 3 jobs rodando em paralelo.
- `objective_metric_name`: A métrica-alvo que seria otimizada (`validation:auc`).
- `hyperparameter_ranges`: Intervalos dos hiperparâmetros que seriam testados (já configurados anteriormente).
- `base_tuning_job_name`: Prefixo do nome dos jobs de tuning (`tuning_job_name_prefix`).
- `strategy`: Estratégia de busca dos hiperparâmetros. Aqui estava definido como `Random`, ou seja, os valores seriam escolhidos aleatoriamente dentro dos intervalos definidos.

```python
objective_metric_name = "validation:auc"

tuner_config_dict = {
                     "estimator" : xgb_estimator,
                     "max_jobs" : 6,
                     "max_parallel_jobs" : 3,    
                     "objective_metric_name" : objective_metric_name,
                     "hyperparameter_ranges" : hyperparameter_ranges,
                     "base_tuning_job_name" : tuning_job_name_prefix,
                     "strategy" : "Random"
                    }
tuner = HyperparameterTuner(**tuner_config_dict)
```

O comando `tuner = HyperparameterTuner(**tuner_config_dict)` criava o objeto de tuning de hiperparâmetros, utilizando o dicionário configurado. A classe `HyperparameterTuner` pertence ao SageMaker SDK para **Python** e gerencia a busca pela melhor combinação de hiperparâmetros. A imagem 17

<div align="Center"><figure>
    <img src="./0-aux/img17.png" alt="img17"><br>
    <figcaption>Imagem 17.</figcaption>
</figure></div><br>

Logo após, outro comando foi utilizado para configurar os canais de entrada para o trabalho de tuning e executar o trabalho do sintonizador, passando os dados de treinamento e validação. A imagem 18 mostra o output dessa célula executada. O treinamento levava de três a quatro minutos para ser executado. O job de treinamento era executado dentro do job de tuning, pois o trabalho de tuning executava vários trabalhos de treinamento com diferentes combinações de hiperparâmetros.

```python
s3_input_train = TrainingInput(s3_data="s3://{}/{}".format(read_bucket, train_data_key), content_type="csv", s3_data_type="S3Prefix")
s3_input_validation = (TrainingInput(s3_data="s3://{}/{}".format(read_bucket, validation_data_key), content_type="csv", s3_data_type="S3Prefix"))

tuner.fit(inputs={"train": s3_input_train, "validation": s3_input_validation}, include_cls_metadata=False)
tuner.wait()
```

<div align="Center"><figure>
    <img src="./0-aux/img18.png" alt="img18"><br>
    <figcaption>Imagem 18.</figcaption>
</figure></div><br>

Por fim, o último comando criava um objeto `HyperparameterTuningJobAnalytics` para acessar os resultados do trabalho de tuning mais recente. Em seguida, ele convertia esses resultados em um DataFrame, filtrava as linhas com valores válidos para a métrica objetivo (eliminando valores infinitos), e ordenava os resultados com base no valor da métrica objetivo em ordem decrescente. O objetivo era mostrar as combinações de hiperparâmetros que resultaram nos melhores desempenhos do modelo. A imagem 19 mostra esse dataframe.

```python
df_tuner = sagemaker.HyperparameterTuningJobAnalytics(tuner.latest_tuning_job.job_name).dataframe()
df_tuner = df_tuner[df_tuner["FinalObjectiveValue"]>-float('inf')].sort_values("FinalObjectiveValue", ascending=False)
df_tuner
```

<div align="Center"><figure>
    <img src="./0-aux/img19.png" alt="img19"><br>
    <figcaption>Imagem 19.</figcaption>
</figure></div><br>