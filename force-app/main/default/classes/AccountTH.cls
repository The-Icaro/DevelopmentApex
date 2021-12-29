/**
 * @author Icaro - TOPi
 */
public with sharing class AccountTH extends TriggerHandler {

    List<Account> newAccounts;

    Map<Id,Account> oldAccounts;

    AccountFilter filter;

    AccountDocumentsNumberValidator documentsValidator;

    AccountEnricher enricher;

    public AccountTH() {
        this( (List<Account>) Trigger.new
            , (Map<Id, Account>) Trigger.oldMap );
    }

    public AccountTH(List<Account> newAccounts, Map<Id,Account> oldAccounts) {
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;
        this.filter = new AccountFilter();
        this.documentsValidator = new AccountDocumentsNumberValidator();
        this.enricher = new AccountEnricher();
    }

    override
    public void afterInsert() {

        List<Account> filteredChangedDocumentsAccounts = this.filterChangedDocumentsNumber();
        List<Account> filteredChangedPostalsAccounts = this.filterChangedPostalCodes();

        this.validateDocuments(filteredChangedDocumentsAccounts);

        this.enrichAccounts(filteredChangedDocumentsAccounts
                            , filteredChangedPostalsAccounts);

    }

    override
    public void afterUpdate() {

        List<Account> filteredChangedDocumentsAccounts = this.filterChangedDocumentsNumber();
        List<Account> filteredChangedPostalsAccounts = this.filterChangedPostalCodes();

        this.validateDocuments(filteredChangedDocumentsAccounts);

        this.enrichAccounts(filteredChangedDocumentsAccounts
                            , filteredChangedPostalsAccounts);

    }


    private List<Account> filterChangedDocumentsNumber() {

        List<Account> filteredAccounts = new List<Account>();

        List<Account> filteredChangedCPF = this.filter.filterByChangedDocumentNumber(this.newAccounts
                                                                                , this.oldAccounts
                                                                                , AccountFilterDocumentsNumberTypes.CPF);

        List<Account> filteredChangedCNPJ = this.filter.filterByChangedDocumentNumber(this.newAccounts
                                                                                , this.oldAccounts
                                                                                , AccountFilterDocumentsNumberTypes.CNPJ);
        filteredAccounts.addAll(filteredChangedCPF);
        filteredAccounts.addAll(filteredChangedCNPJ);

        return filteredAccounts;
        
    }

    private List<Account> filterChangedPostalCodes() {

        List<Account> filteredAccounts = new List<Account>();

        List<Account> filteredChangedBillingPostalCode = this.filter.filterByChangedPostalCodes(this.newAccounts
                                                                                                , this.oldAccounts
                                                                                                , AccountFilterPostalCodeTypes.BILLING);

        List<Account> filteredChangedShippingPostalCode = this.filter.filterByChangedPostalCodes(this.newAccounts
                                                                                                , this.oldAccounts
                                                                                                , AccountFilterPostalCodeTypes.SHIPPING);

        filteredAccounts.addAll(filteredChangedBillingPostalCode);
        filteredAccounts.addAll(filteredChangedShippingPostalCode);

        return filteredAccounts;

    }

    private void validateDocuments(List<Account> accounts) {
        this.documentsValidator.validate(accounts);
    }

    private void enrichAccounts(List<Account> changedDocumentAccounts, List<Account> changedPostalAccounts) {

        List<Account> filteredAccounts = new List<Account>();

        filteredAccounts.addAll(changedDocumentAccounts);
        filteredAccounts.addAll(changedPostalAccounts);

        this.enricher.enrich(filteredAccounts);
    }

}
