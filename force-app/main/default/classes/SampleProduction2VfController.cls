public with sharing class SampleProduction2VfController {
    public Account acc {get; set;}
    public SampleProduction2VfController (){
    Map<String, String> params = ApexPages.CurrentPage().getParameters();
    Id accId = (Id)params.get('id');
    Account[] accounts = [SELECT Name FROM Account WHERE Id =: accId];
    acc = accounts[0];
    }
    public PageReference moveDetailPage(){
    return new PageReference('/' + acc.Id);
    }
    }