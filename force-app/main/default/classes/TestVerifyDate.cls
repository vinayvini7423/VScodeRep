@isTest
private class TestVerifyDate {
    @isTest static void DatesTest() {
        Date date1=date.today();
        Date date2=date1.addDays(22);
        
        Date t = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(t, date2);
    }
    @isTest static void DateOvertest() {
        Date date1=date.today();
        Date date2=date1.addDays(33);
        Date t = VerifyDate.CheckDates(date1, date2);
          System.debug('------------------'+t+'--------------------------------');
        Date test=VerifyDate.SetEndOfMonthDate(date1);
          System.debug('------------------'+test+'--------------------------------');
        System.assertNotEquals(t, test);
    }
}