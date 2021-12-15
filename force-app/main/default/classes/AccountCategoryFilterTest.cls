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

        Account account = AccountFixtureFactory.newAccount();

        AccountCategoryFilter filter = new AccountCategoryFilter();

        List<Account> filteredAccounts = filter.filterByPremiumAccountCategory(new List<Account>{account});

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('Pedro', filteredAccounts.get(0).Name);

    }

    @isTest
    public static void givenAccountsAndAnnualRevenueWithPremiumCategoryWhenFilterThenReturnListWithOnlyIgualsOrMoreGivedAnnualRevenue() {

        Account account = AccountFixtureFactory.newAccount();

        AccountCategoryFilter filter = new AccountCategoryFilter();

        List<Account> filteredAccounts = filter.filterByAnnualRevenueForPremiumAccounts(
                                                            new List<Account>{account}
                                                            , 1000000);

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals(1000000, filteredAccounts.get(0).AnnualRevenue);

    }

}
