/**
* @author Icaro - TOPi
*/
@isTest
public class AccountEnrichEventTest {

    @isTest
    public static void givenPremiumAccountsAndMillionOrMoreAnnualRevenueWhenEnrichThenCreateNewEvent() {

        Account account = AccountFixtureFactory.createAccount();

        List<Account> accounts = new List<Account>{account};

        AccountEnrichEvent enrich = new AccountEnrichEvent();

        List<Event> events = enrich.enrich(accounts);

        System.assert(!events.isEmpty());
        System.assert(events.get(0).WhatId != null);
        System.assertEquals(1, events.size());
        System.assertEquals(account.Id ,events.get(0).WhatId);

    }

}
