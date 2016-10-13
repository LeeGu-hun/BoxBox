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

import rentalItemAdmin.ItemInsertAdmin;
import rentalItemAdmin.ItemSearchAdmin;
import rentalItemAdmin.ItemUpdateAdmin;

public class DaoRentalItemAdmin {
	private JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public DaoRentalItemAdmin(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public ItemSearchAdmin itemSearchAdmin(String cate, String model) {
		String sql = "select rental_category, rental_model, rental_info, rental_fee, model_photo "
						+ "from rental_item where rental_category = ? and rental_model = ? ";
		List<ItemSearchAdmin> results = jdbcTemplate.query(sql, new RowMapper<ItemSearchAdmin>() {
			public ItemSearchAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
				ItemSearchAdmin ItemSearchAdmin = new ItemSearchAdmin(rs.getString("rrental_category"),
						rs.getString("rental_model"), rs.getString("rental_info"), rs.getString("rental_fee"),
						rs.getString("rental_info"));
				
				return ItemSearchAdmin;
			}
		});

		return results.isEmpty() ? null : results.get(0);
	}

	public void itemInsertAdmin(final ItemInsertAdmin itemInsertAdmin) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
					"insert into rental_item(rental_item_id, rental_category, rental_model, rental_info, rental_fee, model_photo) "
					+ "values(seq_rental_item.nextval, ?, ?, ?, ?, ?) ");
				pstmt.setString(1, itemInsertAdmin.getCate());
				pstmt.setString(2, itemInsertAdmin.getModel());
				pstmt.setString(3, itemInsertAdmin.getInfo());
				pstmt.setInt(4, itemInsertAdmin.getFee());
				pstmt.setString(5, itemInsertAdmin.getPhoto());
				
				return pstmt;
			}
		});
	}
	
	public void itemUpdateAdmin(final ItemUpdateAdmin itemUpdateAdmin) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
					"update rental_item " 
					+ "set rental_category = ?, rental_model = ?, rental_info = ?, rental_fee = ?, model_photo = ? ");
				pstmt.setString(1, itemUpdateAdmin.getCate());
				pstmt.setString(2, itemUpdateAdmin.getModel());
				pstmt.setString(3, itemUpdateAdmin.getInfo());
				pstmt.setInt(4, itemUpdateAdmin.getFee());
				pstmt.setString(5, itemUpdateAdmin.getPhoto());
				
				return pstmt;
			}
		});
	}

}
