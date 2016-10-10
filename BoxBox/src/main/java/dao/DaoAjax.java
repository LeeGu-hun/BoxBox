package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import place.Place;
import rental.Rental;
import rental.RentalSearch;

public class DaoAjax extends DaoSet {
	
	public List comboPlace(String postId) {
		List list = new ArrayList();
		Place place = null;
		String sql = "select*from place natural join post where post_id=? ";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, postId);
			rs = pstmt.executeQuery();
			// if (rs.next()) {
			// place = new Place(rs.getString("PLACE_ID"),
			// rs.getString("POST_CITY"), rs.getString("POST_GU"),
			// rs.getString("POST_DONG"), rs.getString("POST_STREET"),
			// rs.getString("PLACE_NAME"),
			// rs.getString("POST_ID"));
			// }
			while (rs.next()) {
				place = new Place(rs.getString("PLACE_ID"), rs.getString("POST_CITY"), rs.getString("POST_GU"),
						rs.getString("POST_DONG"), rs.getString("POST_STREET"), rs.getString("PLACE_NAME"),
						rs.getString("POST_ID"));
				list.add(place);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public List rentalCate(String postId) {
		List list = new ArrayList();
		Rental rental = null;
		String sql = "select distinct ri.RENTAL_CATEGORY,ri.RENTAL_MODEL from rental_item ri,rental r, place p "
				+ "where r.RENTAL_ITEM_ID=ri.RENTAL_ITEM_ID and p.PLACE_ID=r.PLACE_ID and p.POST_ID = ?";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, postId);
			rs = pstmt.executeQuery();
			// if (rs.next()) {
			// place = new Place(rs.getString("PLACE_ID"),
			// rs.getString("POST_CITY"), rs.getString("POST_GU"),
			// rs.getString("POST_DONG"), rs.getString("POST_STREET"),
			// rs.getString("PLACE_NAME"),
			// rs.getString("POST_ID"));
			// }
			while (rs.next()) {
				rental = new Rental(rs.getString("RENTAL_CATEGORY"), rs.getString("RENTAL_MODEL"));
				list.add(rental);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public List rentalInfo(String cate) {
		List list = new ArrayList();
		Rental rental = null;
		String sql = "select r.RENTAL_ITEM_ID, r.RENTAL_INFO,r.RENTAL_FEE from rental_item r where r.RENTAL_MODEL=?";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cate);
			rs = pstmt.executeQuery();
			// if (rs.next()) {
			// place = new Place(rs.getString("PLACE_ID"),
			// rs.getString("POST_CITY"), rs.getString("POST_GU"),
			// rs.getString("POST_DONG"), rs.getString("POST_STREET"),
			// rs.getString("PLACE_NAME"),
			// rs.getString("POST_ID"));
			// }
			while (rs.next()) {
				rental = new Rental(rs.getString("RENTAL_ITEM_ID"), rs.getString("RENTAL_INFO"),
						rs.getString("RENTAL_FEE"));
				list.add(rental);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public List rentalSearch(String placeName) {
		List list = new ArrayList();
		RentalSearch rentalSearch = null;
		String sql = "select r.rental_id,p.post_gu,pl.place_name,i.rental_category,i.rental_model,i.rental_info,i.rental_fee,i.model_photo "
				+ "from rental_item i,place pl, post p ,rental r "
				+ "where  p.POST_ID=pl.POST_ID and pl.PLACE_ID=r.PLACE_ID and r.RENTAL_ITEM_ID=i.RENTAL_ITEM_ID and pl.PLACE_NAME=?";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, placeName);
			rs = pstmt.executeQuery();
			// if (rs.next()) {
			// place = new Place(rs.getString("PLACE_ID"),
			// rs.getString("POST_CITY"), rs.getString("POST_GU"),
			// rs.getString("POST_DONG"), rs.getString("POST_STREET"),
			// rs.getString("PLACE_NAME"),
			// rs.getString("POST_ID"));
			// }
			while (rs.next()) {
				rentalSearch = new RentalSearch(rs.getString("RENTAL_ID"),rs.getString("POST_GU"), rs.getString("PLACE_NAME"),
						rs.getString("RENTAL_CATEGORY"), rs.getString("RENTAL_MODEL"), rs.getString("RENTAL_INFO"),
						rs.getString("RENTAL_FEE"), rs.getString("MODEL_PHOTO"));
				list.add(rentalSearch);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
