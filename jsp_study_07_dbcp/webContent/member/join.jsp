<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<script src="script/member.js"></script>
</head>
<body>
	<h3>회원가입</h3>
	<p>'*' 표시항목은 필수 항목입니다.</p>
	<form method="post" action="join.do" name="frm">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="20" >*</td>
			</tr>
			
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" size="20" >*
					<!-- 중복체크를 안눌렀을때 나타내는 폼 -->
					<input type="hidden" name="reid" size="20" >
					<input type="button" value="중복 체크" onclick="return idCheck()" />
				</td>
			</tr>
			
			<tr>
				<td>암호</td>
				<td><input type="password" name="pwd" size="20" >*</td>
			</tr>
			
			<tr>
				<td>암호확인</td>
				<td><input type="password" name="pwd_check" size="20" >*</td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" size="20" ></td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" size="20" ></td>
			</tr>
			
			<tr>
				<td>등급</td>
				<td><input type="radio" name="admin" value="0" checked> 일반회원 &nbsp;
					<input type="radio" name="admin" value="1" checked> 관리자
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="전송" onclick="return joinCheck()" >
					<input type="reset" value="취소">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">${message}	
				</td>
			</tr>
				
		</table>
	</form>
</body>
</html>