package com.centre;

import java.util.*;
import java.sql.*;
import java.lang.*;
   public class staffattend
 
    {
     public Connection con=null;
     public ResultSet rs=null;
     public Statement st=null;
     public String empno,name,Query;


      public void set(String empno,String name)
           {
             
               this.empno=empno;
               this.name=name;
               
              try
              {
            	  Class.forName("com.mysql.jdbc.Driver");
            	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/central","root","");
              }catch(Exception e){}
          }

      public void insert()
          {
            try
            {
               Query="insert into StaffAttendence values(' "+empno+" ',' "+name+" ')";
               st=con.createStatement();
                st.executeQuery(Query);
            }catch(Exception e){} 
        }
   }
         
    