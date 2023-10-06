<%@page import="com.mystudy.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 처리를 위한 설정(forward 요청 전 설정)
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03_useBeanProc.jsp</title>
</head>
<body>
	<h1>[ ex03_useBeanProc.jsp ]</h1>
	
	<h1>스크립트릿,표현식 사용방식(로컬변수)</h1>
<%
	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
	<hr>
	
	<h1>액션태그 jsp:useBean 사용</h1>
<%--
<%
	// 아래의 jsp:useBean 액션태그의 동작 방식
	PersonVO person = (PersonVO)pageContext.getAttribute("person");
	if(person == null){
		person = new PersonVO();
		pageContext.setAttribute("person", person);
	}
	person.setName(request.getParameter("name"));
	person.setAge(request.getParameter("age"));
%>
--%>	
	<jsp:useBean id="person" class="com.mystudy.PersonVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="person"/>
	
	<jsp:setProperty property="name" name="person"/>
	<jsp:setProperty property="age" name="person"/> 
	
<%
	System.out.println(">person : " + person);
	System.out.println(">page person : " + pageContext.getAttribute("person"));
%>
	<h2>빈(Bean) 저장값 표시</h2>
	<h2>이름(표현식) : <%=person.getName() %></h2>
	<h2>나이(표현식) : <%=person.getAge() %></h2>
	<hr>
	
	<h2>데이터 읽기 : getProperty 액션태그</h2>
	<h2>이름(액션태그) : <jsp:getProperty property="name" name="person"/></h2>
	<h2>나이(액션태그) : <jsp:getProperty property="age" name="person"/></h2>
	<hr><hr>
	
	<h2>EL getter 사용 데이터 출력</h2>
	<h2>이름(EL) : ${person.getName() }</h2>
	<h2>나이(EL) : ${person.getAge() }</h2>
	<p>---------</p>
	<h2>이름(EL) : ${person.name }</h2>
	<h2>나이(EL) : ${person.age }</h2>
	
</body>
</html>