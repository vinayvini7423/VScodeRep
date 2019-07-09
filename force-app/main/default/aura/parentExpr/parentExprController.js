({
    updateParentAttr: function(component, event, helper) {
      
         alert('event going');
       
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
              componentDef : "c:childExpr",
         componentAttributes: {
             "childAttr":component.get("v.parentAttr")
            }
    });
    evt.fire();
    },
     handleMyComponentEvent: function(component, event, helper) {
         alert('getting data');
        var value = event.getParam("param");
         alert('event getting'+value);
       component.set("v.parentAttr",value);
    }
    
})