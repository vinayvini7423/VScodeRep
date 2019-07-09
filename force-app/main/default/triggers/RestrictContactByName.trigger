trigger RestrictContactByName on Contact (before insert,before update) {
  
            System.debug('trigger is calling ');
           /*
            for(Account a : Trigger.New) {
           a.addError('bad');*/
        for (contact cc: Trigger.new) {
        cc.addError('Error from  trigger contact');
    }
    

}