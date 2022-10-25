<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="script/member.js"></script>
</head>
<body>
	<h3>로그인</h3>
		<!-- frm쓴 이유 : script사용하려고 -->
		<form method="post" action="login.do" name="frm">
		
			<table>
				<tr>
					<td>아이디 : </td>
					<td><input type="text" name="userid" value="${userid}"></td>
				</tr>
				
				<tr>
					<td>암 &nbsp; 호 : </td>
					<td><input type="password" name="pwd"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인" onclick="return loginCheck();" />&nbsp;&nbsp;
						<input type="reset" value="취소" />
						<input type="button" value="회원가입" onclick="location.href='join.do'" />
					</td>
				</tr>
				<tr>
					<td colspan="2">${message}</td>
				</tr>
			</table>
		
		</form>
</body>
</html>