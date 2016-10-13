package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import memberAdmin.MemberSearchAdmin;

public class DaoMemberAdmin {
	private JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public DaoMemberAdmin(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public MemberSearchAdmin MemberSearchAdmin(String phone) {
		String sql = "select user_name, user_phone, user_email, password from member "
						+ "where user_phone = ? and user_type = 2 ";
		List<MemberSearchAdmin> results = jdbcTemplate.query(sql, new RowMapper<MemberSearchAdmin>() {
			public MemberSearchAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
				MemberSearchAdmin MemberSearchAdmin = new MemberSearchAdmin(
						rs.getString("user_name"), rs.getString("user_phone"), rs.getString("user_email"), rs.getString("password"));				
				return MemberSearchAdmin;
			}
		});

		return results.isEmpty() ? null : results.get(0);
	}

}
