# AWS Scripts: <a href="./">aws_scripts</a>

### AWS <a href="../">aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25"></a>

O *AWS Scripts* é um diretório de conteúdo autoral criado para centralizar, organizar e compartilhar scripts voltados ao provisionamento e à gestão de infraestrutura em nuvem. Após evoluir por diferentes abordagens, o projeto consolidou uma estrutura padronizada para reestruturar códigos antigos e desenvolver novas implementações para serviços variados da AWS.

A iniciativa abrange inicialmente três tecnologias principais: **AWS CLI com PowerShell**, **SDK Boto3 com Python** e **Terraform**. Outras ferramentas (como Bash ou AWS CloudFormation) estão temporariamente congeladas, mas poderão ser incorporadas no futuro.

A organização do material é baseada nas tecnologias e estruturada por categorias de serviços (como *Compute*, *Cost*, *Identity* e *Network*), contendo subpastas específicas para cada recurso (*EC2*, *Budget*, *IAM*, *VPC*). A arquitetura de desenvolvimento varia conforme a tecnologia adotada:

* **PowerShell e Python:** Utilizam uma abordagem modular baseada em funções. Em cada categoria, existem dois arquivos centrais: um com blocos de variáveis e outro com blocos de funções para cada recurso. As pastas de serviços contêm apenas os scripts de chamada, que carregam esses arquivos base e executam as funções a partir de uma estrutura condicional (geralmente contemplando opções para criar/vincular recursos, remover/desvincular, ou encerrar o fluxo). Cada categoria conta com um arquivo *README.md* contendo uma tabela de mapeamento para facilitar a navegação.

* **Terraform:** Como utiliza o conceito de infraestrutura declarativa, não emprega funções. Os arquivos de cada serviço são organizados de forma padrão em suas respectivas pastas: `main.tf` (código de criação completo do serviço), `provider.tf` (definição do provedor), `variables.tf` (controle de variáveis) e `output.tf` (saídas de dados). O controle de execução dos recursos é gerenciado diretamente nos blocos de código por comentários.

### Tecnologias:

<details><summary>AWS CLI com PowerShell <img src="." alt="" width="auto" height="25"></summary>
    <ul>
        <li>App Integration: <a href="./ps1/app_integration">App Integration   </a></li>
        <li>Compute: <a href="./ps1/compute">Compute   </a></li>
        <li>Cost: <a href="./ps1/cost">Cost   </a></li>
        <li>Network: <a href="./ps1/network">Network   </a></li>
        <li>Security: <a href="./ps1/security">Security   </a></li>
    </ul>
</details>
<details><summary>Boto3 com Python <img src="." alt="" width="auto" height="25"></summary>
    <ul>
        <li>App Integration: <a href="./ps1/app_integration">App Integration   </a></li>
        <li>Compute: <a href="./ps1/compute">Compute   </a></li>
        <li>Cost: <a href="./ps1/cost">Cost   </a></li>
        <li>Network: <a href="./ps1/network">Network   </a></li>
        <li>Security: <a href="./ps1/security">Security   </a></li>
    </ul>
</details>
<details><summary>Terraform <img src="." alt="" width="auto" height="25"></summary>
    <ul>
        <li>App Integration: <a href="./ps1/app_integration">App Integration   </a></li>
        <li>Compute: <a href="./ps1/compute">Compute   </a></li>
        <li>Cost: <a href="./ps1/cost">Cost   </a></li>
        <li>Network: <a href="./ps1/network">Network   </a></li>
        <li>Security: <a href="./ps1/security">Security   </a></li>
    </ul>
</details>
