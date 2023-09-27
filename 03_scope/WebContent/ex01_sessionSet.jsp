<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request 객체를 통해 전달된 파라미터
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	// session scope에 데이터 저장(세션 객체에 저장) -----------------
	session.setAttribute("attr_name", name); // session 객체에 저장
	session.setAttribute("attr_age", age); // session 객체에 저장
	
	String attr_name = (String)session.getAttribute("attr_name");
	String attr_age = (String)session.getAttribute("attr_age");
	
	System.out.println("attr_name : " + attr_name);
	System.out.println("attr_age : " + attr_age);
	
	// request scope에 저장
	request.setAttribute("req_name", name);
	request.setAttribute("req_age", age);
	
	String req_name = (String)request.getAttribute("req_name");
	String req_age = (String)request.getAttribute("req_age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_sessionSet.jsp</title>
</head>
<body>
	<h1>[ex01_sessionSet.jsp]</h1>
	<h1>전달받은 파라미터 값</h1>
	<h2>이름(param) : <%= name%></h2>
	<h2>나이(param) : <%= age%></h2>
	<hr>
	
	<h1>session 객체 저장 데이터(session scope)</h1>
	<h2>이름(session attr_name) : <%= attr_name%></h2>
	<h2>나이(session attr_age) : <%= attr_age%></h2>
	<hr>
	
	<h1>request 객체 저장 데이터(request scope)</h1>
	<h2>이름(request req_name) : <%= req_name%></h2>
	<h2>나이(request req_age) : <%= req_age%></h2>
	
<%
	System.out.println("Redirect - ex01_session.jsp ");
	response.sendRedirect("ex01_session.jsp");
%>	
</body>
</html>