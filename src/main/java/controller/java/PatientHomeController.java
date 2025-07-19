package controller.java;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class PatientHomeController {

    @GetMapping("/patienthome")
    public String patientHome(HttpSession session, Model model) {
        Object user = session.getAttribute("loggedInUser");
        if (user == null) {
            // Not logged in, redirect to login page
            return "redirect:/login";
        }

        model.addAttribute("user", user);
        return "patienthome"; // JSP page name patienthome.jsp
    }
}
