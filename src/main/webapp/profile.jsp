<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page import="uk.ac.dundee.computing.aec.instagrim.models.User"%>
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

                
                
                <%    }
                            }else{
                                %>
                 
                <%
                                        
                            
                    }

                %>
            </ul>
        </nav>
        
        <div class ="MainBody">
            
            <h4>Welcome to your Profile, <%=lg.getFirstName()%></h4>
            
            <%

                if (lg.getProfilePicUuid()== null)
                {
                    %>
                     <img src="noProfilePic.jpg" alt ="Profile Picture" style="width:250px;height:350px;float:right; margin-right:20px;"/>
                    <%      
                }
                else
                {
                  
                %>
                 <img src="http://localhost:8084/Instagrim/Image/<%=lg.getProfilePicUuid()%>" alt ="Profile Picture" style="width:250px;height:350px;float:right; margin-right:20px;"/>
                <%
                }
            %>
        
            
            <div class="profile">
            <p> Your Username is: <%=lg.getUsername()%></p>
            <p> Your Password is: <%=lg.getPassword()%></p>
            <p> Your First Name is: <%=lg.getFirstName()%></p>
            <p> Your Last Name is: <%=lg.getLastName()%></p>
            <p> Your Email is: <%=lg.getEmail()%></p>
            
            
           
            
            
            
            <form method="POST" action="profile" style="margin-left:510px;">
            <input type="submit" value="Upload Profile Picture" name ="Upload Profile Picture" >
            </form>
            
            <form method="GET" action="updateProfile" style="margin-right: 1000px; margin-top: -60px;">
            <input type="submit" value="Update Profile" name ="Update Profile" >
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
