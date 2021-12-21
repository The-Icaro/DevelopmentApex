/**
 * @author Icaro - TOPi
 */
@isTest
public class ProjectExternalTransformerTest {
    
    @isTest
    public static void givenProjectAndSuccessLegacySystemResponseWhenTransformedThenChangeProjectSyncData() {

        Project__c project = ProjectFixtureFactory.newProject();

        String responsePayload = '{ "projectId": "01932190123", "externalId": "a044W00000g70IKQAY", "statusCode": 200 }';

        LegacySystemProjectResponse response = (LegacySystemProjectResponse) 
                                                        JSON.deserialize(responsePayload
                                                        , LegacySystemProjectResponse.class);

        ProjectExternalTransformer transformer = new ProjectExternalTransformer();

        Project__c transformedProject = transformer.toProject(response, project);

        System.assertEquals('Integrado com Sucesso!', transformedProject.SynchronizationStatus__c);
        System.assertEquals(null, transformedProject.ErrorMessage__c);
        System.assertEquals(response.externalId, transformedProject.ExternalId__c);

    }

    @isTest
    public static void givenProjectAndFailureLegacySystemResponseWhenTransformedThenChangeProjectSyncData() {

        Project__c project = ProjectFixtureFactory.newProject();

        String responsePayload = '{ "errorMessage" : "Invalid Start Date", "statusCode": 400 }';

        LegacySystemProjectResponse response = (LegacySystemProjectResponse) 
                                                        JSON.deserialize(responsePayload
                                                        , LegacySystemProjectResponse.class);

        ProjectExternalTransformer transformer = new ProjectExternalTransformer();

        Project__c transformedProject = transformer.toProject(response, project);

        System.assertEquals('Erro na sincronização de projetos', transformedProject.SynchronizationStatus__c);
        System.assertEquals('Invalid Start Date', transformedProject.ErrorMessage__c);
        System.assertEquals(null, transformedProject.ExternalId__c);

    }

}
