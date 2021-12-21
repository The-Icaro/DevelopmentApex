/**
 * @author Icaro - TOPi
 */
public class LegacySystemProjectBody {

    public String name;

    public String code;

    public String status;

    public Date startDate;

    public Date endDate;

    public Double budget;

    public String toLegacySystemBody(Project__c project) {

        LegacySystemProjectBody body = new LegacySystemProjectBody();

        body.name = project.ProjectName__c;

        body.code = project.Id;

        body.status = project.Status__c;

        body.startDate = project.StartDate__c;

        body.endDate = project.EndDate__c;

        body.budget = project.Budget__c;

        return JSON.serialize(body);

    }

}
