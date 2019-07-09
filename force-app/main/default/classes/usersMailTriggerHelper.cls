public with sharing class usersMailTriggerHelper {
    public static void SendMailToAccountList(  Map<String,Map<String,Id>> AccountList, Set<Id> userIdstrigger){
        List<Messaging.SingleEmailMessage> lstMails = new List<Messaging.SingleEmailMessage>();
        
        Map<String,List<Id>> AccountFollower=new   Map<String,List<Id>>();
        List<EntitySubscription> userFollows =[SELECT Id, ParentId,Parent.name, SubscriberId,Subscriber.name, CreatedById,CreatedBy.name, CreatedDate, IsDeleted, NetworkId FROM EntitySubscription where ParentId=:AccountList.keySet()];
        
        Set<Id> userIds = new Set<Id>(userIdstrigger);
        
        for(EntitySubscription ent:userFollows){
            
            if(AccountFollower.containsKey(ent.ParentId)){
                 list<id> temp=new list<id>();
               temp=AccountFollower.get(ent.ParentId);
                temp.add(ent.SubscriberId);
                AccountFollower.put(ent.ParentId,temp);
            }
            else{
                 list<id> temp=new  list<id>();
                temp.add(ent.SubscriberId);
                AccountFollower.put(ent.ParentId,temp);
                
            }     
            userIds.add(ent.SubscriberId);
          
        }
          system.debug('----------------- AccountFollower ----------'+AccountFollower);
       // system.debug('-----------------usersid to send mail----------'+userIds);
        
        list<user> userlist=new list<user>();
        Map<String,user> UserListMap=new   Map<String,user>();
        userlist=[select id ,name,email from user where id in:userIds ];
        for(user usr:userlist){
            UserListMap.put(usr.id,usr);
        }
        system.debug('-----------------UserListMap-------'+UserListMap);
        
        for (String accId : AccountList.keySet()){
         
            
             Set<String> tempMail1=new Set<String>();
				List<Id> USerIdTOSendMail=AccountFollower.get(accId);
            for(Id Ids:USerIdTOSendMail ){
                user tempUser=UserListMap.get(Ids);
               
                tempMail1.add(tempUser.email);
            }
            Id oldUserId=AccountList.get(accId).get('oldUserId');
            user tempUseroldUserId=UserListMap.get(oldUserId);
            tempMail1.add(tempUseroldUserId.email);
           
            
             Id newUserId=AccountList.get(accId).get('newUserId');
            user tempUsernewUserId=UserListMap.get(newUserId);
            tempMail1.add(tempUsernewUserId.email);
           
            
             Id ownerId=AccountList.get(accId).get('ownerId');
            user tempUserownerId=UserListMap.get(ownerId);
            tempMail1.add(tempUserownerId.email);
            String accName=AccountList.get(accId).get('accName');
           string mailId='';
            String[] toAddresses = new String[]{};
            for(String s:tempMail1) {
               toAddresses.add(s);
            }
            System.debug('-----------toAddresses-----------'+toAddresses);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            mail.setToAddresses(toAddresses);
            mail.setSubject('user__C field changes');
            mail.setHtmlBody('In Account name:'+accName+',User__C field Changed from '+tempUseroldUserId.Name+'    to  '+tempUsernewUserId.Name);   
            lstMails.add(mail);
        }
        Messaging.sendEmail(lstMails);
        system.debug('emails are send successfully');

      
      /*  
        for(user usernames:userlist){
            string bodyMessage='';
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {usernames.email};
                mail.setToAddresses(toAddresses);
            system.debug('--Toaddress--' +toAddresses);
            bodyMessage='';
            //bodyMessage+= 'Account user changed to  '+'<br/><br/>';
            bodyMessage+='</table> </br>Thanks</body></html>';
            mail.setHtmlBody(bodyMessage);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail});
        }*/
        
    }
}