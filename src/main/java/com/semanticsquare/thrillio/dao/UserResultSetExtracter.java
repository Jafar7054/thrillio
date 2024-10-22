package com.semanticsquare.thrillio.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.semanticsquare.thrillio.entities.Users;

@Component
public class UserResultSetExtracter implements ResultSetExtractor<Users>{

	@Override
	public Users extractData(ResultSet rs) throws SQLException, DataAccessException {
		
		if(rs.next()) {
		Users u=new Users();
		u.setId(rs.getLong("id"));
		u.setFirstName(rs.getString("first_name"));
		u.setLastName(rs.getString("last_name"));
		u.setDob(rs.getString("dob"));
		u.setEmail(rs.getString("email"));
		u.setPassword(rs.getString("password"));
		return u;
		}
		else {
            return null;  // No result found, return null
        }
	}

}
