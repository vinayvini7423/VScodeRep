trigger CalloutTrigger on Account (before insert,before update) {
            System.debug('trigger is calling ');
           /* for(Account a : Trigger.New) {
           a.addError('bad');*/
        for (Account acct: Trigger.new) {
        acct.addError('Error from  trigger');
    }
    }