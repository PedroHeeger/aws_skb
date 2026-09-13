# AWS CLI com PowerShell: <a href="./ps1">AWS CLI com PowerShell</a>

### AWS <a href="../../../">aws   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25"></a>
#### AWS Scripts <a href="../../">aws_scripts   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25"></a>

<div align="center">

### Identity

| Serviço | Recurso | Power Shell | Dependência | Ação | Qtd Func | Tag | Link |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| identity | - | identity_functions | - | Arquivo de Funções | - | - | [Ver código](./identity_functions.ps1) |
| identity | - | identity_variables | - | Arquivo de Variáveis | - | - | [Ver código](./identity_variables.ps1) |
| iam | User | user | - | Criar/Excluir um usuário do IAM com perfil de login | 12 | Sim | [Ver código](./iam/user.ps1) |
| iam | Group | group | - | Criar/Excluir um grupo de usuário do IAM | 8 | Não | [Ver código](./iam/group.ps1) |
| iam | Role | role | - | Criar/Excluir uma role do IAM | 8 | Sim | [Ver código](./iam/role.ps1) |
| iam | Instance Profile | instance_profile | - | Criar/Excluir um perfil de instância do IAM | 8 | Sim | [Ver código](./iam/instance_profile.ps1) |
| iam | Policy | policy | - | Criar/Excluir uma política do IAM | 10 | Sim | [Ver código](./iam/policy.ps1) |
| iam | MFA Device | mfa_device | - | Criar/Excluir um dispositivo de MFA | 8 | Sim | [Ver código](./iam/mfa_device.ps1) |
| iam | Vinculação | user_mfa | User; MFA Device | Adicionar/Remover um dispositivo de MFA para um usuário | 6 | Não | [Ver código](./iam/user_mfa.ps1) |
| iam | Vinculação | user_key_access | User | Adicionar/Remover uma chave de acesso para um usuário | 6 | Não | [Ver código](./iam/user_key_access.ps1) |
| iam | Vinculação | user_group | User; Group | Adicionar/Remover um usuário do IAM em um grupo | 7 | Não | [Ver código](./iam/user_group.ps1) |
| iam | Vinculação | instace_profile_role | Instance Profile; Role | Adicionar/Remover uma role do IAM a um perfil de instância | 7 | Não | [Ver código](./iam/instance_profile_role.ps1) |
| iam | Vinculação | user_policy | User; {Policy}; {Policy Document} | Adicionar/Remover uma política (gerenciada ou em linha) de um usuário do IAM | 6 | Não | [Ver código](./iam/user_policy.ps1) |
| iam | Vinculação | group_policy | Group; {Policy}; {Policy Document} | Adicionar/Remover uma política de um grupo do IAM | 6 | Não | [Ver código](./iam/group_policy.ps1) |
| iam | Vinculação | role_policy | Role; {Policy}; {Policy Document} | Adicionar/Remover uma política de uma role do IAM | 6 | Não | [Ver código](./iam/role_policy.ps1) |

</div>