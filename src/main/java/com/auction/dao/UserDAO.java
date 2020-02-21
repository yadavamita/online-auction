package com.auction.dao;

import com.auction.model.User;

import java.util.List;

public interface UserDAO {
    public void saveUser(User user);
    public List<User> getUsers();
    public User findByEmail(String email);
}
