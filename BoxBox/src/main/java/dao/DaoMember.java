package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

import member.Member;
import place.Place;

public class DaoMember {
	private JdbcTemplate jdbcTemplate=new JdbcTemplate();

	public DaoMember(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public DaoMember() {

	}

	public Member selectById(Long memberId) {
		List<Member> results = jdbcTemplate.query("select * from MEMBER where USER_ID = ?", new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("USER_EMAIL"), rs.getString("USER_NAME"),
						rs.getString("PASSWORD"), rs.getString("USER_PHONE"), rs.getInt("USER_TYPE"));
				member.setId(rs.getString("USER_ID"));
				return member;
			}
		}, memberId);

		return results.isEmpty() ? null : results.get(0);
	}

	public Member selectByEmail(String memberEmail) {
		List<Member> results = jdbcTemplate.query("select * from MEMBER where USER_EMAIL = ?", new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("USER_EMAIL"), rs.getString("USER_NAME"),
						rs.getString("PASSWORD"), rs.getString("USER_PHONE"), rs.getInt("USER_TYPE"));
				member.setId(rs.getString("USER_ID"));
				return member;
			}
		}, memberEmail);

		return results.isEmpty() ? null : results.get(0);
	}

	public void insert(final Member member) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MEMBER (USER_ID, USER_EMAIL, USER_NAME, PASSWORD,USER_TYPE,USER_PHONE) values (SEQ_MEMBER.nextval,?, ?, ?,?,?)");
				pstmt.setString(1, member.getEmail());
				pstmt.setString(2, member.getName());
				pstmt.setString(3, member.getPassword());
				pstmt.setInt(4, member.getType());
				pstmt.setString(5, member.getPhone());
				return pstmt;
			}
		});
	}

	public void update(Member member) {
		jdbcTemplate.update("update MEMBER set USER_NAME = ?, PASSWORD = ? " + "where USER_EMAIL = ?", member.getName(),
				member.getPassword(), member.getEmail());
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from MEMBER", Integer.class);
		return count;
	}

	public void memberDelete(Member member) {
		jdbcTemplate.update("delete from MEMBER where EMAIL = ?", member.getEmail());
	}

	public List<Place> comboPost() {
		System.out.println("comboPost 메서드 작동");
		List<Place> results = jdbcTemplate.query(
				"select distinct post_id,post_dong,post_gu,post_city from post natural join place order by post_gu",
				new RowMapper<Place>() {
					public Place mapRow(ResultSet rs, int rowNum) throws SQLException {
						Place place = new Place(rs.getString("POST_ID"), rs.getString("POST_CITY"),
								rs.getString("POST_GU"), rs.getString("POST_DONG"));
						return place;
					}
				});
		return results;

	}

	public List<Place> comboPlace(String postId) {
		System.out.println("comboPlace 메서드 작동");
		List<Place> results = jdbcTemplate.query("select*from place natural join post where post_id=?",
				new RowMapper<Place>() {
					public Place mapRow(ResultSet rs, int rowNum) throws SQLException {
						Place place = new Place(rs.getString("PLACE_ID"), rs.getString("POST_CITY"),
								rs.getString("POST_GU"), rs.getString("POST_DONG"), rs.getString("POST_STREET"),
								rs.getString("PLACE_NAME"), rs.getString("POST_ID"));
						System.out.println(rs.getString("PLACE_ID") + "//" + rs.getString("POST_CITY") + "//"
								+ rs.getString("POST_GU") + "//" + rs.getString("POST_STREET") + "//"
								+ rs.getString("PLACE_NAME"));
						return place;
					}
				},postId);
		return results;

	}

//	public List<Place> comboPost(String postGu) {
//		System.out.println("comboPost 메서드 작동");
//		List<Place> results = jdbcTemplate.query(
//				"select*from place natural join post where post_id=post_id and post_gu=?", new RowMapper<Place>() {
//					public Place mapRow(ResultSet rs, int rowNum) throws SQLException {
//						Place place = new Place(rs.getString("PLACE_ID"), rs.getString("POST_CITY"),
//								rs.getString("POST_GU"), rs.getString("POST_DONG"), rs.getString("POST_STREET"),
//								rs.getString("PLACE_NAME"), rs.getString("POST_ID"));
//						System.out.println(rs.getString("PLACE_ID") + "//" + rs.getString("POST_CITY") + "//"
//								+ rs.getString("POST_GU") + "//" + rs.getString("POST_STREET") + "//"
//								+ rs.getString("PLACE_NAME") + "//" + rs.getString("POST_ID"));
//						return place;
//					}
//				}, postGu);
//		return results;
//
//	}

}
