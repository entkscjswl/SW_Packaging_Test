/* 데이터베이스 테이블과 연동하여 작업하는 파일 */
package DBPKG;
import java.sql.*;
import java.util.ArrayList;

import sun.security.jca.GetInstance;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();//	.jsp페이지에서 DB연동빈인 MemberDAO 클래스 메소드에 접근시 필요함.
	public static MemberDAO getInstance() {				//	getInstance() 메소드로 MemberDAO 객체를 리턴.
		return instance;
	}
	private MemberDAO() {}
	
	//데이터베이스 연결
	public static Connection getConnection() throws SQLException{
		String jdbc_driver="oracle.jdbc.OracleDriver";
		String db_url="jdbc:oracle:thin:@localhost:1521:xe";							//	Data Source Explorer에서 properties로 넣을 값들 확인
		try {
			Class.forName(jdbc_driver);
			Connection conn = DriverManager.getConnection(db_url,"system","1234");
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//회원등록
	public void create(MemberVO vo) throws SQLException{
		Connection conn = null; //SQL문을 실행하기 위해선 Connection이 필수
		PreparedStatement pstmt = null; //SQL문을 실행시키는 기능을 함 
		//Resultset rs = null	// sql에서 select문을 쓸 때 사용함, select의 결과를 저장하는 객체  //	rs를 채워주는 건 sql문 다음에
		String sql = null;
		try {
			conn = getConnection();	//	getConnection은 try밖에 있어도 되나(단, 위 Connection getConnection() 클래스가 따로 있을 때!) 통일감을 위해서 connection = null을 주고 try 안에 넣는 걸로 통일
			sql = "insert into member_tbl_02 values(?,?,?,?,to_date(?,'yyyymmdd'),?,?)";	//	순서 중요!!, to_date는 sqlDeveloper에서 date값을 준 것을 MemberVO에서는 string값을 주기 때문
			pstmt = conn.prepareStatement(sql);						// 이 구문은 sql을 등록하는 부분. 그러므로 이 전에 sql 문장을 적어야함. sql 적고 pstmt
			pstmt.setInt(1, Integer.parseInt(vo.getCustno()));		//	여기서 1,2,3,4 숫자들은 sql문에 들어가는 ?를 차례로 적은것임. 그러므로 순서에 유의하여야 한다.	//	pstmt.setXXX로 값을 할당
			pstmt.setString(2, vo.getCustname());					//	윗줄의 Integer.parseInt는 String형인 Custno를 Int형으로 바꿔주는 과정이다.
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			pstmt.executeUpdate();	//	select문을 제외한 다른 구문을 사용할 때 쓰는 함수(Update, Delete 등)
//			pstmt.executeQuery();   //	select문을 수행할 때 쓰는 함수
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();		//	close()를 안해주면 메모리 누수가 생김
			if(pstmt!=null)pstmt.close();	//	close()를 안해주면 메모리 누수가 생김
		}
	}
	
	//create.jsp 에서 회원번호(자동증가)를 자동으로 입력해주기 위한 메소드. 후에 <%=dao.count() %> 꼴로 집어넣는다. 
	public String count() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String custno = null;	//	return 하는 게 string 형식으로 바로 쓸거니깐 string custno 생성
		try {
			conn = getConnection();
			sql = "select max(custno)+1 from member_tbl_02";
			pstmt = conn.prepareStatement(sql);		//	쿼리 실행
			rs = pstmt.executeQuery();				//	rs가 있을때는 executeQuery()를 pstmt가 아니라 rs에서 써줌
			while(rs.next()) {						//	select문을 쓰는 sql문이 있으면 while이 필요함. next로 넘어가다가 더이상 값이 없으면 while을 빠져나감
				custno=rs.getString(1);				//	1(첫번째 값)을 String 타입으로 가져와 custno에 넣어줌.
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		return custno;
	}
	
	// search.jsp에서 쓰이는 클래스 + delete.jsp 에서도 목록을 보여주기 위해 사용
	public ArrayList<MemberVO> memberList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<MemberVO> mvo = new ArrayList<MemberVO>(); 	//	mvo는 ArrayList로 만들어준 배열임으로, 안에는 MemberVO로 생성 된 덩어리들을 모두 담을 예정임. 
		try {
			conn = getConnection();
			sql = "select * from member_tbl_02";		//	sql 의 순서도 중요함!
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();					
			while(rs.next()) {							//	다음값이 없을때까지
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5).substring(0,10));	//	0은 시작위치, 10은 시작위치로부터 얼마나 문자를 표현할 것인지. 만약에 여기서 substring이 없으면 00:00:00 시분초까지 나오게 됨.		
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
				
				mvo.add(vo);	//	배열 mvo안에 하나를 담고 다음으로 넘어가 다시 반복
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();	
		}
		return mvo;
	}
	
	//searchSale.jsp에서 두 테이블을 select문으로 보여주기 위한 부분
	public ArrayList<MemberVO> saleList() throws SQLException{	//	MemberVO 타입의 리스트 클래스
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<MemberVO> mvo = new ArrayList<MemberVO>();	//	mvo 안에 MemberVO 타입의 리스트를 담을 예정
		try {
			conn = getConnection();
			//	sql문 어려우니깐 알아두기
			sql = "select a.custno,a.custname,a.grade,sum(b.price) as totalprice "
					+ " from member_tbl_02 a JOIN money_tbl_02 b ON a.custno=b.custno "
					+ " group by a.custno,a.custname,a.grade order by totalprice desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {					//	select문에 해당하는 데이터베이스의 행(레코드)이 더 없을때까지 수행한다.
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setGrade(rs.getString(3));
				vo.setPrice(rs.getString(4));
				mvo.add(vo);	//	List mvo에 완성된 하나의 행을 집어넣음. 이후 반복
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return mvo;	//	행들로 채워진 리스트 mvo를 리턴함.
	}
	
	//updatePro.jsp에서 쓰임
	public void update(MemberVO vo) throws SQLException{	//	updatePro.jsp에서 가져온 vo값을 넣어준다. 
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "update member_tbl_02 set custname=?, phone=?, address=?, "
					+ " joindate=to_date(?,'yyyy-mm-dd'),grade=?,city=? where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getJoindate());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.setInt(7, Integer.parseInt(vo.getCustno()));	//	String 형태의 Custno를 int형으로 바꾸기 위함
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	//update.jsp에서 수정하고자 하는 것의 정보를 textbox 안에 value로 띄우기 위한 작업
	public MemberVO readOne(String upd) throws SQLException{	//	update.jsp에서 upd 값을 들고온다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberVO vo = new MemberVO();
		try {
			conn = getConnection();
			sql = "select * from member_tbl_02 where custno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, upd);		//	sql의 ?에 들어가는 부분
			rs = pstmt.executeQuery();
			while(rs.next()) {				//	MemberVO vo 안에 들어간 내용을 하나 씩 뿌린다.
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5).substring(0,10));	//	날짜가 온전히 표기되기 위함
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		return vo;			//	MemberVO 타입의 변수를 쓰기 위해서 리턴해준다.
	}
	
	
	//글삭제부분
	public void delete(String del) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "delete from member_tbl_02 where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, del);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}	
	}
}










