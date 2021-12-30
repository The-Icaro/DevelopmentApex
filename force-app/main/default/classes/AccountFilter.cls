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

    public List<Account> filterByChangedAddress(List<Account> newAccounts
                                                , Map<Id, Account> oldAccounts
                                                , AccountFilterPostalCodeTypes type) {

        List<Account> filteredAccounts = new List<Account>();

        Address accountAddress;

        Address oldAccountAddress;

        for(Account account : newAccounts) {

            Account oldAccount = oldAccounts.get(account.Id);

            if(type == AccountFilterPostalCodeTypes.BILLING) {
                accountAddress = account.BillingAddress;
                oldAccountAddress = oldAccount.BillingAddress;

            } else if (type == AccountFilterPostalCodeTypes.SHIPPING) {
                accountAddress = account.ShippingAddress;
                oldAccountAddress = oldAccount.ShippingAddress;

            }

            if(oldAccounts == null && accountAddress != null) {
                filteredAccounts.add(account);
                continue;
            }

            if(accountAddress != null && accountAddress != oldAccountAddress) {
                filteredAccounts.add(account);
            }

        }

        return filteredAccounts;

    }

    public List<Account> filterByChangedDocuments(List<Account> newAccounts
                                                , Map<Id,Account> oldAccounts) {
        
        List<Account> filteredAccounts = new List<Account>();

        List<Account> filteredChangedCPF = this.filterByChangedDocumentNumber(newAccounts
                                                                                , oldAccounts
                                                                                , AccountFilterDocumentsNumberTypes.CPF);

        List<Account> filteredChangedCNPJ = this.filterByChangedDocumentNumber(newAccounts
                                                                                , oldAccounts
                                                                                , AccountFilterDocumentsNumberTypes.CNPJ);
        filteredAccounts.addAll(filteredChangedCPF);
        filteredAccounts.addAll(filteredChangedCNPJ);

        return filteredAccounts;

    }

    public List<Account> filterByChangedZipCodes(List<Account> newAccounts
                                                , Map<Id,Account> oldAccounts) {

        List<Account> filteredAccounts = new List<Account>();

        List<Account> filteredChangedBillingPostalCode = this.filterByChangedPostalCodes(newAccounts
                                                                                                , oldAccounts
                                                                                                , AccountFilterPostalCodeTypes.BILLING);

        List<Account> filteredChangedShippingPostalCode = this.filterByChangedPostalCodes(newAccounts
                                                                                                , oldAccounts
                                                                                                , AccountFilterPostalCodeTypes.SHIPPING);

        filteredAccounts.addAll(filteredChangedBillingPostalCode);
        filteredAccounts.addAll(filteredChangedShippingPostalCode);

        return filteredAccounts;

    }

    public Map<String, List<Account>> filterByChangedDocumentsAndZipCodes(List<Account> newAccounts
                                                                        , Map<Id,Account> oldAccounts) {

        Map<String, List<Account>> filteredAccounts = new Map<String, List<Account>>();

        List<Account> filteredChangedDocuments = this.filterByChangedDocuments(newAccounts, oldAccounts);

        List<Account> filteredChangedZipCodes = this.filterByChangedZipCodes(newAccounts, oldAccounts);

        filteredAccounts.put('changedDocuments', filteredChangedDocuments);

        filteredAccounts.put('changedZipCodes', filteredChangedZipCodes);

        return filteredAccounts;

    }

}
