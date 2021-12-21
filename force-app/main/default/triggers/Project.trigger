/**
 * @author Icaro - TOPi
 */
trigger Project on Project__c (after insert, after update) {

  new ProjectTH().run();

}