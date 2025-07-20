package controller.java;

import java.io.IOException;

import java.util.Base64;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Min;

import bean.java.Appointment;
import bean.java.User;
import dao.java.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import dao.java.DoctorDAO;
import dao.java.AppointmentDAO;
import bean.java.Doctor;

@Controller
public class DoctorController {

    @Autowired
    private DoctorDAO doctorDAO;

    
    @GetMapping("/add-doctor")
    public String showAddDoctorForm(Model model) {
        model.addAttribute("doctor", new Doctor());
        return "empform";
    }
    
    //search doctor
    
 // Add these methods to your DoctorController

 // Search doctors by name or ID
 @GetMapping("/search-doctors")
 public String searchDoctors(@RequestParam(required = false) String query, Model model) {
     List<Doctor> doctors;
     if (query != null && !query.isEmpty()) {
         try {
             // Try to parse as ID first
             int id = Integer.parseInt(query);
             Doctor doctor = doctorDAO.getDoctorById(id);
             doctors = doctor != null ? List.of(doctor) : Collections.emptyList();
         } catch (NumberFormatException e) {
             // If not a number, search by name
             doctors = doctorDAO.searchDoctorsByName(query);
         }
     } else {
         doctors = doctorDAO.getAllDoctors();
     }
     
     // Convert images to base64
     for (Doctor doctor : doctors) {
         if (doctor.getImage() != null) {
             String base64Image = Base64.getEncoder().encodeToString(doctor.getImage());
             doctor.setBase64Image(base64Image);
         }
     }
     
     model.addAttribute("doctors", doctors);
     model.addAttribute("searchQuery", query);
     return "viewemp"; // Reuse the same view but with search functionality
 }

 // View doctor details
 @GetMapping("/doctor-details/{id}")
 public String viewDoctorDetails(@PathVariable("id") int id, Model model) {
     Doctor doctor = doctorDAO.getDoctorById(id);
     if (doctor == null) {
         return "redirect:/viewemp";
     }
     
     if (doctor.getImage() != null) {
         String base64Image = Base64.getEncoder().encodeToString(doctor.getImage());
         doctor.setBase64Image(base64Image);
     }
     
     model.addAttribute("doctor", doctor);
     return "doctordetails";
 }
    

    // Save new doctor with validation
    @PostMapping("/save-doctor")
    public String saveDoctor(@Valid @ModelAttribute("doctor") Doctor doctor,
                             BindingResult result,
                             @RequestParam("imageFile") MultipartFile imageFile,
                             Model model) {
        if (result.hasErrors()) {
            return "empform";
        }

        try {
            if (!imageFile.isEmpty()) {
                doctor.setImage(imageFile.getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Error uploading image");
            return "empform";
        }

        doctorDAO.saveDoctor(doctor);
        return "redirect:/viewemp";
    }

    // List all doctors
    @GetMapping("/viewemp")
    public String listDoctors(Model model) {
        List<Doctor> doctors = doctorDAO.getAllDoctors();

        for (Doctor doctor : doctors) {
            if (doctor.getImage() != null) {
                String base64Image = Base64.getEncoder().encodeToString(doctor.getImage());
                doctor.setBase64Image(base64Image);
            }
        }

        model.addAttribute("doctors", doctors);
        return "viewemp";
    }

    // Show form to edit doctor
    @GetMapping("/edit-doctor/{id}")
    public String showEditDoctorForm(@PathVariable("id") int id, Model model) {
        Doctor doctor = doctorDAO.getDoctorById(id);
        if (doctor == null) {
            return "redirect:/viewemp";
        }

        model.addAttribute("doctor", doctor);
        if (doctor.getImage() != null) {
            String base64Image = Base64.getEncoder().encodeToString(doctor.getImage());
            model.addAttribute("base64Image", base64Image);
        }

        return "empeditform";
    }

    // Update doctor with validation
    @PostMapping("/update-doctor")
    public String updateDoctor(@Valid @ModelAttribute("doctor") Doctor doctor,
                               BindingResult result,
                               @RequestParam("imageFile") MultipartFile imageFile,
                               Model model) {
        if (result.hasErrors()) {
            Doctor existingDoctor = doctorDAO.getDoctorById(doctor.getId());
            if (existingDoctor != null && existingDoctor.getImage() != null) {
                String base64Image = Base64.getEncoder().encodeToString(existingDoctor.getImage());
                model.addAttribute("base64Image", base64Image);
            }
            return "empeditform";
        }

        try {
            if (!imageFile.isEmpty()) {
                doctor.setImage(imageFile.getBytes());
            } else {
                Doctor existingDoctor = doctorDAO.getDoctorById(doctor.getId());
                if (existingDoctor != null) {
                    doctor.setImage(existingDoctor.getImage());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Error uploading image");
            return "empeditform";
        }

        doctorDAO.updateDoctor(doctor);
        return "redirect:/viewemp";
    }

    // Delete doctor
    @GetMapping("/delete-doctor/{id}")
    public String deleteDoctor(@PathVariable("id") int id) {
        doctorDAO.deleteDoctor(id);
        return "redirect:/viewemp";
    }

//@Autowired
//private AppointmentDAO appointmentDAO;  // Inject AppointmentDAO here
//
//    @GetMapping("/doctorSchedule")
//    public String doctorSchedule(HttpSession session, Model model) {
//        User loggedInUser = (User) session.getAttribute("loggedInUser");
//        if (loggedInUser == null || !"doctor".equals(loggedInUser.getRole())) {
//            return "redirect:/login";
//        }
//
//        model.addAttribute("doctorName", loggedInUser.getName());  // use name instead of email
//
//        // Fetch appointments for this doctor
//        List<Appointment> appointments = appointmentDAO.getAppointmentsByDoctorId(loggedInUser.getId());
//        model.addAttribute("appointments", appointments);
//
//        return "doctorSchedule";  // Your JSP page that will display the schedule
//    }

    @Autowired
    private AppointmentDAO appointmentDAO;

    @Autowired
    private UserDAO userDAO;

    @GetMapping("/doctorSchedule")
    public String doctorSchedule(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"doctor".equals(loggedInUser.getRole())) {
            return "redirect:/login";
        }

        model.addAttribute("doctorName", loggedInUser.getName());

        // Fetch appointments
        List<Appointment> appointments = appointmentDAO.getAppointmentsByDoctorId(loggedInUser.getId());

        for (Appointment appointment : appointments) {
            // ✅ Set patient name
            User patient = userDAO.getUserById(appointment.getPatientId());
            if (patient != null) {
                appointment.setPatientName(patient.getName());
            } else {
                appointment.setPatientName("Unknown");
            }

            // ✅ Set formatted date
            if (appointment.getAppointmentDate() != null) {
                String formattedDate = appointment.getAppointmentDate()
                        .format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
                appointment.setFormattedAppointmentDate(formattedDate);
            } else {
                appointment.setFormattedAppointmentDate("N/A");
            }
        }

        model.addAttribute("appointments", appointments);
        return "doctorSchedule";
    }




    @Min(value = 0, message = "Salary must be a positive number")
    private double salary;

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }


}
