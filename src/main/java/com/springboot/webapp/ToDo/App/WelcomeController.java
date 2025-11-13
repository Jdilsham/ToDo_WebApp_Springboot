package com.springboot.webapp.ToDo.App;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("username")

public class WelcomeController {

    @GetMapping("/welcome")
    public String gotoWelcomePage(ModelMap model) {
        model.put("username", "admin");
        return "welcome";
    }
}
