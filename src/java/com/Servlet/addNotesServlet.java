/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Servlet;

import com.user.Post;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import com.DAO.PostDAO;
import com.Db.DBConnect;
/**
 *
 * @author Anurag
 */
@WebServlet("/addNotesServlet")
public class addNotesServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        int uid = Integer.parseInt(request.getParameter("uid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        PostDAO dao = new PostDAO(DBConnect.getCon());
        
        boolean f = dao.addNotes(title, content, uid);
        if(f)
        {
            System.out.print("Sucessfully added");
            response.sendRedirect("showNotes.jsp");
        }
        else{
            System.out.print("Not added");
        }
        
    }
}
