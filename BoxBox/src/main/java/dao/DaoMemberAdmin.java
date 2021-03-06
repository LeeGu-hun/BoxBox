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
import memberAdmin.MemberSearchAdmin;
import place.Place;
import rental.TimeSearch;

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
				MemberSearchAdmin MemberSearchAdmin = new MemberSearchAdmin(rs.getString("user_name"),
						rs.getString("user_phone"), rs.getString("user_email"), rs.getString("password"));
				return MemberSearchAdmin;
			}
		});

		return results.isEmpty() ? null : results.get(0);
	}

	public TimeSearch timeSearch(String rentalId) {
		String sql = "select r.RENTAL_ID,p.post_gu,pl.PLACE_NAME , to_char(o.order_date, 'YYYY/MM/DD') as order_date, "
				+ "to_char(o.start_time, 'YYYY/MM/DD HH24') as start_time, to_char(o.end_time+1/(24*60*60), 'YYYY/MM/DD HH24:MI') as end_time, "
				+ "i.rental_category, i.rental_model, i.rental_info, i.model_photo, i.rental_fee,O.RENTAL_FULL "
				+ "from place pl,post p,rental r, rental_item i, rental_order o	"
				+ "where pl.PLACE_ID=r.PLACE_ID and p.POST_ID=pl.POST_ID "
				+ "and r.RENTAL_ID=o.RENTAL_ID and i.RENTAL_ITEM_ID=r.RENTAL_ITEM_ID "
				+ "and r.RENTAL_ID=?  and o.START_TIME>sysdate-5 order by pl.PLACE_ID,r.RENTAL_ID";
		List<TimeSearch> results = jdbcTemplate.query(sql, new RowMapper<TimeSearch>() {
			public TimeSearch mapRow(ResultSet rs, int rowNum) throws SQLException {
				TimeSearch timeSearch = new TimeSearch(rs.getString("RENTAL_ID"), rs.getString("PLACE_NAME"),
						rs.getString("ORDER_DATE"), rs.getString("RENTAL_CATEGORY"), rs.getString("RENTAL_MODEL"),
						rs.getString("RENTAL_INFO"), rs.getString("MODEL_PHOTO"), rs.getString("RENTAL_FEE"),
						rs.getString("RENTAL_FULL"), rs.getString("START_TIME"), rs.getString("END_TIME"),
						rs.getString("POST_GU"));
				return timeSearch;
			}
		}, rentalId);

		return results.isEmpty() ? null : results.get(0);
	}

/*	public Member selectById(Long memberId) {
		List<Member> results = jdbcTemplate.query("select * from MEMBER where USER_ID = ?", new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("USER_EMAIL"), rs.getString("USER_NAME"),
						rs.getString("PASSWORD"), rs.getString("USER_PHONE"), rowNum);
				member.setId(rs.getString("USER_ID"));
				return member;
			}
		}, memberId);

		return results.isEmpty() ? null : results.get(0);
	}*/

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
				}, postId);
		return results;

	}

}
