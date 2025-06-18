package com.babu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }
    @GetMapping("/resume")
    public String resume() {
        return "error";
    }

    @GetMapping("/skills")
    public String skills() {
        return "skills";
    }

    @GetMapping("/projects")
    public String projects() {
        return "projects";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }
    @GetMapping("/login")
    public String loginPage() {
        return "login"; // This will resolve to login.jsp
    }

    @PostMapping("/login")
    public String handleLogin(
        @RequestParam String username,
        @RequestParam String password,
        HttpSession session,
        RedirectAttributes redirectAttributes) {
        
        if ("ritika".equals(username) && "simpleritika".equals(password)) {
            session.setAttribute("authenticated", true);
            return "redirect:/?edit=true";
        } else {
            redirectAttributes.addAttribute("error", true);
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}

