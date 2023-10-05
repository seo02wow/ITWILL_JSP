<%@page import="java.net.URLEncoder"%>
<%@page import="com.mystudy.vo.EmployeeVO"%>
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
	
	EmployeeVO vo = null;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(JdbcUtill.DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		//conn = DriverManager.getConnection(JdbcUtill.URL,JdbcUtill.USER,JdbcUtill.PASSWORD);
		conn = JdbcUtill.getConnection();
				
		String sql = "";
		sql += "SELECT SABUN, NAME, REGDATE, PAY ";
		sql +="	FROM EMPLOYEE WHERE SABUN = ? ";
		
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,sabun);
		
		//4. SQL 실행 결과에 대한 처리
		// 4-1. SQL문 실행
		rs = pstmt.executeQuery();
				
		// 4-2. SQL문 실행 결과에 대한 처리
		//   - SELECT : 조회(검색) 데이터 결과 값에 대한 처리
		
		if(rs.next()){
			vo = new EmployeeVO();
			vo.setSabun(rs.getInt("SABUN"));
			vo.setName(rs.getString("NAME"));
			vo.setRegdate(rs.getDate("REGDATE"));
			vo.setPay(rs.getInt("PAY"));
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
			<td><%=vo.getSabun()%></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=vo.getName()%></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=vo.getRegdate()%></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=vo.getPay()%></td>
		</tr>
	</table>
	<p>
		<a href="editForm.jsp?sabun=<%=sabun%>&name=<%=vo.getName()%>&pay=<%=vo.getPay()%>">수정</a>
		<a href="delete.jsp?sabun=<%=sabun%>">삭제</a>
		<a href="list.jsp">목록보기</a>
		
	</p>
	<hr>
	<a href="editForm.jsp?sabun=<%=sabun%>&name=<%=URLEncoder.encode(vo.getName(), "UTF-8") %>&pay=<%=vo.getPay() %>">수정(URLEncode적용)</a>
</body>
</html>