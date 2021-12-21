/**
 * @author Icaro - TOPi
 */
@isTest
public class PutExternalProjectOutboundServiceTest {
    

    @isTest
    public static void givenValidProjectWhenSyncLegacySystemReponseToProjectThenChangeProjectSyncData() {

        TriggerHandler.bypass('ProjectTH');

        Project__c project = ProjectFixtureFactory.createProject();

        String expectedResponsePayload = '{ "projectId": "01932190123", "externalId": "a044W00000g70IKQAY" }';

        LegacySystemProjectResponse expectedResponse = (LegacySystemProjectResponse) 
                                                        JSON.deserialize(expectedResponsePayload
                                                        , LegacySystemProjectResponse.class);

        PutExternalProjectOutboundService service = new PutExternalProjectOutboundService();

        Test.setMock(HttpCalloutMock.class, new LegacySystemExternalProjectHttpMock(expectedResponsePayload));

        Test.startTest();

        service.syncLegacySystemResponseToProject(project);

        Test.stopTest();

        System.assertEquals('Integrado com Sucesso!', project.SynchronizationStatus__c);
        System.assertEquals(null, project.ErrorMessage__c);
        System.assertEquals(expectedResponse.externalId, project.ExternalId__c);

    }

    @isTest
    public static void givenProjectIdWhenChangeProjectThenReturnProjectWithSyncDataFromLegacySystemResponse() {

        TriggerHandler.bypass('ProjectTH');

        Project__c project = ProjectFixtureFactory.createProject();

        String expectedResponsePayload = '{ "projectId": "01932190123", "externalId": "a044W00000g70IKQAY" }';

        LegacySystemProjectResponse expectedResponse = (LegacySystemProjectResponse) 
                                                        JSON.deserialize(expectedResponsePayload
                                                        , LegacySystemProjectResponse.class);

        PutExternalProjectOutboundService service = new PutExternalProjectOutboundService();

        Test.setMock(HttpCalloutMock.class, new LegacySystemExternalProjectHttpMock(expectedResponsePayload));

        Test.startTest();

        Project__c changedProject = service.changeProject(project.Id);

        Test.stopTest();

        System.assertEquals('Integrado com Sucesso!', changedProject.SynchronizationStatus__c);
        System.assertEquals(null, changedProject.ErrorMessage__c);
        System.assertEquals(expectedResponse.externalId, changedProject.ExternalId__c);

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
