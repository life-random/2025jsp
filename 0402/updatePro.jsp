<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	//1. DB 연동 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	//2. 연결 객체 생성
	String url = "jdbc:mariadb://localhost:3307/backend";
	Connection con = DriverManager.getConnection(url, "choi", "1111");

	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "UPDATE MEMBER SET NAME=?, PWD=? WHERE ID=?";

	
	//4. SQL 실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, pwd);
	pstmt.setString(3, id);
	
	ResultSet rs = pstmt.executeQuery();
	
	//5. 객체 해제
	rs.close();
	con.close();
	%>

	<script>
		let ans = alert("변경되었습니다!");
		if (!ans){
			location.href='list.jsp';
		}
	</script>



