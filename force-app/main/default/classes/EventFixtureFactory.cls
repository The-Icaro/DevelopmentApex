/**
* @author Icaro - TOPi
*/
@isTest
public class EventFixtureFactory {

    public static Event newEvent() {
        return new Event();
    }

    public static Event createEvent() {
        return persistEvent(newEvent());
    }

    public static Event persistEvent(Event entity) {
        insert entity;

        return entity;
    }

}