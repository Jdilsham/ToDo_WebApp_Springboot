package com.springboot.webapp.ToDo.App;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class ToDoService {

    private static List<ToDo> toDos = new ArrayList<>();

    static{
        toDos.add(new ToDo(1,"in28minutes","Learn AWS",
                    LocalDate.now().plusYears(1),false));

        toDos.add(new ToDo(2,"in28minutes","Learn DevOps",
                LocalDate.now().plusYears(2),true));

        toDos.add(new ToDo(3,"in28minutes","Learn K8s",
                LocalDate.now().plusYears(3),true));
    }

    public List<ToDo> findByUsername(String username) {
        return toDos;
    }
}
