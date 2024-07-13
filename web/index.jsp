<%-- 
    Document   : index
    Created on : 24-Feb-2024, 12:11:15 am
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, com.Db.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .back-img{
                background: url('img/exam.jpeg');
                width: 100%;
                height: 100vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navBar.jsp" %>
        <%
            Connection conn = DBConnect.getCon();
            System.out.print(conn);
        %>
        <div class='container-fluid back-img'>
            <div class="text-center">
                <h1 class='text-white'><i class="fa fa-home" aria-hidden="true"></i>E-Notes save your notes</h1>
                <a href='login.jsp' class="btn btn-light m-1" type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Login</a>
                <a href='register.jsp' class="btn btn-light m-1" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
            </div>
        </div>
        <%@include file="all_component/footer.jsp"%>
    </body>
</html>
