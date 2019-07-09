({
    updateChildAttr: function(component, event, helper) {
       console.log('alert woking');
        component.set("v.childAttr", "updated child attribute");
        alert('alert woking');
    },
    fireMyComponentEvent : function(component, event, helper) {
      
       /* var myEvent = component.getEvent("myComponentEvent");
        myEvent.setParams({"param": "It works!"});
        alert('event fired');
        myEvent.fire();*/
        component.set("v.childAttr", "It Works");
          var myEvent = $A.get("e.c:componentEvent");
        myEvent.setParams({"param": "It works!"});
        myEvent.fire();
	}
})