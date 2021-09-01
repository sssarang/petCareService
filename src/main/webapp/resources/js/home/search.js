function fnDogTypeOn(){
    	$('#dogType').show();		

	} //fnDogTypeOn

	function fnDogTypeOff(){
    	$('#dogType').hide();    	

	} //fnDogTypeOff

	document.getElementById("dog").addEventListener("click", fnDogTypeOn);
	document.getElementById("cat").addEventListener("click", fnDogTypeOff);