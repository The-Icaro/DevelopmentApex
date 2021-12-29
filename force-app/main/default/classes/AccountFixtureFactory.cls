/**
 * @author Icaro - TOPi
 */
@isTest
public class AccountFixtureFactory {

    public static Account newAccount(String name, String cpf, String cnpj) {
        return new Account(Name = name
                         , CPF__c = cpf
                         , CNPJ__c = cnpj
                         , BillingPostalCode = '12460000'
                         , ShippingPostalCode = '12460000');
    }

    public static Account newAccount() {
        return new Account(Name = 'Test Account'
                         , CPF__c = '30108415074'
                         , CNPJ__c = '90447166000143'
                         , BillingPostalCode = '12460000'
                         , ShippingPostalCode = '12460000');
    }

    public static Account createAccount() {
        return persistAccount(newAccount());
    }

    public static Account createAccount(String cpf, String cnpj, String postalCode) {
        return persistAccount(newAccount(cpf, cnpj, postalCode));
    }

    public static Account persistAccount(Account entity) {
        insert entity;
        return entity;
    }

}