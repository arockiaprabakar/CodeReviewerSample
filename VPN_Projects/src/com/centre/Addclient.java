package com.centre;

import java.sql.*;
   public class Addclient
 
    {
     public Connection con=null;
     public ResultSet rs=null;
     public Statement st=null;
     public String Company,Address,Phone,Mail,Person,Query;


      public void set(String Company,String Address,String Phone,String Mail,String Person)
           {
             
               this.Company=Company;
               this.Address=Address;
               this.Phone=Phone;
               this.Mail=Mail;
               this.Person=Person;
              try
              {
            	  Class.forName("com.mysql.jdbc.Driver");
            	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/central","root","");
              }catch(Exception e){
            	  e.printStackTrace();
              }
          }

      public void insert()
          {
            try
            {
               Query="insert into ClientDetails values(' "+Company+" ',' "+Address+" ',' "+Phone+" ',' "+Mail+" ',' "+Person+" ')";
               st=con.createStatement();
                st.executeQuery(Query);
            }catch(Exception e){
            	e.printStackTrace();
            } 
        }
   }
         
    