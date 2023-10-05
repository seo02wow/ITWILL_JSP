<%@page import="com.mystudy.common.JdbcUtill"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 사번(sabun) 데이터 DB 조회해서 화면에 표시 --%>
<%
	//1. 전달받은 사번  값 확인(추출)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	
	//2. DB 데이터 조회
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//DB 데이터 저장할 변수 선언
	String name = null;
	Date regdate = null; 
	int pay = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(JdbcUtill.DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		//conn = DriverManager.getConnection(JdbcUtill.URL,JdbcUtill.USER,JdbcUtill.PASSWORD);
		conn = JdbcUtill.getConnection();
				
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT SABUN, NAME, REGDATE, PAY ");
		sql.append("	FROM EMPLOYEE WHERE SABUN = ? ");
		
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setInt(1,sabun);
		
		//4. SQL 실행 결과에 대한 처리
		// 4-1. SQL문 실행
		rs = pstmt.executeQuery();
				
		// 4-2. SQL문 실행 결과에 대한 처리
		//   - SELECT : 조회(검색) 데이터 결과 값에 대한 처리
		
		if(rs.next()){
			name = rs.getString("NAME");
			regdate = rs.getDate("REGDATE");
			pay = rs.getInt("PAY");
		}
		
		rs.close();
		
	} catch (Exception e){
		e.printStackTrace();
	} finally{
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtill.close(conn, pstmt, rs);
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 [detail.jsp]</title>
</head>
<body>
	<h1>상세보기 [detail.jsp]</h1>
	<table border>
		<tr>
			<th>사번</th>
			<td><%= sabun %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%= name %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=regdate %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=pay %></td>
		</tr>
	</table>
	<p>
		<a href="editForm.jsp?sabun=<%=sabun%>&name=<%=name%>&pay=<%=pay%>">수정</a>
		<a href="delete.jsp?sabun=<%=sabun%>">삭제</a>
		<a href="list.jsp">목록보기</a>
	</p>
</body>
</html>