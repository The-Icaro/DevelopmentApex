/**
 * @author Icaro - TOPi
 */
public class SalesforceOAuthRequestBuilder {
     
    private String client_id = '3MVG9l2zHsylwlpS6h2vTmlmUGQBhdenOwDRCOFn28Edf9ajwCJ3THJs1OvxrZPVNucENmEJb.7paFUCK3Kqr';
    
    private String client_secret = 'BFC7A19775AA64B697A6F712F62E2D0A671321BBA2FAE18973580F4557F5FC68';
    
    private String redirect_uri = 'http://localhost';
    
    private String grant_type = 'password';
    
    private String username = 'integration.user@topirun.com';
    
    private String password = '@TopiRun20214';

    public HttpRequest build() {

        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://login.salesforce.com/services/oauth2/token');

        request.setMethod('POST');

        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        request.setBody (this.buildPostFormParameters(this.buildOAuth()));

        return request;

    }

    public String buildPostFormParameters (Map<String, String> oauthRequest) {

        String formParameters = '';
    
        for ( String formParameterName : oauthRequest.keySet() ) {
    
            if (formParameterName == null) continue;
    
            formParameters += formParameterName 
                                + '=' 
                                + EncodingUtil.urlEncode(oauthRequest.get(formParameterName), 'UTF-8') 
                                + '&';
        }
    
        return formParameters;
    
    }

    public Map<String, String> buildOAuth() {

        Map<String, String> oauth = new Map<String, String>();
    
        oauth.put('client_id', client_id);
        
        oauth.put('client_secret', client_secret);
        
        oauth.put('redirect_uri', redirect_uri);
        
        oauth.put('grant_type', grant_type);
        
        oauth.put('username', username);
        
        oauth.put('password', password);

        return oauth;

    }

}
