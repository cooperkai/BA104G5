package com.article.model;

import java.sql.Date;
import java.sql.Timestamp;

public class ArticleService {
	
	private ArticleDAO_interface dao;
	public ArticleService (){
		dao = new ArticleDAO();
	}
	
	private String article_no;
	private String rtr_no;
	private String article_body;
	private Timestamp post_date;
	private Date update_date;
	private String article_state;
	
	
"INSERT INTO Article (Rtr_No, Article_body, Post_date, Article_State) VALUES( ?, ?, ?, ?)";
"UPDATE Article SET Rtr_No=?, Article_body=?, Post_date=?, Article_State=? WHERE Article_No = ?";
"SELECT Article_No, Rtr_No, Article_body, to_char(Post_Date, 'yyyy-mm-dd hh:mi:ss')Post_Date, Update_date, Article_State FROM Article WHERE Article_No = ?";
"SELECT Article_No, Rtr_No, Article_body, to_char(Post_Date, 'yyyy-mm-dd hh:mi:ss')Post_Date, Update_date, Article_State FROM Article ORDER BY Article_No";

"SELECT * FROM Article ORDER BY Post_Date DESC";// 查詢發布時間排序
	
	
	
	
	public ArticleVO add(String rtr_no, String article_body, Timestamp post_date, String article_state){
		ArticleVO articleVO = new ArticleVO();
		
		
		return null;
		
	}

}
