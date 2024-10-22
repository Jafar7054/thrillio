package com.semanticsquare.thrillio.dao;

import static com.semanticsquare.thrillio.constants.BookmarkConstants.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.semanticsquare.thrillio.entities.Books;
import com.semanticsquare.thrillio.entities.Movies;
import com.semanticsquare.thrillio.entities.Users;
import com.semanticsquare.thrillio.entities.WebLinks;

@Component
public class BookmarkDaoImplementation implements BookmarkDao {

	@Autowired
	JdbcTemplate template;
	
	@Autowired
	BooksRowMapper brm;
	
	@Autowired
	MovieRowMapper mrm;
	
	@Autowired
	WebLinkRowMapper wrm;
	
	@Autowired
	UserResultSetExtracter urse;
	
	@Override
	public List<Books> getAllBooks(Long user_id) {
		
		return template.query(GETALLBOOKS, brm, user_id );
	}
	
	public List<Movies> getAllMovies(Long user_id) {
		
		return template.query(GETALLMOVIES, mrm, user_id );
	}

	@Override
	public List<WebLinks> getAllWebLinks(Long user_id) {
		
		return template.query(GETALLWEBLINKS, wrm, user_id );
	}

	@Override
	public Users userLogin(String email, String password) {
		
		Users user= template.query(LOGIN, new Object[] {email,password}, urse);
		return user;
	}

	@Override
	public void add_user(String fname, String lname, String dob, String email, String password) {
		
		template.update(ADD_USER, new Object[] {fname,lname,dob,email,password});
	}

	@Override
	public void add_book(Long user_id,String title, String genre, String url) {String query="insert into books(user_id,book_genre,title,url) values(?,?,?,?)";
		
		template.update(ADD_BOOK,new Object[] {user_id,genre,title,url});
		
	}

	@Override
	public void add_movie(Long user_id,String title, String genre, String url) {
		
		template.update(ADD_MOVIE,new Object[] {user_id,genre,title,url});
		
	}

	@Override
	public void add_weblink(Long user_id,String title, String url) {
		
		template.update(ADD_WEBLINK,new Object[] {user_id,title,url});
		
	}
	

}
