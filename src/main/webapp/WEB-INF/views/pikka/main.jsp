<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="css/style.css">
<link rel="icon" href="icon/booking.png">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>Pikka</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/pikka/nav.jsp"%>
	<section>
		<div class="container-fluid h-100">
			<div class="row md-5 xs-10" style="margin: 10px 0">
				<div class="col-md-6 col-xs-12 text-center align-middle">
					<!--                <div style="background-color:red; padding : 90px 0"></div>-->
					<h2>
						<b><br>내 손으로 예약하는<br> 스터디카페 pikka</b>
					</h2>

					<p class="mb-3" style="font-size: 1em;">자신이 원하는 자리를 실시간으로
						예약해보세요!</p>

					<div class="row center-block text-center justify-content-center">

						<div class="col-md-6 col-xs-6 mt-2 mr-1"
							style="background-color: lightgray; border-style: solid; border-width: 0.5px; width: 300px;">
							<h4>좌석 현황</h4>
							<h4>12/20</h4>
						</div>
						<div class="col-md-6 col-xs-6 mt-2 mr-1"
							style="background-color: lightgray; border-style: solid; border-width: 0.5px; width: 300px">
							<h4>사물함 현황</h4>
							<h4 id="locCount"></h4>

						</div>
					</div>
					<div class="row justify-content-center">

						<security:authorize access="isAnonymous()">
							<button class="btn btn-dark mt-4 mb-4 mr-1" type="button"
								style="width: 140px" data-toggle="modal"
								data-target="#exampleModalCenter"
								onclick="location.href='/customLogin'">로그인</button>
						</security:authorize>

						<security:authorize access="isAuthenticated()">
							<form action="/logout" method="post">
								<button class="btn btn-dark mt-4 mb-4 mr-1" type="submit"
									style="width: 140px" data-toggle="modal"
									data-target="#exampleModalCenter">로그아웃</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form>
						</security:authorize>


						<security:authorize access="isAnonymous()">
							<button class="btn btn-dark mt-4 mb-4 mr-2 ml-2" type="submit"
								style="width: 140px" onclick="location.href ='SignUp'">회원가입</button>
						</security:authorize>
					</div>
				</div>

				<div class="col-md-5 col-xs-12 mt-3 mb-5" style="margin: 15 px 0">

					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>

						</ol>
						<div class="carousel-inner mt-4">
							<div class="carousel-item active">
								<img src="img/cafeimg1.jpeg" class="d-block img-fluid" alt="..."
									style="height: 350px">
							</div>
							<div class="carousel-item">
								<img src="img/cafeimg2.jpeg" class="d-block img-fluid" alt="..."
									style="height: 350px">
							</div>
							<div class="carousel-item">
								<img src="img/cafeimg3.jpeg" class="d-block img-fluid" alt="..."
									style="height: 350px">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<br>
	<br>
	<br>

	<%@ include file="/WEB-INF/views/pikka/footer.jsp"%>


	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script>
		$(document).ready(function() {

			//ajax를 이용 기존이용권이 있는지 체크
			$.ajax({
				type : 'get',
				url : '/getCountLocker',
				data : "",
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					$('#locCount').text(data + "/60");
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		});
	</script>
</body>
</html>
