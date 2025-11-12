package com.springboot.webapp.ToDo.App;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        model.addAttribute("todo",todo);
        return "addTodo";
    }

    @RequestMapping(value="add-todo", method = RequestMethod.POST)
    public String addNewTodoPage(ModelMap model, @Valid @ModelAttribute("todo") ToDo todo, BindingResult result) {
        if (result.hasErrors()) {
            return "addTodo";
        }
        String usrename = (String) model.get("usrename");
        toDoService.addTodo(usrename, todo.getDescription(), todo.getTargetDate(), false);
        return "redirect:list-totos";
    }

    @RequestMapping("delete-todo")
    public String deleteTotos(@RequestParam int id) {
        toDoService.deleteToDo(id);
        return "redirect:list-totos";
    }
}
