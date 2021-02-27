public with sharing class TableViewAccountController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList(String Id){
        return [SELECT Id, Name, StageName, CloseDate, Amount FROM Opportunity where AccountId =: Id order by Amount desc];
    }
}