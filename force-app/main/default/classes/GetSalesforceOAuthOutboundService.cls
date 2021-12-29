/**
 * @author Icaro - TOPi
 */
public class GetSalesforceOAuthOutboundService {

    SalesforceOAuthRequestBuilder requestBuilder;

    public GetSalesforceOAuthOutboundService() {
        this.requestBuilder = new SalesforceOAuthRequestBuilder();
    }
    
    public SalesforceOAuthResponse getSalesforceOAuth() {

        Http http = new Http();

        HttpResponse response = http.send(this.requestBuilder.build());

        SalesforceOAuthResponse  oauthResponse = (SalesforceOAuthResponse) 
                                                    JSON.deserialize(response.getBody()
                                                    , SalesforceOAuthResponse.class);

        return oauthResponse;

    }

}
