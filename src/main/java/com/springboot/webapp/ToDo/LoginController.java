package com.springboot.webapp.ToDo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginPage(ModelMap model,
                                @RequestParam(value = "error", required = false) String error) {
        if (error != null) {
            model.put("errorMessage", "Invalid username or password!");
        }
        return "login";
    }

}
