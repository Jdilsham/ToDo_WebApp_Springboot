package com.springboot.webapp.ToDo;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
public class ToDoControllerJpa {

    @Autowired
    public ToDoControllerJpa(TodoRepository todoRepository) {

        this.todoRepository = todoRepository;
    }

    private TodoRepository todoRepository;

    @RequestMapping("list-todos")
    public String listAllTotos(ModelMap model,
                               org.springframework.security.core.Authentication authentication) {

        String username = authentication.getName();
        List<ToDo> todos = todoRepository.findByUsername(username);
        model.addAttribute("todos", todos);

        return "listTodos";
    }

    @GetMapping("add-todo")
    public String showNewTodoPage(ModelMap model,
                                  org.springframework.security.core.Authentication authentication) {

        String username = authentication.getName();
        ToDo todo = new ToDo(null, username, "", LocalDate.now(), false);

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
        todo.setUsername(username);
        todoRepository.save(todo);

        return "redirect:list-todos";
    }

    @RequestMapping("delete-todo")
    public String deleteTotos(@RequestParam int id) {
        todoRepository.deleteById(id);
        return "redirect:list-todos";
    }

    @GetMapping("update-todo")
    public String showUpdateTotos(@RequestParam int id, ModelMap model) {

        ToDo todo = todoRepository.findById(id).get();
        model.addAttribute("todo", todo);

        return "addTodo";
    }

    @PostMapping("update-todo")
    public String updateToDo(@Valid @ModelAttribute("todo") ToDo todo,  org.springframework.security.core.Authentication authentication,
                             BindingResult result) {

        if (result.hasErrors()) {
            return "addTodo";
        }
        String username = authentication.getName();
        todo.setUsername(username);
        todoRepository.save(todo);
        return "redirect:list-todos";
    }
}
