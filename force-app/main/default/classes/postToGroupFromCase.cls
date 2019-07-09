public class postToGroupFromCase {
    public void caseFileToGroup(Map<Id,FeedItem>newTrigger,	Set<Id> caseIDs){
         Map<Id,case> caseDetails= new Map<Id,case>([SELECT Id, Type, CaseNumber, Subject FROM Case where id in:caseIDs]);
        for(FeedItem temp:newTrigger.values()){
            //case casedata=caseDetails.get(tem);
        }
    }
}