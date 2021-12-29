/**
 * @author Icaro - TOPi
 */
public class AccountDocumentsNumberValidator {

    BrazilianDocumentValidator brazilianValidator;

    public AccountDocumentsNumberValidator() {
        this.brazilianValidator = new BrazilianDocumentValidator();
    }

    public void validate(List<Account> accounts) {

        for(Account account : accounts) {

            if(String.isNotEmpty(account.CPF__c) && !this.brazilianValidator.isCPF(account.CPF__c)) {
                account.CPF__c.addError('Número de CPF Inválido!');
            }

            if(String.isNotEmpty(account.CNPJ__c) && !this.brazilianValidator.isCNPJ(account.CNPJ__c)) {
                account.CNPJ__c.addError('Número de CNPJ Inválido!');
            }

        }

    }
}
