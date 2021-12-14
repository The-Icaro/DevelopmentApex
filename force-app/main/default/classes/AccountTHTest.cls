/**
* @author Icaro - TOPi
*/
@isTest
public class AccountTHTest {

    @isTest
    public static void givenAccountsWhenFilteredThenCreateEventsForPremiumAccountsAndAnnualRevenueWithMillionOrMore() {

        Account account = AccountFixtureFactory.createAccount();

        Event event = [ SELECT WhatId, Description FROM Event WHERE WhatId = : account.Id];

        System.assertEquals(account.Id, event.WhatId);
        System.assertEquals('Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium'
                                , event.Description);

    }

}
