<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 화면에 표시 --%>
<%
	String username = request.getParameter("username");
	String userid = request.getParameter("userid");
	String pw = request.getParameter("pwd");
	String pw2 = request.getParameter("pwd2");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 데이터</title>
</head>
<body>
	<h2>회원가입 정보(07_resp_signup.jsp)</h2>
	<ul>
		<li>이름 : <%=username%></li>
		<li>아이디 : <%=userid%></li>
		<li>암호 : <%=pw%></li>
		<li>암호 확인 : <%=pw2%></li>
		<li>이메일 : <%=email%></li>
		<li>성별 : <%=gender%></li>
		<li>취미 : 
<%
		if (hobbies == null) {
			out.print("선택 안 함");
		} else {
			for(String hobby : hobbies) {
				out.print(hobby + " ");
			}
		}
%>
	</li>	
	</ul>
</body>
</html>