/**
 * @author Icaro - TOPi
 */
public class PutLegacySystemExternalProjectOS {

    public LegacySystemProjectResponse putLegacySystemProject(Project__c project) {

        HttpRequest request = new HttpRequest();

        request.setHeader('Content-Type', 'application/json');

        request.setMethod('PUT');

        request.setEndpoint('https://run.mocky.io/v3/58d750c1-31bf-45ae-b361-bedecacf55a2');

        request.setBody(new LegacySystemProjectBody().toLegacySystemBody(project));

        Http http = new Http();

        HttpResponse response = http.send(request);

        LegacySystemProjectResponse bodyResponse = (LegacySystemProjectResponse) 
                                                        JSON.deserialize(response.getBody()
                                                                        , LegacySystemProjectResponse.class);
            
        bodyResponse.statusCode = response.getStatusCode();

        return bodyResponse;

    }

}
