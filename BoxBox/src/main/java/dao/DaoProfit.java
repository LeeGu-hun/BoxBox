package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import profitAdmin.ProfitAdmin;

public class DaoProfit {
	private JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public DaoProfit(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public ProfitAdmin ProfitAdmin(String pName, String cate, String firstDate, String lastDate) {
		String sql = "select m.user_email, p.place_name, ri.rental_model, ri.rental_info, ro.start_time, "
						+ "ro.extra_end_time, ro.order_price + ro.extra_price "
						+ "from member m, rental r, rental_item ri, rental_order ro, place p "
						+ "where m.user_id = ro.user_id and ro.rental_id = r.rental_id and "
						+ "r.rental_item_id = ri.rental_item_id and r.place_id = p.place_id and user_type = 2 "
						+ "and p.place_name = ? and ri.rental_category = ? "
						+ "and ro.start_time between to_date(?, 'YY/MM/DD') - 1/(24*60*60) and to_date(?, 'YY/MM/DD') + 1 "
						+ "order by m.user_email";
		List<ProfitAdmin> results = jdbcTemplate.query(sql, new RowMapper<ProfitAdmin>() {
			public ProfitAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProfitAdmin ProfitAdmin
					= new ProfitAdmin(rs.getString("user_email"), rs.getString("place_name"),
							rs.getString("rental_model"), rs.getString("rental_info"),
							rs.getString("start_time"), rs.getString("extra_end_time"),
							rs.getString("order_price + extra_price"));
													
				return ProfitAdmin;
			}
		});

		return results.isEmpty() ? null : results.get(0);
	}

}