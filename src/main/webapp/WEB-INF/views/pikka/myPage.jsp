<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="kor">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="icon/booking.png">
<link rel="stylesheet" href="css/style.css">
<title>회원 가입</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

</head>

<body>

	<jsp:include page="/WEB-INF/views/pikka/nav.jsp" flush="true" />
	
<security:authentication property="principal.userVO" var="userVO_sc"/>
	<div class="container">
		<div class="text-center">

			<a> <img src="icon/booking.png" width="100px" height="100px"></a>
			<h1>

				<b>pikka</b>
			</h1>

		</div>

		<div class="row justify-content-center">
			<div class="col-md-6 col-cs-12 md-auto">
				<form class="needs-validation" action="/user/modify" method="post">
					<hr>
					<div class="mb-3">
						<label for="userId">아이디<span class="text-muted">(필수)</span></label>
						<input type="text" class="form-control" id="userId"
							value="${userVO_sc.userId}" name="userId" readonly>						
					</div>

					<div class="mb-3">
						<label for="userId">이름</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">@</span>
							</div>
							<input type="text" class="form-control" id="userName" readonly="readonly" name="userName" value="${userVO_sc.userName}">

						</div>
					</div>

					<div class="mb-3">
						<label for="userTel">전화번호	</label> 
						<input type="tel" class="form-control" id="userTel" value="${userVO_sc.userTel}" >
					</div>
					<hr class="mt-4 mb-4">

					<button data-oper="modfiy" class="btn btn-dark " type="submit" id="userModify">회원 수정</button>
					<button data-oper="delete" class="btn btn-dark btn-lg btn-block" type="submit" id="userDelete">회원 탈퇴</button>

				</form>
			</div>
		</div>
		
		<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form");
			$('button').on("click", function(e){
				
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				console.log($('#userId'));
				
				if(operation === 'delete'){
					formObj.attr("action","/delete/");
					
				}
				
				formObj.submit();
				
				
			});
		});
		
		</script>

		<footer class="my-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2020 - 2022 Company Name</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


	<%@ include file="/WEB-INF/views/pikka/footer.jsp"%>
</body>
</html>l>