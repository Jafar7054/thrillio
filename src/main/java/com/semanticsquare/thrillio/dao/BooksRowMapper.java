package com.semanticsquare.thrillio.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.semanticsquare.thrillio.entities.Books;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class BooksRowMapper implements RowMapper<Books>{

	@Override
	public Books mapRow(ResultSet rs, int rowNum) throws SQLException {
		Books b=new Books();
		b.setTitle(rs.getString("title"));
		b.setUser_id(rs.getLong("user_id"));
		b.setUrl(rs.getString("url"));
		b.setBook_genre(rs.getString("book_genre"));
		return b;
	}

}
