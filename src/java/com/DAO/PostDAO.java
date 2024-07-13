/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.user.Post;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
/**
 *
 * @author Anurag
 */
public class PostDAO {
    private Connection conn;
    
    public PostDAO(Connection conn)
    {
        super();
        this.conn = conn;
    }
    
    public boolean addNotes(String t, String c, int id)
    {
        boolean f = false;
        try{
            String query = "insert into post(title,content,uid) values (?,?,?)";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, t);
            psmt.setString(2, c);
            psmt.setInt(3, id);
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
    
    public List<Post> getData(int id)
    {
        List<Post> list = new ArrayList<Post>();
        Post po = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String qu ="select *from post where uid=? order by id DESC";
            PreparedStatement ps = conn.prepareStatement(qu);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                po = new Post();
                po.setId(rs.getInt(1));
                po.setTitle(rs.getString(2));
                po.setContent(rs.getString(3));
                po.setDate(rs.getTimestamp(4));
                list.add(po);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getDataById(int noteId)
    {
        Post p = null;
        try{
            String q = "select * from post where id=?";
            
            PreparedStatement ps = conn.prepareStatement(q);
            ps.setInt(1,noteId);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                p = new Post();
                p.setId(rs.getInt(1));
                p.setTitle(rs.getString(2));
                p.setContent(rs.getString(3));
                
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return p;
    }
    
    public boolean PostUpdate(int nid, String ti, String co)
    {
        boolean f = false;
        try{
            String q = "update post set title=?, content=? where id=?";
            PreparedStatement ps = conn.prepareStatement(q);
            ps.setString(1, ti);
            ps.setString(2,co);
            ps.setInt(3, nid);
            int i = ps.executeUpdate();
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
    
    public boolean DeleteNotes(int nid)
    {
        boolean f = false;
        try{
            String qu = "delete from post where id=?";
            PreparedStatement ps = conn.prepareStatement(qu);
            ps.setInt(1,nid);
            int x = ps.executeUpdate();
            if(x==1)
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
}
