/**
 * @author Icaro - TOPi
 */
public class ExternalSystemGeoAddressInfoBuilder {
    
    public HttpRequest build(List<Account> accounts, String accessToken) {

        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://bisso-topirun-20-dev-ed.my.salesforce.com/services/apexrest/api/account/geolocation');

        request.setMethod('PATCH');

        request.setHeader('Authorization', 'Bearer ' + accessToken);
        
        request.setBody(JSON.serialize(this.buildExternalIds(accounts)));

        return request;
        
    }


    public List<String> buildExternalIds(List<Account> accounts) {

        List<String> requestBody = new List<String>();

        for(Account account : accounts) {
            requestBody.add(account.Id);
        }

        return requestBody;

    }

}
