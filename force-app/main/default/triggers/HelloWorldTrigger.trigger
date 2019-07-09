trigger HelloWorldTrigger on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    
    Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
        [SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
    
     for(Account a : Trigger.New) {
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id));
       
         if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
           oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=a.Id));
        }           
    }
   
    if (oppList.size() > 0) {
        insert oppList;
    }
}