/**
 * @author Icaro - TOPi
 */
public class GetAccountGeoAddressInfoOS {

    AccountAddressInfoTransformer transformer;

    GetExternalSystemGeoAddressInfoOS service;

    AccountRepository repository;

    public GetAccountGeoAddressInfoOS() {

        this.transformer = new AccountAddressInfoTransformer();
        this.service = new GetExternalSystemGeoAddressInfoOS();
        this.repository = new AccountRepository();

    }

    public void getAccountGeoInfo(List<Account> accounts, String accessToken) {

        ExternalSystemGeoAddressInfoResponse response = this.service.getExternalSystemGeoAddressInfo(accounts, accessToken);

        for(Account account : accounts) {
            this.transformer.toAccount(response, account);
        }

    }

    public List<Account> changeAccountGeoInfo(List<Account> accounts, String accessToken) {

        this.getAccountGeoInfo(accounts, accessToken);

        this.repository.save(accounts);

        return accounts;

    }

}
