/**
 * @author Icaro - TOPi
 */
public class GetExternalSystemGeoAddressInfoOS {

    ExternalSystemGeoAddressInfoBuilder requestBuilder;

    public GetExternalSystemGeoAddressInfoOS() {
        this.requestBuilder = new ExternalSystemGeoAddressInfoBuilder();
    }
    
    public ExternalSystemGeoAddressInfoResponse getExternalSystemGeoAddressInfo(List<Account> accounts
                                                , String accessToken) {

        Http http = new Http();

        HttpResponse response = http.send(this.requestBuilder.build(accounts, accessToken));

        ExternalSystemGeoAddressInfoResponse  geoAddressResponse = (ExternalSystemGeoAddressInfoResponse) 
                                                    JSON.deserialize(response.getBody()
                                                    , ExternalSystemGeoAddressInfoResponse.class);

        return  geoAddressResponse;

    }
    
}
