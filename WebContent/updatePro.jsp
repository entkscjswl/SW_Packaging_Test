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
	String no = request.getParameter("no");		//	String형 변수 no에 update.jsp에서 no부분에 적었던 값을 넣어준다.
	String name= request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr= request.getParameter("addr");
	String joinDate= request.getParameter("joinDate");
	String grade= request.getParameter("grade");
	String cityCode= request.getParameter("cityCode");
	
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo = new MemberVO();
	vo.setCustno(no);		//	위에서 String형으로 선언한 변수 no를 값으로 넣어준다.
	vo.setCustname(name);
	vo.setPhone(phone);
	vo.setAddress(addr);
	vo.setGrade(grade);
	vo.setCity(cityCode);
	vo.setJoindate(joinDate);
	dao.update(vo);			//	MemberVO 틀의 변수인 vo에 넣어진 값들을 dao.update로 가져가 후처리 해준다.
%>
<script>
location.href="search.jsp";
</script>
</body>
</html>