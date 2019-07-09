public class Email_opportunityCriteria {
    
    public static void testopportunitymail(){
        list<opportunity> Opportunitylist=new list<Opportunity>();
       // Opportunitylist='select id,name,closedate,stageName from Opportunity where closedate>today() group by Opportunity.Ownerid';
        
        for(Opportunity opp:Opportunitylist){
            if(opp.closedate>system.today() && ( opp.StageName!='Closed won' || opp.stageName!='Closed Lost')){
                
                string oppName=opp.name;
                string bodyMessage='';
                system.debug('Check');
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                
                String[] toAddresses = new String[] {'anusha.m@brillio.com','anushahmahadev@gmail.com'};
                    mail.setToAddresses(toAddresses);
                mail.setSubject('Opportunity Updates');
                
                //  mail.setSubject(oppName +  'Opportunity Closedate was'+ opp.closedate+ ' ');
                mail.setPlainTextBody('');
                bodyMessage='Hi <br/><br/>';
                bodyMessage+= opp.Name + 'opportunity closed Date was '+ opp.CloseDate.format() +' whose stage not been updated to closed won or lost ' +'<br/><br/>';
                bodyMessage+='Thanks';
                mail.setHtmlBody(bodyMessage);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail});
            }
        }
    }

}