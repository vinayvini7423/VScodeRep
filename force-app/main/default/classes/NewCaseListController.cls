public class NewCaseListController {

    public List<Case> getNewCases(){
        List<case> results = [SELECT Id,CaseNumber FROM Case where status='new'];
    return results;
    
    }

}