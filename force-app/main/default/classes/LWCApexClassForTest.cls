public with sharing class LWCApexClassForTest {
    public LWCApexClassForTest() {

    }
       @AuraEnabled(Cacheable=true)
       public static List<SObject> contactsList(String name){
          String searchKey='%'+name+'%';
           String query='select id,name,email from contact limit 10';
           return [SELECT Id, Name FROM contact  WHERE Name LIKE :searchKey  LIMIT 10];
       }
        @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, AccountNumber FROM Account WHERE Name LIKE :key  LIMIT 10];
    }
     @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, Title, Phone, Email FROM Contact WHERE Name LIKE :key  LIMIT 10];
    }
}
