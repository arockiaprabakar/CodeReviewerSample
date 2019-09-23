package com.centre;

import java.util.*;
import java.sql.*;
import java.lang.*;
   public class dbsalary
 
    {
     public Connection con=null;
     public ResultSet rs=null;
     public Statement st=null;
     public String empno,empname,doj,pay,Query;


      public void set(String empno,String empname,String doj,String pay)
           {
             
               this.empno=empno;
               this.empname=empname;
               this.doj=doj;
               this.pay=pay;

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
               Query="insert into salarydetails values(' "+empno+" ',' "+empname+" ',' "+doj+" ',' "+pay+" ')";
               st=con.createStatement();
                st.executeQuery(Query);
            }catch(Exception e){} 
        }
   }
         
    