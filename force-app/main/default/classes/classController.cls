public class classController {
// create properties in apex class
 @AuraEnabled public List<account> indTypeBio {get;set;}
 @AuraEnabled public List<account> indTypeEne{get;set;}
 @AuraEnabled public List<account> indTypeEdu{get;set;}
 @auraEnabled public List<account> lstOfAccount{get;set;}
 
@AuraEnabled
  public static classController initClass(){
     List<account> indTypeBio1=new List<account>();
     List<account> indTypeEne1=new List<account>();
     List<account> indTypeEdu1=new List<account>();
  classController obj = new classController();
   obj.lstOfAccount = [SELECT Id, Name, Type, Industry, OwnerId, CreatedDate FROM Account where industry='Biotechnology' or industry='Energy' or industry='Education'];
      for(Account a:obj.lstOfAccount){
          if(a.Industry=='Biotechnology'){
              indTypeBio1.add(a);
               System.debug(a.Industry+'---Biotechnology');
          }
           if(a.Industry=='Energy'){
             indTypeEne1.add(a);
             System.debug(a.Industry+'---Energy');
          }
           if(a.Industry=='Education'){
            indTypeEdu1.add(a);
               System.debug(a.Industry+'---Education');
          }
      }
      obj.indTypeEdu=indTypeEdu1;
      obj.indTypeEne=indTypeEne1;
      obj.indTypeBio=indTypeBio1;
      System.debug(obj);
   // return class instance
   return obj ;
   }
}