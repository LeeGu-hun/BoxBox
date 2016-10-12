package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import place.Place;
import rental.Rental;
import rental.RentalSearch;
import rental.TimeSearch;

public class DaoAjax extends DaoSet {

	public List timeSearch(String rentalFull, String rentalId, String startTime, String endTime, String orderDate,
			String orderDate1) {
		List list = new ArrayList();
		TimeSearch timeSearch = null;
		String sql = "select r.rental_id, pl.place_name, to_char(ro.order_date, 'YYYY/MM/DD') as order_date"
				+ ", to_char(ro.start_time, 'YYYY/MM/DD HH24') as start_time, to_char(ro.end_time, 'YYYY/MM/DD HH24') as end_time"
				+ ", ri.rental_category, ri.rental_model, ri.rental_info, ri.model_photo, ri.rental_fee,RO.RENTAL_FULL "
				+ "from rental_order ro, rental_item ri, rental r, place pl, post po where ro.rental_id = r.rental_id and r.place_id = pl.place_id "
				+ "and pl.post_id = po.post_id and ri.rental_item_id = r.rental_item_id and r.rental_id = ? "
				+ "and sysdate < '"+ orderDate + "' and sysdate < '" + orderDate1 + "' "
				+ "and to_date('" + orderDate+ "', 'YY/MM/DD HH24') + ?/24 <= start_time "
				+ "and to_date('" + orderDate1+ "', 'YY/MM/DD HH24') + ?/24 >= end_time "
				+ "order by ro.start_time";
		try {
			conn = connDB();
			System.out.println("db연결");
			pstmt = conn.prepareStatement(sql);
			System.out.println("sql 입력");
			pstmt.setString(1, rentalId);
			pstmt.setInt(2, Integer.parseInt(startTime));
			pstmt.setInt(3, Integer.parseInt(endTime));
			rs = pstmt.executeQuery();
			// if (rs.next()) {
			// place = new Place(rs.getString("PLACE_ID"),
			// rs.getString("POST_CITY"), rs.getString("POST_GU"),
			// rs.getString("POST_DONG"), rs.getString("POST_STREET"),
			// rs.getString("PLACE_NAME"),
			// rs.getString("POST_ID"));
			// }
			while (rs.next()) {
				timeSearch = new TimeSearch(rs.getString("RENTAL_ID"), rs.getString("PLACE_NAME"),
						rs.getString("ORDER_DATE"), rs.getString("RENTAL_CATEGORY"), rs.getString("RENTAL_MODEL"),
						rs.getString("RENTAL_INFO"), rs.getString("MODEL_PHOTO"), rs.getString("RENTAL_FEE"),
						rentalFull, rs.getString("START_TIME"), rs.getString("END_TIME"));
				list.add(timeSearch);
				System.out.println("완료");
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
				rentalSearch = new RentalSearch(rs.getString("RENTAL_ID"), rs.getString("POST_GU"),
						rs.getString("PLACE_NAME"), rs.getString("RENTAL_CATEGORY"), rs.getString("RENTAL_MODEL"),
						rs.getString("RENTAL_INFO"), rs.getString("RENTAL_FEE"), rs.getString("MODEL_PHOTO"));
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
