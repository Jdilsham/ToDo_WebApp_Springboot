package com.springboot.webapp.ToDo.App;

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
        toDos.add(new ToDo(++todoCount,"in28minutes","Learn AWS",
                    LocalDate.now().plusYears(1),false));

        toDos.add(new ToDo(++todoCount,"in28minutes","Learn DevOps",
                LocalDate.now().plusYears(2),true));

        toDos.add(new ToDo(++todoCount,"in28minutes","Learn K8s",
                LocalDate.now().plusYears(3),true));
    }

    public List<ToDo> findByUsername(String username) {
        return toDos;
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
}
