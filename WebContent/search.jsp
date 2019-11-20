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
	MemberDAO dao = MemberDAO.getInstance();
	ArrayList<MemberVO> members = dao.memberList();	//	members 배열변수는 "select * from member_tbl_02"의 값이 저장된다. 
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
		<h2>회원목록조회/수정</h2>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<!-- enhanced for문의 기본형태 = for(변수타입 변수명 : 배열 -->			
			<%for(MemberVO m : members) {%>		<!-- MemberVO m은 대입받을 변수를 정의 한 것	//	members는 배열		//	배열값이 대입받을 변수에 대입되어 for문이 돌려짐. -->
			<tr>
				<td><a href="update.jsp?upd=<%=m.getCustno()%>"><%=m.getCustno() %></a></td>	<!-- update.jsp로 넘어갈 때 m.getCustno()의 값을 upd 값으로 가져감  -->
				<td><%=m.getCustname() %></td>	<!-- m에 해당하는 첫번째 배열에서 값을 꺼내옴, 한번 다 돌려지고 나서는 다음 배열에서 값을 꺼내옴. 반복-->
				<td><%=m.getPhone() %></td>
				<td><%=m.getAddress() %></td>
				<td><%=m.getJoindate() %></td>
				<td>
				<%
				if(m.getGrade().equals("A")){			//	고객등급을 데이터베이스에 적힌대로가 아닌 자기가 원하는 대로 뿌리고 싶을 때 쓰는 방법
					out.print("VIP");
				}else if(m.getGrade().equals("B")){
					out.print("일반");
				}else if(m.getGrade().equals("C")){
					out.print("직원");
				}
				%>
				</td>
				<td><%=m.getCity() %></td>
			</tr>
<%} %>				
		</table>
	</section>
	
	<footer>
		<h5>HRDKOREA Copyright&copy; 2016 All rights reserved. Human Resource Development Service Of Korea.</h5>
	</footer>
</body>
</html>