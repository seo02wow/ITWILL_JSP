<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function send_go() {
		//alert(">> send_go() 실행");
		//alert("-" + document.frm.username.value + "-");
		if (document.frm.username.value.trim() == ""){ //trim() 빈문자열 제거
			alert("이름을 입력하세요");
			document.frm.username.value =""; // 초기화
			document.frm.username.focus(); // focus() 함수 호출
			return false; // 함수 실행 종료(서버쪽 전송처리 안 함)
		} 
		
		let vForm = document.frm;
		console.log("vForm id : " + vForm.getAttribute("id")
				+ " name : " + vForm.getAttribute("name"));
		if(vForm.userid.value.trim().length < 1){ //userid 최소 1글자 이상
			alert("아이디를 입력하세요");
			vForm.userid.value =""; 
			vForm.userid.focus(); 
			return false; // 함수 실행 종료(서버쪽 전송처리 안 함)
		}
		if(vForm.pwd.value.trim().length < 4){ //pwd 최소 6글자 이상
			alert("암호를 입력하세요");
			vForm.pwd.value =""; 
			vForm.pwd.focus(); 
			return false; // 함수 실행 종료(서버쪽 전송처리 안 함)
		}
		if(vForm.pwd2.value.trim().length < 4){
			alert("확인암호를 입력하세요");
			vForm.pwd2.value =""; 
			vForm.pwd2.focus(); 
			return false; // 함수 실행 종료(서버쪽 전송처리 안 함)
		} 
		if(vForm.pwd.value != vForm.pwd2.value){
			alert("암호가 일치하지 않습니다.\n 확인 후 다시 압력하세요");
			vForm.pwd.value =""; 
			vForm.pwd2.value =""; 
			vForm.pwd.focus(); 
			return false; 
		}
		//conseole.log(vForm.gender); // 2개가 선택됨
		let genders = vForm.gender;
		let checked = false;
		for(let gender of genders){
			console.log(gender.value + " : " + gender.checked);
			if(gender.checked) checked = true;
		}
		if(!checked){
			alert("<성별> 확인이 안 되었습니다.\n 선택해 주세요");
			return;
		}
		
		
		vForm.action = "07_resp_signup.jsp"; // action 속성값 지정
		vForm.submit(); // submit() 함수 호출
		
	}
</script>
</head>
<body>
	<h1>회원가입(07_req_signup.jsp)</h1>
	<form name="frm" id="signupForm">
		<fieldset>
		<legend>회원가입</legend>
		<p>이름 : <input type="text" name="username"></p>
		<p>아이디 : <input type="text" name="userid"></p>
		<p>암호 : <input type="password" name="pwd"></p>
		<p>암호확인 : <input type="password" name="pwd2"></p>
		<p>이메일 : <input type="email" name="email"></p>
		<p>성별 : 
			<input type="radio" name="gender" value="남" class="gender">남
			<input type="radio" name="gender" value="여" class="gender">여
		</p>
		
		<p>취미 : 
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
		
		<input type="button" value="회원가입" onclick="send_go()">
		<input type="reset" value="초기화">
		</fieldset>
	</form>
</body>
</html>