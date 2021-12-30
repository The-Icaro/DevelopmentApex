/**
 * @author Icaro - TOPi
 */
public class PutExternalSystemGeoMappingOS {

    ExternalSystemGeoMappingRequestBuilder requestBuilder;

    public PutExternalSystemGeoMappingOS() {
        this.requestBuilder = new ExternalSystemGeoMappingRequestBuilder();
    }
    
    public ExternalSystemGeoMappingResponse putExternalSystemGeolocation(Account account
                                                                        , String accessToken) {

        Http http = new Http();

        HttpResponse response = http.send(this.requestBuilder.build(account, accessToken));

        ExternalSystemGeoMappingResponse  geolocationResponse = (ExternalSystemGeoMappingResponse) 
                                                    JSON.deserialize(response.getBody()
                                                    , ExternalSystemGeoMappingResponse.class);

        geolocationResponse.statusCode = response.getStatusCode();

        return geolocationResponse;

    }

}
