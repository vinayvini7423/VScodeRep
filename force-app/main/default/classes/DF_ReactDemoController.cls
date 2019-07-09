public with sharing class DF_ReactDemoController {
  public String sfInstanceUrl {get; set;}

  public DF_ReactDemoController() {
    sfInstanceUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/';
  }

  @RemoteAction
  public static List<Account> loadAccounts(String searchString ) {
      System.debug(searchString);
      if(searchString!=''){
       String searchText = '%' + searchString + '%';
          return [select Id, Phone, Type, Name, Industry,accountnumber, NumberOfEmployees, Rating, OwnerId  from Account where Name like :searchText];}
      else 
          return [select Id, Phone, Type, Name, Industry,accountnumber, NumberOfEmployees, Rating, OwnerId  from Account  limit 50 ];
  }
      @RemoteAction
  public static List<Account> loadAccounts1( ) {
      
          return [select Id, Phone, Type, Name, Industry,accountnumber, NumberOfEmployees, Rating, OwnerId  from Account limit 5 ];
  }

    @RemoteAction
    public static List<Contact>loadContacts(String accountId)
        {
            System.debug(accountId);
             System.debug([select Id, Name from contact where AccountId = :accountId]);
    return [select Id, Name from contact where AccountId = :accountId];
  }
  @RemoteAction
  public static List<Opportunity> loadOpportunities(String accountId) {
    return [select Id, Name, AccountId, StageName, Amount, CloseDate, NextStep, 
                   Probability, Description
            from Opportunity
            where AccountId = :accountId];
  }
}