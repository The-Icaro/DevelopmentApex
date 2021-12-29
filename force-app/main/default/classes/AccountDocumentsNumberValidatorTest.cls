/**
 * @author Icaro - TOPi
 */
@isTest
public class AccountDocumentsNumberValidatorTest {
    
    @isTest
    public static void givenAccountWithValidDocumentsNumbersWhenValidateThenCheckIfDocumentsAreValidAndReturnNoErrors() {

        TriggerHandler.bypass('AccountTH');

        List<Account> accountsToValidate = new List<Account>{AccountFixtureFactory.createAccount()};

        AccountDocumentsNumberValidator validator = new AccountDocumentsNumberValidator();

        Test.startTest();

        validator.validate(accountsToValidate);

        Test.stopTest();

        Account accountToAssert = accountsToValidate.get(0);

        System.assertEquals(0, accountToAssert.getErrors().size());

    }

    @isTest
    public static void givenAccountWithInvalidDocumentsNumbersWhenValidateThenCheckIfDocumentsAreValidAndReturnErrors() {

        TriggerHandler.bypass('AccountTH');

        List<Account> accountsToValidate = new List<Account>{AccountFixtureFactory.createAccount('Test With Failure'
                                                                                                , '30108415075'
                                                                                                , '90447166000144')};

        AccountDocumentsNumberValidator validator = new AccountDocumentsNumberValidator();

        Test.startTest();

        validator.validate(accountsToValidate);

        Test.stopTest();

        Account accountToAssert = accountsToValidate.get(0);

        System.assertEquals(2, accountToAssert.getErrors().size());

    }


}
