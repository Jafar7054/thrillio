package com.semanticsquare.thrillio.constants;

public class BookmarkConstants {
	
	//Dao Constants
	public static final String GETALLBOOKS="select * from books where user_id=?";
	public static final String GETALLMOVIES="select * from movies where user_id=?";
	public static final String GETALLWEBLINKS="select * from web_links where user_id=?";
	public static final String LOGIN="select * from users where email=? and password=?";
	public static final String ADD_USER="insert into users(first_name,last_name,dob,email,password) values(?,?,?,?,?)";
	public static final String ADD_BOOK="insert into books(user_id,book_genre,title,url) values(?,?,?,?)";
	public static final String ADD_MOVIE="insert into movies(user_id,movie_genre,title,url) values(?,?,?,?)";
	public static final String ADD_WEBLINK="insert into web_links(user_id,title,url) values(?,?,?)";
	
	//controller mapping
//	public static final String
//	public static final String
//	public static final String
//	public static final String
//	public static final String
//	public static final String
//	public static final String
//	public static final String
//	public static final String
//	public static final String
//	public static final String
}
