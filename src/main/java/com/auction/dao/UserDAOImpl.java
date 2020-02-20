package com.auction.dao;
import com.auction.model.Register;
import com.auction.model.User;
import com.auction.utility.MD5;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.security.*;

import java.util.List;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void saveUser(Register registerUser) {
        User user=new User();
        user.setEmailId(registerUser.getEmail());
        user.setName(registerUser.getName());
        user.setPassword(registerUser.getPassword());

        getSession().save(user);
    }

    @Override
    public List<User> getUsers() {
        Criteria criteria = getSession().createCriteria(User.class);
        return (List) criteria.list();
    }

    @Override
    public User findByEmail(String email) {
        Criteria criteria = getSession().createCriteria(User.class);
        Object obj = criteria.add(Restrictions.eq("emailId", email)).uniqueResult();
        return (User) obj;
    }
}
