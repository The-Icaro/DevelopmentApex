# Repositório Basico para Apex

Repositorio padrão para qualquer projeto Salesforce apex nele você já terá configurado:

    - Padrão de EOF (gitattributes)
    - git ignore
    - Modelo de Pipeline para deployment automático na salesforce
    - Configuração de padrão de branchs (git flow)

## Como utilizar este repositório

Ao criar um novo repositório você tem a opção de importar de uma "repo" já existente, então basta seleciona-lo na listas de repositorios e pronto.

## Como habilitar para execução de pipelines no bitbucket

O Arquivo de configuração de pipeline do bit já esta previamente configurado porém temos a necessidade de
configurar ainda alguns pontos no repositorio novo criado.

Para isso devemos reconfigurar algumas variáveis de ambiente.

### Deployment variables
Acesse Settings > Pipelines > Deployments.

Em cada ambiente deverá ser reconfigurado as variáveis

**TEST**

Variable  | Value |  
--|---|--
 SF_USERNAME |   
 SF_PASSWORD |   
 SF_LOGIN_URL | https://test.salesforce.com   

**Stage**

 Variable      | Value                       
:--------------|:----------------------------
 SF_USERNAME   |                             
 SF_PASSWORD   |                             
 $SF_LOGIN_URL | https://test.salesforce.com

**Production**

Variable      | Value                       
:--------------|:----------------------------
SF_USERNAME   |                             
SF_PASSWORD   |                             
$SF_LOGIN_URL | https://login.salesforce.com
