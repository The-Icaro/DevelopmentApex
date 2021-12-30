/**
 * @author Icaro - TOPi
 */
public class PutAccountGeoMappingPublisher {
    
    public void publish(List<Account> accounts, String accessToken) {

        for(Account account : accounts) {

            System.enqueueJob(new QueuedPutAccountGeoMappingOutbound(account, accessToken));

        }

    }

    public class QueuedPutAccountGeoMappingOutbound implements Queueable, Database.AllowsCallouts {

        Account account;

        String accessToken;

        PutAccountGeoMappingOS mapAddressService;

        public QueuedPutAccountGeoMappingOutbound(Account account, String accessToken) {

            this.account = account;
            this.accessToken = accessToken;
            this.mapAddressService = new PutAccountGeoMappingOS();

        }

        public void execute(QueueableContext context) {
            this.mapAddressService.mapAccountAddress(this.account.Id, this.accessToken);
        }

    }

}
