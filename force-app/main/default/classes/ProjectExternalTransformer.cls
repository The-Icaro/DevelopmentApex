/**
 * @author Icaro - TOPi
 */
public class ProjectExternalTransformer {

    public Project__c toProject(LegacySystemProjectResponse response, Project__c project) {

        project.LastSyncDate__c = Datetime.now();

        if(response.statusCode == 200) {

            project.SynchronizationStatus__c = 'Integrado com Sucesso!';
            project.ErrorMessage__c = response.errorMessage;
            project.ExternalId__c = response.externalId + Math.random();

        } else if (response.statusCode == 400) {

            project.SynchronizationStatus__c = 'Erro na sincronização de projetos';
            project.ErrorMessage__c = response.errorMessage;
            project.ExternalId__c = null;

        }

        return project;

    }

}
