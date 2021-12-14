/**
* @author Icaro - TOPi
*/
@isTest
public class AccountFixtureFactory {

    public static Account newAccount() {
        return new Account(Name = 'Pedro'
                            , Category__c = 'Premium'
                            , AnnualRevenue = 1000000);
    }

    public static Account newAccount(String name, String category, Decimal annualRevenue) {
        return new Account(Name = name
                        , Category__c = category
                        , AnnualRevenue = annualRevenue);
    }

    public static Account newAccount(String name, String category) {
        return new Account(Name = name
                        , Category__c = category);
    }

    public static Account createAccount() {
        return persistAccount(newAccount());
    }

    public static Account createAccount(String name, String category, Decimal annualRevenue) {
        return persistAccount(newAccount(name, category, annualRevenue));
    }

    public static Account createAccount(String name, String category) {
        return persistAccount(newAccount(name, category));
    }

    public static Account persistAccount(Account account) {
        insert account;

        return account;
    }
}