package com.springboot.webapp.ToDo.App;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.swing.*;

@Controller
public class LoginController {

    @RequestMapping("login")
    public String login(@RequestParam String name, ModelMap model) {
        model.put("name",name);
        return "login";
    }
}
