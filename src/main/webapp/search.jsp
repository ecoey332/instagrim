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
        
        <div class ="MainBody">
            <h4>Search</h4>
            <p> Please enter the username you would like to search for </p>
            
            <div class="profile">
                <form method="post" action="search">
                       <input type="text" name="search" placeholder="Search.." style="float:left; margin-left: 20px; margin-right: 0px; width:300px; padding:10px;">
                       <input type="submit" value="Search" >
                           
                </form>
            
            </div>
 

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
