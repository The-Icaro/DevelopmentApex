/**
* @author Icaro - TOPi
*/
public class AccountCategoryFilter {

    public List<Account> filterByNotEmptyCategory(List<Account> accounts) {

        List<Account> filteredAccountsWithCategory = new List<Account>();

        for (Account account : accounts) {

            if(String.isNotEmpty(account.Category__c)) {
                filteredAccountsWithCategory.add(account);
            }
        }

        return filteredAccountsWithCategory;

    }

    public List<Account> filterByPremiumAccountCategory(List<Account> accounts) {

        List<Account> filteredPremiumAccounts = new List<Account>();

        for (Account account : filterByNotEmptyCategory(accounts)) {

            if(account.Category__c == 'Premium') {
                filteredPremiumAccounts.add(account);
            }

        }

        return filteredPremiumAccounts;

    }

    public List<Account> filterByAnnualRevenueForPremiumAccounts(List<Account> accounts, Decimal revenue) {

        List<Account> filteredPremiumAccounts = new List<Account>();

        for (Account account : filterByPremiumAccountCategory(accounts)) {

            if(account.AnnualRevenue >= revenue) {
                filteredPremiumAccounts.add(account);
            }

        }

        return filteredPremiumAccounts;

    }

}
