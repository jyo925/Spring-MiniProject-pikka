<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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

	<div class="container">
		<div class="text-center">

			<a> <img src="icon/booking.png" width="100px" height="100px"></a>
			<h1>

				<b>pikka</b>
			</h1>

		</div>

		<div class="row justify-content-center">
			<div class="col-md-6 col-cs-12 md-auto">
				<form class="needs-validation" action="/signUp" method="post"
					novalidate>
					<hr>
					<div class="mb-3">
						<label for="userId">아이디<span class="text-muted">(필수)</span></label>
						<input type="text" class="form-control" id="userId" name="userId"
							placeholder="영문, 숫자포함 8~12자리 이내">
						<div class="invalid-feedback">아이디를 입력하세요.</div>
					</div>
					<div class="mb-3">
						<label for="userPw">패스워드<span class="text-muted">(필수)</span></label>
						<input type="password" class="form-control" id="userPw" name="userPw"
							placeholder="비밀번호 8~12자리 이내">
						<div class="invalid-feedback">아이디를 입력하세요.</div>
					</div>
					<div class="mb-3">
						<label for="userId">이름</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">@</span>
							</div>
							<input type="text" class="form-control" id="userName" name="userName"
								placeholder="이름을 입력하세요 ex)홍길동" required>
							<div class="invalid-feedback" style="width: 100%;">이름을
								입력하세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="userTel">전화번호</label> <input type="number"
							class="form-control" id="userTel" name="userTel" placeholder="010-0000-0000"
							required>
						<div class="invalid-feedback">전화번호를 입력하세요</div>
					</div>
					<hr class="mt-4 mb-4">

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<button class="btn btn-dark btn-lg btn-block" type="submit">회원
						가입</button>

				</form>
			</div>
		</div>

		<footer class="my-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2020 - 2022 Company Name</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>
	<script src="resources/js/signUpValidate.js"></script> 
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


	<%@ include file="/WEB-INF/views/pikka/footer.jsp"%>
	
</body>
</html>
