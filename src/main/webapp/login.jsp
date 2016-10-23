<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />

    </head>
    <div class ="Container">
        <header>
        <h1>InstaGrim</h1>
        <h2>Your world in Black and White</h2>
        </header>
        
        <nav>
            <ul>
                <li><a href="/Instagrim">Home</a></li>
                <li><a href="/Instagrim/register">Register</a></li>
                <li><a href="/Instagrim/login">Login</a></li>
                    <%
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getloggedin()) {
                    %>

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>

                
                    <%}
                            }else {
                                %>
                 
                <%
                                        
                            
                    }%>
                
            </ul>
        </nav>
                
        <div class = "MainBody"> 
            <h3>Welcome to Instagrim</h3>
            <h3>Login</h3>
            <p class="colorwhite"> Please enter your username and password </p>
            
            <div class = "Login">
                
                <form method="post"  action="login">
                        <label for = "Username">Username: </label>
                        <input type="text" name="username" id="Username">
                        <label for = "Password">Password: </label>
                        <input type="password" name="password" id="Password">
                        <input type="submit" value="Login">  
                </form>

            </div>
        </div>
        <div class="push"></div>    
        <br>
        <footer>
            <ul>
                <li><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </div>
</html>
