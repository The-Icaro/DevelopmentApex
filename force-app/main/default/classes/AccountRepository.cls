/**
 * @author Icaro - TOPi
 */
public class AccountRepository extends AbstractRepository{
    
    public Account findById(Id accountId) {

        return [SELECT Id, Name, CPF__c, CNPJ__c
                FROM Account
                WHERE Id = : accountId];

    }


    public List<Account> findByGeolocationRequested() {

        return [SELECT Id, Name, 
                ShippingAddress, BillingAddress
                FROM Account
                WHERE GeolocationRequested__c = : true];

    }

}
