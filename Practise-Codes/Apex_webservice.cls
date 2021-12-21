@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest req=RestContext.request;
        String caseId = req.requestURI.substringBetween('Accounts/','/contacts');
        Account acc=[Select id,name,(SELECT Id, Name From Contacts) from Account where Id =:caseId];       
        return acc ;
    }
}