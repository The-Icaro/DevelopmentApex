/**
 * @author Icaro - TOPi
 */
public class PutExternalSystemGeolocationOS {

    ExternalSystemGeolocationRequestBuilder requestBuilder;

    public PutExternalSystemGeolocationOS() {
        this.requestBuilder = new ExternalSystemGeolocationRequestBuilder();
    }
    
    public ExternalSystemGeolocationResponse putExternalSystemGeolocation(Account account
                                                                        , String accessToken) {

        Http http = new Http();

        HttpResponse response = http.send(this.requestBuilder.build(account, accessToken));

        ExternalSystemGeolocationResponse  geolocationResponse = (ExternalSystemGeolocationResponse) 
                                                    JSON.deserialize(response.getBody()
                                                    , ExternalSystemGeolocationResponse.class);

        geolocationResponse.statusCode = response.getStatusCode();

        return geolocationResponse;

    }

}
