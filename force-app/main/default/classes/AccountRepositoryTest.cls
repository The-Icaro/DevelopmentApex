/**
 * @author Icaro - TOPi
 */
@isTest
public class AccountRepositoryTest {
    
    @isTest
    public static void givenNewAccountWhenPersistToDatabaseThenReturnSavedAccount() {

        TriggerHandler.bypass('AccountTH');

        Account expectedAccount = AccountFixtureFactory.newAccount();

        AccountRepository repository = new AccountRepository();

        Test.startTest();

        List<Account> responseAccount = repository.save(expectedAccount);

        Test.stopTest();

        Account accountToAssert = responseAccount.get(0);

        System.assert(accountToAssert.Id != null);
        System.assertEquals(1, responseAccount.size());
        System.assertEquals(expectedAccount.Name, accountToAssert.Name);



    }

}
