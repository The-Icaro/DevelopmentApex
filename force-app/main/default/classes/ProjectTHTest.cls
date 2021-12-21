/**
 * @author Icaro - TOPi
 */
@isTest
public class ProjectTHTest {
    
    @isTest
    public static void givenValidProjectWhenInsertedThenSyncDataWithLegacySystemExternalProject() {

        TriggerHandler.clearAllBypasses();

        Project__c project = ProjectFixtureFactory.createProject();

        System.assert(project.ExternalId__c != null);
        System.assert(project.ErrorMessage__c == null);
        System.assertEquals('Integrado com Sucesso!', project.SynchronizationStatus__c);

    }

}
