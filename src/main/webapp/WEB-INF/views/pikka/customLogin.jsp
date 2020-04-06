<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
				<form class="needs-validation" action="/login" method="post"
					novalidate>
					<hr>
					<div class="mb-3">
						<label for="userId">아이디<span class="text-muted"></span></label> <input
							type="text" class="form-control" name="username"
							placeholder="PASSWORD">
						<div class="invalid-feedback">아이디를 입력하세요.</div>
					</div>
					<div class="mb-3">
						<label for="userPw">패스워드<span class="text-muted"></span></label> <input
							type="password" class="form-control" name="password"
							placeholder="ID">
						<div class="invalid-feedback">아이디를 입력하세요.</div>
					</div>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<div class="checkbox mb-1 ml-auto">
						<label> <input type="checkbox" name="remember-me">
							Remember me
						</label>
					</div>
					<button class="btn btn-dark btn-lg btn-block" type="submit">
						로그인</button>
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
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


	<%@ include file="/WEB-INF/views/pikka/footer.jsp"%>
</body>
</html>
