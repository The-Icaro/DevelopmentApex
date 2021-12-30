/**
 * @author Icaro - TOPi
 */
public class CompleteAccountAddressGeoInfoJob implements Schedulable {

    GetAccountGeoAddressInfoPublisher publisher;

    GetAccountOAuthOS oauthService;

    AccountRepository repository;

    public CompleteAccountAddressGeoInfoJob() {

        this.publisher = new GetAccountGeoAddressInfoPublisher();
        this.repository = new AccountRepository();
        this.oauthService = new GetAccountOAuthOS();

    }

    public void execute(SchedulableContext context) {

        List<Account> accounts = repository.findByGeolocationRequested();

        if(accounts.isEmpty()) return;

        publisher.publish(accounts, this.oauthService.getAccountAccessToken());

    }

    public void start() {

        System.schedule('Complete Accounts Addresses with GeoLocation 1', '0 0 * * * ?'
                        , new CompleteAccountAddressGeoInfoJob());

        System.schedule('Complete Accounts Addresses with GeoLocation 2', '0 20 * * * ?'
                        , new CompleteAccountAddressGeoInfoJob());

        System.schedule('Complete Accounts Addresses with GeoLocation 3', '0 40 * * * ?'
                        , new CompleteAccountAddressGeoInfoJob());

    }

}
