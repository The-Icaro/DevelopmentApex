# Topi Run 2020 - Salesforce Developer Test

## Pré-requisitos

* Deverá ser enviado os dados de Org Salesforce como usuario e senha para auditoria
* O Projeto deverá ter 100% de cobertura de código
* O Projeto deverá estar armazenado no repositorio determinado



## US001. Cadastro de Contas
---

**Sendo** um Agente de Vendas

**Posso** posso criar ou modificar Contas 

**Para** que possa gerir a minha carteira de clientes



## Criterios de Aceite
---


### Validar informações de CPF ou CPNJ

**Dado** que estou em uma Conta 
*E* informe os dados de CPF (Cpf__c) 
*OU* CNPJ (Cnpj__c)

**Quando** incluo ou modifico a mesma

**Então** deverá ser aplicado as regras nacionais de validação de CPF ou CNPJ
e caso encontre algum problema devo exibir no campo a mensagem "Inválido"

### Formatar dados em Conta

**Dado** que estou em uma Conta 
*E* informe os dados de CPF (Cpf__c)
*OU* CNPJ (Cnpj__c)
*OU* CEP de cobrança (BillingPostalCode)
*OU* CEP de entrega (ShippingPostalCode)

**Quando** incluo ou modifico a mesma

**Então** deverá ser formatado os campos abaixo de acordo com o exemplo correspondente

* CPF (Cpf__c) :  Exemplo - "365.305.250-50"
* CNPJ (Cnpj__c) :  Exemplo - "24.661.643/0001-44"
* CEP de cobrança (BillingPostalCode) :  Exemplo - "16310-970"
* CEP de entrega (ShippingPostalCode) :  Exemplo - "16310-970"

----

###  Campos que deverão ser criados em Conta
----

| Objeto | Nome do Campo |  Nome de API | Tipo | Tamanho | Obrigatório
|:---|:---|:---|:---:|:---:|:---:|:---:|
| Account | CNPJ | Cnpj__c | Texto | 20 | Não |
| Account | CPF | Cpf__c | Texto | 20 | Não |
| Account | Geolocalização Solicitada | GeolocationRequested__c | Boolean |  | Não |
| Account | Mensagem de Erro Geolocalização | GeolocationErrorMessage__c | Texto Longo (1000) |  | Não |



-----

## US002. Obter dados de Geolocalização para Endereços de Conta
---

**Como** um Agente de Vendas

**Eu quero** obter os dados de Geolocalização de Endereço de Cobrança e Endereço de Entraga de Contas

**Para** garantir que a equipe de campo consiga chegar até o endereço informado.



## Criterios de Aceite
---


### Enviar os Dados de Endereço de Cobrança e Entrega para Geolocalização

**Dado** que estou em uma Conta 
*E* informo ou modifico os dados de Endereço de Cobrança ou Endereço de Entrega

**Quando** incluo ou modifico a mesma

**Então** devo enviar os dados do Endereço de Entrega e/ou Endereço de Cobrança para o Sistema de Geolocalização
conforme o mapeamento *Send Account Address Mapping*.


### Obter os dados de Geolocalização do Sistema Externo

**Dado** que possuo Contas pendentes de Geolocalização (GeolocationRequested__c)

**Quando** Executo o serviço exteno de Geolocalização de Contas a cada 20 minutos

**Então** devo salvar os dados de localização obtidos pelo serviço conforme mapeamento *Get Account Geolocation Address Info Mapping*. 



## Detalhamento Técnico

---

Importe a [Colletion do  Postman](/topiRun2020.postman_collection.json) para visualizar/testar todos os serviços 

### Mapeamento do Serviço : Send Account Address Mapping

Todo Serviço exposto deverá utilizar o OAuth 2.0 como mecanismo de autenticação (ver "OAuth Service Mapping")

