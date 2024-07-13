<%-- 
    Document   : home
    Created on : 08-Mar-2024, 12:49:03 am
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserDetails user2 = (UserDetails)session.getAttribute("userD");
    if(user2==null)
    {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please login...");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <div class="container-fluid p-0">
            <%@include file="all_component/navBar.jsp" %>
            <div class="card py-5">
                <div class="card-body text-center">
                    <img alt="" src="img/notes.png" class="img-fluid mx-auto" style="max-width: 300px;">
                    <h1>START TAKING YOUR NOTES</h1>
                    <a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
                </div>
            </div>
        </div>
            <%@include file="all_component/footer.jsp" %>
    </body>
</html>
