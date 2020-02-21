package com.auction.service;

import com.auction.model.User;

import java.util.List;

public interface UserService {
    public void saveUser(User user);
    public List<User> getUsers();
    public User findUserByEmail(String email);
}
