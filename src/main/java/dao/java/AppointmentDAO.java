//package dao.java;
//
//import bean.java.Appointment;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.RowMapper;
//import org.springframework.stereotype.Repository;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.List;
//
//@Repository
//public class AppointmentDAO {
//
//    @Autowired
//    private JdbcTemplate jdbcTemplate;
//
//    // Save new appointment
//    public int saveAppointment(Appointment appointment) {
//        String sql = "INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES (?, ?, ?, ?, ?)";
//        return jdbcTemplate.update(sql,
//                appointment.getPatientId(),
//                appointment.getDoctorId(),
//                new java.sql.Timestamp(appointment.getAppointmentDate().getTime()),
//                appointment.getStatus(),
//                appointment.getNotes());
//    }
//
//    // Get appointments for a doctor
//    public List<Appointment> getAppointmentsByDoctorId(int doctorId) {
//        String sql = "SELECT * FROM appointments WHERE doctor_id = ? ORDER BY appointment_date ASC";
//        return jdbcTemplate.query(sql, new AppointmentRowMapper(), doctorId);
//    }
//
//    // Get appointments for a patient
//    public List<Appointment> getAppointmentsByPatientId(int patientId) {
//        String sql = "SELECT * FROM appointments WHERE patient_id = ? ORDER BY appointment_date ASC";
//        return jdbcTemplate.query(sql, new AppointmentRowMapper(), patientId);
//    }
//
//    // Inner class to map ResultSet to Appointment
//    private static class AppointmentRowMapper implements RowMapper<Appointment> {
//        @Override
//        public Appointment mapRow(ResultSet rs, int rowNum) throws SQLException {
//            Appointment appointment = new Appointment();
//            appointment.setId(rs.getInt("id"));
//            appointment.setPatientId(rs.getInt("patient_id"));
//            appointment.setDoctorId(rs.getInt("doctor_id"));
//            appointment.setAppointmentDate(rs.getTimestamp("appointment_date"));
//            appointment.setStatus(rs.getString("status"));
//            appointment.setNotes(rs.getString("notes"));
//            return appointment;
//        }
//    }
//}

package dao.java;

import bean.java.Appointment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class AppointmentDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Save new appointment
    public int saveAppointment(Appointment appointment) {
        String sql = "INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                appointment.getPatientId(),
                appointment.getDoctorId(),
                Timestamp.valueOf(appointment.getAppointmentDate()),  // Convert LocalDateTime -> Timestamp
                appointment.getStatus(),
                appointment.getNotes());
    }

    // Get appointments for a doctor
    public List<Appointment> getAppointmentsByDoctorId(int doctorId) {
        String sql = "SELECT * FROM appointments WHERE doctor_id = ? ORDER BY appointment_date ASC";
        return jdbcTemplate.query(sql, new AppointmentRowMapper(), doctorId);
    }

    // Get appointments for a patient
    public List<Appointment> getAppointmentsByPatientId(int patientId) {
        String sql = "SELECT * FROM appointments WHERE patient_id = ? ORDER BY appointment_date ASC";
        return jdbcTemplate.query(sql, new AppointmentRowMapper(), patientId);
    }

    // Inner class to map ResultSet to Appointment
    private static class AppointmentRowMapper implements RowMapper<Appointment> {
        @Override
        public Appointment mapRow(ResultSet rs, int rowNum) throws SQLException {
            Appointment appointment = new Appointment();
            appointment.setId(rs.getInt("id"));
            appointment.setPatientId(rs.getInt("patient_id"));
            appointment.setDoctorId(rs.getInt("doctor_id"));

            Timestamp ts = rs.getTimestamp("appointment_date");
            if (ts != null) {
                appointment.setAppointmentDate(ts.toLocalDateTime()); // Convert Timestamp -> LocalDateTime
            }

            appointment.setStatus(rs.getString("status"));
            appointment.setNotes(rs.getString("notes"));
            return appointment;
        }
    }
}
