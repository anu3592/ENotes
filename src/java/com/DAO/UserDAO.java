/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

/**
 *
 * @author Anurag
 */
import com.user.UserDetails;
import java.sql.*;

public class UserDAO {
    Connection conn;
    public UserDAO(Connection conn)
    {
        this.conn = conn;
    }
    
    public boolean addUser(UserDetails us)
    {
        boolean f = false;
        try{
            String query = "insert into users(name,email,password) values(?,?,?)";
            
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1,us.getName());
            psmt.setString(2,us.getEmail());
            psmt.setString(3,us.getPassword());
            int i = psmt.executeUpdate();
            if(i==1)
            {
                f = true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public UserDetails loginUser(UserDetails us)
    {
        boolean f = false;
        UserDetails user = null;
        try{
            String query = "select * from users where email=? and password=?";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1,us.getEmail());
            psmt.setString(2, us.getPassword());
            ResultSet rs = psmt.executeQuery();
            if(rs.next())
            {
                user = new UserDetails();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }
}
