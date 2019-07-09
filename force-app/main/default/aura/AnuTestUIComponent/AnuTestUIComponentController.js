({
    doInit : function(component, event, helper) {
        var action1 = component.get("c.fulfillmentData");
        action1.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.FulfillmentDetail", (response.getReturnValue()));
                //alert(JSON.stringify(response.getReturnValue()));
            }
            else{
                alert('fail');
            }
        });
        var action2= component.get("c.getPickListValuesIntoList");
        action2.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.PracticePickValue", (response.getReturnValue()));
                //alert(JSON.stringify(response.getReturnValue()));
            }
            else{
                alert('fail');
            }
        });
        
        var action3= component.get("c.getPickListValueofLocation");
        action3.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.PracticePickValueLocation", (response.getReturnValue()));
                //alert(JSON.stringify(response.getReturnValue()));
            }
            else{
                alert('fail');
            }
        });
        
        
        $A.enqueueAction(action1);
        $A.enqueueAction(action2);
        $A.enqueueAction(action3);
        
    }, createRecord : function(component, event, helper){
        
        var RowItemList = component.get("v.FulfillmentDetail");
        alert(RowItemList);
        RowItemList.push({
            'sobjectType': 'Fulfilment_Plan__c',
            'Practice_List__c': component.find("PracSelected").get("v.value"),
            'Location__c': component.find("Location").get("v.value"),
            'NoOfResources__c':component.get("v.NumberOfResource"),
            'Skill_Set__c':component.get("v.Skills"),
            'Opportunity__c':'0061Y00000l7vOpQAI'
        });
        component.set("v.FulfillmentDetail", RowItemList);
        component.set("v.NumberOfResource",0);
        component.set("v.Skills",'');
        component.set("v.defaultPicvalue",'--None--');
        component.set("v.SaveORSubmit",'Submit');
        component.set("v.DelDisable",false);

        
        
        
    },   
    
    /*   createRecord : function(component, event, helper){
        
        var actionTosave = component.get("c.createFulfillment");
        actionTosave.setParams({
            practices : component.find("PracSelected").get("v.value"),
            region : component.find("Location").get("v.value") ,
            Numofemp : component.get("v.NumberOfResource"),
            skillsNeed : component.get("v.Skills")
        });
        actionTosave.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                //alert('data inserted----'+response.getReturnValue());
                component.set("v.FulfillmentDetail", (response.getReturnValue()));
                component.set("v.NumberOfResource",0);
                component.set("v.Skills",'');
            }
            else{
                alert('fail');
            }
        });
        
        $A.enqueueAction(actionTosave);
    },  */
    
    DeleteRecord : function(component, event, helper){
        alert(event.target.id);
        var actionToDelete = component.get("c.deleteFulfillment");
        actionToDelete.setParams({
            fulfillmentId : event.target.id            
        });
        actionToDelete.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                //alert('data inserted----'+response.getReturnValue());
                component.set("v.FulfillmentDetail", (response.getReturnValue()));
            }
            else{
                alert('fail');
                
            }
        });
        
        $A.enqueueAction(actionToDelete);
    },
    
    EnableEdit : function (component, event, helper){
        //var idToedit=event.target.id;
        // alert(idToedit);
        component.set("v.EnableEdit",'false');
    },
    SaveEdited : function(component, event, helper){
        alert(JSON.stringify(component.get("v.FulfillmentDetail")));
        var actionToSave = component.get("c.saveDetails");
        actionToSave.setParams({
            fulfillmentList : component.get("v.FulfillmentDetail")            
        });
        actionToSave.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                alert('data inserted----');
                component.set("v.FulfillmentDetail", (response.getReturnValue()));
            }
            else{
                alert('fail');
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                    
                }
            }
        });
        
        $A.enqueueAction(actionToSave);
    }
})