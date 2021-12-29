/**
 * @author Icaro - TOPi
 */
public abstract class AbstractRepository {
    
    virtual
    public List<SObject> save(SObject entity) {
        return save(new List<SObject>{entity});
    }

    virtual
    public List<SObject> save(List<SObject> entities) {
        upsert entities;

        return entities;
    }

}
