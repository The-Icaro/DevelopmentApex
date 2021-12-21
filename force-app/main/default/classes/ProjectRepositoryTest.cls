/**
 * @author Icaro - TOPi
 */
@isTest
public class ProjectRepositoryTest {
    

    @isTest
    public static void givenCreatedProjectWhenFindByIdThenReturnStoredProject() {

        TriggerHandler.bypass('ProjectTH');

        Project__c expectedProject = ProjectFixtureFactory.createProject();

        ProjectRepository repository = new ProjectRepository();

        Test.startTest();

        Project__c responseProject = repository.findById(expectedProject.Id);

        Test.stopTest();

        System.assert(responseProject.Id != null);
        System.assertEquals(expectedProject.ProjectName__c, responseProject.ProjectName__c);

    }

}