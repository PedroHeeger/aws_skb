# Lab - Analyze Big Data with Hadoop   <img src="./0-aux/logo_course.png" alt="curso_spl_009" width="auto" height="45">

### AWS Skill Builder <a href="../../">aws_skill_builder   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>
### Training Category: <a href="../../self_paced_lab">self_paced_lab</a>
### Software/Subject: aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
### Course: <a href="./">curso_spl_009 (Lab - Analyze Big Data with Hadoop)   <img src="./0-aux/logo_course.png" alt="curso_spl_009" width="auto" height="25"></a>

#### Parceria da AWS com a Escola da Nuvem (EDN)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25">

---

### Theme:
- Big Data
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
  - Amazon CloudFront   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_cloudfront.svg" alt="aws_cloudfront" width="auto" height="25">
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon Elastic MapReduce (EMR)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_emr.svg" alt="aws_emr" width="auto" height="25">
  - Amazon Simple Storage Service (S3)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_s3.svg" alt="aws_s3" width="auto" height="25">
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
  - Apache Hadoop MapReduce   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/apache_hadoop_mapreduce.png" alt="apache_hadoop_mapreduce" width="auto" height="25">
  - Apache Hive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/apache_hive.png" alt="apache_hive" width="auto" height="25">
  - Hadoop Distributed File System (HDFS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/hdfs.png" alt="hdfs" width="auto" height="25">

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
O objetivo deste laboratório prático foi implantar um cluster **Hadoop** totalmente funcional no serviço **Amazon EMR** e com um script **HiveQL** processar os dados de log de uma distribuição do **Amazon CloudFront** armazenados em um bucket do **Amazon Simple Storage Service (S3)**. **HiveQL** é uma linguagem de script semelhante a SQL para armazenamento e análise de dados. O **Amazon EMR** é um serviço gerenciado que torna rápido, fácil e econômico executar o **Apache Hadoop** e o **Apache Spark** para processar grandes quantidades de dados. O **Amazon EMR** também oferece suporte a ferramentas Hadoop poderosas e comprovadas, como **Presto**, **Hive**, **Pig**, **HBase** e muito mais.

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

Infelizmente, a role utilizada pelo laboratório não possuía permissões para criar buckets no **Amazon S3**, conforme mostrado na imagem 01. Dessa forma, o laboratório ficou comprometido e foi necessário fazer alguns ajustes para conseguir executá-lo. Sendo assim, é possível que algumas imagens não esteam disponíveis ou mostrem outra execução da que deveria ser realizada.

<div align="Center"><figure>
    <img src="./0-aux/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item01.2"><h4>Tarefa 2: iniciar um cluster do Amazon EMR</h4></a>[Back to summary](#item0)

A tarefa seguinte foi iniciar o cluster **Apache Hadoop** no serviço **Amazon Elastic MapReduce (EMR)** para processar os dados. Antes de iniciar a criação, foi necessário garantir que a região selecionada no console era igual a indicada nas informações do lab (`us-east-1` (Norte Virgínia)). O cluster foi definido com as seguintes configurações:
- Nome: `Meu cluster`.
- Versão Amazon EMR: `emr-5.36.1`.
- Pacote de aplicativos: foi escolha `Personalizado` e selecionados os seguintes aplicativos, caso ainda não tivesse sido selecionados:
  - **Hue**
  - **Hadoop**
  - **Hive**
  - **Pig**
- Na seção `Configuração do cluster - necessária`; foi configurado o seguinte:
  - Foi escolhido `Grupos de instâncias uniformes`.
  - Para `Primary`, `Core` e `Task 1 de 1`: foi selecionado `m4.large` no menu suspenso `Escolher tipo de instância EC2`.
- Na seção `Rede - necessária`, foi configurado o seguinte:
  - Para `Nuvem privada virtual (VPC)`: foi escolhida a opção `Procurar`.
  - Na janela pop-up `Escolher VPC`: foi selecionado a VPC `Lab VPC`.
  - A seção `Grupos de segurança do EC2 (firewall)` foi expandida e, para o `grupo de segurança gerenciado pelo EMR`, foi selecionado o grupo de segurança que continha o nome `xxxx-EmrSecurityGroup-xxxx` (`ElasticMapReduce-master-SSH`) para o nó `Primary` e os nós `Core` e de `Task`.
- Na seção `Encerramento do cluster e substituição do nó`, foi desmarcado `Use proteção de terminação`.
- Foi expandida a seção `Logs do cluster` e configurado o seguinte:
  - Foi selecionado `Publique logs específicos do cluster no Amazon S3`.
  - Para localização do Amazon S3: foi escolhida `Procurar S3`.
  - Na janela pop-up `Escolher local do Amazon S3`: foi selecionado o bucket do Hadoop que foi criado anteriormente (`edn-dpcn-aws-hadoop`). (`s3://aws-logs-729452871114-us-east-1/elasticmapreduce`)
- Na seção `Configuração de segurança e par de chaves EC2`: foi configurado o seguinte:
  - Para o par de chaves Amazon EC2 para SSH no cluster: foi escolhido `Procurar`.
  - Na janela pop-up `Escolher par de chaves do Amazon EC2 para SSH no cluster`: foi selecionado o par de chaves chamado `EMRKey-lab` que já veio criado pelas pilhas do CloudFormation.
-  Na seção `Funções de gerenciamento de identidade e acesso (IAM) - obrigatórias`, foi configurado o seguinte:
  - Para a função de serviço do Amazon EMR: foi selecionada a role `EMR_DefaultRole` que também já tinha sido criada.
  - Para o perfil de instância do EC2 para Amazon EMR: foi selecionado o perfil de instância `EMR_EC2_DefaultRole` que também já tinha sido construído.

A imagem 02 evidencia o cluster provisionado com sucesso. Poderia ser que o cluster levasse aproximadamente cinco minutos para ser iniciado.

<div align="Center"><figure>
    <img src="./0-aux/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

A configuração padrão instalou automaticamente vários aplicativos padrões no cluster. Alguns deles componentes nativos do próprio **Apache Hadoop**, como **Apache Hive** e **Apache Pig**:
- **Apache Hadoop**: é um projeto de software de código aberto que pode ser usado para processar grandes conjuntos de dados de forma eficiente. Em vez de usar um computador grande para processar e armazenar os dados, o Hadoop usa clusters de hardware de commodity para analisar conjuntos de dados massivos em paralelo (MPP).
- **Ganglia**: O projeto de código aberto **Ganglia** é um sistema escalável e distribuído, projetado para monitorar clusters e grades, minimizando o impacto em seu desempenho. O **Ganglia** pode gerar relatórios e visualizar o desempenho do cluster como um todo, bem como inspecionar o desempenho de nós individuais.
- **Apache Tez**: é uma estrutura para criar um grafo acíclico direcionado (DAG) complexo de tarefas para processamento de dados. Em alguns casos, ele é usado como uma alternativa ao **Apache Hadoop MapReduce**. Por exemplo, os fluxos de trabalho Pig e Hive podem ser executados usando o Hadoop MapReduce ou podem usar o Tez como um mecanismo de execução.
- **Apache Hive**: é um data warehouse de código aberto e um pacote analítico que roda em cima de um cluster Hadoop. Os scripts do Hive usam uma linguagem semelhante a SQL chamada **Hive Query Language (HiveQL)** que abstrai modelos de programação e suporta interações típicas de data warehouse. O Hive permite que sejam evitadas as complexidades de escrever trabalhos Tez com base em gráficos acíclicos direcionados (DAGs) ou programas MapReduce em uma linguagem de computador de nível inferior, como **Java**.
- **Hadoop User Experience (Hue)**: é uma interface gráfica de usuário de código aberto, baseada na web, para uso com **Amazon EMR** e **Apache Hadoop**. Hue agrupa vários projetos diferentes do ecossistema Hadoop em uma interface configurável para o cluster **Amazon EMR**.
- **Apache Pig**: é uma biblioteca Apache de código aberto que roda em cima do Hadoop. A biblioteca pega comandos do tipo SQL escritos em uma linguagem chamada **Pig Latin** e converte esses comandos em trabalhos Tez baseados em gráficos acíclicos direcionados (DAGs) ou programas MapReduce. Não é preciso escrever código complexo usando uma linguagem de computador de nível inferior, como **Java**.

Resumidamente:
- **Apache Hadoop**: Framework de processamento distribuído de grandes volumes de dados em clusters de hardware commodity.
- **Ganglia**: Sistema de monitoramento escalável e distribuído para clusters e grades de computadores.
- **Apache Tez**: Framework para processamento de dados com gráficos acíclicos direcionados (DAGs), utilizado como alternativa ao MapReduce.
- **Apache Hive**: Data warehouse para Hadoop, com suporte a consultas SQL-like através da linguagem **HiveQL**.
- **Hadoop User Experience (Hue)**: Interface web para facilitar o gerenciamento e uso de ferramentas Hadoop, como Hive e Pig, no Amazon EMR.
- **Apache Pig**: Linguagem de alto nível (**Pig Latin**) que transforma scripts em tarefas executadas por Tez ou MapReduce.

Nativamente, o **Apache Hadoop** é composto por diversos componentes, sendo os dois primeiros os principais e muitas vezes os mais lembrados:
- **Apache Hadoop MapReduce**: É um mecanismo de processamento de dados que divide tarefas em duas fases: Map (processamento paralelo) e Reduce (agregação dos resultados). Ele permite o processamento distribuído de grandes volumes de dados de forma eficiente. O **MapReduce** é também conhecido como um modelo de programação.
- **Hadoop Distributed File System (HDFS)**: É o sistema de arquivos distribuído do Hadoop, projetado para armazenar grandes volumes de dados de maneira escalável e redundante em clusters de máquinas. Ele divide os dados em blocos grandes e os distribui por vários nós, garantindo tolerância a falhas por meio de replicação.
- **Yet Another Resource Negotiator (YARN)**: É o gerenciador de recursos do Hadoop, responsável por alocar e monitorar os recursos do cluster, como CPU e memória, garantindo que as tarefas sejam executadas de forma eficiente e equilibrada entre os nós.
- **Apache Hive**: É uma infraestrutura de data warehouse sobre o Hadoop que permite consultas SQL-like usando a linguagem **HiveQL**. Ele facilita a interação com grandes volumes de dados através de uma interface semelhante ao SQL, sem a necessidade de escrever código complexo.
- **Apache HBase**: É um banco de dados NoSQL distribuído e de baixo nível, projetado para armazenar dados estruturados em grande escala, oferecendo acesso em tempo real a dados, como leitura e escrita rápidas, ideal para sistemas que exigem baixa latência.
- **Apache Pig**: É uma plataforma de processamento de dados que utiliza a linguagem de alto nível **Pig Latin** para transformar e processar dados. Pig facilita o processamento de dados complexos e não estruturados, convertendo scripts em tarefas MapReduce ou Tez.
- **Apache ZooKeeper**: É um serviço centralizado para coordenação e sincronização de processos em clusters distribuídos. O ZooKeeper é usado para gerenciar configurações e fornecer mecanismos de bloqueio e notificações entre os nós do cluster, garantindo que todas as partes do sistema funcionem de maneira sincronizada.

<a name="item01.3"><h4>Tarefa 3: Processe seus dados de amostra executando um script Hive</h4></a>[Back to summary](#item0)

Nesta terceira tarefa, o objetivo foi processar os dados oriundos do **Amazon CloudFront**. O CloudFront é um serviço da Web que acelera a distribuição de conteúdo da Web estático e dinâmico, como **HTML**, **CSS**, **PHP** e arquivos de imagem. O CloudFront entrega conteúdo por meio de uma rede mundial de data centers chamados edge locations. Quando um usuário solicita conteúdo por meio do CloudFront, ele é roteado para o edge location que fornece a menor latência (atraso de tempo), para que o conteúdo seja entregue com o melhor desempenho possível. Se o conteúdo já estiver no edge location com a menor latência, o CloudFront o entrega imediatamente. Se o conteúdo não estiver nesse edge location, o CloudFront o recupera de um bucket do **Amazon S3** ou de um servidor HTTP (por exemplo, um servidor da Web) que foi identificado como a origem da versão definitiva do conteúdo. O **Amazon CloudFront** pode produzir logs de acesso que mostram todos os dados solicitados pelos usuários. Os arquivos de log podem crescer muito, então o Hadoop é uma maneira ideal de processar e analisar os arquivos de log. Abaixo é apresentado um exemplo de log do CloudFront.

```
2017-07-05 20:05:47 SEA4 4261 10.0.0.15 eabcd12345678.cloudfront.net /test-image-2.jpeg Mozilla/5.0%20(MacOS;%20U;%20Windows%20NT%205.1;%20en-US;%20rv:1.9.0.9)%20Gecko/2009040821%20Chrome/3.0.9
```

Esse exemplo de log mostra as seguintes informações:
- Data:	A data em que o evento ocorreu. (`2017-07-05`)
- Tempo: O horário em que o servidor CloudFront terminou de responder à solicitação (em UTC). (`20:05:47`)
- Localização de Borda (Edge Locations): O local de borda que atendeu à solicitação. Cada local de borda é identificado por um código de três letras e um número atribuído arbitrariamente, por exemplo, DFW3. O código de três letras normalmente corresponde ao código de aeroporto da International Air Transport Association para um aeroporto próximo ao local de borda. (`SEA4`)
- Bytes: O número total de bytes que o CloudFront forneceu ao visualizador em resposta à solicitação, incluindo cabeçalhos. (`4261`)
- Propriedade Intelectual: O endereço IP do visualizador que fez a solicitação. (`10.0.0.15`)
- Método: O método de acesso HTTP: DELETE, GET, HEAD, OPTIONS, PATCH, POST ou PUT. (`GET`)
- Hospedar:	O nome de domínio da distribuição do CloudFront. (`abcd.cloudfront.net`)
- URI: A parte do URI que identifica o caminho e o objeto. (`/imagem-de-teste-2.jpeg`)
- Status: Um código de status HTTP (por exemplo, 200 = sucesso). (`200`)
- Referenciador: O nome do domínio que originou a solicitação. (`-`)
- Agente do usuário: O cabeçalho User-Agent identifica a origem da solicitação, como o tipo de dispositivo e navegador que enviou a solicitação e, se a solicitação veio de um mecanismo de busca, qual mecanismo de busca. (`Mozilla/5.0…`)

Com o cluster Hadoop em execução, um script Hive foi executado como uma etapa no console do **Amazon Elastic MapReduce (EMR)** para processar os dados de amostra. No Amazon EMR, uma etapa é uma unidade de trabalho que contém um ou mais trabalhos do Hadoop. É possível enviar etapas ao criar o cluster ou quando o cluster estiver em execução, se for um cluster de execução longa. A etapa adicionada foi configurada da seguinte maneira:
- `Tipo`: foi escolhido `Programa Hive`.
- `Nome`: `Registros de processo`.
- Para o local do script Hive: foi passado o bucket do **Amazon S3** que ele se encontrava (`s3://us-east-1.elasticmapreduce.samples/cloudfront/code/Hive_CloudFront.qna`). Tanto este bucket como o arquivo foram gerados pelo próprio laboratório ao iniciar.
- Para inserir o local do Amazon S3 - opcional: foi inserido `s3://us-east-1.elasticmapreduce.samplesna`.
- Para saída Amazon S3 local - opcional: foi navegado até o S3 e escolhido o bucket criado na tarefa 1 (`edn-dpcn-aws-hadoop`).
- Para argumentos - opcional: foi inserido `hiveconf hive.support.sql11.reserved.keywords=false`. Isso permitia nomes de colunas que eram iguais às palavras reservadas.

Após adicionar a etapa, o status dela iniciava em pendente, em seguida entrava em execução até ser concluída. A imagem 03 evidencia a adição desta etapa no cluster **Apache Hadoop** no serviço **Amazon EMR**. O conjunto de dados de amostra que eram os logs gerados pelo **Amazon CloudFront**, continham aproximadamente 5000 linhas de dados. Esse mesmo processo, no entanto, poderia ser usado para processar milhões de linhas de dados em paralelo em vários nós.

<div align="Center"><figure>
    <img src="./0-aux/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

Com relação ao script Hive, ele realizava as seguintes ações:
- Criava uma tabela Hive chamada `cloudfront_logs` dentro do cluster. ([create_table.hql](/resource/create_table.hql))
- Lia os arquivos de log do CloudFront do **Amazon S3** e analisava os arquivos usando o Serializador/Desserializador de Expressões Regulares (RegEx SerDe). ([log_analyze.hql](/resource/log_analyze.hql))
- Gravava os resultados analisados ​​na tabela Hive `cloudfront_logs`.
- Enviava uma consulta HiveQL aos dados para recuperar o total de solicitações por sistema operacional em um determinado período. ([query.hql](/resource/query.hql))
- Gravava os resultados da consulta no bucket de saída do **Amazon S3**.

<a name="item01.4"><h4>Tarefa 4: Visualizar os resultados</h4></a>[Back to summary](#item0)

Após a conclusão bem-sucedida da etapa, a saída da consulta produzida pelo script do Hive era armazenada no bucket do **Amazon S3** que foi provisionado e especificado nas configurações da etapa. O objetivo nesta tarefa foi visualizar os resultados da saída da consulta produzida pelo script Hive. Dessa forma, foi preciso acessar o bucket `edn-dpcn-aws-hadoop` no **Amazon S3** que agora possuía o prefixo `os_requests`. Ao acessar esse prefixo, alguns arquivos de texto eram listado, conforme imagem 04. Para visualizar o conteúdo dos arquivos foi necessário baixá-los e abrí-los com um editor de texto ou ambiente de desenvolvimento integrado (IDE). Neste caso, foi utilizado o **Visual Studio Code (VS Code)**. A imagem 05 mostra o output da consulta HiveQL realizada pelo script Hive para recuperar o total de solicitações por sistema operacional a distribuição do CloudFront em um determinado período.

<div align="Center"><figure>
    <img src="./0-aux/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="./0-aux/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

Devido aos problemas do laboratório, as tarefas 3 e 4 foram executadas interativamente após conectar remotamente na tarefa 5. Contudo, os logs da distribuição do CloudFront também não vieram armazenadas no bucket correspondente, o que significava que não haveria logs para ser processados.

<a name="item01.5"><h4>Tarefa 5: conectar-se à CLI do cluster EMR e executar a consulta usando HiveQL</h4></a>[Back to summary](#item0)

Na tarefa 5, o objetivo foi executar a consulta HiveQL diretamente ao cluster EMR utilizando a interface de linha de comando da **AWS** (**AWS CLI**). Para isso, o primeiro passo era se conectar ao cluster através de uma conexão SSH. Contudo, primeiro foi utilizado o recurso *Session Manager* do **AWS System Manager (SSM)** para abrir uma sessão com uma instância de tag de nome `CommandHost`, sendo facilitado pelo link fornecido pelo laboratório que já levava direto a sessão abrindo o terminal. Mas esse mesmo processo poderia ser feito manualmente no console do SSM. Lembrando que esse cluster era formado por três instâncias, sendo uma a `Primary`, a outra a `Core` e a última a `Task 1 de 1`.

Dentro da sessão, alguns comandos foram executados. O primeiro comando executado foi `export ID=$(aws emr list-clusters | jq '.Clusters[0].Id' | tr -d '"')` para recuperar o ID do cluster EMR, que no caso era `j-UNXVSD07WBOO`. Com o comando `export HOST=$(aws emr describe-cluster --cluster-id $ID | jq '.Cluster.MasterPublicDnsName' | tr -d '"')` era extraído o DNS público da instância primária do cluster, que era `ec2-54-234-168-174.compute-1.amazonaws.com`. Pode ser que seja necessário executar esses dois comandos antes `export LANG=en_US.UTF-8` e `export LC_ALL=en_US.UTF-8`, para forçar a codificação para `UTF-8` ao invés de utilizar o padrão do terminal que é `ASCII`. Já com o comando `ssh -i ~/EMRKey-lab.pem hadoop@$HOST` uma conexão SSH da própria instância mestre com o cluster ao qual essa instância pertencia era executada, passando o arquivo de chave privada para autenticação, que já estava na instância, o nome de usuário que estava acessando, que era `hadoop` e o dns público da instância que tinha sido extraído antes e armazenado na variável `HOST`. A imagem 06 evidencia a abertura de sessão remota SSH da instância mestre com o cluster **Apache Hadoop** no **Amazon EMR**. Basicamente foi realizado um acesso remoto dentro de outro.

<div align="Center"><figure>
    <img src="./0-aux/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>

De dentro dessa sessão SSH foi executado o comando `Hive` para abrir o **Apache Hive** e poder executar a consulta **HiveQL** abaixo. Essa mesma consulta foi executada no script Hive na tarefa 3. Ela calculava o total de solicitações por sistema operacional a distribuição do **Amazon CloudFront** em um determinado período. Essas informações já tinha sido extraídas do CloudFront e armazenadas na tabela Hive criada anteriormente também pelo mesmo script. A imagem 07 mostra o output da consulta realizada.

```hql
SELECT
  os,
  COUNT(*) count
FROM cloudfront_logs
WHERE dateobject
BETWEEN '2014-07-05' AND '2014-08-05'
GROUP BY os;
```

<div align="Center"><figure>
    <img src="./0-aux/img07.png" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>

<a name="item01.6"><h4>Tarefa 6: Encerre seu cluster Amazon EMR</h4></a>[Back to summary](#item0)

