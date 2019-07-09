@isTest
public class TestRestrictContactByName {
     static testMethod void InvailedLastName() {
        
          Contact acct = new Contact(LastName='INVALIDNAME');
        insert acct;
       }
}