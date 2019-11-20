<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css?ver=1">
<script>
	function checkInfo(){
		if(document.getElementById("name").value==0){
			alert("이름이 입력되지 않았습니다");
			document.getElementById('name').focus();
		}
		else if(document.getElementById("phone").value==0){
			alert("전화번호가 입력되지 않았습니다.");
			document.getElementById('phone').focus();
		}
		else if(document.getElementById("addr").value==0){
			alert("주소가 입력되지 않았습니다.");
			document.getElementById("addr").focus();
		}
		else if(document.getElementById("joinDate").value==0){
			alert("가입일자가 입력되지 않았습니다.");
			document.getElementById("joinDate").focus();
		}
		else if(document.getElementById("grade").value==0){
			alert("등급이 입력되지 않았습니다.");
			document.getElementById("grade").focus();
		}
		else if(document.getElementById("cityCode").value==0){
			alert("도시코드가 입력되지 않았습니다.");
			document.getElementById("cityCode").focus();
		}else{
			alert("수정에 성공하였습니다.");
			document.update.action="updatePro.jsp";
			document.update.method="post";
			document.update.submit();
		}
	}
</script>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getInstance();
	String upd = request.getParameter("upd");	//	upd라는 변수 안에다가 search.jsp에서 링크부분에 줬던 m.getCustno를 가져와 값을 넣어준다.
	MemberVO vo = dao.readOne(upd);				//	가져온 upd 값을 들고 readOne 클래스를 돌려 return 값을 받아낸다.
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
		<h2>홈쇼핑 회원등록</h2>
		<form name="update" method="post">
			<table border="1">
				<tr>
					<th width="250">회원번호(자동발생)</th>
					<td align="left"><input type="text" value="<%=vo.getCustno()%>" id="no" name="no" readonly="readonly"></td>	<!-- value 부분에 readOne에서 가져온 vo의 컬럼값들을 넣어준다. -->
				</tr>
				<tr>
					<th>회원성명</th>
					<td align="left"><input type="text" value="<%=vo.getCustname()%>" id="name" name="name"></td>
				</tr>
				<tr>
					<th>회원전화</th> 
					<td align="left"><input type="text" value="<%=vo.getPhone()%>" id="phone" name="phone" size="23"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td align="left"><input type="text" value="<%=vo.getAddress()%>" id="addr" name="addr" size="26"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td align="left"><input type="text" value="<%=vo.getJoindate()%>" id="joinDate" name="joinDate"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td align="left"><input type="text" value="<%=vo.getGrade()%>" id="grade" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td align="left"><input type="text" value="<%=vo.getCity()%>" id="cityCode" name="cityCode"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="checkInfo()">
						<input type="button" onclick="location.href='search.jsp'" value="조회">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<footer>
		<h5>HRDKOREA Copyright&copy; 2016 All rights reserved. Human Resource Development Service Of Korea.</h5>
	</footer>
</body>
</html>