public with sharing class WireApexCallController {

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey){
        return [SELECT Id, Name, Website, Phone, LastModifiedDate 
                  FROM Account
                  WHERE Name LIKE :'%' + String.escapeSingleQuotes(searchKey) + '%'
                ];
    }
}