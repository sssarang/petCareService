$(".selector").flatpickr({ 
	dateFormat: "Y-m-d",
	minDate:"today",
	maxDate: new Date().fp_incr(30)
});