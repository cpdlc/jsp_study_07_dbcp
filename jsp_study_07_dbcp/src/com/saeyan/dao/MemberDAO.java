package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.saeyan.dto.MemberVO;

//데이터베이스 테이블과 연동해서 작업하는 데이터베이스 처리를 위한 DAO클래스
public class MemberDAO {
	
	
	//매개변수 없는 생성자 생성
	private MemberDAO() {
		
	}
	
	private static MemberDAO instance = new MemberDAO();	//객체생성
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	//컨넥션을 얻어오는 메서드 추가
	
	public Connection getConnection() throws Exception{
		
	Connection conn = null;
	Context initContext = new InitialContext();	//네이밍 조작을 위한 클래스 객체 생성
	Context envContext  = (Context)initContext.lookup("java:/comp/env");	// 지정한 이름 찾기
	DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");	// 지정한 이름 찾기
	conn = ds.getConnection();
	return conn;
	
	}
	
	// 사용자 인증시 사용되는 메서드 생성
	public int userCheck(String userid,String pwd) {

		//1. 먼저 DB 연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1; // 초기값은 모두 일치하지 않는것으로 설정
		String sql = "select pwd from member where userid=?";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				if(rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {
				result = 1;
				}else {
					result = 0;
				}
				
			}else 
				result = -1;
			}
			
			
		 catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}
	
	//아이디로 회원 정보 가져오는 메소드
	public MemberVO getMember(String userid){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		MemberVO mVo = null;
		String sql ="select * from member where userid=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
			
				mVo = new MemberVO();
				mVo.setName(rs.getString("name"));
				mVo.setUserid(rs.getString("userid"));
				mVo.setPwd(rs.getString("pwd"));
				mVo.setEmail(rs.getString("email"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setAdmin(rs.getInt("admin"));
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null)rs.close();
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return mVo;
	}
	
}
