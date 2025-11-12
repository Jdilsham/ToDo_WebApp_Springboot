package com.springboot.webapp.ToDo.App;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
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

    @RequestMapping(value="add-todo", method = RequestMethod.GET)
    public String showNewTodoPage(ModelMap model) {
        String usrename = (String) model.get("usrename");
        ToDo todo = new ToDo(0,usrename,"",LocalDate.now(),false);
        model.put("todo",todo);
        return "addTodo";
    }

    @RequestMapping(value="add-todo", method = RequestMethod.POST)
    public String addNewTodoPage(ModelMap model,ToDo todo) {
        String usrename = (String) model.get("usrename");
        toDoService.addTodo(usrename, todo.getDescription(), todo.getTargetDate(), false);
        return "redirect:list-totos";
    }
}
