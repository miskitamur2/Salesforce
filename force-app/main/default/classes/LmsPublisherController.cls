public with sharing class LmsPublisherController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [SELECT Id, Name, email FROM Contact LIMIT 10];
    }
}