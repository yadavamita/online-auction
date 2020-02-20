package com.auction.dao;

import com.auction.model.Register;
import com.auction.model.User;

import java.util.List;

public interface UserDAO {
    public void saveUser(Register user);
    public List<User> getUsers();
    public User findByEmail(String email);

}
