# AWS Scripts Models

### Amazon Web Services (AWS) <a href="../">aws_skb   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25"></a>
### Study Material: <a href="../study_material/">study_material</a>

---

Este diretório reúne modelos de scripts que automatizam o provisionamento de serviços e recursos na **AWS**. Cada modelo é disponibilizado em quatro abordagens distintas: **AWS CLI** em **Windows PowerShell**, **AWS CLI** em **Bash**, **AWS SDK for Python** (**Boto3**) e **Terraform** — oferecendo diferentes formas de implementação para os mesmos objetivos de infraestrutura. 

Cada abordagem de cada modelo está disponibilizada em um arquivo próprio. Exceto no **Terraform**, há dois scripts por arquivo: um responsável pela criação da estrutura (serviço ou recurso) e outro para a sua respectiva remoção. Esses scripts sempre iniciam com uma estrutura condicional que verifica se o código deve ou não ser executado. Na maioria dos modelos, buscou-se implementar verificações por meio de condicionais para evitar a criação de recursos que já existam com as mesmas configurações, exceto nos casos em que isso fosse possível na **AWS**. Tais informações de configuração são armazenadas em variáveis dentro dos scripts.

No caso do **Terraform**, por se tratar de uma ferramenta de infraestrutura como código (IaC), foi criado um diretório específico para cada recurso ou serviço. A partir do momento em que o comando `terraform init` é executado, os arquivos de construção são gerados com base nas configurações do `main.tf`. Nesse caso, o mesmo código é responsável tanto pela criação quanto pela destruição da infraestrutura.

Os modelos estão organizados nesta pasta em diretórios correspondentes aos respectivos serviços, dentro das categorias oficiais da **AWS**. Dessa forma, a lista abaixo representa apenas um direcionamento para os arquivos de scrips de provisionamento.

<details><summary>App Integration</summary>
  <ul>
    <li><details><summary>Amazon SNS</summary>
        <ul>
            <li><strong>SNS Topic</strong>: <a href="./appIntegration/sns/snsTopic.ps1">💠 AWS CLI - PowerShell</a> // <a href="./appIntegration/sns/snsTopic.sh">🐚 AWS CLI - Bash</a> // <a href="./appIntegration/sns/snsTopic.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./appIntegration/sns/snsTopic/main.tf">⚙️ Terraform</a></li>
            <li><strong>SNS Subscribe</strong>: <a href="./appIntegration/sns/snsSubscribe.ps1">💠 AWS CLI - PowerShell</a> // <a href="./appIntegration/sns/snsSubscribe.sh">🐚 AWS CLI - Bash</a> // <a href="./appIntegration/sns/snsSubscribe.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./appIntegration/sns/snsTopic/main.tf">⚙️ Terraform</a>
        </ul>
    </details></li>
  </ul>
</details>

