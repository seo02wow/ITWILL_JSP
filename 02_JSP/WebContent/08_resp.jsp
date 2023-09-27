<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 주문한 내역에 따라 계산하고 결과를 표시 --%>
<%
	//주문한 내역에 따라 계산하고 결과를 표시
	//1. 파라미터값 추출(확인)
	
	//2. 계산처리 : 구입금액, 잔액
	String strMenuChoice = request.getParameter("coffee");
	// 메뉴 선택 안 했을 경우 
	if(strMenuChoice == null){
		response.sendRedirect("08_req_coffee.jsp"); // 재요청
		return;
	}
	int menuChoice = Integer.parseInt(strMenuChoice);
	int su = Integer.parseInt(request.getParameter("su"));
	String menuName;
	int menuPrice;
	
	
	
	switch(menuChoice) {
	case 1: 
		menuName = "아메리카노";
		menuPrice = 3000;
		break;
	case 2: 
		menuName = "카페모카";
		menuPrice = 3500;
		break;
	case 3: 
		menuName = "에스프레소";
		menuPrice = 2500;
		break;	
	case 4: 
		menuName = "카페라떼";
		menuPrice = 4000;
		break;
	default:
		menuName = "아메리카노";
		menuPrice = 3000;	
		break;
}
	int inMoney = Integer.parseInt(request.getParameter("money")); // 입금액
	int totPrice = menuPrice * su; // 구입 금액
	int changeMoney = inMoney - totPrice; // 잔액
	
	//3. 결과 표시 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2>주문 계산 결과(응답 - 08_resp.jsp)</h2>
<%-- 
	커피 종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원(단가 * 수량)
	--------------------
	입금액 : 10000원
	잔액 : 1000원 (입금액 - 구입금액)
--%>	
	<hr>
	<p>커피 종류 : <%=menuName%></p>
	<p>단가 : <%=menuPrice%></p>
	<p>수량 : <%=su%></p>
	<p>구입금액 : <%=totPrice%></p>
	<p>----------------</p>
	<p>입금액 : <%=inMoney%></p>
	<p>잔액 : <%=changeMoney%></p>
	
	
	
</body>
</html>