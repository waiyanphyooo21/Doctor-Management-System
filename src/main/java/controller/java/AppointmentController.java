package controller.java;

import bean.java.Appointment;
import bean.java.User;
import dao.java.AppointmentDAO;
import dao.java.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class AppointmentController {

    @Autowired
    private AppointmentDAO appointmentDAO;

    @Autowired
    private UserDAO userDAO;

    @GetMapping("/appointment")
    public String showAppointmentForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"patient".equals(user.getRole())) {
            return "redirect:/login";
        }

        model.addAttribute("appointment", new Appointment());

        model.addAttribute("doctors", userDAO.getAllDoctors());

        return "appointmentform";
    }

    @PostMapping("/appointment")
    public String saveAppointment(@ModelAttribute Appointment appointment, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"patient".equals(user.getRole())) {
            return "redirect:/login";
        }

        appointment.setPatientId(user.getId());
        appointment.setStatus("Scheduled");

        appointmentDAO.saveAppointment(appointment);

        return "redirect:/patientappointments";
    }

    @GetMapping("/patientappointments")
    public String listPatientAppointments(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"patient".equals(user.getRole())) {
            return "redirect:/login";
        }

        List<Appointment> appointments = appointmentDAO.getAppointmentsByPatientId(user.getId());
        List<User> doctors = userDAO.getAllDoctors();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        for (Appointment appt : appointments) {
            for (User doc : doctors) {
                if (doc.getId() == appt.getDoctorId()) {
                    appt.setDoctorName(doc.getName());
                    break;
                }
            }
            if (appt.getAppointmentDate() != null) {
                appt.setFormattedAppointmentDate(appt.getAppointmentDate().format(formatter));
            }
        }

        model.addAttribute("appointments", appointments);
        return "patientappointments";
    }

    @GetMapping("/doctor-schedule")
    public String doctorSchedule(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"doctor".equals(user.getRole())) {
            return "redirect:/login";
        }

        List<Appointment> appointments = appointmentDAO.getAppointmentsByDoctorId(user.getId());
        model.addAttribute("appointments", appointments);
        return "doctorschedule";
    }
}
