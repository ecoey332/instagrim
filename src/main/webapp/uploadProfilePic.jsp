<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
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
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>" style= "width: 150px;">Your Images</a></li>
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
 
        <div class="MainBody">
            <h3>Upload Profile Pic</h3>
            
            <div class="Upload">
            <form method="POST" enctype="multipart/form-data" action="uploadProfilePic">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <input type="submit" value="Upload">
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
