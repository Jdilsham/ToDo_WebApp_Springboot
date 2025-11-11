package com.springboot.webapp.ToDo.App;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {


    private AuthenticationService authentication;

    @Autowired
    public LoginController(AuthenticationService authentication) {
        super();
        this.authentication = authentication;
    }

    @RequestMapping(value= "login", method = RequestMethod.GET)
    public String gotoLoginPage() {
        return "login";
    }

    @RequestMapping(value= "login", method = RequestMethod.POST)
    public String gotoWelcomePage(@RequestParam String username, @RequestParam String password, ModelMap model) {

        if (authentication.authenticate(username, password)) {
            model.put("username", username);
            return "welcome";
        }else{
            model.put("error", "Wrong Username or Password");
            return "login";

        }
    }
}
