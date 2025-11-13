package com.springboot.webapp.ToDo.App;

import jakarta.validation.Valid;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

@Service
public class ToDoService {

    private static List<ToDo> toDos = new ArrayList<>();
    private static int todoCount = 0;

    static{
        toDos.add(new ToDo(++todoCount,"admin","Learn AWS 1",
                    LocalDate.now().plusYears(1),false));

        toDos.add(new ToDo(++todoCount,"jani","Learn DevOps 1",
                LocalDate.now().plusYears(2),true));

        toDos.add(new ToDo(++todoCount,"in28minutes","Learn K8s 1",
                LocalDate.now().plusYears(3),true));
    }

    public List<ToDo> findByUsername(String username) {
        return toDos.stream()
                .filter(todo -> todo.getUsername().equals(username))
                .toList();
    }

    public void addTodo(String username, String description, LocalDate targetDate, boolean done) {
        ToDo todo = new ToDo(++todoCount,username, description, targetDate, done);
        toDos.add(todo);
    }

    public void deleteToDo(int id) {
        Predicate<?super ToDo> predicate = t -> {
            return t.getId() == id;
        };
        toDos.removeIf(predicate);
    }

    public ToDo findToDoById(int id) {
        Predicate<?super ToDo> predicate =t -> t.getId() == id;
        ToDo todo = toDos.stream().filter(predicate).findFirst().get();
        return todo;
    }

    public void updateToDo(@Valid ToDo todo){
        deleteToDo(todo.getId());
        toDos.add(todo);
    }
}
