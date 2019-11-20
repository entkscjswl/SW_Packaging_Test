<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>   <!-- MemberDAO,VO를 쓰려면 까먹지 말고 page import 해주기 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css?ver=1">
<script>
	function checkInfo(){	//	나중에 checkInfo()를 호출하면 이 함수가 실행 됨
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
			document.create.action="createPro.jsp";		//	여기서 create는 form의 name값을 뜻함	, form 안에 값들을 createPro로 보내줌
			document.create.method="post";			
			document.create.submit();
		}
	}

</script>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");				//	한글 지원되게 하려면 필요, .do 같은 방식으로 할 때는 필수
	MemberDAO dao = MemberDAO.getInstance();			//	DAO를 쓰기 위한 작업
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
		<form name="create" method="post">
			<table border="1">
				<tr>
					<th width="250">회원번호(자동발생)</th>
					<td align="left"><input type="text" value="<%=dao.count()%>" id="no" name="no" readonly="readonly"></td>	<!-- dao.count()는 회원번호를 자동으로 기입해주는 클래스//readonly는 읽기전용 텍스트박스 -->
				</tr>
				<tr>
					<th>회원성명</th>
					<td align="left"><input type="text" id="name" name="name" autofocus></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td align="left"><input type="text" id="phone" name="phone" size="23"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td align="left"><input type="text" id="addr" name="addr" size="26"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td align="left"><input type="text" id="joinDate" name="joinDate"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td align="left"><input type="text" id="grade" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td align="left"><input type="text" id="cityCode" name="cityCode"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="checkInfo()">
						<input type="button" onclick="location.href='search.jsp'" value="조회">
						<input type="reset" value="다시입력" onclick="create.name.focus()">
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