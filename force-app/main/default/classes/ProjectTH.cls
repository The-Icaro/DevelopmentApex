/**
 * @author Icaro - TOPi
 */
public with sharing class ProjectTH extends TriggerHandler{

    List<Project__c> newProjects;

    Map<Id, Project__c> oldProjects;

    ProjectFilter filter;

    PutExternalProjectPublisher projectPublisher;

    public ProjectTH() {

        this((List<Project__c>) Trigger.new, (Map<Id, Project__c>) Trigger.oldMap);

    }

    public ProjectTH(List<Project__c> newProjects, Map<Id, Project__c> oldProjects) {

        this.newProjects = newProjects;
        this.oldProjects = oldProjects;
        this.filter = new ProjectFilter();
        this.projectPublisher = new PutExternalProjectPublisher();

    }

    override
    public void afterInsert() {
        publishSyncProject();
    }

    override
    public void afterUpdate() {
        publishSyncProject();
    }

    public List<Project__c> filterEnterpriseAndInitiadedProjects(){
        return filter.filterByEnterpriseAndInitiadedProjects(this.newProjects);
    }

    public void publishSyncProject() {

        List<Project__c> projects = filterEnterpriseAndInitiadedProjects();

        projectPublisher.publish(projects);

    }
}
