public with sharing class demoTest {
    public demoTest() {

    }
    @AuraEnabled(Cacheable=true)
    public static List<String> demoMethod(){
        List<String> tt=new  List<String>();
        tt.add('test');
       tt.add('test1');
       tt.add('test2');
       tt.add('test3');
       return tt;
    }
   @AuraEnabled(Cacheable=true)
    public static string sampleTest(){
        return 'final out put';
    }
    @AuraEnabled(Cacheable=true)
    public static list<SObject> getContactList(String name){
        String key='%'+name+'%' ;
        String query='select id ,name ,email,phone from contact where name LIKE :key';
        return Database.query(query);

    }
     @AuraEnabled(Cacheable=true)
    public static list<SObject> getAccounttList(String name){
        String key='%'+name+'%' ;
        String query='select id ,name  from Account where name LIKE :key';
        return Database.query(query);
    }
}
