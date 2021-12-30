/**
 * @author Icaro - TOPi
 */
public class GetAccountOAuthOS {

    GetSalesforceOAuthOutboundService service;

    public GetAccountOAuthOS() {
        this.service = new GetSalesforceOAuthOutboundService();
    }

    public String getAccountAccessToken() {

        SalesforceOAuthResponse response = service.getSalesforceOAuth();

        return response.access_token;

    }

}
