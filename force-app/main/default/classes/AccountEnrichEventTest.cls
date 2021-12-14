/**
* @author Icaro - TOPi
*/
@isTest
public class AccountEnrichEventTest {

    @isTest
    public static void givenPremiumAccountsAndMillionOrMoreAnnualRevenueWhenEnrichThenCreateNewEvent() {

        List<Account> accounts = new List<Account> {
            new Account(Name = 'João', Category__c = 'Premium', AnnualRevenue = 1000000)
            , new Account(Name = 'Pedro', Category__c = 'Premium', AnnualRevenue = 1500000)
            , new Account(Name = 'Mario', Category__c = 'Premium', AnnualRevenue = 2000000)
        };


        AccountEnrichEvent enrich = new AccountEnrichEvent();

        List<Event> events = enrich.enrich(accounts);

        System.assert(!events.isEmpty());
        System.assertEquals(3, events.size());
        System.assertEquals(accounts.get(0).Id ,events.get(0).WhatId);
        System.assertEquals(accounts.get(2).Id ,events.get(2).WhatId);

    }

}
