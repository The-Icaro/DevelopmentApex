/**
 * @author Icaro - TOPi
 */
public class ExternalSystemGeolocationRequestBuilder {

    public HttpRequest build(Account account, String accessToken) {

        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://bisso-topirun-20-dev-ed.my.salesforce.com/services/apexrest/api/account/geolocation');

        request.setMethod('PUT');

        request.setHeader('Authorization', 'Bearer ' + accessToken);
        
        request.setBody(JSON.serialize(this.buildBodyRequest(account)));

        return request;
        
    }

    public ExternalSystemAddressRequest buildAddress(Account account, AccountFilterPostalCodeTypes type) {
        
        ExternalSystemGeolocationRequest requestBody = new ExternalSystemGeolocationRequest();

        ExternalSystemAddressRequest requestAddress;

        Address accountAddress;

        if(type == AccountFilterPostalCodeTypes.BILLING) {
            requestAddress = requestBody.billingAddress;
            accountAddress = account.BillingAddress;

        } else if(type == AccountFilterPostalCodeTypes.SHIPPING) {
            requestAddress = requestBody.shippingAddress;
            accountAddress = account.ShippingAddress;

        }

        requestAddress.street = accountAddress.street;

        requestAddress.city = accountAddress.city;

        requestAddress.country = accountAddress.country;

        requestAddress.state = accountAddress.state;

        requestAddress.zipCode = accountAddress.postalCode;

        return requestAddress;

    }

    public ExternalSystemGeolocationRequest buildBodyRequest(Account account) {

        ExternalSystemGeolocationRequest requestBody = new ExternalSystemGeolocationRequest();

        requestBody.name = account.Name;

        requestBody.externalId = account.Id;

        requestBody.billingAddress = this.buildAddress(account
                                                    , AccountFilterPostalCodeTypes.BILLING);

        requestBody.shippingAddress = this.buildAddress(account
                                                    , AccountFilterPostalCodeTypes.SHIPPING);

        return requestBody;

    }

}
