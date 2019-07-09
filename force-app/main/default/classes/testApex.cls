public class testApex {
    public String buttonName{ get; set; }
    public Boolean buttonValue{get;set;}
    public  testApex(){
       	buttonValue=true;
        buttonName='';
           
        if(buttonValue)
            buttonName='Enable';
        else 
            buttonName='Disable';
       
    }
    
    public void buttonEnableDisbale(){
        
        if(buttonValue){
             buttonName='Disable';
             buttonValue=false;
        }
           
        else {
             buttonName='Enable';
             buttonValue=true;
        }
           
    }
}