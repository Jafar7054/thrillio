package com.semanticsquare.thrillio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.semanticsquare.thrillio.dao.BookmarkDao;
import com.semanticsquare.thrillio.entities.Books;
import com.semanticsquare.thrillio.entities.Movies;
import com.semanticsquare.thrillio.entities.Users;
import com.semanticsquare.thrillio.entities.WebLinks;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookmarkingService {

	@Autowired
	BookmarkDao bmd;
	
	
	public List<Books> getAllBooks(Long user_id)
	{
		return bmd.getAllBooks(user_id);
	}
	
	public List<Movies> getAllMovies(Long user_id)
	{
		return bmd.getAllMovies(user_id);
	}
	
	public List<WebLinks> getAllWebLinks(Long user_id)
	{
		return bmd.getAllWebLinks(user_id);
	}
	
	@Transactional(rollbackForClassName= {"java.lang.Exception"})
	public Users userLogin(String email,String password)
	{
		Users user=bmd.userLogin(email, password);
		 if (user == null) {
		        return null;  // No user found, return null
		    }
		return user;
	}
	
	@Transactional(rollbackForClassName= {"java.lang.Exception"})
	public void addUser(String fname, String lname, String dob, String email, String password)
	{
		bmd.add_user(fname,lname,dob,email,password);
		log.info("User added successfully.");
	}
	
	@Transactional(rollbackForClassName= {"java.lang.Exception"})
	public void addBook(Long user_id,String title, String genre, String url)
	{
		bmd.add_book(user_id,title,genre,url);
		log.info("Book added successfully.");
	}
	
	@Transactional(rollbackForClassName= {"java.lang.Exception"})
	public void addMovie(Long user_id,String title, String genre, String url)
	{
		bmd.add_movie(user_id,title,genre,url);
		log.info("Movie added successfully.");
	}
	
	@Transactional(rollbackForClassName= {"java.lang.Exception"})
	public void addWeblink(Long user_id,String title, String url)
	{
		bmd.add_weblink(user_id,title,url);
		log.info("Weblink added successfully.");
	}
	
}
