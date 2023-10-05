<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB연결하고 프로그램 사용해서 사번 구하기(가장 큰 사번 + 1 자동생성) --%>
<%
	//사번구하기
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "MYSTUDY";
	final String PASSWORD = "mystudypw";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int sabun = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = DriverManager.getConnection(URL,USER,PASSWORD);
		
		//  AS SABUN -> 별칭
		String sql = "SELECT NVL(MAX(SABUN),0) + 1 AS SABUN FROM EMPLOYEE";
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		
		//4. SQL 실행 결과에 대한 처리
		// 4-1. SQL문 실행
		rs = pstmt.executeQuery();
		
		//4-2. SQL 실행결과에 대한 처리
		if (rs.next()){
			sabun = rs.getInt("SABUN"); // 컬럼명
			//sabun = rs.getInt(1); -> 컬럼위치값 사용 
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally{
		//5. 클로징 처리에 의한 자원 반납
		try{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e){}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
<script>
	function send_go() {
		let vForm = document.frm;
		if(vForm.name.value.trim() == ""){
			alert("이름을 입력하세요");
			vForm.name.value = "";
			vForm.name.focus();
			return false;
		}
		
		if(vForm.pay.value.trim() == ""){
			alert("금액을 입력하세요");
			vForm.pay.value = "";
			vForm.pay.focus();
			return false;
		}
		
		vForm.action = "insert.jsp"; // action 속성값 지정
		vForm.submit(); // submit() 함수 호출
	}
</script>
</head>
<body>
	<h1>사원등록 [addForm.jsp]</h1>
	<form name = "frm">
		<table>
			<tr>
				<th>사번</th>
				<td><input type="text" name="sabun" value=<%=sabun%> readonly></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="number" name="pay"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="사원등록" onclick="send_go()">
				<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>