* Url : https://bisso-topirun-20-dev-ed.my.salesforce.com/services/apexrest/api/account/geolocation
* Metodo : PUT
* Autenticação OAuth 2.0
* Header : 'Authorization' => 'Bearer ' + <access_token> ( Este deverá ser obtido pela integração de OAuth )
  
#### Mapeamento de Campos
----


#### Request
-----

| Origem | Destino | Obrigatório | Tipo
|:---|:---|:--:|:---|
| Account.Name | name | x | String (80)
| Account.Id             | externalId | x | String (20)
| Account.BillingStreet | billingAddress.street | x | String (255) 
| Account.BillingCity | billingAddress.city |  | String (255) 
| Account.BillingPostalCode | billingAddress.zipCode | x | String (15) 
| Account.BillingState | billingAddress.state |  | String (80) 
| Account.BillingCountry | billingAddress.country |  | String (80) 
| Account.ShippingStreet | shippingAddress.street | x | String (255) 
| Account.ShippingCity | shippingAddress.city |  | String (255) 
| Account.ShippingPostalCode | shippingAddress.zipCode | x | String (15) 
| Account.ShippingState | shippingAddress.state |  | String (80) 
| Account.ShippingCountry | shippingAddress.country |  | String (80)

#### Exemplo de Payload 

``` javascript

{
    "name": "Teste do Bisso",
    "externalId": "23423423432423",
    "billingAddress" : {
        "street": "Rua Pedro Dias Batista 70",
        "city": "Águas de Santa Bárbara",
        "zipCode": "18770-970",
        "state": "SP",
        "country": "Brasil"
    },
    "shippingAddress" : {
        "street": "Rua Coronel Honório Palma 135",
        "city": "Altinópolis",
        "zipCode": "14350-970",
        "state": "SP",
        "country": "Brasil"
    }
}

```  


#### Response
-----

Este serviço não irá prover nenhum conteúdo de response somente o retorno de HTTP Code 200

Caso de Http Code 200
    Account.GeolocationRequested__c = true

Caso Contrario 
    Account.GeolocationErrorMessage__c = errors[0].message

#### Exemplo de Payload de Erro

``` javascript

[
    {
        "errorCode": "APEX_ERROR",
        "message": "Error Message"
    }
]

```

### Mapeamento do Serviço : OAuth Service

* Url : https://login.salesforce.com/services/oauth2/token
* Metodo : POST
* Headers : 'Content Type' => 'application/x-www-form-urlencoded'
  
#### Mapeamento de Campos
----


#### Request
-----

| Destino | Valor
|:---|:---|
|client_id|3MVG9l2zHsylwlpS6h2vTmlmUGQBhdenOwDRCOFn28Edf9ajwCJ3THJs1OvxrZPVNucENmEJb.7paFUCK3Kqr|
|client_secret|BFC7A19775AA64B697A6F712F62E2D0A671321BBA2FAE18973580F4557F5FC68|
|redirect_uri|http://localhost|
|grant_type|password|
|username|integration.user@topirun.com|
|password|@TopiRun2020|


#### Exemplo de Payload 


``` javascript

client_id:3MVG9l2zHsylwlpS6h2vTmlmUGQBhdenOwDRCOFn28Edf9ajwCJ3THJs1OvxrZPVNucENmEJb.7paFUCK3Kqr&
client_secret:BFC7A19775AA64B697A6F712F62E2D0A671321BBA2FAE18973580F4557F5FC68&
redirect_uri:http://localhost&
grant_type:password&
username:integration.user@topirun.com&
password:@TopiRun2020

```  

#### Dica !!!

Trecho de código de preparo da request

``` java

public HttpRequest buildRequest ( Map<String,String> oauthRequest) {

    HttpRequest request = new HttpRequest();
    // algumas atribuições ao request
    request.setBody ( buildPostFormParameters (oauthRequest) );

}


private String buildPostFormParameters ( Map<String,String> oauthRequest ) {

    String parameters = '';
    
    for ( String parameterName : parameters.keySet() ) {

        if (parameters.get( parameterName ) == null) continue;

        parameters += parameterName + '=' + EncodingUtil.urlEncode( parameters.get( parameterName ), 'UTF-8') + '&';
    }

    return parameters;

}


``` 

