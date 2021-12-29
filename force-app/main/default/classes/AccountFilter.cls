/**
 * @author Icaro - TOPi
 */
public class AccountFilter {
    
    public List<Account> filterByChangedDocumentNumber(List<Account> newAccounts
                                                , Map<Id,Account> oldAccounts
                                                , AccountFilterDocumentsNumberTypes type) {

        List<Account> filteredAccounts = new List<Account>();

        String accountDocument;
        String oldAccountDocument;

        for(Account account : newAccounts) {

            if(oldAccounts == null) {
                filteredAccounts.add(account);
                continue;
            }

            Account oldAccount = oldAccounts.get(account.Id);

            if(type == AccountFilterDocumentsNumberTypes.CPF) {
                accountDocument = account.CPF__c;
                oldAccountDocument = oldAccount.CPF__c;

            } else if (type == AccountFilterDocumentsNumberTypes.CNPJ) {
                accountDocument = account.CNPJ__c;
                oldAccountDocument = oldAccount.CNPJ__c;

            }

            if(String.isNotEmpty(accountDocument) && accountDocument != oldAccountDocument) {
                filteredAccounts.add(account);
            }

        }

        return filteredAccounts;

    }


    public List<Account> filterByChangedPostalCodes(List<Account> newAccounts
                                                , Map<Id, Account> oldAccounts
                                                , AccountFilterPostalCodeTypes type) {

        List<Account> filteredAccounts = new List<Account>();

        String accountPostalCode;
        String oldAccountPostalCode;

        for(Account account : newAccounts) {

            if(oldAccounts == null) {
                filteredAccounts.add(account);
                continue;
            }

            Account oldAccount = oldAccounts.get(account.Id);

            if(type == AccountFilterPostalCodeTypes.BILLING) {
                accountPostalCode = account.BillingPostalCode;
                oldAccountPostalCode = oldAccount.BillingPostalCode;

            } else if (type == AccountFilterPostalCodeTypes.SHIPPING) {
                accountPostalCode = account.ShippingPostalCode;
                oldAccountPostalCode = oldAccount.ShippingPostalCode;

            }

            if(String.isNotEmpty(accountPostalCode) && accountPostalCode != oldAccountPostalCode) {
                filteredAccounts.add(account);
            }

        }

        return filteredAccounts;

    }

}
