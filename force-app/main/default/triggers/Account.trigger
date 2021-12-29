/**
 * @author Icaro - TOPi
 */
trigger Account on Account (after insert, after update) {

    new AccountTH().run();

}