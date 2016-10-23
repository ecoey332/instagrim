/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.CommentModel;
import uk.ac.dundee.computing.aec.instagrim.models.PicModel;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.Comment;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Erin
 */
@WebServlet(name = "comments", urlPatterns = {"/comments", "/comments/*"})
public class Comments extends HttpServlet {
    
    Cluster cluster;
    
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    private void DisplayCommentList(java.util.UUID picID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommentModel cm = new CommentModel();
        cm.setCluster(cluster);
        java.util.LinkedList<Comment> commentList = cm.getCommentForPic(picID);
        RequestDispatcher rd = request.getRequestDispatcher("/comments.jsp");
        request.setAttribute("Comments", commentList);
        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String picID = (String)request.getParameter("picID");
        java.util.UUID picUUID;
        
        PicModel pm = new PicModel();
        Cluster cluster = null;
        pm.setCluster(cluster);
        
        request.setAttribute("pictureID", picID); 
        picUUID = java.util.UUID.fromString(picID);
        DisplayCommentList(picUUID,request,response);
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("pictureServlet.doPost() called"); 
        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn)session.getAttribute("LoggedIn");
        //String picID = (String)request.getParameter("picID");
        //String picID = (String)session.getAttribute("pictureID");

        String username=request.getParameter("username");
        String comment=request.getParameter("comment");
        String picID = request.getParameter("picID");
        
        CommentModel cm = new CommentModel();
        cm.setCluster(cluster);
        
        cm.RegisterComment(username, comment, picID);
        
        
        response.sendRedirect("/Instagrim/comments/?picID="+picID);
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
