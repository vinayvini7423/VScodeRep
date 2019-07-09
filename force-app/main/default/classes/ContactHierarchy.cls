public class ContactHierarchy {
public id accId;
public List<Contact> Root=new
List<Contact>();
Public ContactHierarchy(ApexPages.StandardController controller) {
accId=ApexPages.currentPage().getParameters().get('id');
    }
/* Wrapper class to contain the nodes and their children*/
public class cNodes
{
 public Contact gparent
{get; set;}
 Public List<Contact> parent {get;set;}
 Public Map<ID,List<Contact>> child {get;set;}
 Public Map<ID,List<Contact>> allchild {get;set;}
 Public cNodes(Contact gp,List<Contact> p, Map<ID,List<Contact>> c,Map<ID,List<Contact>> gc)
 {
     parent = p;
     gparent = gp;
     child=c;
     allchild=gc;
 }
}
/* end of Wrapper class */
Public List<cNodes> hierarchy;
Public List<cNodes> getmainnodes()
     {
hierarchy = new List<cNodes>();    
map<Id,list<Contact>> element = new
map<Id,list<Contact>>();
List<Contact> tempparent = [Select Id, FirstName,
LastName,ReportsTo.Id from Contact where AccountId=:accId ];
For(Contact c:tempparent)                   
{                   
if(c.ReportsTo.Id==null)                     
{
                            root.add(c);                     
}                  
}                   
System.Debug('root----->'+root);                 
for(Contact c: tempparent)                 
{
if(c.ReportsTo.Id!=null)                       
{
if(!element.containskey(c.ReportsTo.id))
                                {
             List<Contact>conlist = new List<Contact>();                                   
conlist.add(c);
element.put(c.ReportsTo.id, conlist );
                                }
                                else
                                {
List<Contact> templist=element.get(c.ReportsTo.Id);
element.remove(c.ReportsTo.Id);
 templist.add(c);
element.put(c.ReportsTo.Id,templist);
                                }
}
}
System.Debug('element------->'+element);  
integer i=0;  
Map<id,List<Contact>> element1 = new
Map<id,List<Contact>>();
Set<Contact> Con_list= new Set<Contact>();
          for(id ids : element.keyset())              
              Con_list.addall(element.get(ids));
for( contact con : Con_list)
{
if(element.containskey(con.id))
{
element1.put(con.id,element.get(con.id));
}
ELSE
{
RecordType rt = [Select id from RecordType where Name ='School' limit 1];
contact newcon = new Contact();
//newcon.RecordTypeId=rt.id;
//newcon.CurrencyIsoCode='AUD';
newcon.FirstName='';
newcon.LastName='dummy';
List<Contact> tempc= new List<Contact>();
tempc.add(newcon); 
element1.put(con.id,tempc);
}
}
Map<ID,List<Contact>> icon_map= new  Map<ID,List<Contact>>();   
for(Contact cont : root)
 
 
                {
             
List<contact> parnt = element.get(cont.id);
            if(parnt != Null)
            {
for(contact ccd: parnt)
                            {
                List<Contact> icon = new List<Contact>();
                icon =element1.get(ccd.id);
                     IF(icon !=null && icon.size()>0)
                       icon_map.put(ccd.id,icon);
                       else
                               {
                                RecordType rt =[Select id from RecordType where Name ='School' limit 1];
                                contact newcon = new Contact();
                             //   newcon.RecordTypeId=rt.id;
                              //  newcon.CurrencyIsoCode='AUD';
                                newcon.FirstName='';
                                newcon.LastName='dummy';
                                icon = new List<Contact>();
                                icon.add(newcon);
                                icon_map.put(ccd.id,icon);  
                               }
                            }
            }
hierarchy.add(new cNodes(CONT,parnt,icon_map,element1)); 
i++;            
                 }
return
hierarchy;
    }   
}