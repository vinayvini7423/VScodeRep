public class FullFillment {
    
    public list < fullFillmentWrappe > fullFillmentWrappeList { get; set; }
    public fullfillment__C rowAddData { get; set; }
    public Integer indexNum=0;
    public String rowToRemove{ get; set; }
    public FullFillment(ApexPages.StandardController controller) {
        
        fullFillmentWrappeList=new list < fullFillmentWrappe >();
        list <fullfillment__C> storedData=new list <fullfillment__C>();
        storedData=[SELECT Id, res__c, skills__c, Skill_List__c,Practice_List__c,region__c, Opportunity__c, Name FROM fullfillment__c where Opportunity__c=:System.currentPageReference().getParameters().get('id')];
        System.debug('----------ID--------'+System.currentPageReference().getParameters());
        System.debug('----------ID--------'+ ApexPages.currentPage().getUrl());
       
        
        for(fullfillment__C temp:storedData){
            fullFillmentWrappe rec=new fullFillmentWrappe(temp,indexNum,0);
            fullFillmentWrappeList.add(rec);
            indexNum++;
            System.debug(indexNum);
        }
      
        System.debug('----------fullFillmentWrappeList----'+fullFillmentWrappeList);
    }
    
    public class fullFillmentWrappe{
        public Integer addRowValue{get; set;}
        public Integer index{ get; set; }
        public fullfillment__C FullFillmentRecord { get; set; }
        public fullFillmentWrappe(fullfillment__C FullFillmentRecord,Integer index,Integer addRowValue){
            this.addRowValue=addRowValue;
            this.index=index;
            this.FullFillmentRecord=FullFillmentRecord;
            System.debug(FullFillmentRecord);
            
        }
    }
    
    public void addRow(){
      /*  fullfillment__C temp= new fullfillment__C();
        temp.Practice_List__c='Digital Infrastructure';
        temp.region__c='India';
        temp.res__c=0;
        temp.skills__c='java';
        */
        
        //insert temp;
     	fullFillmentWrappe rec=new fullFillmentWrappe(rowAddData,indexNum,1);
        fullFillmentWrappeList.add(rec);
        indexNum++;
        System.debug(indexNum);
         System.debug('----------fullFillmentWrappeList in add row----'+fullFillmentWrappeList);
    }
    public void remove(){
        Integer toremove=Integer.valueOf(rowToRemove) ;
        fullfillment__C objData=new fullfillment__C();
        fullFillmentWrappe temp =fullFillmentWrappeList.get(toremove);
        System.debug('----------rowToRemove-----------'+rowToRemove);
       	objData=temp.FullFillmentRecord;
        System.debug('----------objData-----------'+objData);
             if(objData.Id!=null){
                    Delete objData;
                }
         fullFillmentWrappeList.remove(toremove);   
    }
    public void save(){
        for(fullFillmentWrappe temp:fullFillmentWrappeList){
            temp.addRowValue=0;
            fullfillment__C objData=temp.FullFillmentRecord;
            // '0067F000008lRamQAE'; apexpages.currentpage().getparameters().get('id')
            System.debug('----------ID--------'+ApexPages.currentPage().getParameters().get('id'));
            objData.Opportunity__c= ApexPages.currentPage().getParameters().get('id');
            upsert objData;
            System.debug('----------objData----'+objData); 
        }
         System.debug('----------fullFillmentWrappeList in add row----'+fullFillmentWrappeList);
    }
    
}