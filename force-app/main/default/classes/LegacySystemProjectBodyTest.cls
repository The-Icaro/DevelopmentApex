/**
 * @author Icaro - TOPi
 */
@isTest
public class LegacySystemProjectBodyTest {

    @isTest
    public static void givenValidProjectWhenModifyToLegacySystemBodyThenReturnJSONSerialized() {

        TriggerHandler.bypass('ProjectTH');

        Project__c project = ProjectFixtureFactory.createProject();

        LegacySystemProjectBody legacySystemBody = new LegacySystemProjectBody();

        Test.startTest();

        String jsonBody = legacySystemBody.toLegacySystemBody(project);

        Test.stopTest();

        System.debug(jsonBody);

        System.assert(!String.isEmpty(jsonBody));
        System.assert(jsonBody.contains('name'));
        System.assert(jsonBody.contains('Iniciado'));

    }

}
