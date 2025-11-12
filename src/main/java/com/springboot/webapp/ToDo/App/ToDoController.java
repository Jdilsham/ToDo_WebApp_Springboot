package com.springboot.webapp.ToDo.App;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@SessionAttributes("username")
public class ToDoController {

    private ToDoService toDoService;

    @Autowired
    public ToDoController(ToDoService toDoService) {
        this.toDoService = toDoService;
    }

    @RequestMapping("list-totos")
    public String listAllTotos(ModelMap model) {
        List<ToDo> todos = toDoService.findByUsername("in28minutes");
        model.addAttribute("todos", todos);
        return "listTodos";
    }

}
