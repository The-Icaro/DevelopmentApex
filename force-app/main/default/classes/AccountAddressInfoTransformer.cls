/**
 * @author Icaro - TOPi
 */
public class AccountAddressInfoTransformer {
    
    public Account toAccount(ExternalSystemGeoAddressInfoResponse response, Account account) {
      
        account.BillingCity = response.billingAddress.city;
        
        account.BillingCountry = response.billingAddress.country;
        
        account.BillingState = response.billingAddress.state;
        
        account.BillingStreet = response.billingAddress.street;
        
        account.BillingPostalCode = response.billingAddress.zipCode;
        
        account.BillingLatitude = response.billingAddress.latitude;
        
        account.BillingLongitude = response.billingAddress.longitude;

        account.ShippingCity = response.shippingAddress.city;
        
        account.ShippingCountry = response.shippingAddress.country;
        
        account.ShippingState = response.shippingAddress.state;
        
        account.ShippingStreet = response.shippingAddress.street;
        
        account.ShippingPostalCode = response.shippingAddress.zipCode;
        
        account.ShippingLatitude = response.shippingAddress.latitude;
        
        account.ShippingLongitude = response.shippingAddress.longitude;

        return account;

    }

}
