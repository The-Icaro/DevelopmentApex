/**
 * @author Icaro - TOPi
 */
@isTest
public class AccountFilterTest {
    
    @isTest
    public static void givenNewListAccountsAndOldAccountsAsNullWhenFilterByCNPJThenReturnNewListFiltered() {

        List<Account> accountsToFilter = new List<Account>{AccountFixtureFactory.newAccount()};

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedDocumentNumber(accountsToFilter
                                                                                , null
                                                                                , AccountFilterDocumentsNumberTypes.CNPJ);
                                                            
        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('90447166000143', filteredAccounts.get(0).CNPJ__c);
 
    }


    @isTest
    public static void givenNewListAccountsAndOldAccountsWhenFilterByChangedCNPJThenReturnFilteredChangedAccounts() {

        TriggerHandler.bypass('AccountTH');

        List<Account> accountsToFilter = new List<Account>{AccountFixtureFactory.createAccount()};

        Account oldAccount = AccountFixtureFactory.createAccount('OldAccount', '30108415074', '27587624000103');

        Map<Id,Account> oldAccountsToFilter = new Map<Id,Account>();

        oldAccountsToFilter.put(accountsToFilter.get(0).Id, oldAccount);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedDocumentNumber(accountsToFilter
                                                                                , oldAccountsToFilter
                                                                                , AccountFilterDocumentsNumberTypes.CNPJ);
                                                            
        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('90447166000143', filteredAccounts.get(0).CNPJ__c);
 
    }


    @isTest
    public static void givenNewListAccountsAndOldAccountsAsNullWhenFilterByCPFThenReturnNewListFiltered() {

        List<Account> accountsToFilter = new List<Account>{AccountFixtureFactory.newAccount()};

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedDocumentNumber(accountsToFilter
                                                                                , null
                                                                                , AccountFilterDocumentsNumberTypes.CPF);
                                                            
        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('30108415074', filteredAccounts.get(0).CPF__c);

    }

    @isTest
    public static void givenNewListAccountsAndOldAccountsWhenFilterByChangedCPFThenReturnFilteredChangedAccounts() {

        TriggerHandler.bypass('AccountTH');

        List<Account> accountsToFilter = new List<Account>{AccountFixtureFactory.createAccount()};

        Account oldAccount = AccountFixtureFactory.createAccount('OldAccount', '65400014011', '27587624000103');

        Map<Id,Account> oldAccountsToFilter = new Map<Id,Account>();

        oldAccountsToFilter.put(accountsToFilter.get(0).Id, oldAccount);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedDocumentNumber(accountsToFilter
                                                                                , oldAccountsToFilter
                                                                                , AccountFilterDocumentsNumberTypes.CPF);
                                                            
        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('30108415074', filteredAccounts.get(0).CPF__c);
 
    }

    @isTest
    public static void givenNewListAccountsAndOldAccountsAsNullWhenFilterByBillingPostalCodeThenReturnNewListFiltered() {

        List<Account> accountsToFilter = new List<Account>{AccountFixtureFactory.newAccount()};

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedPostalCodes(accountsToFilter
                                                                                , null
                                                                                , AccountFilterPostalCodeTypes.BILLING);
                                                            
        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('12460000', filteredAccounts.get(0).BillingPostalCode);

    }

    @isTest
    public static void givenNewListAccountsAndOldAccountsWhenFilterByChangedBillingPostalCodeThenFilteredChangedAccounts() {

        TriggerHandler.bypass('AccountTH');

        List<Account> accountsToFilter = new List<Account>{AccountFixtureFactory.createAccount()};

        Account oldAccount = AccountFixtureFactory.createAccount('OldAccount', '30108415074', '27587624000103');

        oldAccount.BillingPostalCode = '12220000';

        Map<Id,Account> oldAccountsToFilter = new Map<Id,Account>();

        oldAccountsToFilter.put(accountsToFilter.get(0).Id, oldAccount);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedPostalCodes(accountsToFilter
                                                                                , oldAccountsToFilter
                                                                                , AccountFilterPostalCodeTypes.BILLING);
                                                            
        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('12460000', filteredAccounts.get(0).BillingPostalCode);
 
    }

    @isTest
    public static void givenNewListAccountsAndOldAccountsAsNullWhenFilterByShippingPostalCodeThenReturnNewListFiltered() {

        List<Account> accountsToFilter = new List<Account>{AccountFixtureFactory.newAccount()};

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedPostalCodes(accountsToFilter
                                                                                , null
                                                                                , AccountFilterPostalCodeTypes.SHIPPING);
                                                            
        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('12460000', filteredAccounts.get(0).ShippingPostalCode);

    }

    @isTest
    public static void givenNewListAccountsAndOldAccountsWhenFilterByChangedShippingPostalCodeThenFilteredChangedAccounts() {

        TriggerHandler.bypass('AccountTH');

        List<Account> accountsToFilter = new List<Account>{AccountFixtureFactory.createAccount()};

        Account oldAccount = AccountFixtureFactory.createAccount('OldAccount', '30108415074', '27587624000103');

        oldAccount.ShippingPostalCode = '12220000';

        Map<Id,Account> oldAccountsToFilter = new Map<Id,Account>();

        oldAccountsToFilter.put(accountsToFilter.get(0).Id, oldAccount);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedPostalCodes(accountsToFilter
                                                                                , oldAccountsToFilter
                                                                                , AccountFilterPostalCodeTypes.SHIPPING);
                                                            
        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('12460000', filteredAccounts.get(0).ShippingPostalCode);
 
    }

    
}
