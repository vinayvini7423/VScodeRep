public with sharing class CampingListController {
        @AuraEnabled
    public static list<Camping_Item__c> getItems(){
        return [SELECT Id, Name, Price__c, Quantity__c, Packed__c
                FROM Camping_Item__c];
    } 
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c CItem){
        upsert CItem;
        return CItem;
    }
}