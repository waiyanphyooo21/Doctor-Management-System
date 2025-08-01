package controller.java;

import java.io.IOException;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Min;

import bean.java.Doctor;
import bean.java.User;
import dao.java.DoctorDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/staff")
public class StaffController {

    @Autowired
    private DoctorDAO doctorDAO;

    @GetMapping("/doctors")
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

    @GetMapping("/doctors/add")
    public String showAddDoctorForm(Model model) {
        model.addAttribute("doctor", new Doctor());
        return "empform";
    }

    @PostMapping("/doctors/save")
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
        return "redirect:/staff/doctors";
    }

    @GetMapping("/doctors/edit/{id}")
    public String showEditDoctorForm(@PathVariable("id") int id, Model model) {
        Doctor doctor = doctorDAO.getDoctorById(id);
        if (doctor == null) {
            return "redirect:/staff/doctors";
        }

        model.addAttribute("doctor", doctor);
        if (doctor.getImage() != null) {
            String base64Image = Base64.getEncoder().encodeToString(doctor.getImage());
            model.addAttribute("base64Image", base64Image);
        }

        return "empeditform";
    }

    @PostMapping("/doctors/update")
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
        return "redirect:/staff/doctors";
    }

    @GetMapping("/doctors/delete/{id}")
    public String deleteDoctor(@PathVariable("id") int id) {
        doctorDAO.deleteDoctor(id);
        return "redirect:/staff/doctors";
    }

//    @GetMapping("")
//    public String staffHome(HttpSession session, Model model) {
//        User loggedInUser = (User) session.getAttribute("loggedInUser");
//        if (loggedInUser == null || !"staff".equals(loggedInUser.getRole())) {
//            return "redirect:/login";
//        }
//        model.addAttribute("staffName", loggedInUser.getName());
//        return "staff";
//    }

    @GetMapping("")
    public String staffHome(HttpSession session, Model model) {
        // returns staff.jsp
        return "staff";
    }

    @GetMapping("/doctors/search")
    public String searchDoctors(@RequestParam(required = false) String query, Model model) {
        List<Doctor> doctors;
        if (query != null && !query.isEmpty()) {
            try {
                int id = Integer.parseInt(query);
                Doctor doctor = doctorDAO.getDoctorById(id);
                doctors = doctor != null ? List.of(doctor) : Collections.emptyList();
            } catch (NumberFormatException e) {
                doctors = doctorDAO.searchDoctorsByName(query);
            }
        } else {
            doctors = doctorDAO.getAllDoctors();
        }

        for (Doctor doctor : doctors) {
            if (doctor.getImage() != null) {
                String base64Image = Base64.getEncoder().encodeToString(doctor.getImage());
                doctor.setBase64Image(base64Image);
            }
        }

        model.addAttribute("doctors", doctors);
        model.addAttribute("searchQuery", query);
        return "viewemp";
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
