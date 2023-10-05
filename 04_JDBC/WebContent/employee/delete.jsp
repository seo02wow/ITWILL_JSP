<%@page import="com.mystudy.common.JdbcUtill"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sabun = Integer.parseInt(request.getParameter("sabun"));

	Connection conn = null;
	PreparedStatement pstmt = null;

	int result = 0; // 입력 건수
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(JdbcUtill.DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		//conn = DriverManager.getConnection(JdbcUtill.URL,JdbcUtill.USER,JdbcUtill.PASSWORD);
		conn = JdbcUtill.getConnection();
		
		String sql = "DELETE FROM EMPLOYEE WHERE SABUN = ?";
		
		
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setInt(1, sabun);

		
		result = pstmt.executeUpdate(); // 입력건수
		
		// 화면 전환
		if(result > 0){
			response.sendRedirect("list.jsp");
	}
%>	
		<script>
			alert("[수정실패] 금액에 숫자가 아닌 값이 입력되었습니다.\n"
					+"확인 후 다시 입력하세요");
			location.href="list.jsp";
		</script>
<%		
	} catch (Exception e){
		e.printStackTrace();
	} finally{
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtill.close(conn, pstmt);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원정보 삭제 실패</h1>
	<p>삭제처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
</body>
</html>