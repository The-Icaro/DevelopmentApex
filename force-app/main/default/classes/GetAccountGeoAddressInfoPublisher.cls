/**
 * @author Icaro - TOPi
 */
public class GetAccountGeoAddressInfoPublisher {

    public void publish(List<Account> accounts, String accessToken) {

        System.enqueueJob(new QueuedGetAccountGeoAddressInfoOutBound(accounts, accessToken));

    }

    public class QueuedGetAccountGeoAddressInfoOutBound implements Queueable, Database.AllowsCallouts {

        List<Account> accounts;

        String accessToken;

        GetAccountGeoAddressInfoOS geoAddressInfoService;

        public QueuedGetAccountGeoAddressInfoOutBound(List<Account> accounts, String accessToken) {

            this.accounts = accounts;
            this.accessToken = accessToken;
            this.geoAddressInfoService = new GetAccountGeoAddressInfoOS();

        }

        public void execute(QueueableContext context) {
            geoAddressInfoService.changeAccountGeoInfo(this.accounts, this.accessToken);
        }

    }

}
