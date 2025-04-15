# Training Category: <a href="./aws_jam">aws_jam</a>

### AWS <a href="../">aws   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/aws_skill_builder.png" alt="aws_skill_builder" width="auto" height="25"></a>

O **AWS Jam** é uma experiência prática e gamificada oferecida pela **AWS**, voltada para o aprendizado de seus serviços por meio da resolução de desafios do mundo real, em um ambiente seguro e controlado. Esses desafios simulam cenários técnicos que exigem investigação, conhecimento e habilidades práticas para serem resolvidos.

O Jam é realizado em eventos da **AWS**, como o *re:Invent*, ou promovido por parceiros em contextos empresariais e educacionais. A participação pode ser individual ou em equipe, de forma presencial ou virtual. Existem edições públicas e outras restritas a determinados grupos. Para isso, a **AWS** disponibiliza uma plataforma específica, acessível por meio do site [https://beta.jam.aws.com/](https://beta.jam.aws.com/), onde o login pode ser feito com o **AWS Builder ID**, o mesmo utilizado no **AWS Skill Builder**. Esse login cria um perfil único para participar dos desafios da plataforma.

Além disso, alguns desafios do **AWS Jam** foram adaptados para o Skill Builder, sob uma categoria específica chamada **AWS Jam Journey**. Esses desafios podem ser realizados individualmente, sem a necessidade de participar de um evento. Ao iniciar um Jam Journey pelo Skill Builder, o desafio é aberto na plataforma do **AWS Jam**, onde são exibidas as instruções e o ambiente de laboratório.

Cada Jam é composto por diversos desafios, que por sua vez contêm tarefas práticas. Cada tarefa inclui uma descrição, critérios de validação (manuais ou automáticos), pontuação e pistas opcionais que, se utilizadas, reduzem a pontuação final. Ao iniciar um desafio, é provisionado automaticamente um sandbox no console da **AWS**, exclusivo para aquele desafio. Esse ambiente pode ser acessado de três formas: diretamente pelo console, via **AWS CLI** ou utilizando o **AWS SDK for Python** (**Boto3**). Também é possível acessar o ambiente via **AWS Cloud9**, especialmente ao optar pela integração com o **Amazon Q**.

Diferente dos treinamentos do tipo `Self-Paced Lab` (laboratórios auto-guiados), onde todas as etapas são orientadas passo a passo, no **AWS Jam** o participante recebe apenas uma descrição geral do problema. Cabe ao usuário explorar e encontrar soluções por conta própria. Algumas tarefas podem ter múltiplas abordagens válidas, incentivando o raciocínio crítico e a autonomia. Ainda assim, o ambiente é limitado para garantir que apenas as ações previstas nos desafios sejam executadas.

Em alguns casos, parte da infraestrutura necessária já é provisionada automaticamente por meio de pilhas do **AWS CloudFormation**, garantindo que o cenário inicial esteja pronto para uso. O acesso ao sandbox é feito por meio de uma identidade federada, onde o perfil do **AWS Jam** ou do Skill Builder funciona como um provedor de identidade (IdP). Esse IdP autentica o usuário e associa automaticamente uma IAM Role criada via CloudFormation. Essa role fornece credenciais temporárias e permissões mínimas, suficientes para a realização das atividades do laboratório, garantindo a segurança e o controle dos recursos provisionados.

Aqui as atividades desenvolvidas do **AWS Jam Journey** no **AWS Skill Builder** foram listadas abaixo na ordem que foram executadas. Não foi realizado uma classificação com relação à área ou aos serviços, pois em um mesmo Jam poderiam haver desafios relacionados a mais de uma área ou serviço.

### Activities:
<li>curso_jam_001: <a href="./curso_jam_001/">Lab - Filtering and blocking web incursions with AWS WAF   <img src="./curso_jam_001/0-aux/logo_course.png" alt="curso_jam_001" width="auto" height="25"></a></li>
