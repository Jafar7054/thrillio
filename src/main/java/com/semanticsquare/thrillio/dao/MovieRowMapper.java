package com.semanticsquare.thrillio.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.semanticsquare.thrillio.entities.Movies;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MovieRowMapper implements RowMapper<Movies>{

	@Override
	public Movies mapRow(ResultSet rs, int rowNum) throws SQLException {
		Movies m=new Movies();
		m.setTitle(rs.getString("title"));
		m.setUser_id(rs.getLong("user_id"));
		m.setUrl(rs.getString("url"));
		m.setMovie_genre(rs.getString("movie_genre"));
		return m;
	}

}
