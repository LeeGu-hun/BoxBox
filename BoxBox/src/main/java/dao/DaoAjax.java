package dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import place.Dong;
import place.Gu;
import place.Place;
import place.Street;
import rental.Rental;
import rental.RentalSearch;
import rental.TimeSearch;

public class DaoAjax extends DaoSet {
	
	public List comboStreet(String dong) {
		List list = new ArrayList();
		Street street = null;
		String sql = "select distinct post_id, post_street from post where POST_dong=? ";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dong);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				street = new Street(rs.getString("POST_STREET"), rs.getString("POST_ID"));
				list.add(street);
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
	
	public List comboDong(String gu) {
		List list = new ArrayList();
		Dong dong = null;
		String sql = "select distinct post_dong from post where POST_gu=? ";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gu);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dong = new Dong(rs.getString("POST_DONG"));
				list.add(dong);
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
	
	public List comboGu(String city) {
		List list = new ArrayList();
		Gu gu = null;
		String sql = "select distinct post_gu from post where POST_CITY=? ";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, city);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				gu = new Gu(rs.getString("POST_GU"));
				list.add(gu);
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
	
	public void insertPlace(String placeName,String postId,String userId) {
		String sql = "insert into place(place_id, place_name, post_id, user_id) values(seq_place.nextval,?,? ,?)";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,placeName);
			pstmt.setString(2,postId);
			pstmt.setString(3,userId);

			String result=(pstmt.executeUpdate() == 0) ? "실패" : "성공";
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	public void insertRental(String placeId,String itemId) {
		String sql = "insert into rental(rental_id, place_id, rental_item_id) values (seq_rental.nextval,?,?)";
		try {
			conn = connDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,placeId);
			pstmt.setString(2,itemId);
			

			String result=(pstmt.executeUpdate() == 0) ? "실패" : "성공";
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	
	
	public List fullEmpty(String start, String end, String rentalId) {
		List list = new ArrayList();
		TimeSearch timeSearch = null;
		String sql = "select * from count";
		try {
			conn = connDB();
			System.out.println("프로시저 실행");
			CallableStatement cstmt = conn.prepareCall("{call ORDER_CNT(?,?,?)}");
			cstmt.setString(1, rentalId);
			cstmt.setString(2, start);
			cstmt.setString(3, end);
			cstmt.execute();
			System.out.println("포로시저 종료");
			System.out.println("sql연결");
			pstmt = conn.prepareStatement(sql);
			System.out.println("sql 입력");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				timeSearch = new TimeSearch(rs.getString("CNT"));
				list.add(timeSearch);
				System.out.println("sql완료");
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
	

	public List timeSearch1(String rentalId) {
		List list = new ArrayList();
		TimeSearch timeSearch = null;
		String sql = "select * from rental_full";
		try {
			conn = connDB();
			System.out.println("프로시저 실행");
			CallableStatement cstmt = conn.prepareCall("{call HOUR_FULL(?)}");
			cstmt.setString(1, rentalId);
			cstmt.execute();
			System.out.println("포로시저 종료");
			System.out.println("db연결");
			pstmt = conn.prepareStatement(sql);
			System.out.println("sql 입력");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				timeSearch = new TimeSearch(rs.getString("FULL_HOUR"),rs.getString("START_HOUR"));
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
	
	
	

	public List timeSearch(String rentalId) {
		List list = new ArrayList();
		TimeSearch timeSearch = null;
		String sql = "select r.RENTAL_ID,p.post_gu,pl.PLACE_NAME , to_char(o.start_time, 'YYYY/MM/DD') as order_date, "
				+ "to_char(o.start_time, 'YYYY/MM/DD HH24') as start_time, to_char(o.end_time+1/(24*60*60), 'YYYY/MM/DD HH24:MI') as end_time, "
				+ "i.rental_category, i.rental_model, i.rental_info, i.model_photo, i.rental_fee,O.RENTAL_FULL "
				+ "from place pl,post p,rental r, rental_item i, rental_order o	"
				+ "where pl.PLACE_ID=r.PLACE_ID and p.POST_ID=pl.POST_ID "
				+ "and r.RENTAL_ID=o.RENTAL_ID and i.RENTAL_ITEM_ID=r.RENTAL_ITEM_ID "
				+ "and r.RENTAL_ID=?  and o.START_TIME>sysdate-50 order by pl.PLACE_ID,r.RENTAL_ID,o.start_time";
		try {
			conn = connDB();
			System.out.println("db연결");
			pstmt = conn.prepareStatement(sql);
			System.out.println("sql 입력");
			pstmt.setString(1, rentalId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				timeSearch = new TimeSearch(rs.getString("RENTAL_ID"), rs.getString("PLACE_NAME"),
						rs.getString("ORDER_DATE"), rs.getString("RENTAL_CATEGORY"), rs.getString("RENTAL_MODEL"),
						rs.getString("RENTAL_INFO"), rs.getString("MODEL_PHOTO"), rs.getString("RENTAL_FEE"),
						rs.getString("RENTAL_FULL"), rs.getString("START_TIME"), rs.getString("END_TIME"),
						rs.getString("post_gu"));
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
