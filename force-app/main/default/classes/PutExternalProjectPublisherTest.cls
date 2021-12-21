/**
 * @author Icaro - TOPi
 */
@isTest
public class PutExternalProjectPublisherTest {
    
    @isTest
    public static void givenListValidAccountsWhenPublishThenChangeProjectsSyncsData() {

        TriggerHandler.bypass('ProjectTH');

        Project__c project = ProjectFixtureFactory.createProject();

        List<Project__c> projects = new List<Project__c>{project};

        String expectedResponsePayload = '{ "projectId": "01932190123", "externalId": "a044W00000g70IKQAY" }';

        LegacySystemProjectResponse expectedResponse = (LegacySystemProjectResponse) 
                                                        JSON.deserialize(expectedResponsePayload
                                                        , LegacySystemProjectResponse.class);

        PutExternalProjectPublisher publisher = new PutExternalProjectPublisher();

        Test.setMock(HttpCalloutMock.class, new LegacySystemExternalProjectHttpMock(expectedResponsePayload));

        Test.startTest();

        publisher.publish(projects);

        Test.stopTest();

        Project__c projectToTest = [SELECT Id, SynchronizationStatus__c, ErrorMessage__c, ExternalId__c
                                        FROM Project__c
                                        WHERE Id = : project.Id];

        System.assertEquals('Integrado com Sucesso!', projectToTest.SynchronizationStatus__c);
        System.assertEquals(null, projectToTest.ErrorMessage__c);
        System.assertEquals(expectedResponse.externalId, projectToTest.ExternalId__c);

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
