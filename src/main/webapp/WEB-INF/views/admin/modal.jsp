<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"> -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 	<div class="modal fade" id="myModal" role="dialog" >
		<div class="modal-dialog">
		
			Modal contents
			<div class="modal-contents">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 id="modal-title" class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<td>사용자명</td>
							<td><input class="form-control" id="userName" type="text"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea class="form-control" id="contents" rows="10"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button id="modalSubmit" type="button" class="btn btn-success">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->

        <!-- The Modal -->
        <!-- NOTE 3: if (  class="modal" ) not exists, the below <div> box appeared without button click. -->
        <div class="modal fade" id="myModal">
            <!-- NOTE 4: if ( class="modal-dialog" ) not exists, modal window appeared by full width on viewport. -->
            <div class="modal-dialog modal-lg">

                <!-- NOTE 5: if ( class="modal-content" ) not exists, the background of modal window not appeared. -->
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
						<h4 id="modal-title" class="modal-title"></h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <table class="table">
							<tr>
								<td>제목</td>
								<td><input class="form-control" id="title" type="text"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea class="form-control" id="contents" rows="10"></textarea></td>
							</tr>
						</table>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button id="modalSubmit" type="button" class="btn btn-success">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>

                </div>

            </div>
        </div>
</body>
</html>