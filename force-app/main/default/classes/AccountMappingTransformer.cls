/**
 * @author Icaro - TOPi
 */
public class AccountMappingTransformer {
    

    // FIX Response.Error
    public Account toAccount(ExternalSystemGeoMappingResponse response, Account account){

        if(response.statusCode == 200) {

            account.GeolocationRequested__c = true;

        } else {

            account.GeolocationErrorMessage__c = response.error[0];

        }

        return account;

    }

}
