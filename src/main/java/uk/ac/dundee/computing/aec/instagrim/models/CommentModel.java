package uk.ac.dundee.computing.aec.instagrim.models;

/*
 * Expects a cassandra columnfamily defined as
 * use keyspace2;
 CREATE TABLE Tweets (
 user varchar,
 interaction_time timeuuid,
 tweet varchar,
 PRIMARY KEY (user,interaction_time)
 ) WITH CLUSTERING ORDER BY (interaction_time DESC);
 * To manually generate a UUID use:
 * http://www.famkruithof.net/uuid/uuidgen
 */
import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.utils.Bytes;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.NoSuchAlgorithmException;
import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.imgscalr.Scalr.*;
import org.imgscalr.Scalr.Method;

import uk.ac.dundee.computing.aec.instagrim.lib.*;
import uk.ac.dundee.computing.aec.instagrim.stores.Comment;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;
//import uk.ac.dundee.computing.aec.stores.TweetStore;
public class CommentModel {
    
Cluster cluster;
    
public CommentModel(){
        
    }

public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

public boolean RegisterComment(String username, String comment, String picID){
        
        java.util.UUID uuid = UUID.fromString(picID);
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("M/dd/yy HH:mm:ss");
        
        String commentID = dateFormat.format(date);
                
        Session session = cluster.connect("instagrim");
        PreparedStatement ps;
        ps = session.prepare("insert into Comments (user,comment,picid, comment_added) Values(?,?,?,?)");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        ResultSet rs = null;
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username,comment, uuid, commentID));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }


public java.util.LinkedList<Comment>  getCommentForPic(java.util.UUID picID) {
        
        java.util.LinkedList<Comment> commentList = new java.util.LinkedList<>();
        
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select comment, user, comment_added from Comments where picid =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        picID));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return null;
        } else {
            for (Row row : rs) {
                Comment userComment = new Comment(); 
                String comment = row.getString("comment");
                String user = row.getString("user");
                String commentAdded = row.getString("comment_added");
                userComment.setComment(comment);
                userComment.setCommentAdded(commentAdded);
                userComment.setUsername(user);
                commentList.add(userComment);

            }
        }
        return commentList;
        }
    }




