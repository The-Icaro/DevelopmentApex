/**
* @author Icaro - TOPi
*/
public class AccountEnrichEvent {

    EventRepository repository;

    public AccountEnrichEvent() {

        this.repository = new EventRepository();

    }

    public List<Event> enrich(List<Account> accounts) {

        List<Event> events = new List<Event>{};

        for (Account account : accounts) {
           List<Event> event = withCreatingEvent(account);
           events.add(event.get(0));
        }

        return events;

    }

    public List<Event> withCreatingEvent(Account account) {

        Event event = new Event();

        Datetime createdDate = Datetime.now();

        event.WhatId = account.Id;

        event.StartDateTime = createdDate.addDays(1);

        event.DurationInMinutes = 60;

        event.ContactType__c = 'Telefônico';

        event.Description = 'Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium';
        
        event.Subject = 'Apresentação institucional dos produtos Premium';
        
        return repository.save(event);

    }

}
