//	처음 시작할 때면 Servers에 Tomcat v8.5도 없고 Data Source Explorer에도 아무것도 없으니 수정을 해야함.
//	window - preferences에서 server - runtime environment에서 8.5 - next - c밑에서 깔린 톰캣의 폴더 선택
//	web - jsp,http,css - utf8
//  general - workspace - other부분에 utf-8
//	String형으로 모든 값을 줌. 그러므로 추후 MemberDAO에서 이에 따른 수정이 필요함.
//	servers에서 우클릭 8.5 추가, 그리고 8.5를 더블클릭한 후 문제에 나왔있는 번호 (ex:8090)로 HTTP의 번호를 수정
//	Data Source Explorer에서 new - Oracle - +마크에서 oracle thin driver 11선택 - 옆쪽의 jar에서 oraclexe의 product의 11.2.0의 server의 jdbc의 lib의 ojdbc6.jar을 추가
//  그리고 옆쪽의 Properties를 선택해 Connection URL을 jdbc:oracle:thin:@localhost:1521:xe로 수정, Database Name 을 xe로 수정
package DBPKG;

public class MemberVO {
	private String custno;
	private String custname;
	private String phone;
	private String address;
	private String joindate;
	private String grade;
	private String city;
	private String salenol;
	private String pcost;
	private String amount;
	private String price;
	private String pcode;
	private String sdate;
	
	
	public String getCustno() {
		return custno;
	}
	public void setCustno(String custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getSalenol() {
		return salenol;
	}
	public void setSalenol(String salenol) {
		this.salenol = salenol;
	}
	public String getPcost() {
		return pcost;
	}
	public void setPcost(String pcost) {
		this.pcost = pcost;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	
}
