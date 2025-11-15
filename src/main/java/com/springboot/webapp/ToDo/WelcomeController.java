package com.springboot.webapp.ToDo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

    @GetMapping("/welcome")
    public String gotoWelcomePage(ModelMap model,
                                  org.springframework.security.core.Authentication authentication) {

        String username = authentication.getName();   // logged-in user
        model.put("username", username);

        return "welcome";
    }
}
