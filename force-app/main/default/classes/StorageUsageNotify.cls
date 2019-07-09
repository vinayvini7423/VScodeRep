global class StorageUsageNotify{ 
  
    public List<account> accountList {
        get {
            if (accountList == null) {
                accountList = [select Id, Phone, Type, Name, Industry,accountnumber, NumberOfEmployees, Rating, OwnerId ,(select id, name from contacts),(select id,name,amount from opportunities),(SELECT Id, Type, Status, CaseNumber FROM Cases) from account limit 150];
            }
            return accountList;
        }
        set;
    }
     public  void saveAccount(){

    }

     }