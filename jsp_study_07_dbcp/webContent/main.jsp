<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- loginUser null값이면 login.do페이지로 이동 --%>

<c:if test="${empty loginUser}">
	<jsp:forward page="login.do"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
</head>
<body>
	<h3>회원 전용페이지</h3>
	<form action="logout.do">
		<table>
			<tr>
				<td>안녕하세요... ${loginUser.name}&nbsp; (${loginUser.userid})님</td>
			</tr>
			
			<tr>
				<td>
					<input type="submit" value="로그아웃">
					<input type="button" value="회원정보변경" onclick="href.location=''">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>