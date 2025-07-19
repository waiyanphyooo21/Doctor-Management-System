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
//    public String login(@RequestParam String username,
//                        @RequestParam String password,
//                        HttpSession session,
//                        Model model) {
//
//        User user = userDAO.findByUsernameAndPassword(username, password);
//
//        if (user != null) {
//            session.setAttribute("loggedInUser", user);
//
//            if ("doctor".equals(user.getRole())) {
//                return "redirect:/viewemp";
//            } else if ("patient".equals(user.getRole())) {
//                return "redirect:/patienthome";
//            }
//        }
//
//        model.addAttribute("error", "Invalid credentials");
//        return "login";
//    }
//
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/";
//    }
//
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
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        User user = userDAO.findByUsernameAndPassword(username, password);

        if (user != null) {
            session.setAttribute("loggedInUser", user);

            if ("doctor".equals(user.getRole())) {
                return "redirect:/doctorhome";  // changed here
            } else if ("patient".equals(user.getRole())) {
                return "redirect:/patienthome";
            }
        }

        model.addAttribute("error", "Invalid credentials");
        return "login";
    }

    @GetMapping("/doctorhome")
    public String doctorHome(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"doctor".equals(loggedInUser.getRole())) {
            return "redirect:/login";
        }
        model.addAttribute("doctorName", loggedInUser.getUsername());
        return "doctor";  // doctor.jsp view
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
