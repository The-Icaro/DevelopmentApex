/**
 * @author Icaro - TOPi
 */
@isTest
public class PutLegacySystemExternalProjectOSTest {
    
    @isTest
    public static void givenValidProjectWhenPutLegacySystemThenReturnExternalIdProject() {

        TriggerHandler.bypass('ProjectTH');

        Project__c project = ProjectFixtureFactory.createProject();

        String expectedResponsePayload = '{ "projectId": "01932190123", "externalId": "a044W00000g70IKQAY" }';

        LegacySystemProjectResponse expectedResponse = (LegacySystemProjectResponse) 
                                                        JSON.deserialize(expectedResponsePayload
                                                        , LegacySystemProjectResponse.class);
                                                    
        PutLegacySystemExternalProjectOS service = new PutLegacySystemExternalProjectOS();

        Test.setMock(HttpCalloutMock.class, new LegacySystemExternalProjectHttpMock(expectedResponsePayload));

        Test.startTest();

        LegacySystemProjectResponse response = service.putLegacySystemProject(project);

        Test.stopTest();

        System.assert(response.errorMessage == null);
        System.assertEquals(expectedResponse.externalId, response.externalId);
        System.assertEquals(expectedResponse.projectId, response.projectId);

    }

    public class LegacySystemExternalProjectHttpMock implements HttpCalloutMock {

        String payload;

        public LegacySystemExternalProjectHttpMock(String payload) {
            this.payload = payload;
        }

        public HttpResponse respond(HttpRequest request) {

            HttpResponse response = new HttpResponse();

            response.setStatusCode(200);

            response.setBody(payload);

            return response;

        }

    }

}
