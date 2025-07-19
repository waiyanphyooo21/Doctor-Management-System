package controller.java;

import bean.java.Patient;
import dao.java.PatientDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

@Controller
public class PatientController {

    @Autowired
    private PatientDAO patientDAO;

    // Show add patient form
    @GetMapping("/add-patient")
    public String showAddPatientForm(Model model) {
        model.addAttribute("patient", new Patient());
        return "patientform";
    }

    // Save new patient with validation and image upload
    @PostMapping("/save-patient")
    public String savePatient(@Valid @ModelAttribute("patient") Patient patient,
                              BindingResult result,
                              @RequestParam("imageFile") MultipartFile imageFile,
                              Model model) {
        if (result.hasErrors()) {
            return "patientform";
        }
        try {
            if (!imageFile.isEmpty()) {
                patient.setImage(imageFile.getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Error uploading image");
            return "patientform";
        }

        patientDAO.addPatient(patient);
        return "redirect:/viewpatients";
    }

    // List all patients
    @GetMapping("/viewpatients")
    public String listPatients(Model model) {
        List<Patient> patients = patientDAO.getAllPatients();

        for (Patient p : patients) {
            if (p.getImage() != null) {
                String base64Image = Base64.getEncoder().encodeToString(p.getImage());
                p.setBase64Image(base64Image);
            }
        }

        model.addAttribute("patients", patients);
        return "viewpatients";
    }

    // Show edit patient form
    @GetMapping("/edit-patient/{id}")
    public String showEditPatientForm(@PathVariable("id") int id, Model model) {
        Patient patient = patientDAO.getPatientById(id);
        if (patient == null) {
            return "redirect:/viewpatients";
        }

        model.addAttribute("patient", patient);
        if (patient.getImage() != null) {
            String base64Image = Base64.getEncoder().encodeToString(patient.getImage());
            model.addAttribute("base64Image", base64Image);
        }

        return "patienteditform";
    }

    // Update patient with validation and image handling
    @PostMapping("/update-patient")
    public String updatePatient(@Valid @ModelAttribute("patient") Patient patient,
                                BindingResult result,
                                @RequestParam("imageFile") MultipartFile imageFile,
                                Model model) {
        if (result.hasErrors()) {
            Patient existingPatient = patientDAO.getPatientById(patient.getId());
            if (existingPatient != null && existingPatient.getImage() != null) {
                String base64Image = Base64.getEncoder().encodeToString(existingPatient.getImage());
                model.addAttribute("base64Image", base64Image);
            }
            return "patienteditform";
        }

        try {
            if (!imageFile.isEmpty()) {
                patient.setImage(imageFile.getBytes());
            } else {
                Patient existingPatient = patientDAO.getPatientById(patient.getId());
                if (existingPatient != null) {
                    patient.setImage(existingPatient.getImage());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Error uploading image");
            return "patienteditform";
        }

        patientDAO.updatePatient(patient);
        return "redirect:/viewpatients";
    }

    // Delete patient
    @GetMapping("/delete-patient/{id}")
    public String deletePatient(@PathVariable("id") int id) {
        patientDAO.deletePatient(id);
        return "redirect:/viewpatients";
    }

    // Search patients by name or ID (optional)
    @GetMapping("/search-patients")
    public String searchPatients(@RequestParam(required = false) String query, Model model) {
        List<Patient> patients;
        if (query != null && !query.isEmpty()) {
            try {
                int id = Integer.parseInt(query);
                Patient p = patientDAO.getPatientById(id);
                patients = p != null ? List.of(p) : Collections.emptyList();
            } catch (NumberFormatException e) {
                patients = patientDAO.searchPatientsByName(query);
            }
        } else {
            patients = patientDAO.getAllPatients();
        }

        for (Patient p : patients) {
            if (p.getImage() != null) {
                String base64Image = Base64.getEncoder().encodeToString(p.getImage());
                p.setBase64Image(base64Image);
            }
        }

        model.addAttribute("patients", patients);
        model.addAttribute("searchQuery", query);
        return "viewpatients";
    }
}
