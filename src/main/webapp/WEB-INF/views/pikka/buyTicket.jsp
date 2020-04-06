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
	<div class="container mb-5">


		<div class="container mb-5">
			<div class="text-center">

				<a> <img src="icon/booking.png" width="75px" height="75px"></a>
				<h1>
					<b>사물함 결제</b>
				</h1>

			</div>
			<hr>

			<div class="mb-3">
				<label for="selectProduct" style="font-size: 18px;">상품 선택</label>
			</div>
			<hr>
			<div class="radio" style="margin-left: 5px;">
				<label> <input type="radio" name="optionsRadios"
					checked="checked" id="optionsRadios1" value="30"> 30일 -
					5,000원
				</label>
			</div>
			<div class="radio" style="margin-left: 5px;">
				<label> <input type="radio" name="optionsRadios"
					id="optionsRadios2" value="60"> 60일 - 10,000원
				</label>
			</div>
			<div class="radio" style="margin-left: 5px;">
				<label> <input type="radio" name="optionsRadios"
					id="optionsRadios3" value="90"> 90일 - 14,000원
				</label>
			</div>
			<hr>

			<div class="form-group">
				<label style="font-size: 18px;">결제수단 선택</label>
				<div style="margin-left: 5px;">
					<select id="scPayType" class="form-control">
						<option>카드결제</option>
						<option>네이버페이</option>
						<option>카카오페이</option>
					</select>
				</div>
			</div>
			<hr>
			<label style="font-size: 18px;">사물함 이용권 구매 정보</label>
			<hr>
			<div class="row">
				<div class="col-md-3 col-xs-6" style="text-align: center;">
					<img src="icon/card.png" id="img_form_url"
						style="width: 200px; height: 200px; border-radius: 50%;">
				</div>
				<hr>
				<div class="col-md-9 col-xs-9 mt-3">
					<hr>
					<div class="infopay ml-2" style="text-align: left">
						<form action="/" method="post" id="sendPay">
							사물함 번호: <input type="text" id="locNo" name="locNo"
								value="${locNo}" readonly style="border: none"> <br>
							상품: <input type="text" id="locType" name="locType" value="30"
								readonly style="border: none; width: 50px; text-align: right;">일
							<br> 가격: <input type="text" id="price" name="price"
								value="5000" readonly
								style="border: none; width: 50px; text-align: right;">원<br>
							사용기간: <input type="text" id="usdDays" name="useDays" value=""
								readonly style="border: none; width: 500px"> <br>
							결제수단: <input type="text" id="payType" name="payType" value="카드결제"
								readonly style="border: none"><br> <input
								type="hidden" name="userId" style="width: 50px;"
								value="${userVO_sc.userId}"> <br>
							<div align="right">
								<button type="submit" class="btn btn-warning" id="paybtn">결제하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.panel-body -->
			<hr>
			<hr>
			<hr>
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->




	<%@ include file="/WEB-INF/views/pikka/footer.jsp"%>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script type="text/javascript">
		$(document).ready(

				function() {


					history.pushState(null, null, location.href);
					window.onpopstate = function() {
						history.go(1);
					};

					//날짜더하는 함수
					function addDays(date, days) {
						const copy = new Date(Number(date))
						copy.setDate(date.getDate() + days)
						return copy
					}
					//날짜 포멧변경 함수
					function getFormatDate(date1) {
						var date = new Date();
						var year = date1.getFullYear();
						var month = date1.getMonth() + 1
						var day = date1.getDate();
						if (month < 10) {
							month = "0" + month;
						}
						if (day < 10) {
							day = "0" + day;
						}
						return year + '-' + month + '-' + day;
					}

					const date = new Date();
					const newDate = addDays(date, 30);

					$('#usdDays').attr(
							'value',
							getFormatDate(date) + " ~ "
									+ getFormatDate(newDate));

					//상품 선택할때
					$('input[name="optionsRadios"]').click(
							function() {

								var days = parseInt($(
										'input[name="optionsRadios"]:checked')
										.val());
								var price;

								if (days == 30) {
									price = "5000";
								} else if (days == 60) {
									price = "10000";
								} else {
									price = "14000";
								}
								$('#locType').attr('value', days);
								$('#price').attr('value', price);

								const date = new Date();
								const newDate = addDays(date, days);

								$('#usdDays').attr(
										'value',
										getFormatDate(date) + " ~ "
												+ getFormatDate(newDate));
							});

					//결제수단 누를때
					$('#scPayType').click(
							function() {
								var payType = $('#scPayType option:selected')
										.val();
								//console.log(payType);
								$('#payType').attr('value', payType);
								//거기에 맞게 이미지도 변경해줘야함
								if (payType == "네이버페이") {
									$('#img_form_url').attr('src',
											'icon/naverpay.png');
								} else if (payType == "카카오페이") {
									$('#img_form_url').attr('src',
											'icon/kakaopay.png');
								} else if (payType == "카드결제") {
									$('#img_form_url').attr('src',
											'icon/card.png');
								}

							});

					//결제하기 버튼 누르면
					$('#paybtn').click(function(e) {
						e.preventDefault();

						console.log($("#scPayType").val());
						if ($("#scPayType").val() == "카카오페이") {
							$("#sendPay").attr("action", "/kakaoPay");
						} else if ($("#scPayType").val() == "카드결제") {
							$("#sendPay").attr("action", "/cardPay");
						} else {
							alert("결제가 완료되었습니다.");
						}

						$("#sendPay").submit();
						//if($('input[value]')==)

						//2.선택되지 않은 값이 있으면 그 값을 선택하도록 alert띄우기
						//3. 결제타입에 맞게 결제
						//4. 선택된 값들 담아서 컨트롤러로 넘겨주기 submit()	

					});

				});
	</script>
</body>

</html>
