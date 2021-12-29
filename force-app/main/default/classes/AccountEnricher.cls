/**
 * @author Icaro - TOPi
 */
public class AccountEnricher {

    PostalCodeFormatter postalCodeFormatter;

    AccountRepository repository;


    public AccountEnricher() {
        this.postalCodeFormatter = new PostalCodeFormatter();
        this.repository = new AccountRepository();
    }

    public List<Account> enrich(List<Account> accounts) {

        for(Account account : accounts) {
            withFormattedDocumentsNumber(account);
            withFormattedPostalCodes(account);
        }

        return repository.save(accounts);

    }

    public Account withFormattedDocumentsNumber(Account account) {

        BrazilianDocument brazilianDocument = new BrazilianDocument(account.CPF__c);

        account.CPF__c = brazilianDocument.getFormattedCpf();

        brazilianDocument.document = account.CNPJ__c;

        account.CNPJ__c = brazilianDocument.getFormattedCpnj();

        return account;
    }

    public Account withFormattedPostalCodes(Account account) {

        account.BillingPostalCode = postalCodeFormatter.formatPostalCode(account.BillingPostalCode);

        account.ShippingPostalCode = postalCodeFormatter.formatPostalCode(account.ShippingPostalCode);
        
        return account;

    }

}
