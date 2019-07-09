({
    handleClick: function(component, event, helper) {
        var btnClicked = event.getSource();         // the button
        var btnMessage = btnClicked.get("v.value");
        if(btnMessage==1){		// the button's label
            component.set("v.message", btnMessage);    }
        else {
            component.set("v.message", btnMessage);
        }// update our message
        var a=JSON.stringify(btnClicked);
        console.log('-------------------'+btnMessage);
    },
    handle: function(component, event, helper) {
     var btnClicked = event.getSource();         // the button
        var btnMessage = btnClicked.get("v.value");
component.set("v.message", btnMessage);
}
})