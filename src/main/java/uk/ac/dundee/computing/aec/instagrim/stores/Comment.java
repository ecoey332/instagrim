/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.stores;

import static com.datastax.driver.core.DataType.uuid;


/**
 *
 * @author Administrator
 */
public class Comment {

  
   
    String username=null;
    String comment;
    String commentAdded;
    java.util.UUID picID;
   
    
    
    
    public void setUsername(String username){
        this.username=username;
    }
    public String getUsername(){
        return username;
    }

    public void setComment(String comment)
    {
        this.comment = comment;
    }
    
    public String getComment()
    {
        return comment;
    }
    
    public void setCommentAdded(String commentAdded)
    {
        this.commentAdded = commentAdded;
    }
    
    public String getCommentAdded()
    {
        return commentAdded;
    }
    
    public void setPicID(java.util.UUID picID)
    {
        this.picID = picID;
    }
    
    public java.util.UUID getPicID()
    {
        return picID;
    }
    
    
    
}
