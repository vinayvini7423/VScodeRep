({
	controllerFunction : function(component, event, helper) {
    
    },
    doInit:function(component, event, helper){
        //helper.showDiv(1,component);
	}
    
,
     forward : function(cmp,helper){
    		
         	var slideIndex=cmp.get("v.slideIndex");
            var i
            if(slideIndex==2){
                slideIndex=-1;
            }
            var elements = document.getElementsByClassName("mySlides");
           // alert("elements.length: " + elements.length);
            var x = document.getElementsByClassName("mySlides");
          //alert(slideIndex+'slideIndex');
           	for (i = 0; i < x.length; i++) {
          			x[i].style.display = "none";  
             }
            x[slideIndex+1].style.display = "block";  
         cmp.set("v.slideIndex",slideIndex+1);
         
        },
     backward : function(cmp,helper){
    		
         	var slideIndex=cmp.get("v.slideIndex");
            var i
            if(slideIndex==0){
                slideIndex=3;
            }
            var elements = document.getElementsByClassName("mySlides");
            //alert("elements.length: " + elements.length);
            var x = document.getElementsByClassName("mySlides");
          //alert(slideIndex+'slideIndex');
           	for (i = 0; i < x.length; i++) {
          			x[i].style.display = "none";  
             }
            x[slideIndex-1].style.display = "block";  
         cmp.set("v.slideIndex",slideIndex-1);
         
        },
    calling:function(cmp){
       var s  }
    
})