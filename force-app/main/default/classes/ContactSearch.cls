public class ContactSearch{
    public  List<account> accountData {get;set;}
    public string aa{get;set;}
    public integer accCount{get;set;}
    public ContactSearch( ApexPages.StandardController controller){
        System.debug(accountData);
        this.accountData =[select Id, Phone, Type, Name, Industry,accountnumber, NumberOfEmployees, Rating, OwnerId ,(SELECT Name, Id, MobilePhone, Email, Department, MailingCountry, Title, LeadSource, Fax  from contacts),(select id,name,amount from opportunities),(SELECT Id, Type, Status, CaseNumber FROM Cases) from account limit 50];
        System.debug(accountData);
    }
    //get the list of account and there child component details function
    public  List<account> getDetails()
    {
        List<account> acclist= new LIst<account>();
        acclist =[select Id, Phone, Type, Name, Industry,accountnumber, NumberOfEmployees, Rating, OwnerId ,(select id, name from contacts),(select id,name,amount from opportunities),(SELECT Id, Type, Status, CaseNumber FROM Cases) from account limit 50];
        return acclist;
        
    }
    
    //saving the account information after editing 
    public  void saveAccount(){
      /*  integer count=1;
        System.debug('count -------'+accCount);
        for(Account acc:accountData){
            if(count==accCount){
                System.debug(acc.opportunities);
                upsert acc;}
            count++;
        }
        System.debug(accountData);*/
        upsert accountData;
    }
    
    
    @RemoteAction
    public static List<account> AccountData(string i) {
        String QueryString= 'select Id, Phone, Type, Name, Industry,accountnumber, NumberOfEmployees, Rating, OwnerId ,(select id, name from contacts),(select id,name,amount from opportunities),(SELECT Id, Type, Status, CaseNumber FROM Cases) from account where Name LIKE \'%' + i + '%\''; 
        System.debug(QueryString);
        List<account> accountData1 = Database.query(QueryString);
        System.debug(i+'------------------');
        return accountData1;
    }
}