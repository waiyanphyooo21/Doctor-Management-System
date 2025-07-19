package dao.java;

import bean.java.Patient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class PatientDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Add new patient
    public int addPatient(Patient p) {
        String sql = "INSERT INTO patient (name, age, gender, contact, email, address, medicalHistory, allergies, emergencyContact, registrationDate, image) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                p.getName(),
                p.getAge(),
                p.getGender(),
                p.getContact(),
                p.getEmail(),
                p.getAddress(),
                p.getMedicalHistory(),
                p.getAllergies(),
                p.getEmergencyContact(),
                new java.sql.Date(p.getRegistrationDate().getTime()),
                p.getImage());
    }

    // Get all patients
    public List<Patient> getAllPatients() {
        String sql = "SELECT * FROM patient ORDER BY id DESC";
        return jdbcTemplate.query(sql, new PatientRowMapper());
    }

    // Get patient by id
    public Patient getPatientById(int id) {
        String sql = "SELECT * FROM patient WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new PatientRowMapper(), id);
    }

    // Search patients by name
    public List<Patient> searchPatientsByName(String name) {
        String sql = "SELECT * FROM patient WHERE name LIKE ?";
        return jdbcTemplate.query(sql, new PatientRowMapper(), "%" + name + "%");
    }

    // Update patient
    public int updatePatient(Patient p) {
        String sql = "UPDATE patient SET name=?, age=?, gender=?, contact=?, email=?, address=?, medicalHistory=?, allergies=?, emergencyContact=?, registrationDate=?, image=? WHERE id=?";
        return jdbcTemplate.update(sql,
                p.getName(),
                p.getAge(),
                p.getGender(),
                p.getContact(),
                p.getEmail(),
                p.getAddress(),
                p.getMedicalHistory(),
                p.getAllergies(),
                p.getEmergencyContact(),
                new java.sql.Date(p.getRegistrationDate().getTime()),
                p.getImage(),
                p.getId());
    }

    // Delete patient
    public int deletePatient(int id) {
        String sql = "DELETE FROM patient WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    // RowMapper inner class
    private static class PatientRowMapper implements RowMapper<Patient> {
        @Override
        public Patient mapRow(ResultSet rs, int rowNum) throws SQLException {
            Patient p = new Patient();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setAge(rs.getInt("age"));
            p.setGender(rs.getString("gender"));
            p.setContact(rs.getString("contact"));
            p.setEmail(rs.getString("email"));
            p.setAddress(rs.getString("address"));
            p.setMedicalHistory(rs.getString("medicalHistory"));
            p.setAllergies(rs.getString("allergies"));
            p.setEmergencyContact(rs.getString("emergencyContact"));
            p.setRegistrationDate(rs.getDate("registrationDate"));
            p.setImage(rs.getBytes("image"));
            return p;
        }
    }
}
