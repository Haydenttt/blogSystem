/**
 * 
 */
package com.unicom.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * @author 閸掓锟戒礁绗�
 * 閺佺増宓佹惔鎾存惙娴ｆ粏绶熼崝鈺佷紣閸忛琚�
 * 2017楠烇拷1閺堬拷17閺冦儰绗傞崡锟�10:21:00
 */
public class DBCon {
	private Connection conn;
	/**
	 * 閸涙垝鎶ょ拠顓炲綖鐎电钖�
	 */
	private PreparedStatement ps;
	/**
	 * 缂佹挻鐏夐梿锟�
	 */
	private ResultSet rs;

	/**
	 * 閹垫挸绱戦獮鎯板箯閸欐牗鏆熼幑顔肩氨鏉╃偞甯撮惃鍕煙濞夛拷
	 *
	 * @return 鏉╂柨娲栭弫鐗堝祦鎼存捁绻涢幒銉ヮ嚠鐠烇拷
	 */
	public Connection openConn() {
		conn=DBUtil.getConn();
		return  conn;
	}

	/**
	 * 閸忔娊妫撮幍锟介張澶庣カ濠э拷
	 */
	public void closeAll() {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if (ps != null)
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}


	/**
	 * 閹笛嗩攽閺佺増宓侀弴瀛樻煀閸涙垝鎶ら敍鍫濐杻閿涘苯鍨归敍灞炬暭閿涳拷
	 *
	 * @param //sql閸涙垝鎶ょ拠顓炲綖
	 * @param paras          閸欘垰褰夐崣鍌涙殶閿涘奔绱堕柅鎵碤L娑擃厾娈戦崣鍌涙殶閸婏拷
	 * @return 鏉╂柨娲栭崣妤�濂栭崫宥堫攽閺佸府绱濇径褌绨�0鐞涖劎銇氶幍褑顢戦幋鎰
	 */
	public int update(String sql, Object... paras) {
		int resu = 0;//閻€劍娼垫潻鏂挎礀閸欐濂栭崫宥堫攽閺侊拷
		//閹垫挸绱戦弫鐗堝祦鎼存捁绻涢幒銉ヮ嚠鐠烇拷
		openConn();
		try {
			//閼惧嘲褰嘢QL閸涙垝鎶ょ�电钖�
			ps = conn.prepareStatement(sql);
			//瀵邦亞骞嗛懢宄板絿閸欏倹鏆熼弫鎵矋娑擃厾娈戦崐纭风礉楠炴儼绻樼悰宀冪ゴ閸婏拷
			if (paras != null) {
				for (int i = 0; i < paras.length; i++) {
					ps.setObject(i + 1, paras[i]);//娑撳搫寮弫鎷岀ゴ閸婏拷
				}
			}
			//閹笛嗩攽SQL閹稿洣鎶�
			resu = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll();//閺堬拷閸氬簼绔村銉礉閸忔娊妫撮幍锟介張澶庣カ濠э拷
		}
		return resu;
	}

	// 增加方法
	public boolean insert(String sql, Object... paras) {
		boolean flat = false;
		openConn();
		try {
			ps = conn.prepareStatement(sql);
			if (paras != null) {
				for (int i = 0; i < paras.length; i++) {
					ps.setObject(i + 1, paras[i]);
					System.out.println(paras[i]);
				}
			}
			int f = ps.executeUpdate();
			if (f > 0) {
				System.out.println("成功插入" + f + "条数据");
				flat = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flat;

	}

	/**
	 * 閹笛嗩攽閺佺増宓侀弻銉嚄閿涘奔濞囬悽銊ョ暚閺佺増宓侀崥搴ゎ唶瀵版鍙ч梻顓＄カ濠ф亪loseAll()閺傝纭�
	 *
	 * @param
	 * @param paras 閸欘垰褰夐崣鍌涙殶閿涘奔绱堕柅鎵碤L娑擃厾娈戦崣鍌涙殶閸婏拷
	 * @return 鏉╂柨娲栭弻銉嚄閸掓壆娈戦弫鐗堝祦閿涘瞼绮ㄩ弸婊堟肠
	 */
	public ResultSet query(String sql, Object... paras) {
		//閹垫挸绱戦弫鐗堝祦鎼存捁绻涢幒锟�
		openConn();
		try {
			//閼惧嘲褰囬崨鎴掓姢鐎电钖�
			ps = conn.prepareStatement(sql);
			//瀵邦亞骞嗛懢宄板絿閸欏倹鏆熼弫鎵矋娑擃厾娈戦崐纭风礉楠炴儼绻樼悰宀冪ゴ閸婏拷
			if (paras != null) {
				for (int i = 0; i < paras.length; i++) {
					ps.setObject(i + 1, paras[i]);//娑撳搫寮弫鎷岀ゴ閸婏拷
				}
			}
			//閹笛嗩攽閺屻儴顕楅敍宀冨箯閸欐牜绮ㄩ弸婊堟肠
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//閺屻儴顕楅弫鐗堝祦閺冭绱濇稉宥堫洣閸忔娊妫寸挧鍕爱閿涘奔姘﹂悽杈殶閻€劏锟藉懏娼甸崗鎶芥４鐠у嫭绨�
		return rs;//閺堬拷閸氬簼绔村銉礉鏉╂柨娲栭弻銉嚄閸掓壆娈戦弫鐗堝祦缂佹挻鐏夐梿锟�
	}

}