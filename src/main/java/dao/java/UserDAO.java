package dao.java;

import bean.java.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Login user by email and password
    public User findByUsernameAndPassword(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        List<User> users = jdbcTemplate.query(sql, new UserRowMapper(), email, password);
        return users.isEmpty() ? null : users.get(0);
    }

    // Get all doctors only
    public List<User> getAllDoctors() {
        return getUsersByRole("doctor");
    }

    // Get all staff only
    public List<User> getAllStaff() {
        return getUsersByRole("staff");
    }

    // Generic method to get users by role
    public List<User> getUsersByRole(String role) {
        String sql = "SELECT * FROM users WHERE role = ?";
        return jdbcTemplate.query(sql, new UserRowMapper(), role);
    }

    // Get user by ID (needed to get patient names by patientId)
    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new UserRowMapper(), id);
        } catch (EmptyResultDataAccessException e) {
            return null; // no user found with that ID
        }
    }

    // Common UserRowMapper to avoid duplication
    private static class UserRowMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            return user;
        }
    }
}
