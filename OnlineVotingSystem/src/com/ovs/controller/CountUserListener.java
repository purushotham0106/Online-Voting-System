package com.ovs.controller;

import javax.servlet.ServletContext;  
import javax.servlet.http.HttpSessionEvent;  
import javax.servlet.http.HttpSessionListener;  
  
public class CountUserListener implements HttpSessionListener{  
    ServletContext ctx=null;  
    static int total=0,current=0;  
      
    public void sessionCreated(HttpSessionEvent e) {  
    total++;  
    current++;  
      
    ctx=e.getSession().getServletContext();  
    System.out.println("session created");
    ctx.setAttribute("totalusers", total);  
    ctx.setAttribute("currentusers", current);  
      
    }  
  
    public void sessionDestroyed(HttpSessionEvent e) {  
        current--;  
        System.out.println("session destroyed");
        ctx.setAttribute("currentusers",current);  
    }  
  
}  