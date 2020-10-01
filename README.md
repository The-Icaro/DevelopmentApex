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

###  Mapeamento de Campos
----

| Objeto | Nome do Campo |  Nome de API | Tipo | Tamanho | Obrigatório
|:---|:---|:---|:---:|:---:|:---:|:---:|
| Account | CNPJ | Cnpj__c | Texto | 20 | Não |
| Account | CPF | Cpf__c | Texto | 20 | Não |




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

**Dado** que possuo Contas pendentes de Geolocalização (GeolocationPending__c)

**Quando** Executo o serviço exteno de Geolocalização de Contas a cada 20 minutos

**Então** devo completar os dados da conta conforme mapeamento *Get Account Geolocation Address Info Mapping*.


