public class FiveStarsController {
      public String caseId {get;set;}
    public String attachedRecords {get;set;}
    public Integer rating { get; set; }
     public FiveStarsController() {
       // attachedRecords = ApexPages.currentPage().getParameters();
         System.debug('-----attachedRecords------'+attachedRecords);
//caseId =attachedRecords.getChars('CaseId');
          System.debug('-----caseId------'+caseId);
    }    
}