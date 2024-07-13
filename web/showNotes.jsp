<%-- 
    Document   : showNotes
    Created on : 10-Mar-2024, 9:48:30 pm
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.DAO.PostDAO, com.Db.DBConnect, java.util.List, com.user.Post " %>
<%
    UserDetails user3 = (UserDetails)session.getAttribute("userD");
    if(user3==null)
    {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please login...");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Notes</title>
        <%@include file="all_component/allcss.jsp"%>
    </head>
    <body>
        <%@include file="all_component/navBar.jsp"%>
        <%
            String updateMsg = (String)request.getAttribute("updateMsg");
            if(updateMsg!=null)
            {%>
            <div class="alert alert-success" role="alert"><%= updateMsg%></div>
            <%
                session.removeAttribute("updateMsg");
                }
        %>
        
        <%
            String wrongMsg = (String)request.getAttribute("wrongMsg");
            if(wrongMsg!=null)
            {%>
            <div class="alert alert-danger" role="alert"><%= wrongMsg%></div>
            <%
                session.removeAttribute("wrongMsg");
                }
        %>
        <div class="container">
            <h2 class="text-center">All Notes:</h2>
            
            <div class="row">
                <div class="col-md-12">
                    <%
                        if(user3!=null)
                        {
                            PostDAO ob = new PostDAO(DBConnect.getCon());
                            List<Post> post = ob.getData(user3.getId());
                            for(Post po:post)
                            {%>
                                <div class="card mt-3">
                        <img alt="" src="img/notes.png" class="card-img-top mt-2 mx-auto"
                             style="max-width:100px;">
                        
                        <div class="card-body p-4">
                            <h5 class="card-title"><%=po.getTitle()%></h5>
                            <p><%=po.getContent()%></p>
                            
                            <p>
                                <b class="text-success">Published By: <%=user3.getName()%></b></br><b
                                    class="text-primary"></b>
                            </p>
                            
                            <p>
                                <b class="text-success">Published Date: <%=po.getDate()%></b></br><b
                                    class="text-success"></b>
                            </p>
                                            
                            <div class="container text-center mt-2">
                                <a href="deleteServlet?note_id=<%=po.getId()%>" class="btn btn-danger">Delete</a>
                                
                                <a href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-primary">Edit</a>
                            </div>
                        </div>
                    </div>
                            <%}
                        }
                    %>
                    
                </div>
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
