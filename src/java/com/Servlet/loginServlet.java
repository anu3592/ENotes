/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Servlet;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.user.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Anurag
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword"); 
        
        UserDetails us = new UserDetails();
        us.setEmail(email);
        us.setPassword(password);
        UserDAO dao = new UserDAO(DBConnect.getCon());
        UserDetails user = dao.loginUser(us);
        if(user!=null)
        {
            HttpSession session = request.getSession();
            session.setAttribute("userD", user);
            response.sendRedirect("home.jsp");
        }
        else{
            HttpSession session = request.getSession();
            session.setAttribute("login-failed", "Invalid Username and Password");
            response.sendRedirect("login.jsp");
        }
    }
}
