/**
 * @author Icaro - TOPi
 */
public class PutAccountGeoMappingOS {

    AccountMappingTransformer transformer;

    AccountRepository repository;

    PutExternalSystemGeoMappingOS service;

    public PutAccountGeoMappingOS() {

        this.transformer = new AccountMappingTransformer();
        this.repository = new AccountRepository();
        this.service = new PutExternalSystemGeoMappingOS();

    }

    public void getAccountMapping(Account account, String accessToken) {

        ExternalSystemGeoMappingResponse response = service.putExternalSystemGeolocation(account, accessToken);

        transformer.toAccount(response, account);

    }

    public Account mapAccountAddress(Id accountId, String accessToken) {

        Account account = repository.findById(accountId);

        this.getAccountMapping(account, accessToken);

        this.repository.save(account);

        return account;

    }

}
