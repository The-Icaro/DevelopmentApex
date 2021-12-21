/**
 * @author Icaro - TOPi
 */
@isTest
public class ProjectFixtureFactory {

    public static Project__c newProject() {
        return new Project__c(ProjectName__c = 'Novo Projeto' 
                            , Status__c = 'Iniciado'
                            , Type__c = 'Enterprise' 
                            , StartDate__c = Date.today()
                            , EndDate__c = Date.today()
                            , Budget__c = 15000000);
    }

    public static Project__c createProject() {
        return persistProject(newProject());
    }

    public static Project__c persistProject(Project__c entity) {
        insert entity;

        return entity;
    }

}