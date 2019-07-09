({
    doInit : function(component, event, helper) {
        var mydate = component.get("v.expense.Date__c");
         var mydate1 = component.get("v.expense");
         console.log("in the display list: " + JSON.stringify(mydate1));
        if(mydate){
            component.set("v.formatdate", new Date(mydate));
        }
    },
   
    clickReimbursed: function(component, event, helper) {
        var expense = component.get("v.expense");
        var updateEvent = component.getEvent("updateExpense");
        updateEvent.setParams({ "expense": expense });
        updateEvent.fire();
    }

})