//package controller.java;
//
//import bean.java.User;
//import dao.java.UserDAO;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpSession;
//
//@Controller
//public class LoginController {
//
//    @Autowired
//    private UserDAO userDAO;
//
//    @PostMapping("/login")
//    public String login(@RequestParam String email,
//                        @RequestParam String password,
//                        HttpSession session,
//                        Model model) {
//
//        User user = userDAO.findByUsernameAndPassword(email, password);
//
//        if (user != null) {
//            session.setAttribute("loggedInUser", user);
//
//            if ("doctor".equals(user.getRole())) {
//                return "redirect:/doctorhome";  // changed here
//            } else if ("patient".equals(user.getRole())) {
//                return "redirect:/patienthome";
//            }
//        }
//
//        model.addAttribute("error", "Invalid credentials");
//        return "login";
//    }
//
//    @GetMapping("/doctorhome")
//    public String doctorHome(HttpSession session, Model model) {
//        User loggedInUser = (User) session.getAttribute("loggedInUser");
//        if (loggedInUser == null || !"doctor".equals(loggedInUser.getRole())) {
//            return "redirect:/login";
//        }
//        model.addAttribute("doctorName", loggedInUser.getName());
//        return "doctor";  // doctor.jsp view
//    }
//
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/";
//    }
//}

package controller.java;

import bean.java.User;
import dao.java.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserDAO userDAO;

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        User user = userDAO.findByUsernameAndPassword(email, password);

        if (user != null) {
            session.setAttribute("loggedInUser", user);

            switch(user.getRole()) {
                case "doctor":
                    return "redirect:/doctorhome";    // doctor dashboard
                case "patient":
                    return "redirect:/patienthome";   // patient dashboard
                case "staff":
                    return "redirect:/staff";  // staff dashboard (create this)
                default:
                    model.addAttribute("error", "Role not supported");
                    return "redirect:/index.jsp";
            }
        }

        model.addAttribute("error", "Invalid credentials");
        return "forward:/index.jsp";  // use forward to keep model attributes

    }

    @GetMapping("/doctorhome")
    public String doctorHome(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"doctor".equals(loggedInUser.getRole())) {
            return "redirect:/login";
        }
        model.addAttribute("doctorName", loggedInUser.getName());
        return "doctor";  // doctor.jsp view
    }

//    @GetMapping("/patienthome")
//    public String patientHome(HttpSession session, Model model) {
//        User loggedInUser = (User) session.getAttribute("loggedInUser");
//        if (loggedInUser == null || !"patient".equals(loggedInUser.getRole())) {
//            return "redirect:/login";
//        }
//        model.addAttribute("patientName", loggedInUser.getName());
//        return "patient";  // patient.jsp view
//    }

    // Staff dashboard page handler
//    @GetMapping("/staff")
//    public String staffDashboard(HttpSession session, Model model) {
//        User loggedInUser = (User) session.getAttribute("loggedInUser");
//        if (loggedInUser == null || !"staff".equals(loggedInUser.getRole())) {
//            return "redirect:/login";
//        }
//        model.addAttribute("staffName", loggedInUser.getName());
//        return "staff";  // staffDashboard.jsp view (create this)
//    }

    //new


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
