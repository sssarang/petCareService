$(function () {
	console.debug('jq started...');
	
	$("#searchBtn").click(function () {
	    console.log("#listBtn button clicked..");
	
		// 버튼 클릭시 해당 페이지로 이동
	    location ="/search/main";    
	    //location.href = "/board/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
	    
	}); //.onclick
    
}); //jq