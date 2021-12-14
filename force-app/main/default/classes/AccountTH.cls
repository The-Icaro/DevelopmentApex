/**
* @author Icaro - TOPi
*/
public with sharing class AccountTH extends TriggerHandler {
 
    List<Account> newAccounts;

    Map<Id, Account> oldAccounts;

    AccountCategoryFilter categoryFilter;

    AccountEnrichEvent enrichEvent;

    public AccountTH() {
        this( (List<Account>) Trigger.new
            ,  (Map<Id,Account>) Trigger.oldMap );
    }

    public AccountTH(List<Account> newAccounts, Map<Id, Account> oldAccounts) {

        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;
        this.categoryFilter = new AccountCategoryFilter();
        this.enrichEvent = new AccountEnrichEvent();

    }

    override
    public void afterInsert() {

        enrichEvents(filterPremiumAccountsAndAnnualRevenue());
        
    }

    public List<Account> filterPremiumAccountsAndAnnualRevenue() {
        return this.categoryFilter.filterByAnnualRevenueForPremiumAccounts(this.newAccounts, 1000000);
    }

    public void enrichEvents(List<Account> accounts) {
        this.enrichEvent.enrich(accounts);
    }

}
