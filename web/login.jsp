<%-- 
    Document   : login
    Created on : 23-Feb-2024, 11:13:23 pm
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navBar.jsp" %>
        <div class="container-fluid div-color">
            <div class='row'>
                <div class='col-md-4 offset-md-4'>
                    <div class='card mt-4'>
                        <div class='card-header text-center text-white bg-custom'>
                            <i class="fa fa-user-plus  fa-3x" aria-hidden="true"></i>
                            <h4>Login</h4>
                        </div>
                        <%
                            String failedMsg = (String) session.getAttribute("login-failed");
                            if(failedMsg !=null)
                            {%>
                               
                            <div class="alert alert-danger" role="alert"><%=failedMsg%></div>
                           <%     
                               session.removeAttribute("login-failed");
                            }
                        %>
                        
                        <%
                            String withoutLogin = (String) session.getAttribute("login-error");
                            if(withoutLogin!=null)
                            {%>
                                <div class="alert alert-danger" role="alert"><%=withoutLogin%></div>
                                
                            <%
                                session.removeAttribute("login-error");
                                }
                        %>
                            
                        <%
                            String outMsg = (String)session.getAttribute("logoutMsg");
                            if(outMsg!=null)
                            {%>
                                <div class="alert alert-success" role="alert"><%=outMsg%></div>
                            <%
                                session.removeAttribute("logoutMsg");
                                }
                        %>
                        <div class='card-body'>
                            <form action="loginServlet" method="POST">
                            <div class="mb-3">
                              <label for="exampleInputEmail1" class="form-label">Email address</label>
                              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail">
                          
                            </div>
                            <div class="mb-3">
                              <label for="exampleInputPassword1" class="form-label">Password</label>
                              <input type="password" class="form-control" id="exampleInputPassword1" name="upassword">
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file='all_component/footer.jsp' %>
    </body>
</html>
