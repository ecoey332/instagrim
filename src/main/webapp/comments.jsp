<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
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
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>" style= "width: 150px;">Your Images</a></li>
                <li><a href="/Instagrim/upload">Upload</a></li>
                <li><a href="/Instagrim/search">Search</a></li>
                <li><a href="/Instagrim/logout">Logout</a><li> 
                    <%}
                            }else{
                                %>
                 
                <%
                                        
                            
                    }%>
            </ul>
        </nav>
            
        <div class ="MainBody">
            
            <h1> Comments </h1>
            <h4>Your Comment's</h4>
        
       <%
            java.util.LinkedList<Comment> commentList = (java.util.LinkedList<Comment>) request.getAttribute("Comments");
            if (commentList == null) {
        %>
        <p class="colorwhite">No Comments found</p>
        <%
        } else {
            Iterator<Comment> iterator;
            iterator = commentList.iterator();
            while (iterator.hasNext()) {
                Comment c = (Comment) iterator.next();
                String user = c.getUsername();
                String userComment = c.getComment();
                String commentAdded = c.getCommentAdded();
                String displayComment = "Username: " + user +  " Comment: " + userComment + " Comment Added: " + commentAdded;
        %>
       
                    <p> <%=displayComment%> </p>           
                    <%
}
                }

               
%>

        
            <% 
               
               String username  = lg.getUsername();
               String picID = (String)request.getAttribute("pictureID");
            %>

              
            <a href="/Instagrim/Image/<%=picID%>">
            <img id="userPicture" src="/Instagrim/Thumb/<%=picID%>" alt="User Picture"></a>
            
            <form method="post"  action="comments">
                        <input type="hidden" name="username" value="<%=username%>">
                        <label for = "Comment">Comment </label>
                        <input type="text" name="comment" id="Comment">
                        <input type="hidden" name="picID" value="<%=picID%>">
                        
                        <input type="submit" value="Submit Comment">  
            </form>
            
            
           
            
        </div>
        
            <div class ="push"></div>
            <br>
            
        <footer>
            <ul>
                <li><a href="/Instagrim">Home</a></li>
                <li>&COPY; Andy C</li>
            </ul>
        </footer>
    </div>
</html>

