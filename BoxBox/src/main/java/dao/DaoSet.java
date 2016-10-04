package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DaoSet {
	Connection conn = null;
	PreparedStatement pstmt = null; // db������ �ߺ��ؼ� ������ �ҷ����� ����,  sql �غ����ִ� Ŭ����
	Statement stmt = null; // �ϳ��� �ҷ��� ��
	ResultSet rs = null; //

	//db�� �����ϴ� �޼���
	public static Connection connDB() throws SQLException {
		String url = "jdbc:oracle:thin:@tlgus07081.iptime.org:1521:xe";
		String user_id = "box";
		String user_pw = "1";
		Connection conn = DriverManager.getConnection(url, user_id, user_pw);
		return conn;
	}

}
