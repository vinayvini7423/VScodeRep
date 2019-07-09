({
    doInit : function(component, event, helper) {
        var action1 = component.get("c.fulfillmentData");
        action1.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.FulfillmentDetail", (response.getReturnValue()));
                alert(JSON.stringify(response.getReturnValue()));
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
        
    },

createRecord : function(component, event, helper){
        
    var RowItemList = component.get("v.FulfillmentDetail");
    var rowNum= component.get("v.rowNum");
   
    RowItemList.push({
        'sobjectType': 'fullfillment__c',
        'Id':rowNum,
        'res__c':component.get("v.NumberOfResource"),
        'skills__c':component.get("v.Skills"),
        'Practice_List__c': component.find("PracSelected").get("v.value"),
        'region__c': component.find("Location").get("v.value"),
        'Opportunity__c':'Null'
    });
     alert(RowItemList);
    // alert(RowItemList[0].Id);
    component.set("v.FulfillmentDetail", RowItemList);
    component.set("v.rowNum", rowNum+1);
    },
    
   /* 
    createRecord : function(component, event, helper){
        
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
    },
    */
    DeleteRecord : function(component, event, helper){
          var RowItemList = component.get("v.FulfillmentDetail");
        for(var i=0;i<RowItemList.length;i++){
            if(event.target.id==RowItemList[i].Id){
                
               alert(event.target.id+'---equ------'+RowItemList[i].Id);
                
               
             
              if(typeof RowItemList[i].Id !="number"){
                    alert('str');
                    var action = component.get("c.deleteFulfillment");
                    action.setParams({
                        fulfillmentId: RowItemList[i].Id
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        alert( response);
                        if (state === "SUCCESS"){
                            //alert('data inserted----'+response.getReturnValue());
                            
                        }
                        else{
                            alert('fail');
                        }
                    });
                    $A.enqueueAction(action);
                }
                 RowItemList.splice(i,1);
                break;
 
            }
        }
        
       component.set("v.FulfillmentDetail",RowItemList)
    },
    
    SaveEdited : function(component, event, helper){
         alert(JSON.stringify(component.get("v.FulfillmentDetail")));
        var action = component.get("c.saveDetails");
        action.setParams({
            dataList: component.get("v.FulfillmentDetail")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            alert( response);
            if (state === "SUCCESS"){
                //alert('data inserted----'+response.getReturnValue());
                
            }
            else{
                alert('fail');
            }
        });
        $A.enqueueAction(action);
    },
    
    doSomething :function(component, event, helper){
       
        var RowItemList = component.get("v.FulfillmentDetail");
        
        var test=event.target.id;
        //alert(test);
        var dynamicCmp = document.getElementById(event.target.id).value;
        alert(dynamicCmp);
        var res = test.split("-");
        alert(res[0]);
       RowItemList[res[0]].Practice_List__c=dynamicCmp;
       
              
    }
})