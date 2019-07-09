public class sample {

     public static void insertNewAccount(){
     try{
          
       List<List<SObject>> searchList = [FIND 'vinay' IN ALL FIELDS 
                                      RETURNING Account(Name), Contact(FirstName,LastName)];
         
         System.debug('-----------'+ searchList +'----------');
     }
          catch(DmlException e)
          {
          
          }
  
     }

}