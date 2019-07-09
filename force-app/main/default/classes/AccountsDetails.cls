public class AccountsDetails {
    
     String[] accountFields = new String[]{};
         
         
         
    public List<account> accDet { get; set; }
    public integer accCount{get;set;}
    public List<String> accFields{get;set;}
    public List<String> conFields{get;set;}
    public List<String> accFieldsLable{get;set;}
    public List<String> conFieldsLable{get;set;}
    public List<String> caseFieldsLable{get;set;}
    public List<String> caseFields{get;set;}
    public Integer accDateIndex{get;set;}
    public AccountsDetails(ApexPages.StandardController controlle) {
        
        System.debug(accDet);
        //String query='select Id,name,ownerId,AccountNumber,rating,(select  Id, Name, FirstName, LastName, AccountId, OwnerId from contacts) ,(SELECT Id, Type, Status, CaseNumber FROM Cases) from account limit 3';
       String query= setField();
        this.accDet=Database.query(query);
        
       // this.accDet=[select Id,name,ownerId,AccountNumber,rating,(select  Id, Name, FirstName, LastName, AccountId, OwnerId from contacts) ,(SELECT Id, Type, Status, CaseNumber FROM Cases) from account limit 3];
    
          System.debug(accDet);
    }
     public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Account.FieldSets.AccountFieldSet.getFields();
    }
     public List<Schema.FieldSetMember> getFields1() {
        return SObjectType.Contact.FieldSets.ContactFieldSet.getFields();
    }
     public List<Schema.FieldSetMember> getFields2() {
        return SObjectType.Case.FieldSets.caseDetails.getFields();
    }
    public String  setField(){
        accFields=new List<String>();
        conFields=new List<String>();
        accFieldsLable=new List<String>();
        conFieldsLable=new List<String>();
        caseFieldsLable=new List<String>();
        caseFields=new List<String>();
        
        Integer countIndex=0;
        String QueryString='Select ';
        
        for(Schema.FieldSetMember f : this.getFields()) {
            accFields.add(f.getFieldPath());
            System.debug('field set type '+f.getType());
            string accDate=''+f.getType();
            
            if(accDate=='DATE' || accDate=='DATETIME'){
                accDateIndex=countIndex+1;
                System.debug(accDateIndex);
            }
            countIndex++;
            QueryString += f.getFieldPath() + ',';
            accFieldsLable.add(f.getLabel());
        }
        
        System.debug(QueryString);
        QueryString+='(select ';
        
        for(Schema.FieldSetMember f : this.getFields1()) {
            conFields.add(f.getFieldPath());
            QueryString += f.getFieldPath() + ',';
            conFieldsLable.add(f.getLabel());
        }
        System.debug('Contact query '+QueryString);
        QueryString+='Id from Contacts),(select ';
        
        for(Schema.FieldSetMember f : this.getFields2()) {
            caseFields.add(f.getFieldPath());
            QueryString += f.getFieldPath() + ',';
            caseFieldsLable.add(f.getLabel());
        }
        QueryString+='Id from Cases),Id from Account limit 5 ';
        System.debug('complete----------- '+QueryString);
        return QueryString;
    }
 
    public void saveAcc(){
        
      /*  integer count=1;
        System.debug('count -------'+accCount);
        for(Account acc:accDet){
            if(count==accCount){
                System.debug(acc.Contacts);
                System.debug(acc.Cases);
                upsert acc.Contacts;
                upsert acc.Cases;
                upsert acc;
            }
            count++;
        }*/
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
            return null;
        }
            
        public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('NumberOfEmployees ','NumberOfEmployees '));
            options.add(new SelectOption('Type','Type'));
            options.add(new SelectOption('AccountNumber','AccountNumber'));
            return options;
        }
            
        public String[] getaccountFields() {
            return accountFields;
        }
            
        public void setaccountFields(String[] accountFields) {
            this.accountFields = accountFields;
        }
    public void TestingSri(){
        system.debug('comming----------------');
    }
}