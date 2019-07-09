trigger caseFileToGroupTrigger on FeedItem (After insert) {
 	Set<Id> caseIDs= new Set<Id>();
    for(FeedItem ft:trigger.new ){
         string checkIfCase = string.valueof(ft.ParentId);
        if(checkIfCase.startsWith('500')){
            caseIDs.add(ft.ParentId);
        }
    }
    postToGroupFromCase obj=new postToGroupFromCase();
    obj.caseFileToGroup(trigger.newmap,caseIDs);
}