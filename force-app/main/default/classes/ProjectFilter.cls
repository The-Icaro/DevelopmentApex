/**
 * @author Icaro - TOPi
 */
public class ProjectFilter {

    public List<Project__c> filterByEnterpriseAndInitiadedProjects(List<Project__c> projects) {

        return filterByInitiatedStatus(filterByEnterpriseType(projects));

    }

    public List<Project__c> filterByEnterpriseType(List<Project__c> projects) {

        List<Project__c> filteredEnterpriseProjects = new List<Project__c>();

        for(Project__c project : projects) {

            if(project.Type__c == 'Enterprise') {
                filteredEnterpriseProjects.add(project);
            }

        }

        return filteredEnterpriseProjects;

    }

    public List<Project__c> filterByInitiatedStatus(List<Project__c> projects) {

        List<Project__c> filteredInitiadedProjects = new List<Project__c>();

        for(Project__c project : projects) {

            if(project.Status__c == 'Iniciado') {
                filteredInitiadedProjects.add(project);
            }

        }

        return filteredInitiadedProjects;

    }

}
