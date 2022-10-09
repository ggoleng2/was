<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%

Context ctx = new InitialContext();
DataSource ds = (DataSource)ctx.lookup("java:/comp/env/jdbc/Hotel");

Connection conn= null;

Statement stmt = null;

ResultSet rs = null;


try {


conn = ds.getConnection();
stmt = conn.createStatement(); // 상태 확인



String query = "SELECT * FROM Reservation"; // DB에 전송할 쿼리문 생성 목록을 나타내기 위해 SELECT문을 사용했습니다.

rs = stmt.executeQuery(query); // 쿼리문 실행!


%><table border="1" cellspacing="0">
<tr>
<td>ID</td>
<td>Name</td>
<td>ReserveDate</td>
<td>RoomNum</td>



</tr>

<%

while(rs.next()) {

%><tr>

<td><%=rs.getString("ID") /* 파라미터값을 직접 넣어줘 출력시켜도 되구요 */%></td>

<td><%=rs.getString("Name")%></td>

<td><%=rs.getString("ReserveDate") /* 숫자를 부여하여 몇번째 데이터 값인지 출력해도 되네요. */%></td>

<td><%=rs.getString("RoomNum")%></td>




</tr>

<%

} // end while

%></table>

<%


rs.close(); // ResultSet 종료


stmt.close(); // Statement 종료


conn.close(); // Connection 종료


} catch (SQLException e) { // 예외처리

out.println("err:"+e.toString());

}

%>
