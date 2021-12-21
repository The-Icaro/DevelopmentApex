/**
 * @author Icaro - TOPi
 */
@isTest
public class ProjectFilterTest {
    
    @isTest
    public static void givenProjectsWhenFilterByInitiadedStatusThenReturnListOnlyWithInitiadedProjects() {

        Project__c project = ProjectFixtureFactory.newProject();

        List<Project__c> projects = new List<Project__c>{project};

        ProjectFilter filter = new ProjectFilter();

        List<Project__c> filteredProjects = filter.filterByInitiatedStatus(projects);

        System.assert(!filteredProjects.isEmpty());
        System.assertEquals(1, filteredProjects.size());
        System.assertEquals(15000000, filteredProjects.get(0).Budget__c);

    }

    @isTest
    public static void givenProjectsWhenFilterByEnterpriseTypeThenReturnListOnlyWithEnterpriseProjects() {

        Project__c project = ProjectFixtureFactory.newProject();

        List<Project__c> projects = new List<Project__c>{project};

        ProjectFilter filter = new ProjectFilter();

        List<Project__c> filteredProjects = filter.filterByEnterpriseType(projects);

        System.assert(!filteredProjects.isEmpty());
        System.assertEquals(1, filteredProjects.size());
        System.assertEquals('Novo Projeto', filteredProjects.get(0).ProjectName__c);

    }

    @isTest
    public static void givenProjectsWhenFilterThenReturnListOnlyWithEnterpriseAndInitiatedProjects() {

        List<Project__c> projects = new List<Project__c>{
            new Project__c(ProjectName__c = 'Project1', Status__c = 'Iniciado', Type__c = 'Enterprise')
            , new Project__c(ProjectName__c = 'Project2', Status__c = 'Iniciado')
            , new Project__c(ProjectName__c = 'Project3', Type__c = 'Enterprise')
        };

        ProjectFilter filter = new ProjectFilter();

        List<Project__c> filteredProjects = filter.filterByEnterpriseAndInitiadedProjects(projects);

        System.assert(!filteredProjects.isEmpty());
        System.assertEquals(1, filteredProjects.size());
        System.assertEquals('Project1', filteredProjects.get(0).ProjectName__c);

    }

}
