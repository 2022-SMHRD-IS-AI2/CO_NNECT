<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String email = (String)request.getAttribute("email");
	String id = (String)request.getAttribute("id");

%>

		<div id="wrapper">
		<!-- Menu -->
		<h1>코넥트와 함께<br>하시게 된 것을<br>환영합니다!</h1>
		
		<br>
		정보를 확인하세요<br>
		<br>
		
		<table>
			<tr>
				<td>Email : </td>
				<td><%=email %></td>			
			</tr>
		</table>
		<a href="login.jsp"><input type="button" value="메인페이지로"></a> </nav>
	</div>
</body>
</html>