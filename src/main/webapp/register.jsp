<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
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
                            }else{
                                %>
                 
                <%
                                        
                            
                    }%>
            </ul>
        </nav>
       
        <div class="MainBody">
            <h3>Welcome to Instagrim</h3>
            <h3>Register</h3>
            <p class="colorwhite"> Please enter your details </p>
            
           
            <div class="Login">
                <form name="register" method="POST"  action="register">
                        <label for = "username">Username: </label>
                        <input type="text" name="username" id="username">
                        <label for = "password">Password: </label>
                        <input type="password" name="password" id="password">
                        <label for = "first_name">First Name: </label>
                        <input type="text" name="first_name" id="first_name">
                        <label for = "last_name">Last Name: </label>
                        <input type="text" name="last_name" id="last_name">
                        <label for = "email">Email: </label>
                        <input type="text" name="email" id="email">
                      
                        <input type="submit" value="Register">  
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
