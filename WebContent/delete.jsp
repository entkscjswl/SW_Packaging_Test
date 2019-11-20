<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css?ver=1">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getInstance();
	ArrayList<MemberVO> mvo = dao.memberList();
%>
	<header>
		<h2>쇼핑몰 회원관리 ver 1.0</h2>
	</header>
	
	<menu>
		<a href="create.jsp">회원등록</a>
		<a href="search.jsp">회원목록조회/수정</a>
		<a href="searchSale.jsp">회원매출조회</a>
		<a href="index.jsp">홈으로</a>
	</menu>
	
	<section>
		<h2>회원 삭제</h2>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원이름</td>
				<td>삭제</td>
			</tr>
			<%for(MemberVO m : mvo) {%>
			<tr>
				<td><%=m.getCustno() %></td>
				<td><%=m.getCustname() %></td>
				<td><a href="deletePro.jsp?del=<%=m.getCustno()%>"><input type="button" value="삭제하기"></a></td>
			</tr>
			<%} %>
		</table>
	</section>
	
	<footer>
		<h5>HRDKOREA Copyright&copy; 2016 All rights reserved. Human Resource Development Service Of Korea.</h5>
	</footer>
</body>
</html>