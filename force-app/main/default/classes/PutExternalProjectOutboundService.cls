/**
 * @author Icaro - TOPi
 */
public class PutExternalProjectOutboundService {

    ProjectExternalTransformer transformer;

    PutLegacySystemExternalProjectOS outboundService;

    ProjectRepository repository;

    public PutExternalProjectOutboundService() {

        this.transformer = new ProjectExternalTransformer();
        this.outboundService = new PutLegacySystemExternalProjectOS();
        this.repository = new ProjectRepository();

    }

    public void syncLegacySystemResponseToProject(Project__c project) {

        LegacySystemProjectResponse response = outboundService.putLegacySystemProject(project);

        transformer.toProject(response, project);

    }

    public Project__c changeProject(Id projectId) {

        Project__c project = repository.findById(projectId);

        syncLegacySystemResponseToProject(project);

        repository.save(project);

        return project;

    }

}
