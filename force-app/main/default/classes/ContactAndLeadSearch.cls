public Class ContactAndLeadSearch
{
public static List<List< SObject>> searchContactsAndLeads(String searchName){
            
               
            List<List<sObject>> searchList = [FIND :searchName in Name FIELDS
                   RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
                   Contact[] cr=(Contact[])searchList[0];
                  for (Contact c : cr) {
                        System.debug(c.LastName + '------------------------ ' + c.FirstName);
                    }
                   return searchList;

        }
}