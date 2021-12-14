/**
* @author Icaro - TOPi
*/
@isTest
public class AccountCategoryFilterTest {

    @isTest
    public static void givenAccountsWithCategoryWhenFilterThenReturnListWithOnlyNotEmptyCategory() {

        List<Account> accounts = new List<Account> {
            new Account(Name = 'João', Category__c = 'Premium')
            , new Account(Name = 'Pedro', Category__c = '')
            , new Account(Name = 'Mario')
        };

        AccountCategoryFilter filter = new AccountCategoryFilter();

        List<Account> filteredAccounts = filter.filterByNotEmptyCategory(accounts);

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('Premium', filteredAccounts.get(0).Category__c);


    }

    @isTest
    public static void givenAccountsWithCategoryNotEmptyWhenFilterByPremiumThenReturnListWithOnlyPremiumCategory() {

        List<Account> accounts = new List<Account> {
            new Account(Name = 'João', Category__c = 'Premium')
            , new Account(Name = 'Pedro', Category__c = 'Standard')
            , new Account(Name = 'Mario', Category__c = 'Special')
            , new Account(Name = 'Luigi', Category__c = 'Premium')
        };

        AccountCategoryFilter filter = new AccountCategoryFilter();

        List<Account> filteredAccounts = filter.filterByPremiumAccountCategory(accounts);

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(2, filteredAccounts.size());
        System.assertEquals('Luigi', filteredAccounts.get(1).Name);

    }

    @isTest
    public static void givenAccountsAndAnnualRevenueWithPremiumCategoryWhenFilterThenReturnListWithOnlyIgualsOrMoreGivedAnnualRevenue() {

        List<Account> accounts = new List<Account> {
            new Account(Name = 'João', Category__c = 'Premium', AnnualRevenue = 1000000)
            , new Account(Name = 'Pedro', Category__c = 'Premium', AnnualRevenue = 1500000)
            , new Account(Name = 'Mario', Category__c = 'Premium', AnnualRevenue = 999999)
            , new Account(Name = 'Luigi', Category__c = 'Premium', AnnualRevenue = 50000)
        };

        AccountCategoryFilter filter = new AccountCategoryFilter();

        List<Account> filteredAccounts = filter.filterByAnnualRevenueForPremiumAccounts(accounts, 1000000);

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(2, filteredAccounts.size());
        System.assertEquals(1000000, filteredAccounts.get(0).AnnualRevenue);
        System.assertEquals('Pedro', filteredAccounts.get(1).Name);

    }

}
