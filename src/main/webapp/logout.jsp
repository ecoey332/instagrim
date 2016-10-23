<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <div class="Container">
        <header>
            <h1>InstaGrim</h1>
            <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <ul>
                <%
                        
                        session.setAttribute("LoggedIn",null);
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg == null) {
                            System.out.println("No one is logged in");
                    %>
                    <li><a href="/Instagrim">Home</a></li>
                    <li><a href="register.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <%
                        }
                        else if(lg!=null){                 
                        if (lg.getloggedin()) {
                    %>
                <li><a href="/Instagrim">Home</a></li>
                <li><a href="profile.jsp" style="width:150px;">Your Profile</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>" style= "width: 150px;">Your Images</a></li>
                    <%}
                            }else{
                                %>
                 
                <%
                                        
                            
                    }%>
            </ul>
        </nav>
            
        <div class ="MainBody" style="height:300px;">
            <h1> Successfully Logged Out </h1>
        </div>
            
        <div class="push"></div>
        <br>
        
        <footer>
            <ul>
                <li><a href="/Instagrim">Home</a></li>
                <li>&COPY; Andy C</li>
            </ul>
        </footer>
    </div>
</html>
