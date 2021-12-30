/**
 * @author Icaro - TOPi
 */
public with sharing class AccountTH extends TriggerHandler {

    // TODO Publishers

    List<Account> newAccounts;

    Map<Id,Account> oldAccounts;

    AccountFilter filter;

    AccountDocumentsNumberValidator documentsValidator;

    AccountEnricher enricher;

    GetAccountGeoAddressInfoPublisher accountGeoAddressInfoPublisher;

    PutAccountGeoMappingPublisher accountAddressMappingPublisher;

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
        this.accountGeoAddressInfoPublisher = new GetAccountGeoAddressInfoPublisher();
        this.accountAddressMappingPublisher = new PutAccountGeoMappingPublisher();
    }

    override
    public void afterInsert() {

        Map<String, List<Account>> filteredAccounts = this.filteredChangedDocumentsAndZipCodes();

        this.validateDocuments(filteredAccounts.get('changedDocuments'));

        this.enrichAccounts(filteredAccounts);

        this.publishGetAccountGeoAddress(filteredAccounts);

        this.publishMapAccountAddress(filteredAccounts);

    }

    override
    public void afterUpdate() {

        Map<String, List<Account>> filteredAccounts = this.filteredChangedDocumentsAndZipCodes();

        this.validateDocuments(filteredAccounts.get('changedDocuments'));

        this.enrichAccounts(filteredAccounts);

        this.publishGetAccountGeoAddress(filteredAccounts);

        this.publishMapAccountAddress(filteredAccounts);

    }

    private Map<String, List<Account>> filteredChangedDocumentsAndZipCodes() {
        return this.filter.filterByChangedDocumentsAndZipCodes(this.newAccounts, this.oldAccounts);
    }

    private void validateDocuments(List<Account> accounts) {
        this.documentsValidator.validate(accounts);
    }

    private void enrichAccounts(Map<String, List<Account>> filteredAccounts) {

        List<Account> accounts = new List<Account>();

        accounts.addAll(filteredAccounts.get('changedDocuments'));
        accounts.addAll(filteredAccounts.get('changedZipCodes'));

        this.enricher.enrich(accounts);
    }

    private void publishMapAccountAddress(Map<String, List<Account>> filteredAccounts) {

        List<Account> accounts = new List<Account>();

        accounts.addAll(filteredAccounts.get('changedDocuments'));
        accounts.addAll(filteredAccounts.get('changedZipCodes'));

        String accessToken = new GetAccountOAuthOS().getAccountAccessToken();

        this.accountGeoAddressInfoPublisher.publish(accounts, accessToken);

    }

    private void publishGetAccountGeoAddress(Map<String, List<Account>> filteredAccounts) {

        List<Account> accounts = new List<Account>();

        accounts.addAll(filteredAccounts.get('changedDocuments'));
        accounts.addAll(filteredAccounts.get('changedZipCodes'));

        String accessToken = new GetAccountOAuthOS().getAccountAccessToken();

        this.accountAddressMappingPublisher.publish(accounts, accessToken);

    }

}
