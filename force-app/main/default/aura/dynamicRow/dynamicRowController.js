({
 
    // function call on component Load
    doInit: function(component, event, helper) {
        // create a Default RowItem [Contact Instance] on first time Component Load
        // by call this helper function  
      alert('getting');
        // get the contactList from component and add(push) New Object to List  

         var action = component.get("c.deatilsOfFulfilment");
         action.setParams({
        "oppId": component.get("v.recordId") /* here it sends a null value*/
    });
         action.setCallback(this, function(response) {
                var state = response.getState();
           
                if (state === "SUCCESS") {
                   
                    component.set("v.contactList",response.getReturnValue());
                     console.log('currency data is:' + component.get("v.contactList"));
                }
            });
            // enqueue the server side action  
            $A.enqueueAction(action);
    },
 
    // function for save the Records 
    Save: function(component, event, helper) {
        
            var action = component.get("c.saveContacts");
            action.setParams({
                "ListContact": component.get("v.contactList"),
                  "oppId": component.get("v.recordId")
            });
            alert(component.get("v.recordId"));
          
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                  
                    //component.set("v.contactList", []);
                    //helper.createObjectData(component, event);
                    alert('record Save');
                }
            });
            // enqueue the server side action  
            $A.enqueueAction(action);
        
    },
 
    // function for create new object Row in Contact List 
    addNewRow: function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createObjectData(component, event);
    },
 
    // function for delete the row 
    removeDeletedRow: function(component, event, helper) {
        // get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.getParam("indexVar");
        // get the all List (contactList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.contactList");
        AllRowsList.splice(index, 1);
        // set the contactList after remove selected row element  
        component.set("v.contactList", AllRowsList);
    },
})