<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 <h2> 태그에 작성해서 응답처리 --%>
<%
	//request.setCharacterEncoding("UTF-8"); -> 한글 적용 안 됨, 요청쪽에서 처리해야 함
	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이름 : <%= name %></h2>
	<h2>나이 : <%= age %></h2>
</body>
</html>