/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user;

/**
 *
 * @author Anurag
 */

import java.util.Date;

public class Post {
    private int id;
    private String title;
    private String content;
    private Date date;
    private UserDetails user;
    
    public Post(int id, String title, String content, Date date, UserDetails user)
    {
        super();
        this.id = id;
        this.title = title;
        this.content = content;
        this.date = date;
        this.user = user;
    }
    
    public Post()
    {
        super();
    }
    
    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id = id;
    }
    
    public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }
    
    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    
    public Date getDate()
    {
        return date;
    }
    public void setDate(Date date)
    {
        this.date = date;
    }
    
    public UserDetails getUser()
    {
        return user;
    }
    public void setUser(UserDetails user)
    {
        this.user = user;
    }
            
}
