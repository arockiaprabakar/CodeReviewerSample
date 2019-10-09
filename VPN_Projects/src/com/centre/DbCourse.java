package com.centre;


import java.sql.*;

   public class DbCourse
 
    {
     public Connection con=null;
     public ResultSet rs=null;
     public Statement st=null;
     public String courseno,cname,amount,duration,Query;


      public void set(String courseno,String cname,String amount,String duration)
           {
             
               this.courseno=courseno;
               this.cname=cname;
               this.amount=amount;
               this.duration=duration;

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
               Query="insert into coursedetails values(' "+courseno+" ',' "+cname+" ',' "+amount+" ',' "+duration+" ')";
               st=con.createStatement();
                st.executeQuery(Query);
            }catch(Exception e){} 
        }
   }
         
    