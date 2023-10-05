<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mystudy.common.JdbcUtill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습)전달받은 데이터로 DB 데이터 수정처리 후 페이지 전환 
	수정할 데이터 : 성명, 금액, 날짜(SYSDATE)
	정상처리 후 : list.jsp 이동 또는 detail.jsp 페이지 이동 처리
	예외발생 시 : 현재 페이지에 오류메시지 보여주기
--%>
<%
	//1. 전달 받은 데이터 확인
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	
	int pay = 0;
	String sPay = request.getParameter("pay");
	try{
		pay = Integer.parseInt(request.getParameter("pay"));
	} catch(NumberFormatException e){ %>
		<script>
			alert("[수정실패] 금액에 숫자가 아닌 값이 입력되었습니다.\n"
					+"확인 후 다시 입력하세요");
			history.back();
		</script>
<%	return; // service() 메소드 종료
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int result = 0; // 입력 건수
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(JdbcUtill.DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		//conn = DriverManager.getConnection(JdbcUtill.URL,JdbcUtill.USER,JdbcUtill.PASSWORD);
		conn = JdbcUtill.getConnection();
		
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE EMPLOYEE");
		sql.append("	SET NAME = ?");
		sql.append("	, PAY = ?");
		sql.append("	, REGDATE = SYSDATE ");
		sql.append("WHERE SABUN = ? ");
		
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql.toString());
		
		int i = 1;
		pstmt.setString(i++, name);
		pstmt.setInt(i++, pay);
		pstmt.setInt(i++, sabun);
		
		result = pstmt.executeUpdate(); // 입력건수
		
		// 화면 전환
		if(result > 0){ 
			response.sendRedirect("detail.jsp?sabun=" + sabun);	
		}
		if(result == 0){  // SQL 문 정상실행 + 데이터 없음
%>
	<script>
		alert("[수정실패] 대상이 없어서 수정하지 못했습니다.\n"
				+"목록 페이지로 이동합니다.");
		location.href = "list.jsp";
	</script>
<%				
		}
		
		
	} catch (Exception e){
		e.printStackTrace();
		result = -1;
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
	<h1>사원정보 수정 실패</h1>
	<p>수정처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
</body>
</html>