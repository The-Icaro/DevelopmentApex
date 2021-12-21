/**
 * @author Icaro - TOPi
 */
public class PutExternalProjectPublisher {

  public static PutExternalProjectOutboundService outboundService;

  static {
    outboundService = new PutExternalProjectOutboundService();
  }

  public void publish(List<Project__c> projects) {

    for(Project__c project : projects) {

      System.enqueueJob(new QueuedPutExternalProjectOutbound(project));

    }

  }

  public class QueuedPutExternalProjectOutbound implements Queueable, Database.AllowsCallouts {

    Project__c project;

    PutExternalProjectOutboundService outboundService;

    public QueuedPutExternalProjectOutbound(Project__c project) {

      this.project = project;
      this.outboundService = new PutExternalProjectOutboundService();

    }

    public void execute(QueueableContext context) {
      outboundService.changeProject(this.project.Id);
    }

  }

}
