({
    createObjectData: function(component, event) {
        // get the contactList from component and add(push) New Object to List  
        var RowItemList = component.get("v.contactList");
        RowItemList.push({
            'sobjectType': 'fullfillment__c',
            'res__c': '',
            'region__c': '',
            'skills__c': '',
            'Practice_List__c':''
        });
        // set the updated list to attribute (contactList) again    
        component.set("v.contactList", RowItemList);
    },
    // helper function for check if first Name is not null/blank on save  
    validateRequired: function(component, event) {
        var isValid = true;
        var allContactRows = component.get("v.contactList");
        for (var indexVar = 0; indexVar < allContactRows.length; indexVar++) {
            if (allContactRows[indexVar].FirstName == '') {
                isValid = false;
                alert('First Name Can\'t be Blank on Row Number ' + (indexVar + 1));
            }
        }
        return isValid;
    },
})