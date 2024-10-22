package com.semanticsquare.thrillio.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.semanticsquare.thrillio.entities.WebLinks;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class WebLinkRowMapper implements RowMapper<WebLinks>{

	@Override
	public WebLinks mapRow(ResultSet rs, int rowNum) throws SQLException {
		WebLinks w=new WebLinks();
		w.setTitle(rs.getString("title"));
		w.setUser_id(rs.getLong("user_id"));
		w.setUrl(rs.getString("url"));
		return w;
	}

}
