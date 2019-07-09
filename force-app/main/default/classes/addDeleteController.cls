public with sharing class addDeleteController {
    @AuraEnabled
    public static list <fullfillment__C> deatilsOfFulfilment(Id oppId){
        
         list <fullfillment__C> storedData=new list <fullfillment__C>();
        storedData=[SELECT Id, res__c, skills__c, Skill_List__c,Practice_List__c,region__c, Opportunity__c, Name FROM fullfillment__c where Opportunity__c=:oppId];
  System.debug(storedData);
        return storedData;
    }
   @AuraEnabled
    public static void saveContacts(List<fullfillment__C> ListContact,Id oppId){
        List<fullfillment__C> UpdateList=new   List<fullfillment__C>();
         List<fullfillment__C> UpsertList=new   List<fullfillment__C>();

        for(fullfillment__C temp:ListContact){
            System.debug('------data---------'+temp);
             System.debug('------oppId---------'+oppId);
            if(  temp.Opportunity__c==null){
                temp.Opportunity__c=oppId;
                UpsertList.add(temp);
            }
            else
                UpdateList.add(temp);
        }
        update UpdateList;
        upsert UpsertList;
    }
}