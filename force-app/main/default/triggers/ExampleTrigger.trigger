trigger ExampleTrigger on Contact (after insert, after delete) {
if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        EmailManager.sendMail('vinayvini.7423@gmail.com', 'Testing', 
                    recordCount + ' contact(s) were inserted.');
    System.debug('------------------Hello World!---------------');
    }
    else if (Trigger.isDelete) {
        EmailManager.sendMail('vinayvini.7423@gmail.com', 'Deleting', 
                     ' contact(s) were inserted.');
     
        }        System.debug('------------------Hello World!---------------');
}