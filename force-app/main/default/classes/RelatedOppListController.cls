public with sharing class RelatedOppListController {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppList(String accountId){
        return [SELECT Id, Name, Amount, CloseDate 
                    FROM Opportunity Where AccountId =: accountId
                    ORDER BY CreatedDate DESC];
    }
}