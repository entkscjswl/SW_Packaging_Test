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
	String no = request.getParameter("no");				//	여기서 getParameter 괄호안에 들어가는 값은 선언한 String 변수가 아니라. create에서 name,id로 지어진 이름을 넣어주는 것이다.
	String name= request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr= request.getParameter("addr");
	String joinDate= request.getParameter("joinDate");
	String grade= request.getParameter("grade");
	String cityCode= request.getParameter("cityCode");
	
	MemberDAO dao = MemberDAO.getInstance();			//	MemberDAO를 쓰기 위한 작업
	MemberVO vo = new MemberVO();						//	테이블에 올리기 위해 MemberVO를 불러와 그 틀에다가 값을 집어 넣기 위한 전초작업
	vo.setCustno(no);									//	MemberVO에서 getters,setters로 만든 부분의 set부분을 적는다. 여기서 괄호 안에는 위의 선언한 String 값을 집어 넣어준다.
	vo.setCustname(name);
	vo.setPhone(phone);
	vo.setAddress(addr);
	vo.setGrade(grade);
	vo.setCity(cityCode);
	vo.setJoindate(joinDate);
	dao.create(vo);				//	MemberVO 형식의 vo에 채워진 값들을  MemberDAO의 create 클래스 인자로 보낸다.
%>
<script>
alert("회원가입에 성공하였습니다.");
location.href="search.jsp";
	//	history.go(-1); 은 이전 화면으로 가기 위한 명령어
</script>
</body>
</html>