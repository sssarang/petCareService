const config = {
	"plugins": [new rangePlugin({ input: "#secondRangeInput"})],
	// 현재 날짜부터 시작
	minDate:"today",
	// 현재로부터 3개월까지 활성화
	maxDate: new Date().fp_incr(90)
  };

flatpickr('.flatpickr', config);
                           