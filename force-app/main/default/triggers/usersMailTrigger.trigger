trigger usersMailTrigger on Account (before insert,before update) {
    Set<Id> userIds = new Set<Id>();
  
    Map<String,map<String,String>> AccountList=new Map<String,map<String,String>>();
    
    for (Account acc : Trigger.new) {
        
        Account oldacc = Trigger.oldMap.get(acc.Id);
        
        if(oldacc.User__c!=null){
            
          
            userIds.add(oldacc.User__c);
            userIds.add(acc.User__c);
            userIds.add(acc.ownerid);
            
            Map<String,Id> oldNewValue=new Map<String,Id>();
            oldNewValue.put('oldUserId',acc.User__c);
            oldNewValue.put('newUserId',oldacc.User__c);
            oldNewValue.put('ownerId',acc.ownerid);
           oldNewValue.put('accName',acc.Name);
            AccountList.put(acc.id,oldNewValue);
            
           
       
        }
        System.debug('------user id------'+userIds);
      
        System.debug('------AccountList-------'+AccountList);
       usersMailTriggerHelper.SendMailToAccountList(AccountList,userIds);
    }
}