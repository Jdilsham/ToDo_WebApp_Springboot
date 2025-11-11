package com.springboot.webapp.ToDo.App;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ToDoController {

    private ToDoService toDoService;
    public ToDoController(ToDoService toDoService) {
        super();
        this.toDoService = toDoService;
    }

    @RequestMapping("list-totos")
    public String listAllTotos(ModelMap model) {
        List<ToDo> todos = toDoService.findByUsername("in28minutes");
        model.addAttribute("todos", todos);
        return "listTodos";
    }

}
