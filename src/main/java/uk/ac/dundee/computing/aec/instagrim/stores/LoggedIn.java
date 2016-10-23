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
public class LoggedIn {
    boolean loggedin=false;
    String username=null;
    String password;
    String firstName;
    String lastName;
    String email;
    java.util.UUID profilePicUuid;
   
    
    public void LoggedIn(){
        
    }
    
    public void setUsername(String username){
        this.username=username;
    }
    public String getUsername(){
        return username;
    }
    
    public void setEmail(String email){
        this.email=email;
    }
    public String getEmail(){
        return email;
    }
    public void setLoggedin(){
        loggedin=true;
    }
    public void setLoggedout(){
        loggedin=false;
    }
    
    public void setPassword(String password)
    {
        this.password = password;
    }
    
    public String getPassword()
    {
        return password;
    }
    
    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }
    
    public String getFirstName()
    {
        return firstName;
    }
    
    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }
    
    public String getLastName()
    {
        return lastName;
    }
    
    public void setLoginState(boolean loggedin){
        this.loggedin=loggedin;
    }
    public boolean getloggedin(){
        return loggedin;
    }
    
    public void setProfilePicUuid(java.util.UUID profilePicUuid){
        this.profilePicUuid=profilePicUuid;
    }
    public java.util.UUID getProfilePicUuid(){
        return profilePicUuid;
    }
    
}
