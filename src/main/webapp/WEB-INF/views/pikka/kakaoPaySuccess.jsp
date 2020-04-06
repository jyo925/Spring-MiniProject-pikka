<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/exLocker.css">
<link rel="icon" href="icon/booking.png">
<title>Pikka</title>
</head>
<body>


	<%@ include file="/WEB-INF/views/pikka/nav.jsp"%>
	<security:authentication property="principal.userVO" var="userVO_sc" />
	<div class="container">
		<h4>카카오페이 결제가 정상적으로 완료되었습니다.</h4>
		<hr>
		<br />
		<h4>구매 내역</h4>
		<hr>
		고객명: ${ticket.userId}님 <br> 사물함 번호: ${ticket.lockerNo}<br>
		상품명: ${info.item_name} - ${info.amount.total}원<br> 사용기간:
		${ticket.lockerStartDate} ~ ${ticket.lockerEndDate}<br> 결제금액:
		${info.amount.total}<br> 결제일시: ${info.approved_at}<br>
		<hr>
		<br />
		<button type="submit" class="btn btn-warning"
			onclick="location.href='/'">Main</button>
	</div>

	<%@ include file="/WEB-INF/views/pikka/footer.jsp"%>

</body>
</html>