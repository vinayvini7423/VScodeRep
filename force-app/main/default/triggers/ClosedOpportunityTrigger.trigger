trigger ClosedOpportunityTrigger on Opportunity (before insert,before update) {
    
List<Task> FollowUpTasks =new List<Task>();

     if(Trigger.isUpdate){
   for(Opportunity opp :Trigger.New){

       Task T = new Task() ;

       T.Subject = 'Follow Up Test Task' ;

       T.WhatId = opp.Id ;

        if(opp.StageName=='Closed Won')

            FollowUpTasks.add(T);

    }
    }

    insert FollowUpTasks;
}