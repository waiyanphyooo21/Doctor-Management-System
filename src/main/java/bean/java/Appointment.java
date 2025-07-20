package bean.java;

import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

public class Appointment {
    private int id;
    private int patientId;
    private int doctorId;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime appointmentDate;

    private String status;
    private String notes;

    // New fields for display only
    private String doctorName;
    private String formattedAppointmentDate;

    // getters and setters

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getPatientId() { return patientId; }
    public void setPatientId(int patientId) { this.patientId = patientId; }

    public int getDoctorId() { return doctorId; }
    public void setDoctorId(int doctorId) { this.doctorId = doctorId; }

    public LocalDateTime getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(LocalDateTime appointmentDate) { this.appointmentDate = appointmentDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    // New getter/setter for doctorName
    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

    // New getter/setter for formattedAppointmentDate
    public String getFormattedAppointmentDate() { return formattedAppointmentDate; }
    public void setFormattedAppointmentDate(String formattedAppointmentDate) { this.formattedAppointmentDate = formattedAppointmentDate; }
}
