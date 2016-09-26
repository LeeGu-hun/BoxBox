package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import member.Member;

public class DaoMember {
	private JdbcTemplate jdbcTemplate;

	public DaoMember(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public Member selectById(Long memberId) {
		List<Member> results = jdbcTemplate.query("select * from MEMBER where id = ?", new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("USER_EMAIL"), rs.getString("USER_NAME"),
						rs.getString("PASSWORD"), rs.getLong("PHONE"), rs.getLong("USER_TYPE"));
				member.setId(rs.getLong("USER_ID"));
				return member;
			}
		}, memberId);

		return results.isEmpty() ? null : results.get(0);
	}

	public Member selectByEmail(String memberEmail) {
		List<Member> results = jdbcTemplate.query("select * from MEMBER where USER_EMAIL = ?", new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("USER_EMAIL"), rs.getString("USER_NAME"),
						rs.getString("PASSWORD"), rs.getLong("PHONE"), rs.getLong("USER_TYPE"));
				member.setId(rs.getLong("USER_ID"));
				return member;
			}
		}, memberEmail);

		return results.isEmpty() ? null : results.get(0);
	}

	public void insert(final Member member) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con
						.prepareStatement("insert into ADMIN values (SEQ_ADMIN.nextval, 'admin@box.com', '관리자', '1')");
				return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		member.setId(keyValue.longValue());
	}

	public void update(Member member) {
		jdbcTemplate.update("update MEMBER set USER_NAME = ?, PASSWORD = ? " + "where USER_EMAIL = ?", member.getName(),
				member.getPassword(), member.getEmail());
	}

	public List<Member> selectAll() {
		System.out.print("----- selectAll ");
		int total = count();
		System.out.println("전체 데이터: " + total);
		List<Member> results = jdbcTemplate.query("select * from MEMBER", new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("NAME"),
						rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		});
		return results;
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from MEMBER", Integer.class);
		return count;
	}

	public void mDelete(Member member) {
		jdbcTemplate.update("delete from MEMBER where EMAIL = ?", member.getEmail());
	}

}
