public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer n,String LName)
    {
         list<contact> c=[select  FirstName from contact limit : n];
       return c;
       
    }

}