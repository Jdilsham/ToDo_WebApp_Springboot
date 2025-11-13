package com.springboot.webapp.ToDo.App;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.List;

@Controller
public class ToDoController {

    private ToDoService toDoService;

    @Autowired
    public ToDoController(ToDoService toDoService) {
        this.toDoService = toDoService;
    }

    @RequestMapping("list-totos")
    public String listAllTotos(ModelMap model,
                               org.springframework.security.core.Authentication authentication) {

        String username = authentication.getName();
        List<ToDo> todos = toDoService.findByUsername(username);
        model.addAttribute("todos", todos);

        return "listTodos";
    }

    @GetMapping("add-todo")
    public String showNewTodoPage(ModelMap model,
                                  org.springframework.security.core.Authentication authentication) {

        String username = authentication.getName();
        ToDo todo = new ToDo(0, username, "", LocalDate.now(), false);

        model.addAttribute("todo", todo);
        return "addTodo";
    }

    @PostMapping("add-todo")
    public String addNewTodoPage(@Valid @ModelAttribute("todo") ToDo todo,
                                 BindingResult result,
                                 org.springframework.security.core.Authentication authentication) {

        if (result.hasErrors()) {
            return "addTodo";
        }

        String username = authentication.getName();
        toDoService.addTodo(username, todo.getDescription(), todo.getTargetDate(), false);

        return "redirect:list-totos";
    }

    @RequestMapping("delete-todo")
    public String deleteTotos(@RequestParam int id) {
        toDoService.deleteToDo(id);
        return "redirect:list-totos";
    }

    @GetMapping("update-todo")
    public String showUpdateTotos(@RequestParam int id, ModelMap model) {

        ToDo todo = toDoService.findToDoById(id);
        model.addAttribute("todo", todo);

        return "addTodo";
    }

    @PostMapping("update-todo")
    public String updateToDo(@Valid @ModelAttribute("todo") ToDo todo,
                             BindingResult result) {

        if (result.hasErrors()) {
            return "addTodo";
        }

        toDoService.updateToDo(todo);
        return "redirect:list-totos";
    }
}
