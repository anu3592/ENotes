<%-- 
    Document   : register
    Created on : 23-Feb-2024, 11:13:58 pm
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
                            <h4>Registration</h4>
                        </div>
                        
                        <%
                            String regMsg = (String) session.getAttribute("reg-success");
                            if(regMsg !=null)
                            {%>
                               
                            <div class="alert alert-success" role="alert"><%=regMsg%></div>
                           <%     
                               session.removeAttribute("reg-success");
                            }
                        %>
                        
                        <%
                            String failedMsg = (String) session.getAttribute("failed-msg");
                            if(failedMsg !=null)
                            {%>
                               
                            <div class="alert alert-danger" role="alert"><%=failedMsg%></div>
                           <%     
                               session.removeAttribute("failed-msg");
                            }
                        %>
                        <div class='card-body'>
                            <form action="UserServlet" method="POST">
                                <div class="mb-3">
                              <label for="exampleInputEmail1" class="form-label" >Full Name</label>
                              <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="fname">
                              
                            </div>
                            <div class="mb-3">
                              <label for="exampleInputEmail1" class="form-label" >Email address</label>
                              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail">
                          
                            </div>
                            <div class="mb-3">
                              <label for="exampleInputPassword1" class="form-label" >Password</label>
                              <input type="password" class="form-control" id="exampleInputPassword1" name="upassword">
                            </div>
                            <button type="submit" class="btn btn-primary">Register</button>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file='all_component/footer.jsp' %>
    </body>
</html>
