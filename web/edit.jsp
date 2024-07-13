<%-- 
    Document   : edit
    Created on : 23-Mar-2024, 5:38:51 pm
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.DAO.PostDAO, com.Db.DBConnect, java.util.List, com.user.Post " %>
<%
    UserDetails user1 = (UserDetails)session.getAttribute("userD");
    if(user1==null)
    {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please login...");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Notes</title>
        <%@include file="all_component/allcss.jsp"%>
    </head>
    <body>
        <%
            Integer noteid = Integer.parseInt(request.getParameter("note_id"));
            PostDAO post = new PostDAO(DBConnect.getCon());
            Post p = post.getDataById(noteid);
        %>
        <div class="container-fluid">
            <%@include file="all_component/navBar.jsp"%>
            <h1 class="text-center">Edit Your Notes</h1>
            <div class="container">
                <div class="row">
                <div class="col-md-12">
                    <form action="NoteEditServlet" method="POST">
                        <input type="hidden" id="noteid" name="noteid" value="<%= noteid%>">
                        <div class="mb-3">
                            
                            
                          <label for="exampleInputEmail1" class="form-label">Enter Title</label>
                          <input type="text" class="form-control" id="title" aria-describedby="emailHelp" name="title" required="required"
                                 value="<%= p.getTitle()%>">
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputEmail">Enter Content</label>
                            <textarea rows="9" cols="" class="form-control" name="content" id="content" required="required"><%=p.getContent()%></textarea>
                        </div>
                        <div class="container text-center m-2">
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </div>
                      </form>
                </div>
            </div>
            </div>
        </div>
            <%@include file="all_component/footer.jsp" %>
    </body>
</html>
