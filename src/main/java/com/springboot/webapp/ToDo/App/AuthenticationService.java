package com.springboot.webapp.ToDo.App;

import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {

    public boolean authenticate(String username, String password) {
        boolean user = username.equalsIgnoreCase("aaa");
        boolean pass = password.equalsIgnoreCase("aaa");

        return user && pass;
    }
}
