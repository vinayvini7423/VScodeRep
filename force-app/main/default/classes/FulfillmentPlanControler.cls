public class FulfillmentPlanControler {
    @AuraEnabled
    public static  list <fullfillment__C> fulfillmentData(String oppId){
        list <fullfillment__C> storedData=new list <fullfillment__C>();
        storedData=[SELECT Id, res__c, skills__c, Skill_List__c,Practice_List__c,region__c, Opportunity__c, Name FROM fullfillment__c where Opportunity__c='0067F000009v3eaQAA' ];
        
        return storedData;
    }

    @AuraEnabled
    public static List<String> getPickListValuesIntoList(){
       List<String> pickListValuesList= new List<String>();
		Schema.DescribeFieldResult fieldResult = fullfillment__C.Practice_List__c.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
			pickListValuesList.add(pickListVal.getLabel());
		}    
		return pickListValuesList;
    }
    
     @AuraEnabled
    public static List<String> getPickListValueofLocation(){
       List<String> pickListValuesListOfLocation= new List<String>();
		Schema.DescribeFieldResult fieldResult = fullfillment__C.region__c.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
			pickListValuesListOfLocation.add(pickListVal.getLabel());
		}    
        system.debug('---testing --'+pickListValuesListOfLocation);
		return pickListValuesListOfLocation;
    }
    
    @AuraEnabled
    public static list <fullfillment__C> createFulfillment( string practices,string region,string Numofemp,string skillsNeed){
        fullfillment__C newFulfillment=new fullfillment__C();
        newFulfillment.Practice_List__c=practices;
        newFulfillment.region__c=region;
        newFulfillment.res__c=Integer.valueOf(Numofemp);
        newFulfillment.skills__c=skillsNeed;
        newFulfillment.Opportunity__c='0067F000009v3eaQAA';
        
        system.debug('---testing ---'+newFulfillment);
        insert newFulfillment;
        return FulfillmentPlanControler.fulfillmentData('');
        
    }
    
    @AuraEnabled
    public static list <fullfillment__C> deleteFulfillment(string fulfillmentId){
         fullfillment__C newFulfillment=new fullfillment__C();
         newFulfillment=[SELECT Id, fulfillmentStatus__c, Name FROM fullfillment__c where Id=:fulfillmentId];
         newFulfillment.fulfillmentStatus__c='Canceled';
        
        update newFulfillment;
         return FulfillmentPlanControler.fulfillmentData('');
    }
    
     @AuraEnabled
 public static void saveDetails( list <fullfillment__C> dataList){
		System.debug('---------------dataList-----------'+dataList); 
     
     for(fullfillment__C temp:dataList)
     {
       
             system.debug('testing-----'+temp);
             
             fullfillment__C test= new fullfillment__C();
             test.Practice_List__c=temp.Practice_List__c;
             system.debug('testing-----111111'+test);
             test.Opportunity__c='0067F000009v3eaQAA';
          system.debug('testing-----22222'+test);
            insert test; 
       
        
     }   
}
}