<details><summary>Compute</summary>
  <ul>
    <li><details><summary>Amazon EC2</summary>
        <ul>
            <li><details><summary>EC2 Instance</summary>
                <ul>
                    <li><strong>EC2 Instance</strong>: <a href="./compute/ec2/instance/ec2Instance.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/ec2/instance/ec2Instance.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/ec2/instance/ec2Instance.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/ec2/instance/ec2Instance/main.tf">⚙️ Terraform</a></li>
                    <li><strong>EC2 Two Instances</strong>: <a href="./compute/ec2/instance/ec2TwoInst.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/ec2/instance/ec2Instance.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/ec2/instance/ec2Instance.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/ec2/instance/ec2Instance/main.tf">⚙️ Terraform</a></li>
                </ul>
            </details>
            <li><details><summary>EC2 Key Pair</summary>
                <ul>
                    <li><strong>EC2 Key Pair</strong>: <a href="./compute/ec2/keyPair/ec2KeyPair.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/ec2/keyPair/ec2KeyPair.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/ec2/keyPair/ec2KeyPair.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/ec2/keyPair/ec2KeyPair/">⚙️ Terraform</a></li>
                </ul>
            </details></li>
            <li><details><summary>EC2 Lauch Template</summary>
                <ul>
                    <li><strong>EC2 Lauch Template</strong>: <a href="./compute/ec2/launchTemp/launchTemp.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/ec2/launchTemp/launchTemp.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/ec2/launchTemp/launchTemp.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/ec2/launchTemp/launchTemp/main.tf">⚙️ Terraform</a></li>
                </ul>
            </details></li>
            <li><details><summary>EC2 User Data</summary>
                <ul>
                    <li><strong>Linux Tools & Git</strong>: <a href="./compute/ec2/userData/0linuxTools_git/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>AWS & Docker</strong>: <a href="./compute/ec2/userData/aws_dock/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>ECS Agent</strong>: <a href="./compute/ec2/userData/ecs_agent/udFileRpm.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>Httpd</strong>: <a href="./compute/ec2/userData/httpd/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>Httpd & Stress</strong>: <a href="./compute/ec2/userData/httpd_stress/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>NFS Server</strong>: <a href="./compute/ec2/userData/nfsServer/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>NVM e Node.js</strong>: <a href="./compute/ec2/userData/nvm_nodejs/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>Zshell e AWS</strong>: <a href="./compute/ec2/userData/zsh_aws/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>Zshell, AWS e Docker</strong>: <a href="./compute/ec2/userData/zsh_aws_dock/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                    <li><strong>Zshell, AWS, Dokcer e Kubernetes</strong>: <a href="./compute/ec2/userData/zsh_aws_dock_kube/udFileDeb.sh">🐚 AWS CLI - Bash</a></li>
                </ul>
            </details></li>
        </ul>
    </details></li>
    <li><details><summary>AWS Auto Scaling</summary>
        <ul>
            <li><details><summary>Auto Scaling Group</summary>
                <ul>
                    <li><strong>Auto Scaling Group</strong>: <a href="./compute/ec2/instance/ec2Instance.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/ec2/instance/ec2Instance.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/ec2/instance/ec2Instance.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/ec2/instance/ec2Instance/main.tf">⚙️ Terraform</a></li>
                </ul>
            </details>
            <li><details><summary>Launch Configuration</summary>
                <ul>
                    <li><strong>Launch Configuration</strong>: <a href="./compute/as/launchConfig/asLaunchConfig.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/as/asg/asg.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/as/asg/asg.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/as/asg/asg/main.tf">⚙️ Terraform</a></li>
                </ul>
            </details>
            <li><details><summary>Policies</summary>
                <ul>
                    <li><strong>Simple Scaling Policy</strong>: <a href="./compute/as/policy/asScalingPolicy.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/as/policy/asScalingPolicy.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/as/policy/asScalingPolicy.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/as/policy/asScalingPolicy/main.tf">⚙️ Terraform</a></li>
                    <li><strong>Simple Scaling Policy Double</strong>: <a href="./compute/as/policy/asScalingPolicyDouble.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/as/policy/asScalingPolicyDouble.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/as/policy/asScalingPolicyDouble.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/as/policy/asScalingPolicy/main.tf">⚙️ Terraform</a></li>
                    <li><strong>Step Scaling Policy</strong>: <a href="./compute/as/policy/assScalingPolicy.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/as/policy/assScalingPolicy.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/as/policy/assScalingPolicy.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/as/policy/asScalingPolicy/main.tf">⚙️ Terraform</a></li>
                    <li><strong>Target Tracking Scaling Policy</strong>: <a href="./compute/as/policy/asttScalingPolicy.ps1">💠 AWS CLI - PowerShell</a> // <a href="./compute/as/policy/asttScalingPolicy.sh">🐚 AWS CLI - Bash</a> // <a href="./compute/as/policy/asttScalingPolicy.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./compute/as/policy/asScalingPolicy/main.tf">⚙️ Terraform</a></li>
                </ul>
            </details>
        </ul>
    </details></li>
  </ul>
</details>



<details><summary>Cost</summary>
  <ul>
    <li><details><summary>AWS Budget</summary>
        <ul>
            <li><strong>Budget</strong>: <a href="./cost/budget/budget.ps1">💠 AWS CLI - PowerShell</a> // <a href="./cost/budget/budget.sh">🐚 AWS CLI - Bash</a> // <a href="./cost/budget/budget.py">🐍 AWS SDK for Python (Boto3)</a> // <a href="./cost/budget/budget/main.tf">⚙️ Terraform</a></li>
        </ul>
    </details></li>
  </ul>
</details>