<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피 주문</title>
<script>
	function checkInmoney(){
		let inMoney = document.frm.money.value;
		let su = document.frm.su.value;
		
		if (inMoney == 0){
			alert("입금액을 입력하세요");
			document.frm.money.focus(); 
			return false;
		}
		
		document.frm.submit();
	}
</script>
</head>
<body>
	<h1>커피주문(요청 - 08_req_coffee.jsp)</h1>
	<form name = "frm" action="08_resp.jsp">
		<%-- checked="checked" : 아메리카노 체크 defalut --%>
		<input type="radio" name="coffee" value="1">아메리카노(3000원)<br>
		<input type="radio" name="coffee" value="2">카페모카(3500원)<br>
		<input type="radio" name="coffee" value="3">에스프레소(2500원)<br>
		<input type="radio" name="coffee" value="4">카페라떼(4000원)<br>
		<hr>
		수량 : <input type="number" name="su" value="1"><br>
		입금액 : <input type="number" name="money" value="0"><br>
		
		<input type=button value="주문처리" onclick="checkInmoney()">
	</form>
	

</body>
</html>