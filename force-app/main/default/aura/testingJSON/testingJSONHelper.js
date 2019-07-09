({
	showDiv:function(n,component){
        var i;
        var slideIndex=component.get("v.slideIndex");
          alert(n);
        this.superRender();
  		var x = document.getElementsByClassName("mySlides");
       //var x = component.find("mySlides")
         alert(x.length);
  		/*if (n > x.length) {slideIndex = 1}    
  		if (n < 1) {slideIndex = x.length}
  		for (i = 0; i < x.length; i++) {
           
            var toggleText = component.find(x[i]);
             alert(toggleText);
            $A.util.toggleClass(toggleText, "toggle");
            alert(  $A.util.toggleClass(toggleText, "toggle"));
     	//x[i].style.display = "none";  
  		}
        var toggleText1 = component.find(x[slideIndex-1]);
          $A.util.toggleClass(toggleText1, "toggle2");
  		//x[slideIndex-1].style.display = "block"; */
    
},
})