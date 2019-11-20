<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getInstance();
	String del = request.getParameter("del");
	dao.delete(del);
%>
<script>
	alert("삭제되었습니다.");
	location.href="search.jsp";
</script>
</body>
</html>