@isTest
public class AccountControllerTest {
     @isTest static  void AnimalLocatorMock1() {
         
         List<account> accountList = [SELECT Type, Id,Name, BillingStreet, BillingCity, BillingState FROM Account LIMIT 2];
			ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(accountList);
        System.Test.SetMock(HttpCallOutMock.class, new AccountControllerMock());
            // System.Test.SetMock(HttpCallOutMock.class, new AccountControllerMock1());
         AccountController a=new AccountController(ssc);
        PageReference result=a.GetSelectedAccount();
        string expectedResult=null;
        System.assertEquals(result, null);
    }

}