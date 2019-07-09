public class ContactsController {
   @RemoteAction
   public static List<account> GetAllContactsByFilter(String searchText)
   {
       String searchString = '%' + searchText + '%';
      List<account> accountList = [select Id, Phone, Type, Name, Industry,accountnumber, NumberOfEmployees, Rating, OwnerId ,(SELECT Name, Id, MobilePhone, Email, Department, MailingCountry, Title, LeadSource, Fax  from contacts),(select id,name,amount from opportunities),(SELECT Id, Type, Status, CaseNumber FROM Cases) from account  where name like :searchString limit 50];
       return accountList;
   }
}