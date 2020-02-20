package com.auction.model;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "REGISTRATION")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userId")
    private int userId;

    @NotNull
    @Column(name = "public_name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "email_address", nullable = false)
    private String emailId;

    @NotNull
    @Column(name = "password", nullable = false)
    private String password;

    public User() {}

    public int getUserId() {
        return userId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmailId(String email_id) {
        this.emailId = email_id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public String getEmailId() {
        return emailId;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return "Registration{" +
                "user_id=" + userId +
                ", public_name='" + name + '\'' +
                ", email_id='" + emailId + '\'' +
                '}';
    }
}
