/**
 * @author Icaro - TOPi
 */
@isTest
public class AccountEnricherTest {

    @isTest
    public static void givenWhenThen() {

        TriggerHandler.bypass('AccountTH');

        List<Account> accountsToEnrich = new List<Account>{AccountFixtureFactory.newAccount()};

        AccountEnricher enricher = new AccountEnricher();

        Test.startTest();

        List<Account> enrichedAccounts = enricher.enrich(accountsToEnrich);

        Test.stopTest();

        Account accountToAssert = enrichedAccounts.get(0);

        System.assertEquals('301.084.150-74', accountToAssert.CPF__c);
        System.assertEquals('90.447.166/0001-43', accountToAssert.CNPJ__c);
        System.assertEquals('12460-000', accountToAssert.BillingPostalCode);
        System.assertEquals('12460-000', accountToAssert.ShippingPostalCode);

    }
    
    @isTest
    public static void givenAccountWithValidDocumentsNumbersWhenEnrichThenEnrichDocumentsNumbers() {

        Account accountToEnrich = AccountFixtureFactory.newAccount();

        AccountEnricher enricher = new AccountEnricher();

        Account enrichedAccount = enricher.withFormattedDocumentsNumber(accountToEnrich);

        System.assertEquals('301.084.150-74', enrichedAccount.CPF__c);
        System.assertEquals('90.447.166/0001-43', enrichedAccount.CNPJ__c);

    }

    @isTest
    public static void givenAccountWithValidPostalCodesWhenEnrichThenEnrichPostalCodes() {

        Account accountToEnrich = AccountFixtureFactory.newAccount();

        accountToEnrich.ShippingPostalCode = '12220000';

        AccountEnricher enricher = new AccountEnricher();

        Account enrichedAccount = enricher.withFormattedPostalCodes(accountToEnrich);

        System.assertEquals('12460-000', enrichedAccount.BillingPostalCode);
        System.assertEquals('12220-000', enrichedAccount.ShippingPostalCode);

    }

}
