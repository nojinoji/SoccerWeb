package info;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import info.InfoDataBean;

public class InfoDBBean {
	private static InfoDBBean instance = new InfoDBBean();
	public static InfoDBBean getInstance() {
		return instance;
	}
	private InfoDBBean() {}
	//커넥션 풀에서 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}
	public InfoDataBean getMember(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InfoDataBean player =null;
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from player where player_name = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {//해당 아이디에 대한 레코드가 존재
				//사용자가 입력한 비밀번호와 테이블의 비밀번호가 같으면 수행
					player = new InfoDataBean();//데이터저장빈 객체생성
					player.setName(rs.getString("player_name"));
					player.setPosition(rs.getString("player_team"));
					player.setAge(Integer.parseInt(rs.getString("player_age")));
					player.setCountry(rs.getString("player_con"));
				}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally
		{
			if
			(rs != null) try { rs.close(); } catch
			(SQLException ex) {}
			if
			(pstmt != null) try { pstmt.close(); } catch
			(SQLException ex) {}
			if
			(conn != null) try { conn.close(); } catch
			(SQLException ex) {}
		}
		return player;//데이터 저장빈 객체 member 리턴
	}
}
