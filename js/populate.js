function populate_state()
{
	var sel = document.getElementById("country");        
    var option = sel.options[sel.selectedIndex];
    var value = option.value;
	
	if (window.XMLHttpRequest)
	 {
	 	// code for IE7+, Firefox, Chrome, Opera, Safari
	 	 xmlhttp=new XMLHttpRequest();
	 }
	else
	 {	 // code for IE6, IE5
	 	 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	 }
	xmlhttp.onreadystatechange=function()
	{
		 if (xmlhttp.readyState==4 && xmlhttp.status==200)
	   	 {
			document.getElementById("state").innerHTML=xmlhttp.responseText;
	     }
	  }
	xmlhttp.open("GET","country.cfm?countryId="+value,true);
	xmlhttp.send();
	
}
