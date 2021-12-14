/**
* @author Icaro - TOPi
*/
trigger Account on Account (after insert) {

  new AccountTH().run();

}