$(function () {
    console.clear();
    console.debug('jq started...');

    $("#reserveBtn").click(function () {
        console.log("#listBtn button clicked..");

        // location ="/board/list";
        // self.location = "/board/list"

        location ="/mypage/customerResvManage";    
        //location.href = "/board/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
        
        // self.location.href ="/board/list";
    }); //.onclick

    
}); //jq