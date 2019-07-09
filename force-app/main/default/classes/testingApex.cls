public class testingApex {
    public List< String> AccountSelectedFields = new List< String> ();
     public List<String> accountFields{get;set;}
    public List<account> accDet { get; set; }
   public Opportunity Opportunity {get; set;}

    public testingApex(ApexPages.StandardController controller) {
        System.debug(accDet);
        String query= setField();
        this.accDet=Database.query(query);
        System.debug(accDet);
    }
    
      public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Account.FieldSets.AccountFieldSet.getFields();
    }
    
    public String  setField(){
        String QueryString='Select ';
        
        System.debug(AccountSelectedFields.size());
        System.debug(AccountSelectedFields);
        for(integer i=0;i<AccountSelectedFields.size();i++){
            QueryString+=AccountSelectedFields[i]+',';
        }
        QueryString+='Id from Account limit 5';
        System.debug(QueryString);
         
        return QueryString;
    }
 
    public void saveAcc(){
       try{
            upsert accDet;
            System.debug(accDet);
        }
        catch(Exception ex){
            ApexPages.addMessages(ex);
          system.debug(ex.getMessage());
        }
    }
    
     public PageReference test() {
         String QueryString='Select ';
          accountFields=new List<String>();
         System.debug(AccountSelectedFields.size());
         System.debug(AccountSelectedFields);
         for(integer i=0;i<AccountSelectedFields.size();i++){
             QueryString+=AccountSelectedFields[i]+',';
                accountFields.add(AccountSelectedFields[i]);
         }
         if(AccountSelectedFields.size()==0){
             accountFields=null;
         }
         QueryString+='Id from Account limit 1';
         System.debug(QueryString);
          System.debug(accountFields);
           this.accDet=Database.query(QueryString);
         return null;
        }
            
        public List<SelectOption> getItems() {
              
           
            List<SelectOption> options = new List<SelectOption>();
            for(Schema.FieldSetMember f : this.getFields()) {
            //accFields.add(f.getFieldPath());
            System.debug('field set type '+f.getType());
                
            options.add(new SelectOption(f.getFieldPath(),f.getLabel()));
            }
            
            return options;
        }
            
        public List< String>  getAccountSelectedFields() {
            return AccountSelectedFields;
        }
            
        public void setAccountSelectedFields(List< String>  accountSelectedFields) {
            this.AccountSelectedFields = accountSelectedFields;
           }
}