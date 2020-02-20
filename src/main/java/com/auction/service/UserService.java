package com.auction.service;

import com.auction.model.Register;
import com.auction.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {
    public void saveUser(Register user);
    public List<User> getUsers();
    public User findUserByEmail(String email);
    
}
