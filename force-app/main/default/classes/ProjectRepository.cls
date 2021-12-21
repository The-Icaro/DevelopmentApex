/**
 * @author Icaro - TOPi
 */
public virtual class ProjectRepository extends AbstractRepository {

  virtual
  public Project__c findById(Id projectId) {

    return [SELECT Id
                  , ProjectName__c
                  , Status__c
                  , StartDate__c
                  , EndDate__c
                  , Budget__c
                  , LastSyncDate__c
                  , SynchronizationStatus__c
                  , ErrorMessage__c 
                  , ExternalId__c
                  FROM Project__c
                  WHERE Id = : projectId];

  }

}
