package com.kh.search.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.book.model.vo.Book;

import static common.JDBCTemplate.close;

public class SearchDao {

	private Properties prop;
	
	public SearchDao() {
		prop = new Properties();
		
		try {
			String filename = SearchDao.class.getResource("./search-query.properties").getPath();
			prop.load(new FileReader(filename));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<Book> selectBook(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> list=null;
//		String content = "한국의 대표 판타지 소설『드래곤 라자』를 양장본으로 만나다!\r\n" + 
//				"\r\n" + 
//				"이영도 판타지 장편소설『드래곤 라자』제1권 \"태양을 향해 달리는 말\" 편. 출간 10주년을 맞이하여 기존의 12권을 8권의 양장본으로 새롭게 펴냈다. 1998년 출간 이후 국내에서만 100만 부 넘게 판매되며 한국의 대표 판타지 소설로 자리잡은 이 작품은 일본, 대만, 중국에서도 큰 인기를 얻었다. 2004년에는 고등학교 문학 교과서에 실려 화제가 되기도 했다. \r\n" + 
//				"\r\n" + 
//				"그동안 <퓨처워커>, <눈물을 마시는 새>, <피를 마시는 새> 등을 발표하며 한국 최고의 장르 소설가로 이름을 알린 이영도. 그의 작품들은 판타지 장르임에도 불구하고 정교한 이야기 구성과 깊이 있는 주제 의식, 위트 넘치는 대화와 개성 있는 인물들이 특징적이다.『드래곤 라자』역시 강한 흡인력과 깊이 있는 작품성으로 독보적인 인기를 누려왔다.\r\n" + 
//				"\r\n" + 
//				"드래곤 아무르타트를 제압하기 위해 드래곤 캇셀프라임과 그의 라자인 할슈타일 가문의 어린 공자가 헬턴트 영지에 도착하지만, 캇셀프라임은 아무르타트에게 패하여 죽게 된다. 그 와중에 소년 후치의 아버지를 포함한 패잔병들이 아무르타트에게 포로로 잡히고, 아무르타트는 인질 석방금을 요구한다. 전투 패배 보고와 석방금을 구하기 위해 수도로 향한 후치와 칼, 그리고 샌슨의 여행이 시작되는데…. [양장본]\r\n" + 
//				"\r\n" + 
//				"☞ 작품 조금 더 살펴보기!\r\n" + 
//				"이번 양장본은 이영도 출판 카페(HTTP://CAFE.NAVER.COM/BLOODBIRD)에서 2005년부터 팬들과 함께 준비한 결과물이라는 점에서 더 의미가 있다. 카페에는 수백 건에 이르는 10주년 기념 출판 제안과 아이디어가 올라왔으며, 인터넷 서점 서평으로 활발히 활동하고 있는 팬들이 새로운 판본의 독자 편집자로 참여하기도 했다.";
//		try {
//			pstmt = conn.prepareStatement(prop.getProperty("updateTest"));
//			StringReader sr = new StringReader(content);
//			pstmt.setCharacterStream(1, sr, content.length());
//			
//			int result = pstmt.executeUpdate();
//			
//			System.out.println(result);
//			
//			if(result>0) {
//				conn.commit();
//			}
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchList"));
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			list = new ArrayList<Book>();
			
			while(rs.next()) {
				Book b = new Book();
				b.setBookName(rs.getString("bookname"));
				b.setPrice(rs.getInt("price"));
				b.setPublisher(rs.getString("publisher"));
				b.setAuthorNum(rs.getInt("authornum"));
				b.setGenre(rs.getString("genre"));
				b.setBookId(rs.getInt("bookid"));
				b.setIsbn(rs.getString("isbn"));
				b.setBookImage(rs.getString("bookImage"));
				b.setBookInfo(rs.getString("bookinfo"));
				b.setEditor(rs.getString("editor"));
				b.setTranslator(rs.getString("translator"));
				b.setPageNum(rs.getInt("pagenum"));
				b.setStock(rs.getInt("stock"));
				b.setSales(rs.getInt("sales"));
				
				list.add(b);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