#### Response
-----

Utilizar o campo ``` access_token  ``` para montar o Header de todas as requests autenticadas

``` javascript

{
    "access_token": "00D4W0000048AiQ!AQoAQKgVN6E4i3uIec7RcHjSHfFcknDSEU6D2QKFybFmMrW566TwI1YxcA0aEEeVVsvfAUaUHv5r1PAZzPaFfPQ.XuImOXGt",
    "instance_url": "https://bisso-topirun-20-dev-ed.my.salesforce.com",
    "id": "https://login.salesforce.com/id/00D4W0000048AiQUAU/0054W00000B99edQAB",
    "token_type": "Bearer",
    "issued_at": "1601639269587",
    "signature": "Y4PFBhk+5IhmznVJobqlK6rK8ggSOD41seY4auvYJzA="
}

```


#### Dica !!!

Trecho de código de como deve ser utilizado o ``` access_token  ``` em toda request autenticada (*Send Account Address Mapping*, **)

``` java

 HttpRequest request = new HttpRequest();
 // algumas atribuições ao request

 request.setHeader ('Authorization', 'Bearer ' + accessToken ); // < -- super dica !!!!
 
```


### Mapeamento do Serviço : Get Account Geolocation Address Info Mapping

* Url : https://bisso-topirun-20-dev-ed.my.salesforce.com/services/apexrest/api/account/geolocation
* Metodo : **PATCH**
* Autenticação OAuth 2.0
* Header : 'Authorization' => 'Bearer ' + <access_token> ( Este deverá ser obtido pela integração de OAuth )
  
#### Mapeamento de Campos
----

Este serviço deverá ser executado utilizando mecanismo de agendamento (*Schedulable*). Ele tem como objetivo enviar todos as Contas com o Campo ```GeolocationRequested__c = true ``` mapeando um array de Strings com o Id das Contas pedentes.


#### Request
-----

| Origem | Destino | Obrigatório | Tipo
|:---|:---|:--:|:---|
| Account.Id | externalId | x | String (20)

#### Exemplo de Payload 

``` javascript

{
    "externalIds": [
        "5567655675676",
        "3123212132",
        "3232365654633"
    ]
}

```  

#### Response de Sucesso
-----

| Origem | Destino | Obrigatório | Tipo
|:---|:---|:--:|:---|
| Account.Id | externalId | x | String(28)
| Account.BillingLatitude | billingAddress.latitude |  | Double
| Account.BillingLongitude | billingAddress.longitude |  | Double
| Account.ShippingLatitude | shippingAddress.latitude |  | Double
| Account.ShippingLongitude | shippingAddress.longitude |  | Double


``` javascript

[
    {
        "shippingAddress": {
            "zipCode": "14350-970",
            "street": "Rua Coronel Honório Palma 135",
            "state": "SP",
            "longitude": -47.37663,
            "latitude": -21.02352,
            "country": "Brasil",
            "city": "Altinópolis"
        },
        "name": "Teste do Bisso",
        "externalId": "23423423432423",
        "billingAddress": {
            "zipCode": "18770-970",
            "street": "Rua Pedro Dias Batista 70",
            "state": "SP",
            "longitude": -49.24069129319908,
            "latitude": -22.880184142428277,
            "country": "Brasil",
            "city": "Águas de Santa Bárbara"
        }
    }
]

``` 

#### Exemplo de Payload de Erro

``` javascript

[
    {
        "errorCode": "APEX_ERROR",
        "message": "Error Message"
    }
]

```

# Pontos que serão avaliados
* CodeStyle (Java Code Style)
* Padrões aplicados
* Violações do PMD


---


> # *"Sacrifícios temporários trazem recompensas permanentes"*
>
> ## *Boa Sorte !!!*
