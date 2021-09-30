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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>쓰담쓰담 ADMIN</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/css/admin/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Custom styles for this page -->
    <link href="/resources/css/admin/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="/resources/css/admin/paging.css" rel="stylesheet">
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon2.ico" />
    
    <!-- jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/js/admin/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/js/admin/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/admin/sb-admin-2.min.js"></script>
    <script src="/resources/js/admin/paging.js"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <!-- <i class="fas fa-laugh-wink"></i> -->
                    <img class="img-fluid" src="/resources/assets/img/common/6.png" style="width: 100px;">
                </div>
                <div class="sidebar-brand-text mx-3">쓰담쓰담<sup>Admin</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                FAQ
            </div>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>FAQ관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">FAQ</h6>
                        <a class="collapse-item" href="/admin/faq">FAQ 리스트</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                회원
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>회원관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원관리</h6>
                        <a class="collapse-item" href="/admin/petSitter">펫시터</a>
                        <a class="collapse-item" href="/admin/normalUser">반려인</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><c:out value="${session}"/></span>
                                <img class="img-profile rounded-circle"
                                    src="/resources/assets/img/admin/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/user/logout">
                                    <!-- <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> -->
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">펫시터</h1>
					<br>
					
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원 번호</th>
                                            <th>아이디</th>
                                            <th>닉네임</th>
                                            <th>연락처</th>
                                            <th>주소</th>
                                            <th>성별</th>
                                            <th>회원 구분</th>
                                            <th>회원 상태</th>
                                            <th>가입 날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach items="${userList}" var="i">
											<tr>
												<th><c:out value="${i.userNo}"/></th>
												<th><c:out value="${i.userId}"/></th>
												<th><c:out value="${i.userNickname}"/></th>
												<th><c:out value="${i.userContact}"/></th>
												<th><c:out value="${i.userAddress}"/></th>
												<th><c:out value="${i.userGender}"/></th>
												<th>펫시터</th>
												<th><c:out value="${i.userStatus}"/></th>												
												<th><fmt:formatDate pattern="yyyy-MM-dd"
												value="${i.regDate}"/></th>												
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>
                                
                                <div class='pull-right'>
                                	<form id='actionForm' action="/admin/petSitter" method='GET'>
                                		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	                                	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	                                	<ul class="pagination">
	                                		
	                                		<c:if test="${pageMaker.prev}">
	                                			<li class="paginate_button previous">
	                                				<a href="${pageMaker.startPage -1}">previous</a>
	                                			</li>
	                                		</c:if>
	                                		
	                                		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                                			<li class="paginate_button  ${pageMaker.cri.pageNum == num ? 'active' : ''} ">
	                                				<a class="${pageMaker.cri.pageNum == num? 'active' : '' }"
	                                					href="${num}">
	                                					${num}</a>
	                                			</li>
	                                		</c:forEach>
	
	                                		<c:if test="${pageMaker.next}">
	                                			<li class="paginate_button next">
	                                				<a href="${pageMaker.endPage + 1}">Next</a>
	                                			</li>
	                                		</c:if>
	                                	</ul>

                                	</form>

                                </div>
                                <!-- end Pagination -->

                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; 쓰담쓰담</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    
<!--     <script type="text/javascript">
    	$(document).ready(function() {
    		
    		var actionForm = $("#actionForm");
    		
    		$(".paginate_button a").on("click", function(e){
    			e.preventDefault();
    			console.log('click');
    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		});
    		
    		$(".paginate_button a").on("click", function(e){
    			e.preventDefault();
    			
    			console.log('click');
    			
    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    			actionForm.submit();
    		});
    	});
    </script> -->
   </body>

</html>