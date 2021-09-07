$(document).ready(function(){
    
	var don = "123123123";
    console.log(don);  // 콘솔창에 123123123 찍힘
	    
	don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	console.log(don);  // 콘솔창에 123,123,123 찍힘
        
});