<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<%@ page import="java.util.*" %>	<!-- ArrayList를 사용하기 위해 -->  
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
	ArrayList<MemberVO> members = dao.saleList();	// MemberVO 타입으로 리스트 members를 생성한다. 이 members 안에는 dao.saleList에서 받아온 MemberVO 리스트 타입인 리턴값 mvo를 집어 넣는다.
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
		<h2>회원매출조회</h2>
		<table>
			<table border="1">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
				<!-- enhanced for문의 기본형태 = for(변수타입 변수명 : 배열 -->
				<%for(MemberVO m : members) {%>		<!--MemberVO 타입의 m에다가 MemberVo 타입인 배열(리스트) members를 집어넣음-->
				<tr>
					<td><%=m.getCustno() %></td>	<!-- m에 해당하는 첫번째 배열에서 값을 꺼내옴, 한번 다 돌려지고 나서는 다음 배열에서 값을 꺼내옴. 반복-->
					<td><%=m.getCustname() %></td>
					<td>
					<%
					if(m.getGrade().equals("A")){		//	고객등급을 데이터베이스에 적힌대로가 아닌 자기가 원하는 대로 뿌리고 싶을 때 쓰는 방법
						out.print("VIP");
					}else if(m.getGrade().equals("B")){
						out.print("일반");
					}else if(m.getGrade().equals("C")){
						out.print("직원");
					}
					
					%>
					</td>
					<td><%=m.getPrice() %></td>
				</tr>
			<%} %>
			</table>
		</table>
	</section>
	
	<footer>
		<h5>HRDKOREA Copyright&copy; 2016 All rights reserved. Human Resource Development Service Of Korea.</h5>
	</footer>
</body>
</html>