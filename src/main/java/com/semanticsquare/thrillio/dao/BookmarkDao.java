package com.semanticsquare.thrillio.dao;

import java.util.List;

import com.semanticsquare.thrillio.entities.Books;
import com.semanticsquare.thrillio.entities.Movies;
import com.semanticsquare.thrillio.entities.Users;
import com.semanticsquare.thrillio.entities.WebLinks;

public interface BookmarkDao {

	List<Books> getAllBooks(Long user_id);
	List<Movies> getAllMovies(Long user_id);
	List<WebLinks> getAllWebLinks(Long user_id);
	Users userLogin(String email,String passwod);
	void add_user(String fname, String lname, String dob, String email, String password);
	void add_book(Long user_id,String title, String genre, String url);
	void add_movie(Long user_id,String title, String genre, String url);
	void add_weblink(Long user_id,String title, String url);
}
