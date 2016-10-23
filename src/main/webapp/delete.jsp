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
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        String username = lg.getUsername();
                        if (lg == null) {
                            System.out.println("No one is logged in");
                    %>
                    <li><a href="/Instagrim">Home</a></li>
                    <li><a href="/Instagrim/register">Register</a></li>
                    <li><a href="/Instagrim/login">Login</a></li>
                    <%
                        }
                        else if(lg!=null){                 
                        if (lg.getloggedin()) {
                           
                    %>
                <li><a href="/Instagrim">Home</a></li>
                <li><a href="/Instagrim/profile" style="width:150px;">Your Profile</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>" style="width:150px;">Your Images</a></li>
                <li><a href="/Instagrim/upload">Upload</a></li>
                <li><a href="/Instagrim/search">Search</a></li>
                <li><a href="/Instagrim/logout">Log Out</a></li>
             
                
                
                
                <%}
                            }else{
                                %>
                 
                <%
                                        
                            
                    }%>
            </ul>
        </nav>
            
        <div class ="MainBody" style="height:300px;">
            
            <h1> Delete </h1>
            
            <p style="text-align: center;"> Are you sure you want to delete your profile? </p>
            <p style = "text-align: center;"> Once it has been deleted you cannot get it back! </p>
            
            <form method="POST" action="delete" style="width:200px; margin-left:270px;">
            <input type="submit"  value ="Yes" >
            </form>
        
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
