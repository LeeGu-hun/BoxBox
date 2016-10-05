package dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import place.Place;

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
//			if (rs.next()) {
//				place = new Place(rs.getString("PLACE_ID"), rs.getString("POST_CITY"), rs.getString("POST_GU"),
//						rs.getString("POST_DONG"), rs.getString("POST_STREET"), rs.getString("PLACE_NAME"),
//						rs.getString("POST_ID"));
//			}
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
}
